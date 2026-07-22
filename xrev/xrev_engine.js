autowatch = 1;
inlets = 1;
outlets = 5;

// Commands, preview, status, result, source label.
var sourcePath = "";
var renderFrames = 0;
var renderBeats = 0;
var originalFrames = 0;
var selectedClipDurationBeats = 0;
var lengthMode = "FILE";
var detectedEvents = 0;
var sensitivityAmount = 62;
var crossfadeMs = 18;
var pendingFrames = 0;
var pendingSampleRate = 44100;
var pendingTempo = 120;
var pendingPlacePath = "";
var pendingPlaceApiPath = "";
var pendingCursor = 0;
var pendingClipCount = 0;
var awaitingWrite = 0;
var placementChecks = 0;

function clamp(value, low, high) {
    return Math.max(low, Math.min(high, value));
}

function source(path) {
    sourcePath = arrayfromargs(arguments).join(" ");
    renderFrames = 0;
    detectedEvents = 0;
    selectedClipDurationBeats = selectedArrangementClipDuration(sourcePath);
    lengthMode = selectedClipDurationBeats > 0 ? "CLIP" : "FILE";
    outlet(2, "set", "SOURCE LOADED — PRESS PROCESS");
    outlet(3, "set", "NOT PROCESSED");
    outlet(4, "set", leafName(sourcePath));
}

function atomString(value) {
    if (Array.isArray(value)) { return value.join(" "); }
    return String(value || "");
}

// live.drop only reports a file path, not a cropped Arrangement range. The
// dragged Arrangement clip remains Live's detail clip, so capture its exact
// visible start/end duration while the drop is happening and lock rendering to
// that duration. Matching the file name avoids borrowing an unrelated clip.
function selectedArrangementClipDuration(path) {
    try {
        var clip = new LiveAPI(null, "live_set view detail_clip");
        if (!clip.id) { return 0; }
        var clipPath = atomString(clip.get("file_path"));
        if (!clipPath || leafName(clipPath) !== leafName(path)) { return 0; }
        var start = Number(clip.get("start_time"));
        var end = Number(clip.get("end_time"));
        var duration = end - start;
        return isFinite(duration) && duration > 0 ? duration : 0;
    } catch (error) { return 0; }
}

function sensitivity(value) { sensitivityAmount = clamp(Number(value) || 0, 0, 100); }
function crossfade(value) { crossfadeMs = clamp(Number(value) || 0, 0, 250); }

function leafName(path) {
    var bits = String(path).split(/[\\\/]/);
    return bits[bits.length - 1] || "SOURCE AUDIO";
}

function parentPath(path) {
    var slash = Math.max(path.lastIndexOf("/"), path.lastIndexOf("\\"));
    return slash >= 0 ? path.substring(0, slash + 1) : "";
}

function safeStem(path) {
    var name = leafName(path).replace(/\.[^.]+$/, "");
    return name.replace(/[^A-Za-z0-9_-]+/g, "_").substring(0, 36) || "source";
}

