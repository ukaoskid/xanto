var XOrdsCore = (() => {
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __export = (target, all) => {
    for (var name in all)
      __defProp(target, name, { get: all[name], enumerable: true });
  };
  var __copyProps = (to, from, except, desc) => {
    if (from && typeof from === "object" || typeof from === "function") {
      for (let key2 of __getOwnPropNames(from))
        if (!__hasOwnProp.call(to, key2) && key2 !== except)
          __defProp(to, key2, { get: () => from[key2], enumerable: !(desc = __getOwnPropDesc(from, key2)) || desc.enumerable });
    }
    return to;
  };
  var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

  // XOrds Max adapter
  var xords_max_exports = {};
  __export(xords_max_exports, {
    dump: () => dump,
    init: () => init,
    learnBase: () => learnBase,
    note: () => note,
    panic: () => panic,
    regenerate: () => regenerate,
    setBase: () => setBase,
    setExtensionFlags: () => setExtensionFlags,
    setExtensions: () => setExtensions,
    setGenre: () => setGenre,
    setKey: () => setKey,
    setOctave: () => setOctave,
    setScale: () => setScale,
    setTranspose: () => setTranspose
  });

  // XOrds harmony engine
  var KEYS = ["C", "C\u266F", "D", "E\u266D", "E", "F", "F\u266F", "G", "A\u266D", "A", "B\u266D", "B"];
  var SCALES = [
    "Major",
    "Minor",
    "Harmonic Minor",
    "Melodic Minor",
    "Dorian",
    "Phrygian",
    "Lydian",
    "Mixolydian",
    "Locrian",
    "Phrygian Dominant"
  ];
  var GENRES = [
    "Pop",
    "Neo Soul",
    "R&B",
    "Soul",
    "Gospel",
    "Jazz",
    "Lo-fi",
    "House",
    "Drum & Bass",
    "Liquid Drum & Bass",
    "UK Garage",
    "Funk",
    "Rock",
    "Cinematic",
    "Ambient",
    "Latin"
  ];
  var EXTENSIONS = ["Triad", "7", "9", "11", "13", "Sus", "6 / add9"];
  var KEY_PITCH = {
    C: 0,
    "C\u266F": 1,
    D: 2,
    "E\u266D": 3,
    E: 4,
    F: 5,
    "F\u266F": 6,
    G: 7,
    "A\u266D": 8,
    A: 9,
    "B\u266D": 10,
    B: 11
  };
  var SCALE_INTERVALS = {
    Major: [0, 2, 4, 5, 7, 9, 11],
    Minor: [0, 2, 3, 5, 7, 8, 10],
    "Harmonic Minor": [0, 2, 3, 5, 7, 8, 11],
    "Melodic Minor": [0, 2, 3, 5, 7, 9, 11],
    Dorian: [0, 2, 3, 5, 7, 9, 10],
    Phrygian: [0, 1, 3, 5, 7, 8, 10],
    Lydian: [0, 2, 4, 6, 7, 9, 11],
    Mixolydian: [0, 2, 4, 5, 7, 9, 10],
    Locrian: [0, 1, 3, 5, 6, 8, 10],
    "Phrygian Dominant": [0, 1, 4, 5, 7, 8, 10]
  };
  var NOTE_NAMES = ["C", "C\u266F", "D", "E\u266D", "E", "F", "F\u266F", "G", "A\u266D", "A", "B\u266D", "B"];
  var ROMANS = ["I", "II", "III", "IV", "V", "VI", "VII"];
  var GENRE_DEGREES = {
    Pop: [1, 5, 6, 4, 2, 3, 1],
    "Neo Soul": [2, 5, 1, 6, 4, 3, 7],
    "R&B": [6, 2, 4, 5, 1, 3, 7],
    Soul: [1, 6, 2, 5, 4, 3, 7],
    Gospel: [1, 3, 4, 2, 5, 6, 7],
    Jazz: [2, 5, 1, 6, 3, 4, 7],
    "Lo-fi": [2, 5, 1, 6, 4, 3, 7],
    House: [6, 4, 1, 5, 2, 3, 7],
    "Drum & Bass": [1, 6, 3, 7, 4, 5, 2],
    "Liquid Drum & Bass": [6, 4, 1, 5, 2, 3, 7],
    "UK Garage": [6, 4, 2, 5, 1, 3, 7],
    Funk: [1, 4, 2, 5, 6, 3, 7],
    Rock: [1, 4, 5, 6, 3, 2, 7],
    Cinematic: [1, 5, 6, 3, 4, 2, 7],
    Ambient: [1, 3, 4, 2, 6, 5, 7],
    Latin: [2, 5, 1, 6, 4, 3, 7]
  };
  function diatonicChord(key2, scale2, degree, extension, voicing, base = 48) {
    const intervals = SCALE_INTERVALS[scale2];
    const rootIndex = degree - 1;
    const scaleNote = (offset) => {
      const index = rootIndex + offset;
      return base + KEY_PITCH[key2] + intervals[index % 7] + Math.floor(index / 7) * 12;
    };
    const triad = [scaleNote(0), scaleNote(2), scaleNote(4)];
    const third = triad[1] - triad[0];
    const fifth = triad[2] - triad[0];
    const quality = third === 3 ? fifth === 6 ? "dim" : "m" : "";
    let notes = [...triad];
    let suffix = quality;
    if (extension === "7") {
      notes.push(scaleNote(6));
      suffix = quality === "m" ? "m7" : quality === "dim" ? "m7\u266D5" : notes[3] - notes[0] === 11 ? "maj7" : "7";
    } else if (extension === "9") {
      notes.push(scaleNote(6), scaleNote(8));
      suffix = quality === "m" ? "m9" : scaleNote(6) - notes[0] === 11 ? "maj9" : "9";
    } else if (extension === "11") {
      notes.push(scaleNote(6), scaleNote(8), scaleNote(10));
      suffix = quality === "m" ? "m11" : "11";
    } else if (extension === "13") {
      notes.push(scaleNote(6), scaleNote(8), scaleNote(12));
      suffix = quality === "m" ? "m13" : "13";
    } else if (extension === "Sus") {
      const sus4 = voicing % 2 === 0;
      notes = [scaleNote(0), scaleNote(sus4 ? 3 : 1), scaleNote(4), scaleNote(6)];
      suffix = sus4 ? "7sus4" : "sus2";
    } else if (extension === "6 / add9") {
      if (voicing % 2 === 0) {
        notes = [...triad, scaleNote(5), scaleNote(8)];
        suffix = quality === "m" ? "m6/9" : "6/9";
      } else {
        notes = [...triad, scaleNote(8)];
        suffix = quality === "m" ? "m(add9)" : "add9";
      }
    }
    if (voicing % 3 === 1 && notes.length > 3) notes[1] += 12;
    if (voicing % 3 === 2) notes[notes.length - 1] += 12;
    notes = [...new Set(notes)].sort((a, b) => a - b).filter((note2) => note2 <= 88);
    const rootPitch = KEY_PITCH[key2] + intervals[rootIndex];
    const roman = quality === "m" || quality === "dim" ? ROMANS[rootIndex].toLowerCase() : ROMANS[rootIndex];
    return { degree, label: `${NOTE_NAMES[rootPitch % 12]}${suffix}`, roman, notes };
  }
  function generateChordBank(genre2, key2, scale2, enabled, variation2 = 0) {
    const colors = enabled.length ? enabled : ["Triad"];
    const degrees = GENRE_DEGREES[genre2];
    const raw = Array.from({ length: 25 }, (_, index) => {
      const degree = degrees[(index + variation2) % degrees.length];
      const extension = colors[(index + Math.floor(index / 7) + variation2) % colors.length];
      return diatonicChord(key2, scale2, degree, extension, index + variation2);
    });
    return voiceLeadBank(raw);
  }
  function voiceLeadBank(chords) {
    return chords.reduce((result, chord, index) => {
      if (index === 0) return [chord];
      const previous = result[index - 1].notes;
      const center = previous.reduce((sum, note2) => sum + note2, 0) / previous.length;
      const voiced = chord.notes.map((note2, noteIndex) => {
        const pitchClass = (note2 % 12 + 12) % 12;
        const target = previous[Math.min(noteIndex, previous.length - 1)] ?? center;
        const candidates = Array.from({ length: 6 }, (_, octave2) => pitchClass + 36 + octave2 * 12);
        return candidates.reduce((best, candidate) => Math.abs(candidate - target) < Math.abs(best - target) ? candidate : best);
      }).sort((a, b) => a - b);
      const unique = voiced.filter((note2, noteIndex) => noteIndex === 0 || note2 !== voiced[noteIndex - 1]);
      return [...result, { ...chord, notes: unique }];
    }, []);
  }

  // XOrds performance state and MIDI routing
  var emit = () => void 0;
  var key = "C";
  var scale = "Major";
  var genre = "Neo Soul";
  var extensions = ["Triad", "7", "9"];
  var baseNote = 48;
  var transpose = 0;
  var octave = 0;
  var variation = 0;
  var learningBase = false;
  var bank = [];
  var activeNotes = /* @__PURE__ */ new Map();
  var chordRoots = { C: 0, "C\u266F": 1, D: 2, "E\u266D": 3, E: 4, F: 5, "F\u266F": 6, G: 7, "A\u266D": 8, A: 9, "B\u266D": 10, B: 11 };
  var chromaticNames = ["C", "C\u266F", "D", "E\u266D", "E", "F", "F\u266F", "G", "A\u266D", "A", "B\u266D", "B"];
  var clampIndex = (value, length) => Math.max(0, Math.min(length - 1, Math.round(value)));
  var clampMidi = (value) => Math.max(0, Math.min(127, Math.round(value)));
  function outputNote(note2, velocity) {
    emit(0, clampMidi(note2), clampMidi(velocity));
  }
  function release(triggerNote) {
    const active = activeNotes.get(triggerNote);
    if (!active) return;
    active.notes.forEach((note2) => outputNote(note2, 0));
    emit(1, "held", active.index + 1, 0);
    activeNotes.delete(triggerNote);
  }
  function panic() {
    learningBase = false;
    activeNotes.forEach((_, triggerNote) => release(triggerNote));
    emit(1, "active", 0);
  }
  function rebuild() {
    panic();
    bank = generateChordBank(genre, key, scale, extensions, variation);
    dumpBank();
    emit(1, "status", "ENGINE READY");
  }
  function trigger(pitch, velocity) {
    const triggerNote = clampMidi(pitch);
    if (learningBase) {
      if (velocity <= 0) return;
      baseNote = triggerNote;
      learningBase = false;
      emit(1, "base", baseNote);
      emit(1, "status", "LOWEST KEY LEARNED");
      return;
    }
    if (velocity <= 0) {
      release(triggerNote);
      emit(1, "active", 0);
      return;
    }
    const index = triggerNote - baseNote;
    if (index < 0 || index >= bank.length) return;
    release(triggerNote);
    const shift = transpose + octave * 12;
    const notes = bank[index].notes.map((note2) => clampMidi(note2 + shift));
    notes.forEach((note2) => outputNote(note2, velocity));
    activeNotes.set(triggerNote, { notes, index });
    emit(1, "held", index + 1, 1);
    emit(1, "active", index + 1);
  }
  function dumpBank() {
    bank.forEach((chord, index) => {
      const root = Object.keys(chordRoots).sort((a, b) => b.length - a.length).find((name) => chord.label.startsWith(name)) || "C";
      const suffix = chord.label.slice(root.length);
      const displayRoot = chromaticNames[(chordRoots[root] + transpose + 120) % 12];
      emit(1, "slot", index + 1, `${displayRoot}${suffix}`, `(${chord.roman})`);
    });
    emit(1, "settings", key, scale, genre, transpose, octave);
  }
  function init(hostEmit) {
    emit = hostEmit;
    rebuild();
  }
  function note(pitch, velocity) {
    trigger(pitch, velocity);
  }
  function setKey(index) {
    key = KEYS[clampIndex(index, KEYS.length)];
    rebuild();
  }
  function setScale(index) {
    scale = SCALES[clampIndex(index, SCALES.length)];
    rebuild();
  }
  function setGenre(index) {
    genre = GENRES[clampIndex(index, GENRES.length)];
    rebuild();
  }
  function setBase(noteValue) {
    baseNote = clampMidi(noteValue);
    panic();
  }
  function learnBase() {
    panic();
    learningBase = true;
    emit(1, "status", "PRESS LOWEST KEY");
  }
  function setTranspose(value) {
    transpose = Math.max(-12, Math.min(12, Math.round(value)));
    panic();
    dumpBank();
  }
  function setOctave(value) {
    octave = Math.max(-2, Math.min(2, Math.round(value)));
    panic();
    dumpBank();
  }
  function setExtensions(...indices) {
    extensions = indices.map((index) => EXTENSIONS[clampIndex(index, EXTENSIONS.length)]).filter(Boolean);
    if (!extensions.length) extensions = ["Triad"];
    rebuild();
  }
  function setExtensionFlags(...flags) {
    extensions = EXTENSIONS.filter((_, index) => Boolean(Math.round(flags[index] || 0)));
    if (!extensions.length) extensions = ["Triad"];
    rebuild();
  }
  function regenerate() {
    variation += 1;
    rebuild();
  }
  function dump() {
    dumpBank();
  }
  return __toCommonJS(xords_max_exports);
})();

inlets = 1;
outlets = 2;

function xords_emit() {
  outlet.apply(null, arrayfromargs(arguments));
}

XOrdsCore.init(xords_emit);

function list() {
  var values = arrayfromargs(arguments);
  XOrdsCore.note(values[0], values[1]);
}

function note(pitch, velocity) { XOrdsCore.note(pitch, velocity); }
function set_key(index) { XOrdsCore.setKey(index); }
function set_scale(index) { XOrdsCore.setScale(index); }
function set_genre(index) { XOrdsCore.setGenre(index); }
function set_base(value) { XOrdsCore.setBase(value); }
function learn_base() { XOrdsCore.learnBase(); }
function set_transpose(value) { XOrdsCore.setTranspose(value); }
function set_octave(value) { XOrdsCore.setOctave(value); }
function set_extensions() { XOrdsCore.setExtensions.apply(null, arrayfromargs(arguments)); }
function set_extension_flags() { XOrdsCore.setExtensionFlags.apply(null, arrayfromargs(arguments)); }
function regenerate() { XOrdsCore.regenerate(); }
function dump_bank() { XOrdsCore.dump(); }
function panic() { XOrdsCore.panic(); }
