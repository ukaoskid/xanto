autowatch = 1;
inlets = 1;
outlets = 5;

// Outlets: render buffer commands, preview commands, status, result, source.
var sourcePath = "";
var renderedPath = "";
var renderFrames = 0;
var renderBeats = 0;
var reverbAmount = 65;
var mixAmount = 65;
var generation = 0;
var pendingSourceFrames = 0;
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

function zeroArray(size) {
    var result = new Array(size);
    for (var i = 0; i < size; i++) { result[i] = 0; }
    return result;
}

function source(path) {
    sourcePath = arrayfromargs(arguments).join(" ");
    renderedPath = "";
    renderFrames = 0;
    outlet(2, "set", "SOURCE LOADED — PRESS GENERATE");
    outlet(3, "set", "NO PRE-REVERB");
    outlet(4, "set", leafName(sourcePath));
}

function reverb(value) {
    reverbAmount = clamp(Number(value) || 0, 0, 100);
}

function mix(value) {
    mixAmount = clamp(Number(value) || 0, 0, 100);
}

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
    if (/^\/(Users|Applications|Library|System|private|tmp)\//.test(suffix)) {
        return suffix;
    }
    return "/Volumes/" + volume + suffix;
}

function songApi() {
    try { return new LiveAPI(null, "live_set"); } catch (error) { return null; }
}

function renderDirectory(song) {
    try {
        var setPathValue = song.get("file_path");
        var setPath = Array.isArray(setPathValue) ? setPathValue.join(" ") : String(setPathValue || "");
        if (setPath) { return parentPath(setPath); }
    } catch (error) {}
    return parentPath(sourcePath);
}

function currentTempo() {
    var song = songApi();
    return song ? Number(song.get("tempo")) || 120 : 120;
}

function generate() {
    if (!sourcePath) {
        outlet(2, "set", "DROP SOURCE AUDIO FIRST");
        return;
    }

    try {
        var sourceBuffer = new Buffer("xpre_source");
        var frames = sourceBuffer.framecount();
        var lengthMs = sourceBuffer.length();
        var sampleRate = lengthMs > 0 ? frames * 1000 / lengthMs : 0;
        if (!frames || !sampleRate) {
            outlet(2, "set", "SOURCE IS STILL LOADING — TRY AGAIN");
            return;
        }

        pendingSourceFrames = frames;
        pendingSampleRate = sampleRate;
        pendingTempo = currentTempo();
        renderFrames = frames;
        renderBeats = frames / sampleRate * pendingTempo / 60;
        renderedPath = "";
        outlet(2, "set", "REVERSING + REVERB…");
        outlet(0, "sizeinsamps", renderFrames);
        var renderTask = new Task(renderNow, this);
        renderTask.schedule(80);
    } catch (error) {
        outlet(2, "set", "GENERATE FAILED — OPEN MAX CONSOLE");
        post("XPre GENERATE error: " + error + "\n");
    }
}

function renderNow() {
    try {
        renderCore(pendingSourceFrames, pendingSampleRate);
    } catch (error) {
        outlet(2, "set", "RENDER FAILED — OPEN MAX CONSOLE");
        post("XPre RENDER error: " + error + "\n");
    }
}