function liveApiFilePath(path) {
    var value = String(path || "");
    if (value.charAt(0) === "/") { return value; }
    var marker = value.indexOf(":/");
    if (marker < 0) { return value; }
    var volume = value.substring(0, marker);
    var suffix = value.substring(marker + 1);
    if (/^\/(Users|Applications|Library|System|private|tmp)\//.test(suffix)) { return suffix; }
    return "/Volumes/" + volume + suffix;
}

function songApi() {
    try { return new LiveAPI(null, "live_set"); } catch (error) { return null; }
}

function currentTempo() {
    var song = songApi();
    return song ? Number(song.get("tempo")) || 120 : 120;
}

function renderDirectory(song) {
    try {
        var value = song.get("file_path");
        var setPath = Array.isArray(value) ? value.join(" ") : String(value || "");
        if (setPath) { return parentPath(setPath); }
    } catch (error) {}
    return parentPath(sourcePath);
}

function process() {
    if (!sourcePath) {
        outlet(2, "set", "DROP AN AUDIO CLIP FIRST");
        return;
    }
    try {
        // Refresh once more at PROCESS time in case Live updated Detail View a
        // moment after the drop message was delivered.
        var refreshedDuration = selectedArrangementClipDuration(sourcePath);
        if (refreshedDuration > 0) {
            selectedClipDurationBeats = refreshedDuration;
            lengthMode = "CLIP";
        }
        var sourceBuffer = new Buffer("xrev_source");
        var frames = sourceBuffer.framecount();
        var lengthMs = sourceBuffer.length();
        var sampleRate = lengthMs > 0 ? frames * 1000 / lengthMs : 0;
        if (!frames || !sampleRate) {
            outlet(2, "set", "SOURCE IS STILL LOADING — TRY AGAIN");
            return;
        }
        originalFrames = frames;
        if (selectedClipDurationBeats > 0) {
            var clipFrames = Math.round(selectedClipDurationBeats * 60 / currentTempo() * sampleRate);
            if (clipFrames > 0 && clipFrames <= frames) {
                frames = clipFrames;
                lengthMode = "CLIP";
            } else {
                selectedClipDurationBeats = 0;
                lengthMode = "FILE";
                frames = effectiveFrameCount(sourceBuffer, frames, sampleRate);
            }
        } else {
            frames = effectiveFrameCount(sourceBuffer, frames, sampleRate);
            lengthMode = frames < originalFrames ? "TRIM" : "FILE";
        }
        pendingFrames = frames;
        pendingSampleRate = sampleRate;
        pendingTempo = currentTempo();
        renderFrames = frames;
        renderBeats = lengthMode === "CLIP" ? selectedClipDurationBeats : frames / sampleRate * pendingTempo / 60;
        if (lengthMode === "CLIP") {
            outlet(2, "set", "LOCKING TO LIVE CLIP LENGTH…");
        } else if (frames < originalFrames) {
            outlet(2, "set", "TRIMMING SILENT TAIL + REVERSING…");
        } else {
            outlet(2, "set", "DETECTING NOTES + REVERSING…");
        }
        outlet(0, "sizeinsamps", frames);
        new Task(renderNow, this).schedule(80);
    } catch (error) {
        outlet(2, "set", "PROCESS FAILED — OPEN MAX CONSOLE");
        post("XRev PROCESS error: " + error + "\n");
    }
}

// live.drop resolves an Arrangement clip to its underlying audio file. A
// cropped bounce can therefore arrive with minutes of silence after the clip's
// visible end. Find the last audible block and retain a short release margin.
// We only trim a clearly long tail, so ordinary pauses at the end are kept.
function effectiveFrameCount(sourceBuffer, frames, sampleRate) {
    var channels = Math.max(1, Math.min(2, sourceBuffer.channelcount()));
    var left = sourceBuffer.peek(1, 0, frames);
    var right = channels > 1 ? sourceBuffer.peek(2, 0, frames) : left;
    if (!Array.isArray(left)) { left = [left]; }
    if (!Array.isArray(right)) { right = [right]; }
    var blockSize = Math.max(32, Math.round(sampleRate * 0.010));
    var blockCount = Math.ceil(frames / blockSize);
    var peaks = new Array(blockCount);
    var globalPeak = 0;
    for (var block = 0; block < blockCount; block++) {
        var start = block * blockSize;
        var end = Math.min(frames, start + blockSize);
        var peak = 0;
        for (var i = start; i < end; i++) {
            peak = Math.max(peak, Math.abs(left[i] || 0), Math.abs(right[i] || 0));
        }
        peaks[block] = peak;
        globalPeak = Math.max(globalPeak, peak);
    }
    if (globalPeak <= 0.000001) { return frames; }
    var audibleThreshold = Math.max(0.00001, globalPeak * 0.0005);
    var lastAudibleBlock = blockCount - 1;
    while (lastAudibleBlock > 0 && peaks[lastAudibleBlock] < audibleThreshold) {
        lastAudibleBlock -= 1;
    }
    var releaseMargin = Math.round(sampleRate * 0.080);
    var audibleEnd = Math.min(frames, (lastAudibleBlock + 1) * blockSize + releaseMargin);
    var removableTail = frames - audibleEnd;
    var minimumTail = Math.max(Math.round(sampleRate * 0.5), Math.round(frames * 0.02));
    return removableTail >= minimumTail ? audibleEnd : frames;
}

function renderNow() {
    try { renderCore(pendingFrames, pendingSampleRate); }
    catch (error) {
        outlet(2, "set", "RENDER FAILED — OPEN MAX CONSOLE");
        post("XRev RENDER error: " + error + "\n");
    }
}

function percentile(values, fraction) {
    if (!values.length) { return 0; }
    var sorted = values.slice(0).sort(function(a, b) { return a - b; });
    return sorted[Math.floor(clamp(fraction, 0, 1) * (sorted.length - 1))];
}

// Energy-flux onset detector tuned for bounced instruments. Sensitivity raises
// or lowers the flux threshold; a refractory period prevents one piano attack
// from being counted several times.
function analyzeBoundaries(left, right, frames, sampleRate) {
    var hop = Math.max(16, Math.round(sampleRate * 0.004));
    var windowSize = Math.max(hop, Math.round(sampleRate * 0.012));
    var count = Math.max(1, Math.ceil(frames / hop));
    var energy = new Array(count);
    for (var block = 0; block < count; block++) {
        var start = block * hop;
        var end = Math.min(frames, start + windowSize);
        var sum = 0;
        for (var i = start; i < end; i++) {
            var mono = 0.5 * ((left[i] || 0) + (right[i] || 0));
            sum += mono * mono;
        }
        energy[block] = Math.sqrt(sum / Math.max(1, end - start));
    }

    // Light smoothing makes the result stable across different sample rates.
    var smooth = new Array(count);
    var state = 0;
    for (var s = 0; s < count; s++) {
        var coefficient = energy[s] > state ? 0.58 : 0.12;
        state += coefficient * (energy[s] - state);
        smooth[s] = state;
    }
    var floor = percentile(smooth, 0.15);
    var high = percentile(smooth, 0.95);
    var range = Math.max(0.000001, high - floor);
    var lookback = Math.max(1, Math.round(0.020 * sampleRate / hop));
    var localRadius = Math.max(1, Math.round(0.012 * sampleRate / hop));
    var minimumBlocks = Math.max(1, Math.round(0.075 * sampleRate / hop));
    var threshold = range * (0.19 - 0.00145 * sensitivityAmount);
    threshold = Math.max(range * 0.035, threshold);
    var gate = floor + range * 0.035;
    var scores = new Array(count);
    for (var n = 0; n < count; n++) {
        var previous = smooth[Math.max(0, n - lookback)];
        scores[n] = smooth[n] - previous;
    }

    var boundaries = [0];
    var lastBlock = -minimumBlocks;
    for (var candidate = lookback; candidate < count; candidate++) {
        if (smooth[candidate] < gate || scores[candidate] < threshold) { continue; }
        var isPeak = true;
        var maxIndex = Math.min(count - 1, candidate + localRadius);
        for (var neighbour = Math.max(0, candidate - localRadius); neighbour <= maxIndex; neighbour++) {
            if (scores[neighbour] > scores[candidate]) { isPeak = false; break; }
        }
        if (!isPeak || candidate - lastBlock < minimumBlocks) { continue; }
        var boundary = candidate * hop;
        if (boundary > Math.round(sampleRate * 0.008) && boundary < frames - Math.round(sampleRate * 0.008)) {
            boundaries.push(boundary);
            lastBlock = candidate;
        }
    }
    boundaries.push(frames);
    return boundaries;
}

function renderCore(frames, sampleRate) {
    var sourceBuffer = new Buffer("xrev_source");
    var outputBuffer = new Buffer("xrev_render");
    var channels = Math.max(1, Math.min(2, sourceBuffer.channelcount()));
    var left = sourceBuffer.peek(1, 0, frames);
    var right = channels > 1 ? sourceBuffer.peek(2, 0, frames) : left;
    if (!Array.isArray(left)) { left = [left]; }
    if (!Array.isArray(right)) { right = [right]; }

    var boundaries = analyzeBoundaries(left, right, frames, sampleRate);
    var outputLeft = new Array(frames);
    var outputRight = new Array(frames);
    for (var region = 0; region < boundaries.length - 1; region++) {
        var start = boundaries[region];
        var end = boundaries[region + 1];
        for (var position = start; position < end; position++) {
            var reversePosition = end - 1 - (position - start);
            outputLeft[position] = left[reversePosition] || 0;
            outputRight[position] = right[reversePosition] || 0;
        }
    }

    // Treat every detected region exactly like an independently chopped clip:
    // fade its beginning in from zero and fade its reversed transient out to
    // zero. There is no overlap or signal blending across regions. A raised
    // cosine is deliberately strong near the cut, suppressing narrow transient
    // spikes more effectively than an equal-power crossfade.
    var requestedFade = Math.max(0, Math.round(sampleRate * crossfadeMs / 1000));
    for (var fadeRegion = 0; fadeRegion < boundaries.length - 1; fadeRegion++) {
        var regionStart = boundaries[fadeRegion];
        var regionEnd = boundaries[fadeRegion + 1];
        var regionLength = regionEnd - regionStart;
        var sliceFade = Math.min(requestedFade, Math.floor(regionLength * 0.45));
        for (var entryIndex = 0; entryIndex < sliceFade; entryIndex++) {
            var entryPhase = sliceFade > 1 ? entryIndex / (sliceFade - 1) : 0;
            var entryWeight = 0.5 - 0.5 * Math.cos(Math.PI * entryPhase);
            outputLeft[regionStart + entryIndex] *= entryWeight;
            outputRight[regionStart + entryIndex] *= entryWeight;
        }
        for (var fadeIndex = 0; fadeIndex < sliceFade; fadeIndex++) {
            var endPhase = sliceFade > 1 ? fadeIndex / (sliceFade - 1) : 1;
            var endWeight = 0.5 + 0.5 * Math.cos(Math.PI * endPhase);
            var fadeTarget = regionEnd - sliceFade + fadeIndex;
            outputLeft[fadeTarget] *= endWeight;
            outputRight[fadeTarget] *= endWeight;
        }
    }

    var edgeFade = Math.max(1, Math.round(sampleRate * 0.0025));
    var peak = 0;
    for (var sample = 0; sample < frames; sample++) {
        var edge = Math.min(1, sample / edgeFade, (frames - 1 - sample) / edgeFade);
        outputLeft[sample] *= edge;
        outputRight[sample] *= edge;
        peak = Math.max(peak, Math.abs(outputLeft[sample]), Math.abs(outputRight[sample]));
    }
    var gain = peak > 0.98 ? 0.98 / peak : 1;
    if (gain < 1) {
        for (var gainIndex = 0; gainIndex < frames; gainIndex++) {
            outputLeft[gainIndex] *= gain;
            outputRight[gainIndex] *= gain;
        }
    }
    outputBuffer.poke(1, 0, outputLeft);
    outputBuffer.poke(2, 0, outputRight);
    detectedEvents = boundaries.length - 1;
    var lengthLabel = lengthMode === "CLIP" ? "  ·  CLIP LENGTH LOCKED" : (originalFrames > frames ? "  ·  TAIL TRIMMED" : "");
    outlet(3, "set", detectedEvents + " PIECES  ·  " + Math.round(crossfadeMs) + " MS SLICE FADE" + lengthLabel);
    outlet(2, "set", "READY — SAME LENGTH");
}

function preview() {
    if (!renderFrames) { outlet(2, "set", "PROCESS THE CLIP FIRST"); return; }
    outlet(1, "stop");
    outlet(1, "start", 0);
    outlet(2, "set", "PREVIEWING");
}

function stoppreview() { outlet(1, "stop"); }

function arrangementClipIds(track) {
    var ids = track.get("arrangement_clips");
    return Array.isArray(ids) ? ids : [ids];
}

function arrangementClipCount(track) {
    var ids;
    try { ids = arrangementClipIds(track); } catch (error) { return -1; }
    var count = 0;
    for (var i = 0; i < ids.length; i++) {
        if (ids[i] !== "id" && Number(ids[i])) { count += 1; }
    }
    return count;
}

function hasCollision(track, start, end) {
    var ids;
    try { ids = arrangementClipIds(track); } catch (error) { return true; }
    for (var i = 0; i < ids.length; i++) {
        if (ids[i] === "id" || !Number(ids[i])) { continue; }
        try {
            var clip = new LiveAPI();
            clip.id = Number(ids[i]);
            var clipStart = Number(clip.get("start_time"));
            var clipEnd = Number(clip.get("end_time"));
            if (start < clipEnd - 0.000001 && end > clipStart + 0.000001) { return true; }
        } catch (error) { return true; }
    }
    return false;
}

function place() {
    if (!renderFrames || !sourcePath) { outlet(2, "set", "PROCESS THE CLIP FIRST"); return; }
    var song = songApi();
    if (!song) { outlet(2, "set", "LIVE API IS NOT AVAILABLE"); return; }
    if (Number(song.get("is_playing"))) { outlet(2, "set", "STOP TRANSPORT BEFORE PLACING"); return; }
    var cursor = Number(song.get("current_song_time"));
    if (!isFinite(cursor) || cursor < 0) { outlet(2, "set", "COULD NOT READ ARRANGEMENT CURSOR"); return; }
    var track;
    try { track = new LiveAPI(null, "this_device canonical_parent"); } catch (error) { track = null; }
    if (!track || !track.id || Number(track.get("has_audio_input")) !== 1) {
        outlet(2, "set", "PLACE XREV ON AN AUDIO TRACK"); return;
    }
    if (hasCollision(track, cursor, cursor + renderBeats)) {
        outlet(2, "set", "TARGET OVERLAPS A CLIP — MOVE CURSOR"); return;
    }
    pendingPlacePath = renderDirectory(song) + "XRev_" + safeStem(sourcePath) + "_" + new Date().getTime() + ".wav";
    pendingPlaceApiPath = liveApiFilePath(pendingPlacePath);
    pendingCursor = cursor;
    pendingClipCount = arrangementClipCount(track);
    awaitingWrite = 1;
    outlet(2, "set", "WRITING WAV…");
    outlet(0, "writewave", pendingPlacePath);
}

function write_done() {
    if (!awaitingWrite) { return; }
    awaitingWrite = 0;
    outlet(2, "set", "CREATING ARRANGEMENT CLIP…");
    new Task(createClip, this).schedule(20);
}

function createClip() {
    try {
        var track = new LiveAPI(null, "this_device canonical_parent");
        if (!track.id) { throw new Error("containing track unavailable"); }
        track.call("create_audio_clip", pendingPlaceApiPath, pendingCursor);
        placementChecks = 0;
        new Task(verifyPlacement, this).schedule(200);
    } catch (error) {
        outlet(2, "set", "PLACE FAILED — OPEN MAX CONSOLE");
        post("XRev PLACE error: " + error + "\n");
    }
}

function verifyPlacement() {
    try {
        var track = new LiveAPI(null, "this_device canonical_parent");
        if (arrangementClipCount(track) > pendingClipCount) {
            outlet(2, "set", "PLACED AT " + pendingCursor.toFixed(2) + " BEATS"); return;
        }
        placementChecks += 1;
        if (placementChecks < 10) { new Task(verifyPlacement, this).schedule(200); }
        else { outlet(2, "set", "PLACE FAILED — OPEN MAX CONSOLE"); }
    } catch (error) {
        outlet(2, "set", "PLACE VERIFY FAILED — OPEN MAX CONSOLE");
        post("XRev PLACE verify error: " + error + "\n");
    }
}
