autowatch = 1;
inlets = 1;
outlets = 8;

var generation = 0;

var categories = [
    "OMINOUS", "DARK", "MELANCHOLIC", "AMBIENT", "WET", "LUMINOUS",
    "FROZEN", "DUSTY", "HARMONIC", "UNSTABLE", "CELESTIAL", "INDUSTRIAL"
];

function clamp(value, low, high) {
    return Math.max(low, Math.min(high, value));
}

function randomBetween(low, high) {
    return low + Math.random() * (high - low);
}

function skewed(low, high, exponent) {
    return low + Math.pow(Math.random(), exponent) * (high - low);
}

function choose(values) {
    return values[Math.floor(Math.random() * values.length)];
}

function hexSignature(value) {
    var result = value.toString(16).toUpperCase();
    return ("000000" + result).slice(-6);
}

function restore(categoryIndex, signatureValue) {
    var safeCategory = clamp(Math.round(categoryIndex), 0, categories.length - 1);
    var safeSignature = clamp(Math.round(signatureValue), 0, 0xFFFFFF);
    outlet(1, "set", categories[safeCategory] + "  ·  " + hexSignature(safeSignature));
}

function makePreset(category) {
    var p = {
        wave: 1, filter: 1, ratio: 1.002, osc: 0.5, sub: 0.12, noise: 0.01,
        octave: 0.5, cutoff: 1800, resonance: 0.35, driftRate: 0.04,
        driftDepth: 220, fmRatio: 2, fmAmount: 0, fmMix: 0,
        decay: 3200, sustain: 0.72,
        chorusRate: 0.16, chorusMod: 0.38, chorusWidth: 0.8,
        reverbSize: 0.72, reverbDamping: 0.58, reverbMod: 0.3,
        driveBass: 0.5, driveTreble: 0.42
    };

    if (category === "OMINOUS") {
        p.wave = choose([1, 3]);
        p.filter = 1;
        p.ratio = choose([0.5, 0.667, 1.498]);
        p.osc = randomBetween(0.2, 0.48);
        p.sub = randomBetween(0.28, 0.5);
        p.noise = randomBetween(0.015, 0.075);
        p.octave = 0.5;
        p.cutoff = skewed(240, 1450, 1.7);
        p.resonance = randomBetween(0.32, 0.62);
        p.driftRate = randomBetween(0.012, 0.04);
        p.driftDepth = randomBetween(45, 230);
        p.fmRatio = choose([0.5, 1, 1.5]);
        p.fmAmount = randomBetween(8, 42);
        p.fmMix = randomBetween(0.04, 0.16);
        p.sustain = randomBetween(0.72, 0.92);
        p.reverbSize = randomBetween(0.76, 0.94);
        p.reverbDamping = randomBetween(0.66, 0.9);
        p.driveBass = randomBetween(0.62, 0.82);
        p.driveTreble = randomBetween(0.22, 0.4);
    } else if (category === "DARK") {
        p.wave = choose([1, 2, 3]);
        p.filter = choose([1, 3]);
        p.ratio = choose([0.75, 0.997, 1.5]);
        p.osc = randomBetween(0.32, 0.65);
        p.sub = randomBetween(0.14, 0.35);
        p.noise = randomBetween(0.025, 0.11);
        p.octave = choose([0.5, 1]);
        p.cutoff = skewed(320, 2100, 1.55);
        p.resonance = randomBetween(0.38, 0.72);
        p.driftRate = randomBetween(0.025, 0.08);
        p.driftDepth = randomBetween(120, 470);
        p.fmRatio = choose([1, 2, 2.5]);
        p.fmAmount = randomBetween(15, 75);
        p.fmMix = randomBetween(0.05, 0.2);
        p.reverbDamping = randomBetween(0.72, 0.94);
        p.driveBass = randomBetween(0.58, 0.76);
        p.driveTreble = randomBetween(0.18, 0.36);
    } else if (category === "MELANCHOLIC") {
        p.wave = 2;
        p.filter = choose([1, 4]);
        p.ratio = choose([1.4983, 1.25, 0.74915]);
        p.osc = randomBetween(0.2, 0.42);
        p.sub = randomBetween(0.06, 0.18);
        p.noise = randomBetween(0, 0.028);
        p.octave = 1;
        p.cutoff = randomBetween(1100, 3600);
        p.resonance = randomBetween(0.26, 0.5);
        p.driftRate = randomBetween(0.018, 0.052);
        p.driftDepth = randomBetween(160, 520);
        p.fmRatio = choose([1.5, 2, 3]);
        p.fmAmount = randomBetween(8, 38);
        p.fmMix = randomBetween(0.08, 0.24);
        p.decay = randomBetween(4200, 7600);
        p.sustain = randomBetween(0.56, 0.78);
        p.chorusRate = randomBetween(0.08, 0.2);
        p.chorusMod = randomBetween(0.42, 0.68);
        p.reverbMod = randomBetween(0.28, 0.5);
    } else if (category === "AMBIENT") {
        p.wave = choose([1, 2]);
        p.filter = choose([1, 4]);
        p.ratio = choose([0.5, 1.003, 1.997, 2.997]);
        p.osc = randomBetween(0.18, 0.55);
        p.sub = randomBetween(0.02, 0.16);
        p.noise = randomBetween(0.015, 0.09);
        p.octave = choose([0.5, 1]);
        p.cutoff = randomBetween(1500, 6200);
        p.resonance = randomBetween(0.18, 0.48);
        p.driftRate = randomBetween(0.008, 0.035);
        p.driftDepth = randomBetween(360, 980);
        p.fmRatio = choose([1, 2, 3, 4]);
        p.fmAmount = randomBetween(5, 55);
        p.fmMix = randomBetween(0.04, 0.18);
        p.decay = randomBetween(5000, 8500);
        p.sustain = randomBetween(0.68, 0.94);
        p.chorusRate = randomBetween(0.04, 0.13);
        p.reverbSize = randomBetween(0.84, 1);
        p.reverbDamping = randomBetween(0.35, 0.68);
        p.reverbMod = randomBetween(0.38, 0.68);
    } else if (category === "WET") {
        p.wave = choose([2, 3]);
        p.filter = choose([2, 3, 4]);
        p.ratio = choose([0.5, 1.5, 2, 3]);
        p.osc = randomBetween(0.16, 0.42);
        p.sub = randomBetween(0.02, 0.12);
        p.noise = randomBetween(0.03, 0.13);
        p.octave = 1;
        p.cutoff = randomBetween(900, 5400);
        p.resonance = randomBetween(0.5, 0.78);
        p.driftRate = randomBetween(0.018, 0.07);
        p.driftDepth = randomBetween(420, 1100);
        p.fmRatio = choose([1.5, 2.5, 3.5]);
        p.fmAmount = randomBetween(28, 110);
        p.fmMix = randomBetween(0.12, 0.32);
        p.chorusRate = randomBetween(0.05, 0.18);
        p.chorusMod = randomBetween(0.58, 0.88);
        p.chorusWidth = randomBetween(0.88, 1);
        p.reverbSize = randomBetween(0.92, 1);
        p.reverbDamping = randomBetween(0.2, 0.52);
        p.reverbMod = randomBetween(0.55, 0.82);
    } else if (category === "LUMINOUS") {
        p.wave = 2;
        p.filter = choose([2, 4]);
        p.ratio = choose([1.5, 2, 3, 4]);
        p.osc = randomBetween(0.3, 0.62);
        p.sub = randomBetween(0, 0.08);
        p.noise = randomBetween(0, 0.025);
        p.octave = 1;
        p.cutoff = randomBetween(3200, 9200);
        p.resonance = randomBetween(0.22, 0.56);
        p.driftRate = randomBetween(0.022, 0.085);
        p.driftDepth = randomBetween(260, 920);
        p.fmRatio = choose([2, 3, 4]);
        p.fmAmount = randomBetween(38, 125);
        p.fmMix = randomBetween(0.18, 0.38);
        p.driveBass = randomBetween(0.3, 0.46);
        p.driveTreble = randomBetween(0.58, 0.78);
        p.reverbDamping = randomBetween(0.28, 0.52);
    } else if (category === "FROZEN") {
        p.wave = choose([2, 3]);
        p.filter = 3;
        p.ratio = choose([1.997, 2.997, 4.01]);
        p.osc = randomBetween(0.15, 0.38);
        p.sub = randomBetween(0, 0.06);
        p.noise = randomBetween(0.04, 0.12);
        p.octave = 1;
        p.cutoff = randomBetween(1800, 6800);
        p.resonance = randomBetween(0.62, 0.86);
        p.driftRate = randomBetween(0.006, 0.024);
        p.driftDepth = randomBetween(90, 380);
        p.fmRatio = choose([3, 5, 7]);
        p.fmAmount = randomBetween(55, 150);
        p.fmMix = randomBetween(0.2, 0.4);
        p.chorusRate = randomBetween(0.025, 0.08);
        p.reverbDamping = randomBetween(0.16, 0.4);
        p.reverbMod = randomBetween(0.08, 0.28);
    } else if (category === "DUSTY") {
        p.wave = 1;
        p.filter = 1;
        p.ratio = choose([0.5, 0.997, 1.503, 1.997]);
        p.osc = randomBetween(0.3, 0.68);
        p.sub = randomBetween(0.08, 0.24);
        p.noise = randomBetween(0.09, 0.22);
        p.octave = choose([0.5, 1]);
        p.cutoff = skewed(420, 2800, 1.45);
        p.resonance = randomBetween(0.2, 0.46);
        p.driftRate = randomBetween(0.07, 0.18);
        p.driftDepth = randomBetween(420, 1050);
        p.fmRatio = choose([0.5, 1, 2]);
        p.fmAmount = randomBetween(4, 24);
        p.fmMix = randomBetween(0, 0.1);
        p.chorusMod = randomBetween(0.22, 0.5);
        p.reverbDamping = randomBetween(0.7, 0.93);
        p.driveTreble = randomBetween(0.18, 0.34);
    } else if (category === "HARMONIC") {
        p.wave = 2;
        p.filter = choose([1, 4]);
        p.ratio = choose([1.5, 2, 2.5, 3, 4]);
        p.osc = randomBetween(0.42, 0.76);
        p.sub = randomBetween(0.02, 0.11);
        p.noise = randomBetween(0, 0.02);
        p.octave = 1;
        p.cutoff = randomBetween(1400, 6500);
        p.resonance = randomBetween(0.18, 0.48);
        p.driftRate = randomBetween(0.015, 0.065);
        p.driftDepth = randomBetween(160, 580);
        p.fmRatio = choose([2, 3, 4, 5]);
        p.fmAmount = randomBetween(20, 85);
        p.fmMix = randomBetween(0.16, 0.34);
        p.driveBass = randomBetween(0.34, 0.5);
        p.driveTreble = randomBetween(0.5, 0.7);
    } else if (category === "UNSTABLE") {
        p.wave = choose([1, 3]);
        p.filter = choose([1, 2, 3, 4]);
        p.ratio = choose([0.667, 0.749, 1.414, 1.618, 2.013]);
        p.osc = randomBetween(0.28, 0.7);
        p.sub = randomBetween(0.03, 0.2);
        p.noise = randomBetween(0.035, 0.14);
        p.octave = choose([0.5, 1]);
        p.cutoff = randomBetween(650, 5200);
        p.resonance = randomBetween(0.42, 0.78);
        p.driftRate = randomBetween(0.09, 0.24);
        p.driftDepth = randomBetween(620, 1200);
        p.fmRatio = choose([1.414, 1.618, 2.718, 3.142]);
        p.fmAmount = randomBetween(48, 155);
        p.fmMix = randomBetween(0.16, 0.38);
        p.chorusRate = randomBetween(0.18, 0.42);
        p.chorusMod = randomBetween(0.5, 0.82);
        p.reverbMod = randomBetween(0.45, 0.75);
    } else if (category === "CELESTIAL") {
        p.wave = 2;
        p.filter = choose([3, 4]);
        p.ratio = choose([2, 3, 4, 5]);
        p.osc = randomBetween(0.22, 0.52);
        p.sub = randomBetween(0, 0.07);
        p.noise = randomBetween(0.005, 0.04);
        p.octave = 1;
        p.cutoff = randomBetween(2600, 8500);
        p.resonance = randomBetween(0.5, 0.76);
        p.driftRate = randomBetween(0.01, 0.045);
        p.driftDepth = randomBetween(280, 760);
        p.fmRatio = choose([3, 4, 5, 6]);
        p.fmAmount = randomBetween(45, 135);
        p.fmMix = randomBetween(0.24, 0.42);
        p.chorusMod = randomBetween(0.48, 0.74);
        p.reverbSize = randomBetween(0.88, 1);
        p.reverbDamping = randomBetween(0.2, 0.46);
    } else { // INDUSTRIAL
        p.wave = 3;
        p.filter = choose([2, 3]);
        p.ratio = choose([0.5, 1.414, 1.997, 2.5]);
        p.osc = randomBetween(0.42, 0.78);
        p.sub = randomBetween(0.1, 0.28);
        p.noise = randomBetween(0.08, 0.2);
        p.octave = choose([0.5, 1]);
        p.cutoff = randomBetween(700, 4300);
        p.resonance = randomBetween(0.48, 0.8);
        p.driftRate = randomBetween(0.035, 0.12);
        p.driftDepth = randomBetween(240, 780);
        p.fmRatio = choose([1.5, 2.5, 3.5]);
        p.fmAmount = randomBetween(60, 165);
        p.fmMix = randomBetween(0.2, 0.42);
        p.chorusWidth = randomBetween(0.5, 0.78);
        p.reverbDamping = randomBetween(0.58, 0.82);
        p.driveBass = randomBetween(0.54, 0.74);
        p.driveTreble = randomBetween(0.48, 0.72);
    }

    return p;
}