function renderCore(frames, sampleRate) {
    var sourceBuffer = new Buffer("xpre_source");
    var outputBuffer = new Buffer("xpre_render");
    var channels = Math.max(1, Math.min(2, sourceBuffer.channelcount()));
    var sourceLeft = sourceBuffer.peek(1, 0, frames);
    var sourceRight = channels > 1 ? sourceBuffer.peek(2, 0, frames) : sourceLeft;
    if (!Array.isArray(sourceLeft)) { sourceLeft = [sourceLeft]; }
    if (!Array.isArray(sourceRight)) { sourceRight = [sourceRight]; }

    var reversedLeft = new Array(frames);
    var reversedRight = new Array(frames);
    for (var i = 0; i < frames; i++) {
        reversedLeft[i] = sourceLeft[frames - 1 - i] || 0;
        reversedRight[i] = sourceRight[frames - 1 - i] || 0;
    }

    var amount = reverbAmount / 100;
    var wet = mixAmount / 100;
    var earlyLevel = (1 - wet) * 0.36;
    var tailLevel = 1.02 + wet * 0.22;
    var feedback = 0.72 + amount * 0.26;
    var roomScale = 0.78 + amount * 0.82;
    var delayTimesLeft = [0.053, 0.071, 0.089, 0.113];
    var delayTimesRight = [0.059, 0.079, 0.097, 0.127];
    var delaySamplesLeft = new Array(4);
    var delaySamplesRight = new Array(4);
    var combLeft = new Array(4);
    var combRight = new Array(4);
    var dampLeft = [0, 0, 0, 0];
    var dampRight = [0, 0, 0, 0];
    var damping = 0.4 + (1 - amount) * 0.15;
    for (var setupTap = 0; setupTap < 4; setupTap++) {
        delaySamplesLeft[setupTap] = Math.max(1, Math.round(sampleRate * delayTimesLeft[setupTap] * roomScale));
        delaySamplesRight[setupTap] = Math.max(1, Math.round(sampleRate * delayTimesRight[setupTap] * roomScale));
        combLeft[setupTap] = zeroArray(delaySamplesLeft[setupTap]);
        combRight[setupTap] = zeroArray(delaySamplesRight[setupTap]);
    }

    // A short fixed impulse response supplies convolution-like early
    // reflections before the algorithmic tail takes over.
    var earlyTimesLeft = [0.007, 0.011, 0.017, 0.023, 0.032, 0.046, 0.063];
    var earlyTimesRight = [0.009, 0.013, 0.019, 0.027, 0.036, 0.051, 0.069];
    var earlyGains = [0.72, -0.48, 0.4, -0.32, 0.27, -0.21, 0.17];
    var earlySamplesLeft = new Array(7);
    var earlySamplesRight = new Array(7);
    for (var earlySetup = 0; earlySetup < 7; earlySetup++) {
        earlySamplesLeft[earlySetup] = Math.max(1, Math.round(sampleRate * earlyTimesLeft[earlySetup] * roomScale));
        earlySamplesRight[earlySetup] = Math.max(1, Math.round(sampleRate * earlyTimesRight[earlySetup] * roomScale));
    }

    // Four decorrelating all-pass diffusers per side turn the parallel combs
    // into a smooth algorithmic tail instead of audible discrete echoes.
    var diffuserGain = 0.66;
    var diffuserDelayLeft = [Math.max(1, Math.round(sampleRate * 0.0047 * roomScale)), Math.max(1, Math.round(sampleRate * 0.0127 * roomScale)), Math.max(1, Math.round(sampleRate * 0.0193 * roomScale)), Math.max(1, Math.round(sampleRate * 0.0271 * roomScale))];
    var diffuserDelayRight = [Math.max(1, Math.round(sampleRate * 0.0059 * roomScale)), Math.max(1, Math.round(sampleRate * 0.0109 * roomScale)), Math.max(1, Math.round(sampleRate * 0.0179 * roomScale)), Math.max(1, Math.round(sampleRate * 0.0239 * roomScale))];
    var diffuserLeft = [zeroArray(diffuserDelayLeft[0]), zeroArray(diffuserDelayLeft[1]), zeroArray(diffuserDelayLeft[2]), zeroArray(diffuserDelayLeft[3])];
    var diffuserRight = [zeroArray(diffuserDelayRight[0]), zeroArray(diffuserDelayRight[1]), zeroArray(diffuserDelayRight[2]), zeroArray(diffuserDelayRight[3])];

    var processedReversedLeft = new Array(frames);
    var processedReversedRight = new Array(frames);

    // Four parallel feedback combs create a real decaying room behind the
    // reversed source. The wet signal excludes the direct input so REVERB has
    // an obvious audible range instead of mostly turning up another dry copy.
    for (var n = 0; n < frames; n++) {
        var earlyLeft = 0;
        var earlyRight = 0;
        for (var earlyTap = 0; earlyTap < 7; earlyTap++) {
            if (n >= earlySamplesLeft[earlyTap]) {
                earlyLeft += reversedLeft[n - earlySamplesLeft[earlyTap]] * earlyGains[earlyTap];
            }
            if (n >= earlySamplesRight[earlyTap]) {
                earlyRight += reversedRight[n - earlySamplesRight[earlyTap]] * earlyGains[earlyTap];
            }
        }
        var tailLeft = 0;
        var tailRight = 0;
        for (var tap = 0; tap < 4; tap++) {
            var positionLeft = n % delaySamplesLeft[tap];
            var positionRight = n % delaySamplesRight[tap];
            var delayedLeft = combLeft[tap][positionLeft];
            var delayedRight = combRight[tap][positionRight];
            dampLeft[tap] += damping * (delayedLeft - dampLeft[tap]);
            dampRight[tap] += damping * (delayedRight - dampRight[tap]);
            combLeft[tap][positionLeft] = reversedLeft[n] + earlyLeft * 0.18 + dampLeft[tap] * feedback;
            combRight[tap][positionRight] = reversedRight[n] + earlyRight * 0.18 + dampRight[tap] * feedback;
            tailLeft += delayedLeft;
            tailRight += delayedRight;
        }
        tailLeft *= 0.28;
        tailRight *= 0.28;

        for (var diffuserStage = 0; diffuserStage < 4; diffuserStage++) {
            var diffuserPositionLeft = n % diffuserDelayLeft[diffuserStage];
            var diffuserPositionRight = n % diffuserDelayRight[diffuserStage];
            var diffuserDelayedLeft = diffuserLeft[diffuserStage][diffuserPositionLeft];
            var diffuserDelayedRight = diffuserRight[diffuserStage][diffuserPositionRight];
            var diffusedLeft = diffuserDelayedLeft - diffuserGain * tailLeft;
            var diffusedRight = diffuserDelayedRight - diffuserGain * tailRight;
            diffuserLeft[diffuserStage][diffuserPositionLeft] = tailLeft + diffuserGain * diffusedLeft;
            diffuserRight[diffuserStage][diffuserPositionRight] = tailRight + diffuserGain * diffusedRight;
            tailLeft = diffusedLeft;
            tailRight = diffusedRight;
        }

        // As MIX approaches 100%, suppress the short early reflections that
        // psychoacoustically resemble a dry/delayed voice and favor late wash.
        // Slow opposing stereo drift gives the late field a gentle floating
        // motion without resampling or pitch-shifting the source.
        var drift = Math.sin(6.283185307179586 * 0.13 * n / sampleRate) * 0.075 +
            Math.sin(6.283185307179586 * 0.29 * n / sampleRate) * 0.025;
        var hybridWetLeft = earlyLeft * earlyLevel + (tailLeft * (0.78 + drift) + tailRight * (0.28 - drift)) * tailLevel;
        var hybridWetRight = earlyRight * earlyLevel + (tailRight * (0.78 - drift) + tailLeft * (0.28 + drift)) * tailLevel;
        processedReversedLeft[n] = reversedLeft[n] * (1 - wet) + hybridWetLeft * wet;
        processedReversedRight[n] = reversedRight[n] * (1 - wet) + hybridWetRight * wet;
    }

    var outputLeft = new Array(frames);
    var outputRight = new Array(frames);
    var peak = 0;
    var fadeSamples = Math.max(1, Math.round(sampleRate * 0.0025));
    for (var outIndex = 0; outIndex < frames; outIndex++) {
        var reverseIndex = frames - 1 - outIndex;
        var left = processedReversedLeft[reverseIndex];
        var right = processedReversedRight[reverseIndex];
        var edge = Math.min(1, outIndex / fadeSamples, (frames - 1 - outIndex) / fadeSamples);
        left *= edge;
        right *= edge;
        outputLeft[outIndex] = left;
        outputRight[outIndex] = right;
        peak = Math.max(peak, Math.abs(left), Math.abs(right));
    }

    // Only turn down unsafe peaks; do not inflate quiet source material.
    var gain = peak > 0.95 ? 0.95 / peak : 1;
    if (gain < 1) {
        for (var gainIndex = 0; gainIndex < frames; gainIndex++) {
            outputLeft[gainIndex] *= gain;
            outputRight[gainIndex] *= gain;
        }
    }

    outputBuffer.poke(1, 0, outputLeft);
    outputBuffer.poke(2, 0, outputRight);
    generation += 1;
    outlet(3, "set", "PRE-REVERB  ·  REV " + Math.round(reverbAmount) + "%  ·  MIX " + Math.round(mixAmount) + "%");
    outlet(2, "set", "READY — SAME PITCH + LENGTH");
}

