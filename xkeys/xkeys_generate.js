autowatch = 1;
inlets = 1;
outlets = 8;

var generation = 0;

// Keyboard families only: piano-inspired, synth keys, and plucks.
// Organ architectures are deliberately outside XKeys' sound world.
var categories = [
    "FELT", "HAMMER", "TINE", "GLASS", "WARM", "BRIGHT",
    "ANALOG", "DIGITAL", "PLUCK", "MALLET", "DUSK", "HYBRID"
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
        wave: 2, filter: 1, ratio: 2, osc: 0.26, sub: 0.04, noise: 0.035,
        octave: 1, cutoff: 4800, resonance: 0.28,
        driftRate: 0.035, driftDepth: 90,
        fmRatio: 2, fmAmount: 42, fmMix: 0.18,
        decay: 900, sustain: 0.28,
        chorusRate: 0.2, chorusMod: 0.3, chorusWidth: 0.72,
        reverbSize: 0.55, reverbDamping: 0.62, reverbMod: 0.12,
        driveBass: 0.45, driveTreble: 0.58
    };

    if (category === "FELT") {
        p.wave = 2;
        p.ratio = choose([1.997, 2.003, 3.001]);
        p.osc = randomBetween(0.08, 0.22);
        p.sub = randomBetween(0.025, 0.09);
        p.noise = randomBetween(0.035, 0.09);
        p.cutoff = skewed(1500, 4300, 1.35);
        p.resonance = randomBetween(0.15, 0.34);
        p.driftRate = randomBetween(0.012, 0.04);
        p.driftDepth = randomBetween(25, 110);
        p.fmRatio = choose([2, 3]);
        p.fmAmount = randomBetween(16, 55);
        p.fmMix = randomBetween(0.06, 0.17);
        p.decay = randomBetween(850, 1900);
        p.sustain = randomBetween(0.2, 0.42);
        p.chorusMod = randomBetween(0.15, 0.34);
        p.reverbDamping = randomBetween(0.68, 0.9);
        p.driveBass = randomBetween(0.52, 0.68);
        p.driveTreble = randomBetween(0.25, 0.44);
    } else if (category === "HAMMER") {
        p.wave = choose([1, 2]);
        p.ratio = choose([1.997, 2.006, 3]);
        p.osc = randomBetween(0.14, 0.32);
        p.sub = randomBetween(0.02, 0.08);
        p.noise = randomBetween(0.025, 0.075);
        p.cutoff = randomBetween(3200, 7800);
        p.resonance = randomBetween(0.16, 0.36);
        p.driftRate = randomBetween(0.018, 0.055);
        p.driftDepth = randomBetween(35, 145);
        p.fmRatio = choose([2, 3, 4]);
        p.fmAmount = randomBetween(35, 95);
        p.fmMix = randomBetween(0.1, 0.25);
        p.decay = randomBetween(550, 1350);
        p.sustain = randomBetween(0.18, 0.38);
        p.driveBass = randomBetween(0.46, 0.62);
    } else if (category === "TINE") {
        p.wave = 2;
        p.ratio = choose([2, 3, 4]);
        p.osc = randomBetween(0.04, 0.16);
        p.sub = randomBetween(0, 0.045);
        p.noise = randomBetween(0, 0.025);
        p.cutoff = randomBetween(3800, 9000);
        p.resonance = randomBetween(0.18, 0.42);
        p.driftRate = randomBetween(0.012, 0.045);
        p.driftDepth = randomBetween(20, 90);
        p.fmRatio = choose([2, 3, 4, 5]);
        p.fmAmount = randomBetween(55, 145);
        p.fmMix = randomBetween(0.22, 0.43);
        p.decay = randomBetween(1100, 2800);
        p.sustain = randomBetween(0.22, 0.48);
        p.chorusRate = randomBetween(0.12, 0.3);
        p.chorusMod = randomBetween(0.35, 0.62);
        p.driveTreble = randomBetween(0.55, 0.76);
    } else if (category === "GLASS") {
        p.wave = 2;
        p.filter = choose([1, 4]);
        p.ratio = choose([3, 4, 5]);
        p.osc = randomBetween(0.02, 0.13);
        p.sub = 0;
        p.noise = randomBetween(0, 0.018);
        p.cutoff = randomBetween(5200, 11200);
        p.resonance = randomBetween(0.28, 0.58);
        p.driftRate = randomBetween(0.008, 0.03);
        p.driftDepth = randomBetween(12, 70);
        p.fmRatio = choose([3, 4, 5, 6]);
        p.fmAmount = randomBetween(80, 175);
        p.fmMix = randomBetween(0.28, 0.48);
        p.decay = randomBetween(900, 2400);
        p.sustain = randomBetween(0.1, 0.3);
        p.reverbSize = randomBetween(0.68, 0.9);
        p.reverbDamping = randomBetween(0.18, 0.42);
        p.driveTreble = randomBetween(0.62, 0.82);
    } else if (category === "WARM") {
        p.wave = choose([1, 2]);
        p.ratio = choose([0.997, 1.003, 2]);
        p.osc = randomBetween(0.2, 0.42);
        p.sub = randomBetween(0.08, 0.2);
        p.noise = randomBetween(0.005, 0.035);
        p.octave = choose([0.5, 1]);
        p.cutoff = skewed(900, 4200, 1.3);
        p.resonance = randomBetween(0.18, 0.42);
        p.driftRate = randomBetween(0.025, 0.08);
        p.driftDepth = randomBetween(70, 260);
        p.fmAmount = randomBetween(5, 35);
        p.fmMix = randomBetween(0.02, 0.12);
        p.decay = randomBetween(850, 2200);
        p.sustain = randomBetween(0.38, 0.68);
        p.chorusMod = randomBetween(0.32, 0.58);
        p.driveBass = randomBetween(0.58, 0.76);
        p.driveTreble = randomBetween(0.28, 0.48);
    } else if (category === "BRIGHT") {
        p.wave = choose([1, 2]);
        p.ratio = choose([1.5, 2, 3]);
        p.osc = randomBetween(0.22, 0.46);
        p.sub = randomBetween(0, 0.055);
        p.noise = randomBetween(0.01, 0.045);
        p.cutoff = randomBetween(5800, 11500);
        p.resonance = randomBetween(0.18, 0.46);
        p.driftRate = randomBetween(0.025, 0.085);
        p.driftDepth = randomBetween(55, 220);
        p.fmRatio = choose([2, 3, 4]);
        p.fmAmount = randomBetween(45, 125);
        p.fmMix = randomBetween(0.16, 0.34);
        p.decay = randomBetween(600, 1600);
        p.sustain = randomBetween(0.25, 0.52);
        p.driveTreble = randomBetween(0.6, 0.82);
        p.reverbDamping = randomBetween(0.28, 0.55);
    } else if (category === "ANALOG") {
        p.wave = choose([1, 3]);
        p.ratio = choose([0.997, 1.004, 2]);
        p.osc = randomBetween(0.34, 0.62);
        p.sub = randomBetween(0.08, 0.2);
        p.noise = randomBetween(0.005, 0.04);
        p.octave = choose([0.5, 1]);
        p.cutoff = randomBetween(1200, 6000);
        p.resonance = randomBetween(0.3, 0.62);
        p.driftRate = randomBetween(0.045, 0.14);
        p.driftDepth = randomBetween(130, 480);
        p.fmAmount = randomBetween(0, 25);
        p.fmMix = randomBetween(0, 0.08);
        p.decay = randomBetween(450, 1500);
        p.sustain = randomBetween(0.34, 0.7);
        p.chorusMod = randomBetween(0.4, 0.68);
        p.driveBass = randomBetween(0.55, 0.74);
    } else if (category === "DIGITAL") {
        p.wave = choose([2, 3]);
        p.filter = choose([1, 3, 4]);
        p.ratio = choose([1.5, 2.5, 3, 4]);
        p.osc = randomBetween(0.12, 0.38);
        p.sub = randomBetween(0, 0.07);
        p.noise = randomBetween(0, 0.035);
        p.cutoff = randomBetween(3000, 10000);
        p.resonance = randomBetween(0.32, 0.66);
        p.driftRate = randomBetween(0.008, 0.04);
        p.driftDepth = randomBetween(10, 100);
        p.fmRatio = choose([2.5, 3, 4, 5, 7]);
        p.fmAmount = randomBetween(65, 170);
        p.fmMix = randomBetween(0.24, 0.46);
        p.decay = randomBetween(450, 1450);
        p.sustain = randomBetween(0.22, 0.5);
        p.chorusWidth = randomBetween(0.78, 1);
        p.reverbMod = randomBetween(0.18, 0.42);
    } else if (category === "PLUCK") {
        p.wave = choose([1, 2, 3]);
        p.filter = choose([1, 3]);
        p.ratio = choose([1.5, 2, 3]);
        p.osc = randomBetween(0.1, 0.36);
        p.sub = randomBetween(0, 0.08);
        p.noise = randomBetween(0.015, 0.08);
        p.cutoff = randomBetween(1800, 8500);
        p.resonance = randomBetween(0.34, 0.68);
        p.driftRate = randomBetween(0.015, 0.06);
        p.driftDepth = randomBetween(25, 150);
        p.fmRatio = choose([2, 3, 4, 5]);
        p.fmAmount = randomBetween(30, 120);
        p.fmMix = randomBetween(0.08, 0.3);
        p.decay = randomBetween(120, 680);
        p.sustain = randomBetween(0.01, 0.09);
        p.reverbSize = randomBetween(0.5, 0.82);
        p.driveTreble = randomBetween(0.46, 0.72);
    } else if (category === "MALLET") {
        p.wave = 2;
        p.ratio = choose([2, 3, 4]);
        p.osc = randomBetween(0.04, 0.18);
        p.sub = randomBetween(0, 0.045);
        p.noise = randomBetween(0.005, 0.045);
        p.cutoff = randomBetween(2800, 7800);
        p.resonance = randomBetween(0.24, 0.54);
        p.driftRate = randomBetween(0.008, 0.035);
        p.driftDepth = randomBetween(10, 75);
        p.fmRatio = choose([3, 4, 5, 6]);
        p.fmAmount = randomBetween(70, 165);
        p.fmMix = randomBetween(0.24, 0.46);
        p.decay = randomBetween(280, 1100);
        p.sustain = randomBetween(0.015, 0.14);
        p.reverbSize = randomBetween(0.58, 0.86);
        p.reverbDamping = randomBetween(0.3, 0.6);
    } else if (category === "DUSK") {
        p.wave = choose([1, 2]);
        p.filter = 1;
        p.ratio = choose([0.997, 1.5, 2]);
        p.osc = randomBetween(0.12, 0.36);
        p.sub = randomBetween(0.05, 0.16);
        p.noise = randomBetween(0.03, 0.1);
        p.octave = choose([0.5, 1]);
        p.cutoff = skewed(650, 3100, 1.45);
        p.resonance = randomBetween(0.22, 0.48);
        p.driftRate = randomBetween(0.025, 0.085);
        p.driftDepth = randomBetween(80, 310);
        p.fmRatio = choose([1.5, 2, 3]);
        p.fmAmount = randomBetween(15, 70);
        p.fmMix = randomBetween(0.05, 0.2);
        p.decay = randomBetween(700, 1900);
        p.sustain = randomBetween(0.18, 0.46);
        p.reverbDamping = randomBetween(0.7, 0.92);
        p.driveBass = randomBetween(0.58, 0.78);
        p.driveTreble = randomBetween(0.2, 0.42);
    } else { // HYBRID
        p.wave = choose([1, 2, 3]);
        p.filter = choose([1, 3, 4]);
        p.ratio = choose([0.997, 1.5, 2, 2.5, 3]);
        p.osc = randomBetween(0.12, 0.48);
        p.sub = randomBetween(0, 0.14);
        p.noise = randomBetween(0.005, 0.075);
        p.octave = choose([0.5, 1]);
        p.cutoff = randomBetween(1400, 9200);
        p.resonance = randomBetween(0.2, 0.64);
        p.driftRate = randomBetween(0.015, 0.11);
        p.driftDepth = randomBetween(30, 390);
        p.fmRatio = choose([1.5, 2, 3, 4, 5]);
        p.fmAmount = randomBetween(20, 155);
        p.fmMix = randomBetween(0.06, 0.42);
        p.decay = randomBetween(300, 2100);
        p.sustain = randomBetween(0.06, 0.62);
        p.chorusMod = randomBetween(0.2, 0.7);
        p.reverbMod = randomBetween(0.08, 0.45);
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
    // Attack and Release stay under the player's hands across generations.
    outlet(4, preset.cutoff);

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