function bang() {
    generation += 1;

    var now = new Date().getTime();
    var entropy = Math.floor(Math.random() * 0x7fffffff);
    var seed = ((now & 0xffffffff) ^ entropy ^ (generation * 2654435761)) >>> 0;
    var signatureValue = ((seed ^ (seed >>> 16)) >>> 0) & 0xFFFFFF;
    var categoryIndex = Math.floor(Math.random() * categories.length);
    var category = categories[categoryIndex];
    var preset = makePreset(category);

    outlet(0, "wave_mode", preset.wave);
    outlet(0, "filter_mode", preset.filter);
    outlet(0, "osc_mix", preset.osc);
    outlet(0, "sub_mix", preset.sub);
    outlet(0, "noise_mix", preset.noise);
    outlet(0, "octave", preset.octave);
    outlet(0, "detune", preset.ratio);
    outlet(0, "resonance", preset.resonance);
    outlet(0, "decay", preset.decay);
    outlet(0, "sustain", preset.sustain);
    outlet(0, "drift_rate", preset.driftRate);
    outlet(0, "drift_depth", clamp(preset.driftDepth, 0, 1200));
    outlet(0, "fm_ratio", preset.fmRatio);
    outlet(0, "fm_amount", preset.fmAmount);
    outlet(0, "fm_mix", preset.fmMix);

    outlet(1, "set", category + "  ·  " + hexSignature(signatureValue));
    // Outlets 2 and 3 are intentionally reserved. Attack and Release are
    // persistent user controls and must never move when Generate is pressed.
    outlet(4, preset.cutoff);

    // These alter the character of the effects without moving the user's
    // Chorus, Drive, or Reverb amount knobs.
    outlet(5, "chorus_rate", preset.chorusRate);
    outlet(5, "chorus_mod", preset.chorusMod);
    outlet(5, "chorus_width", preset.chorusWidth);
    outlet(5, "reverb_size", preset.reverbSize);
    outlet(5, "reverb_damping", preset.reverbDamping);
    outlet(5, "reverb_mod", preset.reverbMod);
    outlet(5, "drive_bass", preset.driveBass);
    outlet(5, "drive_treble", preset.driveTreble);
    outlet(6, categoryIndex);
    outlet(7, signatureValue);
}