function preview() {
    if (!renderFrames) {
        outlet(2, "set", "GENERATE A PRE-REVERB FIRST");
        return;
    }
    outlet(1, "stop");
    outlet(1, "start", 0);
    outlet(2, "set", "PREVIEWING");
}

function stoppreview() { outlet(1, "stop"); }

function place() {
    if (!renderFrames || !sourcePath) {
        outlet(2, "set", "GENERATE A PRE-REVERB FIRST");
        return;
    }
    var song = songApi();
    if (!song) {
        outlet(2, "set", "LIVE API IS NOT AVAILABLE");
        return;
    }
    if (Number(song.get("is_playing"))) {
        outlet(2, "set", "STOP TRANSPORT BEFORE PLACING");
        return;
    }

    var cursor = Number(song.get("current_song_time"));
    if (!isFinite(cursor) || cursor < 0) {
        outlet(2, "set", "COULD NOT READ ARRANGEMENT CURSOR");
        return;
    }

    var track;
    try { track = new LiveAPI(null, "this_device canonical_parent"); } catch (error) { track = null; }
    if (!track || !track.id) {
        outlet(2, "set", "COULD NOT FIND XPRE TRACK");
        return;
    }
    if (Number(track.get("has_audio_input")) !== 1) {
        outlet(2, "set", "PLACE REQUIRES AN AUDIO TRACK");
        return;
    }
    if (hasCollision(track, cursor, cursor + renderBeats)) {
        outlet(2, "set", "TARGET OVERLAPS AN EXISTING CLIP — MOVE CURSOR");
        return;
    }

    var stamp = new Date().getTime();
    pendingPlacePath = renderDirectory(song) + "XPre_" + safeStem(sourcePath) + "_" + stamp + ".wav";
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
    var placeTask = new Task(createClip, this);
    placeTask.schedule(20);
}

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

function createClip() {
    try {
        var track = new LiveAPI(null, "this_device canonical_parent");
        if (!track.id) { throw new Error("containing track is not available"); }
        track.call("create_audio_clip", pendingPlaceApiPath, pendingCursor);
        renderedPath = pendingPlacePath;
        placementChecks = 0;
        var verifyTask = new Task(verifyPlacement, this);
        verifyTask.schedule(200);
    } catch (error) {
        outlet(2, "set", "PLACE FAILED — OPEN MAX CONSOLE");
        post("XPre PLACE error: " + error + "\n");
    }
}

function verifyPlacement() {
    try {
        var track = new LiveAPI(null, "this_device canonical_parent");
        if (!track.id) { throw new Error("containing track is not available"); }
        if (arrangementClipCount(track) > pendingClipCount) {
            outlet(2, "set", "PLACED AT " + pendingCursor.toFixed(2) + " BEATS");
            return;
        }
        placementChecks += 1;
        if (placementChecks < 10) {
            var verifyTask = new Task(verifyPlacement, this);
            verifyTask.schedule(200);
        } else {
            outlet(2, "set", "PLACE FAILED — OPEN MAX CONSOLE");
            post("XPre PLACE verification failed for " + pendingPlaceApiPath + "\n");
        }
    } catch (error) {
        outlet(2, "set", "PLACE VERIFY FAILED — OPEN MAX CONSOLE");
        post("XPre PLACE verify error: " + error + "\n");
    }
}
