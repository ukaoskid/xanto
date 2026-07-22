{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 8,
			"minor": 6,
			"revision": 5,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			80,
			80,
			840,
			450
		],
		"openrect": [
			0,
			0,
			760,
			169
		],
		"bglocked": 0,
		"openinpresentation": 1,
		"default_fontsize": 10,
		"default_fontface": 0,
		"default_fontname": "Ableton Sans Medium Regular",
		"gridonopen": 1,
		"gridsize": [
			8,
			8
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 760,
		"description": "Play a genre-aware chord bank from a 25-key MIDI controller.",
		"digest": "One-note chord performance and harmonic discovery.",
		"tags": "MIDI chord harmony XOrds",
		"title": "XOrds",
		"boxes": [
			{
				"box": {
					"id": "note-in",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						25,
						270,
						45,
						22
					],
					"outlettype": [
						"int",
						"int",
						"int"
					],
					"text": "notein"
				}
			},
			{
				"box": {
					"id": "pack-note",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						25,
						310,
						62,
						22
					],
					"outlettype": [
						"list"
					],
					"text": "pack 0 0"
				}
			},
			{
				"box": {
					"id": "engine",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						125,
						310,
						205,
						22
					],
					"filename": "none",
					"outlettype": [
						"",
						""
					],
					"saved_object_attributes": {
						"parameter_enable": 0
					},
					"textfile": {
						"text": "var XOrdsCore = (() => {\n  var __defProp = Object.defineProperty;\n  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;\n  var __getOwnPropNames = Object.getOwnPropertyNames;\n  var __hasOwnProp = Object.prototype.hasOwnProperty;\n  var __export = (target, all) => {\n    for (var name in all)\n      __defProp(target, name, { get: all[name], enumerable: true });\n  };\n  var __copyProps = (to, from, except, desc) => {\n    if (from && typeof from === \"object\" || typeof from === \"function\") {\n      for (let key2 of __getOwnPropNames(from))\n        if (!__hasOwnProp.call(to, key2) && key2 !== except)\n          __defProp(to, key2, { get: () => from[key2], enumerable: !(desc = __getOwnPropDesc(from, key2)) || desc.enumerable });\n    }\n    return to;\n  };\n  var __toCommonJS = (mod) => __copyProps(__defProp({}, \"__esModule\", { value: true }), mod);\n\n  // XOrds Max adapter\n  var xords_max_exports = {};\n  __export(xords_max_exports, {\n    dump: () => dump,\n    init: () => init,\n    learnBase: () => learnBase,\n    note: () => note,\n    panic: () => panic,\n    regenerate: () => regenerate,\n    setBase: () => setBase,\n    setExtensionFlags: () => setExtensionFlags,\n    setExtensions: () => setExtensions,\n    setGenre: () => setGenre,\n    setKey: () => setKey,\n    setOctave: () => setOctave,\n    setScale: () => setScale,\n    setTranspose: () => setTranspose\n  });\n\n  // XOrds harmony engine\n  var KEYS = [\"C\", \"C\\u266F\", \"D\", \"E\\u266D\", \"E\", \"F\", \"F\\u266F\", \"G\", \"A\\u266D\", \"A\", \"B\\u266D\", \"B\"];\n  var SCALES = [\n    \"Major\",\n    \"Minor\",\n    \"Harmonic Minor\",\n    \"Melodic Minor\",\n    \"Dorian\",\n    \"Phrygian\",\n    \"Lydian\",\n    \"Mixolydian\",\n    \"Locrian\",\n    \"Phrygian Dominant\"\n  ];\n  var GENRES = [\n    \"Pop\",\n    \"Neo Soul\",\n    \"R&B\",\n    \"Soul\",\n    \"Gospel\",\n    \"Jazz\",\n    \"Lo-fi\",\n    \"House\",\n    \"Drum & Bass\",\n    \"Liquid Drum & Bass\",\n    \"UK Garage\",\n    \"Funk\",\n    \"Rock\",\n    \"Cinematic\",\n    \"Ambient\",\n    \"Latin\"\n  ];\n  var EXTENSIONS = [\"Triad\", \"7\", \"9\", \"11\", \"13\", \"Sus\", \"6 / add9\"];\n  var KEY_PITCH = {\n    C: 0,\n    \"C\\u266F\": 1,\n    D: 2,\n    \"E\\u266D\": 3,\n    E: 4,\n    F: 5,\n    \"F\\u266F\": 6,\n    G: 7,\n    \"A\\u266D\": 8,\n    A: 9,\n    \"B\\u266D\": 10,\n    B: 11\n  };\n  var SCALE_INTERVALS = {\n    Major: [0, 2, 4, 5, 7, 9, 11],\n    Minor: [0, 2, 3, 5, 7, 8, 10],\n    \"Harmonic Minor\": [0, 2, 3, 5, 7, 8, 11],\n    \"Melodic Minor\": [0, 2, 3, 5, 7, 9, 11],\n    Dorian: [0, 2, 3, 5, 7, 9, 10],\n    Phrygian: [0, 1, 3, 5, 7, 8, 10],\n    Lydian: [0, 2, 4, 6, 7, 9, 11],\n    Mixolydian: [0, 2, 4, 5, 7, 9, 10],\n    Locrian: [0, 1, 3, 5, 6, 8, 10],\n    \"Phrygian Dominant\": [0, 1, 4, 5, 7, 8, 10]\n  };\n  var NOTE_NAMES = [\"C\", \"C\\u266F\", \"D\", \"E\\u266D\", \"E\", \"F\", \"F\\u266F\", \"G\", \"A\\u266D\", \"A\", \"B\\u266D\", \"B\"];\n  var ROMANS = [\"I\", \"II\", \"III\", \"IV\", \"V\", \"VI\", \"VII\"];\n  var GENRE_DEGREES = {\n    Pop: [1, 5, 6, 4, 2, 3, 1],\n    \"Neo Soul\": [2, 5, 1, 6, 4, 3, 7],\n    \"R&B\": [6, 2, 4, 5, 1, 3, 7],\n    Soul: [1, 6, 2, 5, 4, 3, 7],\n    Gospel: [1, 3, 4, 2, 5, 6, 7],\n    Jazz: [2, 5, 1, 6, 3, 4, 7],\n    \"Lo-fi\": [2, 5, 1, 6, 4, 3, 7],\n    House: [6, 4, 1, 5, 2, 3, 7],\n    \"Drum & Bass\": [1, 6, 3, 7, 4, 5, 2],\n    \"Liquid Drum & Bass\": [6, 4, 1, 5, 2, 3, 7],\n    \"UK Garage\": [6, 4, 2, 5, 1, 3, 7],\n    Funk: [1, 4, 2, 5, 6, 3, 7],\n    Rock: [1, 4, 5, 6, 3, 2, 7],\n    Cinematic: [1, 5, 6, 3, 4, 2, 7],\n    Ambient: [1, 3, 4, 2, 6, 5, 7],\n    Latin: [2, 5, 1, 6, 4, 3, 7]\n  };\n  function diatonicChord(key2, scale2, degree, extension, voicing, base = 48) {\n    const intervals = SCALE_INTERVALS[scale2];\n    const rootIndex = degree - 1;\n    const scaleNote = (offset) => {\n      const index = rootIndex + offset;\n      return base + KEY_PITCH[key2] + intervals[index % 7] + Math.floor(index / 7) * 12;\n    };\n    const triad = [scaleNote(0), scaleNote(2), scaleNote(4)];\n    const third = triad[1] - triad[0];\n    const fifth = triad[2] - triad[0];\n    const quality = third === 3 ? fifth === 6 ? \"dim\" : \"m\" : \"\";\n    let notes = [...triad];\n    let suffix = quality;\n    if (extension === \"7\") {\n      notes.push(scaleNote(6));\n      suffix = quality === \"m\" ? \"m7\" : quality === \"dim\" ? \"m7\\u266D5\" : notes[3] - notes[0] === 11 ? \"maj7\" : \"7\";\n    } else if (extension === \"9\") {\n      notes.push(scaleNote(6), scaleNote(8));\n      suffix = quality === \"m\" ? \"m9\" : scaleNote(6) - notes[0] === 11 ? \"maj9\" : \"9\";\n    } else if (extension === \"11\") {\n      notes.push(scaleNote(6), scaleNote(8), scaleNote(10));\n      suffix = quality === \"m\" ? \"m11\" : \"11\";\n    } else if (extension === \"13\") {\n      notes.push(scaleNote(6), scaleNote(8), scaleNote(12));\n      suffix = quality === \"m\" ? \"m13\" : \"13\";\n    } else if (extension === \"Sus\") {\n      const sus4 = voicing % 2 === 0;\n      notes = [scaleNote(0), scaleNote(sus4 ? 3 : 1), scaleNote(4), scaleNote(6)];\n      suffix = sus4 ? \"7sus4\" : \"sus2\";\n    } else if (extension === \"6 / add9\") {\n      if (voicing % 2 === 0) {\n        notes = [...triad, scaleNote(5), scaleNote(8)];\n        suffix = quality === \"m\" ? \"m6/9\" : \"6/9\";\n      } else {\n        notes = [...triad, scaleNote(8)];\n        suffix = quality === \"m\" ? \"m(add9)\" : \"add9\";\n      }\n    }\n    if (voicing % 3 === 1 && notes.length > 3) notes[1] += 12;\n    if (voicing % 3 === 2) notes[notes.length - 1] += 12;\n    notes = [...new Set(notes)].sort((a, b) => a - b).filter((note2) => note2 <= 88);\n    const rootPitch = KEY_PITCH[key2] + intervals[rootIndex];\n    const roman = quality === \"m\" || quality === \"dim\" ? ROMANS[rootIndex].toLowerCase() : ROMANS[rootIndex];\n    return { degree, label: `${NOTE_NAMES[rootPitch % 12]}${suffix}`, roman, notes };\n  }\n  function generateChordBank(genre2, key2, scale2, enabled, variation2 = 0) {\n    const colors = enabled.length ? enabled : [\"Triad\"];\n    const degrees = GENRE_DEGREES[genre2];\n    const raw = Array.from({ length: 25 }, (_, index) => {\n      const degree = degrees[(index + variation2) % degrees.length];\n      const extension = colors[(index + Math.floor(index / 7) + variation2) % colors.length];\n      return diatonicChord(key2, scale2, degree, extension, index + variation2);\n    });\n    return voiceLeadBank(raw);\n  }\n  function voiceLeadBank(chords) {\n    return chords.reduce((result, chord, index) => {\n      if (index === 0) return [chord];\n      const previous = result[index - 1].notes;\n      const center = previous.reduce((sum, note2) => sum + note2, 0) / previous.length;\n      const voiced = chord.notes.map((note2, noteIndex) => {\n        const pitchClass = (note2 % 12 + 12) % 12;\n        const target = previous[Math.min(noteIndex, previous.length - 1)] ?? center;\n        const candidates = Array.from({ length: 6 }, (_, octave2) => pitchClass + 36 + octave2 * 12);\n        return candidates.reduce((best, candidate) => Math.abs(candidate - target) < Math.abs(best - target) ? candidate : best);\n      }).sort((a, b) => a - b);\n      const unique = voiced.filter((note2, noteIndex) => noteIndex === 0 || note2 !== voiced[noteIndex - 1]);\n      return [...result, { ...chord, notes: unique }];\n    }, []);\n  }\n\n  // XOrds performance state and MIDI routing\n  var emit = () => void 0;\n  var key = \"C\";\n  var scale = \"Major\";\n  var genre = \"Neo Soul\";\n  var extensions = [\"Triad\", \"7\", \"9\"];\n  var baseNote = 48;\n  var transpose = 0;\n  var octave = 0;\n  var variation = 0;\n  var learningBase = false;\n  var bank = [];\n  var activeNotes = /* @__PURE__ */ new Map();\n  var chordRoots = { C: 0, \"C\\u266F\": 1, D: 2, \"E\\u266D\": 3, E: 4, F: 5, \"F\\u266F\": 6, G: 7, \"A\\u266D\": 8, A: 9, \"B\\u266D\": 10, B: 11 };\n  var chromaticNames = [\"C\", \"C\\u266F\", \"D\", \"E\\u266D\", \"E\", \"F\", \"F\\u266F\", \"G\", \"A\\u266D\", \"A\", \"B\\u266D\", \"B\"];\n  var clampIndex = (value, length) => Math.max(0, Math.min(length - 1, Math.round(value)));\n  var clampMidi = (value) => Math.max(0, Math.min(127, Math.round(value)));\n  function outputNote(note2, velocity) {\n    emit(0, clampMidi(note2), clampMidi(velocity));\n  }\n  function release(triggerNote) {\n    const active = activeNotes.get(triggerNote);\n    if (!active) return;\n    active.notes.forEach((note2) => outputNote(note2, 0));\n    emit(1, \"held\", active.index + 1, 0);\n    activeNotes.delete(triggerNote);\n  }\n  function panic() {\n    learningBase = false;\n    activeNotes.forEach((_, triggerNote) => release(triggerNote));\n    emit(1, \"active\", 0);\n  }\n  function rebuild() {\n    panic();\n    bank = generateChordBank(genre, key, scale, extensions, variation);\n    dumpBank();\n    emit(1, \"status\", \"ENGINE READY\");\n  }\n  function trigger(pitch, velocity) {\n    const triggerNote = clampMidi(pitch);\n    if (learningBase) {\n      if (velocity <= 0) return;\n      baseNote = triggerNote;\n      learningBase = false;\n      emit(1, \"base\", baseNote);\n      emit(1, \"status\", \"LOWEST KEY LEARNED\");\n      return;\n    }\n    if (velocity <= 0) {\n      release(triggerNote);\n      emit(1, \"active\", 0);\n      return;\n    }\n    const index = triggerNote - baseNote;\n    if (index < 0 || index >= bank.length) return;\n    release(triggerNote);\n    const shift = transpose + octave * 12;\n    const notes = bank[index].notes.map((note2) => clampMidi(note2 + shift));\n    notes.forEach((note2) => outputNote(note2, velocity));\n    activeNotes.set(triggerNote, { notes, index });\n    emit(1, \"held\", index + 1, 1);\n    emit(1, \"active\", index + 1);\n  }\n  function dumpBank() {\n    bank.forEach((chord, index) => {\n      const root = Object.keys(chordRoots).sort((a, b) => b.length - a.length).find((name) => chord.label.startsWith(name)) || \"C\";\n      const suffix = chord.label.slice(root.length);\n      const displayRoot = chromaticNames[(chordRoots[root] + transpose + 120) % 12];\n      emit(1, \"slot\", index + 1, `${displayRoot}${suffix}`, `(${chord.roman})`);\n    });\n    emit(1, \"settings\", key, scale, genre, transpose, octave);\n  }\n  function init(hostEmit) {\n    emit = hostEmit;\n    rebuild();\n  }\n  function note(pitch, velocity) {\n    trigger(pitch, velocity);\n  }\n  function setKey(index) {\n    key = KEYS[clampIndex(index, KEYS.length)];\n    rebuild();\n  }\n  function setScale(index) {\n    scale = SCALES[clampIndex(index, SCALES.length)];\n    rebuild();\n  }\n  function setGenre(index) {\n    genre = GENRES[clampIndex(index, GENRES.length)];\n    rebuild();\n  }\n  function setBase(noteValue) {\n    baseNote = clampMidi(noteValue);\n    panic();\n  }\n  function learnBase() {\n    panic();\n    learningBase = true;\n    emit(1, \"status\", \"PRESS LOWEST KEY\");\n  }\n  function setTranspose(value) {\n    transpose = Math.max(-12, Math.min(12, Math.round(value)));\n    panic();\n    dumpBank();\n  }\n  function setOctave(value) {\n    octave = Math.max(-2, Math.min(2, Math.round(value)));\n    panic();\n    dumpBank();\n  }\n  function setExtensions(...indices) {\n    extensions = indices.map((index) => EXTENSIONS[clampIndex(index, EXTENSIONS.length)]).filter(Boolean);\n    if (!extensions.length) extensions = [\"Triad\"];\n    rebuild();\n  }\n  function setExtensionFlags(...flags) {\n    extensions = EXTENSIONS.filter((_, index) => Boolean(Math.round(flags[index] || 0)));\n    if (!extensions.length) extensions = [\"Triad\"];\n    rebuild();\n  }\n  function regenerate() {\n    variation += 1;\n    rebuild();\n  }\n  function dump() {\n    dumpBank();\n  }\n  return __toCommonJS(xords_max_exports);\n})();\n\ninlets = 1;\noutlets = 2;\n\nfunction xords_emit() {\n  outlet.apply(null, arrayfromargs(arguments));\n}\n\nXOrdsCore.init(xords_emit);\n\nfunction list() {\n  var values = arrayfromargs(arguments);\n  XOrdsCore.note(values[0], values[1]);\n}\n\nfunction note(pitch, velocity) { XOrdsCore.note(pitch, velocity); }\nfunction set_key(index) { XOrdsCore.setKey(index); }\nfunction set_scale(index) { XOrdsCore.setScale(index); }\nfunction set_genre(index) { XOrdsCore.setGenre(index); }\nfunction set_base(value) { XOrdsCore.setBase(value); }\nfunction learn_base() { XOrdsCore.learnBase(); }\nfunction set_transpose(value) { XOrdsCore.setTranspose(value); }\nfunction set_octave(value) { XOrdsCore.setOctave(value); }\nfunction set_extensions() { XOrdsCore.setExtensions.apply(null, arrayfromargs(arguments)); }\nfunction set_extension_flags() { XOrdsCore.setExtensionFlags.apply(null, arrayfromargs(arguments)); }\nfunction regenerate() { XOrdsCore.regenerate(); }\nfunction dump_bank() { XOrdsCore.dump(); }\nfunction panic() { XOrdsCore.panic(); }\n",
						"filename": "none",
						"flags": 0,
						"embed": 1,
						"autowatch": 1
					},
					"text": "v8"
				}
			},
			{
				"box": {
					"id": "unpack-note",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						368,
						310,
						74,
						22
					],
					"outlettype": [
						"int",
						"int"
					],
					"text": "unpack 0 0"
				}
			},
			{
				"box": {
					"id": "note-out",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 0,
					"patching_rect": [
						480,
						310,
						52,
						22
					],
					"text": "noteout"
				}
			},
			{
				"box": {
					"id": "label-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						12,
						10,
						55,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						12,
						10,
						55,
						18
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "XORDS"
				}
			},
			{
				"box": {
					"id": "label-key",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						82,
						10,
						55,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						82,
						10,
						55,
						18
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "KEY"
				}
			},
			{
				"box": {
					"id": "label-scale",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						152,
						10,
						80,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						152,
						10,
						80,
						18
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "SCALE"
				}
			},
			{
				"box": {
					"id": "label-genre",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						257,
						10,
						130,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						257,
						10,
						130,
						18
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "GENRE"
				}
			},
			{
				"box": {
					"id": "label-transpose",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						412,
						10,
						65,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						412,
						10,
						65,
						18
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "TRANSPOSE"
				}
			},
			{
				"box": {
					"id": "label-octave",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						492,
						10,
						55,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						492,
						10,
						55,
						18
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "OCTAVE"
				}
			},
			{
				"box": {
					"id": "label-base",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						562,
						10,
						60,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						562,
						10,
						60,
						18
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "LOWEST KEY"
				}
			},
			{
				"box": {
					"id": "key-menu",
					"maxclass": "live.menu",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						82,
						29,
						58,
						24
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						82,
						29,
						58,
						24
					],
					"varname": "Key",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"C",
								"C#",
								"D",
								"Eb",
								"E",
								"F",
								"F#",
								"G",
								"Ab",
								"A",
								"Bb",
								"B"
							],
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Key",
							"parameter_mmax": 11,
							"parameter_shortname": "Key",
							"parameter_type": 2
						}
					}
				}
			},
			{
				"box": {
					"id": "scale-menu",
					"maxclass": "live.menu",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						152,
						29,
						94,
						24
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						152,
						29,
						94,
						24
					],
					"varname": "Scale",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
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
							],
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Scale",
							"parameter_mmax": 9,
							"parameter_shortname": "Scale",
							"parameter_type": 2
						}
					}
				}
			},
			{
				"box": {
					"id": "genre-menu",
					"maxclass": "live.menu",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						257,
						29,
						143,
						24
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						257,
						29,
						143,
						24
					],
					"varname": "Genre",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"Pop",
								"Neo Soul",
								"R&B",
								"Soul",
								"Gospel",
								"Jazz",
								"Lo-fi",
								"House",
								"Drum & Bass",
								"Liquid DnB",
								"UK Garage",
								"Funk",
								"Rock",
								"Cinematic",
								"Ambient",
								"Latin"
							],
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Genre",
							"parameter_mmax": 15,
							"parameter_shortname": "Genre",
							"parameter_type": 2
						}
					}
				}
			},
			{
				"box": {
					"id": "transpose-box",
					"maxclass": "live.numbox",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						412,
						29,
						65,
						24
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						412,
						29,
						65,
						24
					],
					"varname": "Transpose",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Transpose",
							"parameter_mmin": -12,
							"parameter_mmax": 12,
							"parameter_shortname": "Transpose",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "octave-box",
					"maxclass": "live.numbox",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						492,
						29,
						55,
						24
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						492,
						29,
						55,
						24
					],
					"varname": "Octave",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Octave",
							"parameter_mmin": -2,
							"parameter_mmax": 2,
							"parameter_shortname": "Octave",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "base-box",
					"maxclass": "live.numbox",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						682,
						210,
						58,
						24
					],
					"parameter_enable": 1,
					"presentation": 0,
					"presentation_rect": [
						682,
						210,
						58,
						24
					],
					"varname": "Lowest Key",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								48
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Lowest Key",
							"parameter_mmin": 0,
							"parameter_mmax": 127,
							"parameter_shortname": "Lowest Key",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "learn-base-button",
					"maxclass": "textbutton",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						562,
						29,
						58,
						24
					],
					"presentation": 1,
					"presentation_rect": [
						562,
						29,
						58,
						24
					],
					"fontsize": 8,
					"text": "LEARN",
					"texton": "LEARN"
				}
			},
			{
				"box": {
					"id": "learn-base-message",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						682,
						250,
						72,
						22
					],
					"text": "learn_base"
				}
			},
			{
				"box": {
					"id": "key-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						90,
						210,
						100,
						22
					],
					"text": "prepend set_key"
				}
			},
			{
				"box": {
					"id": "scale-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						200,
						210,
						100,
						22
					],
					"text": "prepend set_scale"
				}
			},
			{
				"box": {
					"id": "genre-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						310,
						210,
						100,
						22
					],
					"text": "prepend set_genre"
				}
			},
			{
				"box": {
					"id": "transpose-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						420,
						210,
						100,
						22
					],
					"text": "prepend set_transpose"
				}
			},
			{
				"box": {
					"id": "octave-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						530,
						210,
						100,
						22
					],
					"text": "prepend set_octave"
				}
			},
			{
				"box": {
					"id": "base-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						640,
						210,
						100,
						22
					],
					"text": "prepend set_base"
				}
			},
			{
				"box": {
					"id": "chord-types-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						12,
						166,
						75,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						625,
						61,
						75,
						16
					],
					"fontsize": 9,
					"textcolor": [
						0.58,
						0.58,
						0.56,
						1
					],
					"text": "CHORD TYPES"
				}
			},
			{
				"box": {
					"id": "extension-pak",
					"maxclass": "newobj",
					"numinlets": 7,
					"numoutlets": 1,
					"patching_rect": [
						300,
						250,
						132,
						22
					],
					"text": "pak 1 1 1 0 0 0 0"
				}
			},
			{
				"box": {
					"id": "extension-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						445,
						250,
						165,
						22
					],
					"text": "prepend set_extension_flags"
				}
			},
			{
				"box": {
					"id": "extension-toggle-0",
					"maxclass": "live.toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						625,
						78,
						17,
						17
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						625,
						78,
						17,
						17
					],
					"varname": "Chord Type Triad",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Chord Type Triad",
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_shortname": "Chord Type Triad",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "extension-label-0",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						646,
						77,
						43,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						646,
						77,
						43,
						18
					],
					"fontsize": 9,
					"text": "Triad"
				}
			},
			{
				"box": {
					"id": "extension-toggle-1",
					"maxclass": "live.toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						689,
						78,
						17,
						17
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						689,
						78,
						17,
						17
					],
					"varname": "Chord Type 7",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Chord Type 7",
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_shortname": "Chord Type 7",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "extension-label-1",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						710,
						77,
						43,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						710,
						77,
						43,
						18
					],
					"fontsize": 9,
					"text": "7"
				}
			},
			{
				"box": {
					"id": "extension-toggle-2",
					"maxclass": "live.toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						625,
						99,
						17,
						17
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						625,
						99,
						17,
						17
					],
					"varname": "Chord Type 9",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Chord Type 9",
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_shortname": "Chord Type 9",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "extension-label-2",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						646,
						98,
						43,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						646,
						98,
						43,
						18
					],
					"fontsize": 9,
					"text": "9"
				}
			},
			{
				"box": {
					"id": "extension-toggle-3",
					"maxclass": "live.toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						689,
						99,
						17,
						17
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						689,
						99,
						17,
						17
					],
					"varname": "Chord Type 11",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Chord Type 11",
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_shortname": "Chord Type 11",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "extension-label-3",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						710,
						98,
						43,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						710,
						98,
						43,
						18
					],
					"fontsize": 9,
					"text": "11"
				}
			},
			{
				"box": {
					"id": "extension-toggle-4",
					"maxclass": "live.toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						625,
						120,
						17,
						17
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						625,
						120,
						17,
						17
					],
					"varname": "Chord Type 13",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Chord Type 13",
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_shortname": "Chord Type 13",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "extension-label-4",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						646,
						119,
						43,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						646,
						119,
						43,
						18
					],
					"fontsize": 9,
					"text": "13"
				}
			},
			{
				"box": {
					"id": "extension-toggle-5",
					"maxclass": "live.toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						689,
						120,
						17,
						17
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						689,
						120,
						17,
						17
					],
					"varname": "Chord Type Sus",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Chord Type Sus",
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_shortname": "Chord Type Sus",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "extension-label-5",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						710,
						119,
						43,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						710,
						119,
						43,
						18
					],
					"fontsize": 9,
					"text": "Sus"
				}
			},
			{
				"box": {
					"id": "extension-toggle-6",
					"maxclass": "live.toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						625,
						141,
						17,
						17
					],
					"parameter_enable": 1,
					"presentation": 1,
					"presentation_rect": [
						625,
						141,
						17,
						17
					],
					"varname": "Chord Type 6/add9",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_longname": "Chord Type 6/add9",
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_shortname": "Chord Type 6/add9",
							"parameter_type": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "extension-label-6",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						646,
						140,
						43,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						646,
						140,
						43,
						18
					],
					"fontsize": 9,
					"text": "6/add9"
				}
			},
			{
				"box": {
					"id": "regen-button",
					"maxclass": "textbutton",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						12,
						67,
						92,
						28
					],
					"presentation": 1,
					"presentation_rect": [
						625,
						29,
						59,
						24
					],
					"fontsize": 8,
					"text": "GENERATE",
					"texton": "GENERATE"
				}
			},
			{
				"box": {
					"id": "regen-message",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						20,
						110,
						70,
						22
					],
					"text": "regenerate"
				}
			},
			{
				"box": {
					"id": "panic-button",
					"maxclass": "textbutton",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						112,
						67,
						72,
						28
					],
					"presentation": 1,
					"presentation_rect": [
						689,
						29,
						54,
						24
					],
					"fontsize": 8,
					"text": "PANIC",
					"texton": "PANIC"
				}
			},
			{
				"box": {
					"id": "panic-message",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						112,
						110,
						50,
						22
					],
					"text": "panic"
				}
			},
			{
				"box": {
					"id": "state-route",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 6,
					"patching_rect": [
						560,
						310,
						182,
						22
					],
					"text": "route active slot status base held"
				}
			},
			{
				"box": {
					"id": "active-number",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						656,
						68,
						46,
						24
					],
					"presentation": 0
				}
			},
			{
				"box": {
					"id": "active-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						612,
						72,
						75,
						18
					],
					"presentation": 0,
					"fontsize": 9,
					"text": "ACTIVE SLOT"
				}
			},
			{
				"box": {
					"id": "status-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						705,
						310,
						75,
						22
					],
					"text": "prepend set"
				}
			},
			{
				"box": {
					"id": "status-display",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						625,
						157,
						118,
						12
					],
					"presentation": 0,
					"presentation_rect": [
						625,
						157,
						118,
						12
					],
					"fontsize": 7,
					"text": "ENGINE NOT LOADED"
				}
			},
			{
				"box": {
					"id": "slot-router",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 26,
					"patching_rect": [
						650,
						345,
						520,
						22
					],
					"text": "route 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25"
				}
			},
			{
				"box": {
					"id": "held-router",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 26,
					"patching_rect": [
						650,
						370,
						520,
						22
					],
					"text": "route 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25"
				}
			},
			{
				"box": {
					"id": "slot-symbol-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						395,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						525,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						740,
						525,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						650,
						655,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-1",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						785,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-1",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						915,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-1",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						12,
						65,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						12,
						65,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-2",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						395,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-2",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						525,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-2",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						845,
						525,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-2",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						755,
						655,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-2",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						785,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-2",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						915,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-2",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						133,
						65,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						133,
						65,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-3",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						395,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-3",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						525,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-3",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						950,
						525,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-3",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						860,
						655,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-3",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						785,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-3",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						915,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-3",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						254,
						65,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						254,
						65,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-4",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						395,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-4",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						525,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-4",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1055,
						525,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-4",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						965,
						655,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-4",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						785,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-4",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						915,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-4",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						375,
						65,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						375,
						65,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-5",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						395,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-5",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						525,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-5",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1160,
						525,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-5",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1070,
						655,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-5",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						785,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-5",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						915,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-5",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						496,
						65,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						496,
						65,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-6",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						420,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-6",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						550,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-6",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						740,
						550,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-6",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						650,
						680,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-6",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						810,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-6",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						940,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-6",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						12,
						84,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						12,
						84,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-7",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						420,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-7",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						550,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-7",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						845,
						550,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-7",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						755,
						680,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-7",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						810,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-7",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						940,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-7",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						133,
						84,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						133,
						84,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						420,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						550,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						950,
						550,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						860,
						680,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-8",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						810,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-8",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						940,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-8",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						254,
						84,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						254,
						84,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-9",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						420,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-9",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						550,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-9",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1055,
						550,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-9",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						965,
						680,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-9",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						810,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-9",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						940,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-9",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						375,
						84,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						375,
						84,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-10",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						420,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-10",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						550,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-10",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1160,
						550,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-10",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1070,
						680,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-10",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						810,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-10",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						940,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-10",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						496,
						84,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						496,
						84,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-11",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						445,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-11",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						575,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-11",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						740,
						575,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-11",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						650,
						705,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-11",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						835,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-11",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						965,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-11",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						12,
						103,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						12,
						103,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-12",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						445,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-12",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						575,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-12",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						845,
						575,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-12",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						755,
						705,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-12",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						835,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-12",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						965,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-12",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						133,
						103,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						133,
						103,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-13",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						445,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-13",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						575,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-13",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						950,
						575,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-13",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						860,
						705,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-13",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						835,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-13",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						965,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-13",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						254,
						103,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						254,
						103,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-14",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						445,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-14",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						575,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-14",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1055,
						575,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-14",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						965,
						705,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-14",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						835,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-14",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						965,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-14",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						375,
						103,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						375,
						103,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-15",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						445,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-15",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						575,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-15",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1160,
						575,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-15",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1070,
						705,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-15",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						835,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-15",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						965,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-15",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						496,
						103,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						496,
						103,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-16",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						470,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-16",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						600,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-16",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						740,
						600,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-16",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						650,
						730,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-16",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						860,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-16",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						990,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-16",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						12,
						122,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						12,
						122,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-17",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						470,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-17",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						600,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-17",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						845,
						600,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-17",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						755,
						730,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-17",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						860,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-17",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						990,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-17",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						133,
						122,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						133,
						122,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-18",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						470,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-18",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						600,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-18",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						950,
						600,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-18",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						860,
						730,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-18",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						860,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-18",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						990,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-18",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						254,
						122,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						254,
						122,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-19",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						470,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-19",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						600,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-19",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1055,
						600,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-19",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						965,
						730,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-19",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						860,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-19",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						990,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-19",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						375,
						122,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						375,
						122,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-20",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						470,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-20",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						600,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-20",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1160,
						600,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-20",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1070,
						730,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-20",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						860,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-20",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						990,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-20",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						496,
						122,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						496,
						122,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-21",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						495,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-21",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						625,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-21",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						740,
						625,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-21",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						650,
						755,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-21",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						885,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-21",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						650,
						1015,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-21",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						12,
						141,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						12,
						141,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-22",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						495,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-22",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						625,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-22",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						845,
						625,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-22",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						755,
						755,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-22",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						885,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-22",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755,
						1015,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-22",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						133,
						141,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						133,
						141,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-23",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						495,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-23",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						625,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-23",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						950,
						625,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-23",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						860,
						755,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-23",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						885,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-23",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						860,
						1015,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-23",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						254,
						141,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						254,
						141,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-24",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						495,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-24",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						625,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-24",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1055,
						625,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-24",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						965,
						755,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-24",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						885,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-24",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						965,
						1015,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-24",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						375,
						141,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						375,
						141,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "slot-symbol-25",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						495,
						55,
						20
					],
					"text": "tosymbol"
				}
			},
			{
				"box": {
					"id": "slot-text-prepend-25",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						625,
						82,
						20
					],
					"text": "prepend text"
				}
			},
			{
				"box": {
					"id": "slot-texton-prepend-25",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1160,
						625,
						92,
						20
					],
					"text": "prepend texton"
				}
			},
			{
				"box": {
					"id": "slot-held-select-25",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1070,
						755,
						55,
						20
					],
					"text": "sel 0 1"
				}
			},
			{
				"box": {
					"id": "slot-idle-style-25",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						885,
						400,
						20
					],
					"text": "bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1"
				}
			},
			{
				"box": {
					"id": "slot-active-style-25",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1070,
						1015,
						400,
						20
					],
					"text": "bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1"
				}
			},
			{
				"box": {
					"id": "slot-display-25",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						496,
						141,
						115,
						17
					],
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"parameter_mappable": 0,
					"presentation": 1,
					"presentation_rect": [
						496,
						141,
						115,
						17
					],
					"fontsize": 8,
					"active": 1,
					"mode": 1,
					"ignoreclick": 1,
					"rounded": 0,
					"text": "—",
					"texton": "—",
					"bgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"activebgcolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"bgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"activebgoncolor": [
						0.78,
						0.94,
						0.27,
						1
					],
					"bordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"focusbordercolor": [
						0.12,
						0.12,
						0.12,
						1
					],
					"textcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextcolor": [
						0.78,
						0.78,
						0.76,
						1
					],
					"activetextoncolor": [
						0.04,
						0.04,
						0.03,
						1
					]
				}
			},
			{
				"box": {
					"id": "loadbang",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						25,
						360,
						58,
						22
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "initial-0",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						100,
						360,
						96,
						22
					],
					"text": "set_key 0"
				}
			},
			{
				"box": {
					"id": "initial-1",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						205,
						360,
						96,
						22
					],
					"text": "set_scale 0"
				}
			},
			{
				"box": {
					"id": "initial-2",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						310,
						360,
						96,
						22
					],
					"text": "set_genre 1"
				}
			},
			{
				"box": {
					"id": "initial-3",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						415,
						360,
						96,
						22
					],
					"text": "set_extension_flags 1 1 1 0 0 0 0"
				}
			},
			{
				"box": {
					"id": "initial-4",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						520,
						360,
						96,
						22
					],
					"text": "set_transpose 0"
				}
			},
			{
				"box": {
					"id": "initial-5",
					"maxclass": "message",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						625,
						360,
						96,
						22
					],
					"text": "set_octave 0"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"note-in",
						0
					],
					"destination": [
						"pack-note",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"note-in",
						1
					],
					"destination": [
						"pack-note",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pack-note",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"engine",
						0
					],
					"destination": [
						"unpack-note",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"unpack-note",
						0
					],
					"destination": [
						"note-out",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"unpack-note",
						1
					],
					"destination": [
						"note-out",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"learn-base-button",
						0
					],
					"destination": [
						"learn-base-message",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"learn-base-message",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"key-menu",
						0
					],
					"destination": [
						"key-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"key-prepend",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"scale-menu",
						0
					],
					"destination": [
						"scale-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"scale-prepend",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"genre-menu",
						0
					],
					"destination": [
						"genre-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"genre-prepend",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"transpose-box",
						0
					],
					"destination": [
						"transpose-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"transpose-prepend",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"octave-box",
						0
					],
					"destination": [
						"octave-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"octave-prepend",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"base-box",
						0
					],
					"destination": [
						"base-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"base-prepend",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-pak",
						0
					],
					"destination": [
						"extension-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-prepend",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-toggle-0",
						0
					],
					"destination": [
						"extension-pak",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-toggle-1",
						0
					],
					"destination": [
						"extension-pak",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-toggle-2",
						0
					],
					"destination": [
						"extension-pak",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-toggle-3",
						0
					],
					"destination": [
						"extension-pak",
						3
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-toggle-4",
						0
					],
					"destination": [
						"extension-pak",
						4
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-toggle-5",
						0
					],
					"destination": [
						"extension-pak",
						5
					]
				}
			},
			{
				"patchline": {
					"source": [
						"extension-toggle-6",
						0
					],
					"destination": [
						"extension-pak",
						6
					]
				}
			},
			{
				"patchline": {
					"source": [
						"regen-button",
						0
					],
					"destination": [
						"regen-message",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"regen-message",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"panic-button",
						0
					],
					"destination": [
						"panic-message",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"panic-message",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"engine",
						1
					],
					"destination": [
						"state-route",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"state-route",
						0
					],
					"destination": [
						"active-number",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"state-route",
						2
					],
					"destination": [
						"status-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"status-prepend",
						0
					],
					"destination": [
						"status-display",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"state-route",
						3
					],
					"destination": [
						"base-box",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"state-route",
						1
					],
					"destination": [
						"slot-router",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"state-route",
						4
					],
					"destination": [
						"held-router",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						0
					],
					"destination": [
						"slot-symbol-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-1",
						0
					],
					"destination": [
						"slot-text-prepend-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-1",
						0
					],
					"destination": [
						"slot-texton-prepend-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-1",
						0
					],
					"destination": [
						"slot-display-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-1",
						0
					],
					"destination": [
						"slot-display-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						0
					],
					"destination": [
						"slot-held-select-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-1",
						0
					],
					"destination": [
						"slot-idle-style-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-1",
						1
					],
					"destination": [
						"slot-active-style-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-1",
						0
					],
					"destination": [
						"slot-display-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-1",
						0
					],
					"destination": [
						"slot-display-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						1
					],
					"destination": [
						"slot-symbol-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-2",
						0
					],
					"destination": [
						"slot-text-prepend-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-2",
						0
					],
					"destination": [
						"slot-texton-prepend-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-2",
						0
					],
					"destination": [
						"slot-display-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-2",
						0
					],
					"destination": [
						"slot-display-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						1
					],
					"destination": [
						"slot-held-select-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-2",
						0
					],
					"destination": [
						"slot-idle-style-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-2",
						1
					],
					"destination": [
						"slot-active-style-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-2",
						0
					],
					"destination": [
						"slot-display-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-2",
						0
					],
					"destination": [
						"slot-display-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						2
					],
					"destination": [
						"slot-symbol-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-3",
						0
					],
					"destination": [
						"slot-text-prepend-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-3",
						0
					],
					"destination": [
						"slot-texton-prepend-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-3",
						0
					],
					"destination": [
						"slot-display-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-3",
						0
					],
					"destination": [
						"slot-display-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						2
					],
					"destination": [
						"slot-held-select-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-3",
						0
					],
					"destination": [
						"slot-idle-style-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-3",
						1
					],
					"destination": [
						"slot-active-style-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-3",
						0
					],
					"destination": [
						"slot-display-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-3",
						0
					],
					"destination": [
						"slot-display-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						3
					],
					"destination": [
						"slot-symbol-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-4",
						0
					],
					"destination": [
						"slot-text-prepend-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-4",
						0
					],
					"destination": [
						"slot-texton-prepend-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-4",
						0
					],
					"destination": [
						"slot-display-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-4",
						0
					],
					"destination": [
						"slot-display-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						3
					],
					"destination": [
						"slot-held-select-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-4",
						0
					],
					"destination": [
						"slot-idle-style-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-4",
						1
					],
					"destination": [
						"slot-active-style-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-4",
						0
					],
					"destination": [
						"slot-display-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-4",
						0
					],
					"destination": [
						"slot-display-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						4
					],
					"destination": [
						"slot-symbol-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-5",
						0
					],
					"destination": [
						"slot-text-prepend-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-5",
						0
					],
					"destination": [
						"slot-texton-prepend-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-5",
						0
					],
					"destination": [
						"slot-display-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-5",
						0
					],
					"destination": [
						"slot-display-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						4
					],
					"destination": [
						"slot-held-select-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-5",
						0
					],
					"destination": [
						"slot-idle-style-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-5",
						1
					],
					"destination": [
						"slot-active-style-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-5",
						0
					],
					"destination": [
						"slot-display-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-5",
						0
					],
					"destination": [
						"slot-display-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						5
					],
					"destination": [
						"slot-symbol-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-6",
						0
					],
					"destination": [
						"slot-text-prepend-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-6",
						0
					],
					"destination": [
						"slot-texton-prepend-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-6",
						0
					],
					"destination": [
						"slot-display-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-6",
						0
					],
					"destination": [
						"slot-display-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						5
					],
					"destination": [
						"slot-held-select-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-6",
						0
					],
					"destination": [
						"slot-idle-style-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-6",
						1
					],
					"destination": [
						"slot-active-style-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-6",
						0
					],
					"destination": [
						"slot-display-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-6",
						0
					],
					"destination": [
						"slot-display-6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						6
					],
					"destination": [
						"slot-symbol-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-7",
						0
					],
					"destination": [
						"slot-text-prepend-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-7",
						0
					],
					"destination": [
						"slot-texton-prepend-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-7",
						0
					],
					"destination": [
						"slot-display-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-7",
						0
					],
					"destination": [
						"slot-display-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						6
					],
					"destination": [
						"slot-held-select-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-7",
						0
					],
					"destination": [
						"slot-idle-style-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-7",
						1
					],
					"destination": [
						"slot-active-style-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-7",
						0
					],
					"destination": [
						"slot-display-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-7",
						0
					],
					"destination": [
						"slot-display-7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						7
					],
					"destination": [
						"slot-symbol-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-8",
						0
					],
					"destination": [
						"slot-text-prepend-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-8",
						0
					],
					"destination": [
						"slot-texton-prepend-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-8",
						0
					],
					"destination": [
						"slot-display-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-8",
						0
					],
					"destination": [
						"slot-display-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						7
					],
					"destination": [
						"slot-held-select-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-8",
						0
					],
					"destination": [
						"slot-idle-style-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-8",
						1
					],
					"destination": [
						"slot-active-style-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-8",
						0
					],
					"destination": [
						"slot-display-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-8",
						0
					],
					"destination": [
						"slot-display-8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						8
					],
					"destination": [
						"slot-symbol-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-9",
						0
					],
					"destination": [
						"slot-text-prepend-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-9",
						0
					],
					"destination": [
						"slot-texton-prepend-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-9",
						0
					],
					"destination": [
						"slot-display-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-9",
						0
					],
					"destination": [
						"slot-display-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						8
					],
					"destination": [
						"slot-held-select-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-9",
						0
					],
					"destination": [
						"slot-idle-style-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-9",
						1
					],
					"destination": [
						"slot-active-style-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-9",
						0
					],
					"destination": [
						"slot-display-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-9",
						0
					],
					"destination": [
						"slot-display-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						9
					],
					"destination": [
						"slot-symbol-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-10",
						0
					],
					"destination": [
						"slot-text-prepend-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-10",
						0
					],
					"destination": [
						"slot-texton-prepend-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-10",
						0
					],
					"destination": [
						"slot-display-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-10",
						0
					],
					"destination": [
						"slot-display-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						9
					],
					"destination": [
						"slot-held-select-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-10",
						0
					],
					"destination": [
						"slot-idle-style-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-10",
						1
					],
					"destination": [
						"slot-active-style-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-10",
						0
					],
					"destination": [
						"slot-display-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-10",
						0
					],
					"destination": [
						"slot-display-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						10
					],
					"destination": [
						"slot-symbol-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-11",
						0
					],
					"destination": [
						"slot-text-prepend-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-11",
						0
					],
					"destination": [
						"slot-texton-prepend-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-11",
						0
					],
					"destination": [
						"slot-display-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-11",
						0
					],
					"destination": [
						"slot-display-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						10
					],
					"destination": [
						"slot-held-select-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-11",
						0
					],
					"destination": [
						"slot-idle-style-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-11",
						1
					],
					"destination": [
						"slot-active-style-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-11",
						0
					],
					"destination": [
						"slot-display-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-11",
						0
					],
					"destination": [
						"slot-display-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						11
					],
					"destination": [
						"slot-symbol-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-12",
						0
					],
					"destination": [
						"slot-text-prepend-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-12",
						0
					],
					"destination": [
						"slot-texton-prepend-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-12",
						0
					],
					"destination": [
						"slot-display-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-12",
						0
					],
					"destination": [
						"slot-display-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						11
					],
					"destination": [
						"slot-held-select-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-12",
						0
					],
					"destination": [
						"slot-idle-style-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-12",
						1
					],
					"destination": [
						"slot-active-style-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-12",
						0
					],
					"destination": [
						"slot-display-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-12",
						0
					],
					"destination": [
						"slot-display-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						12
					],
					"destination": [
						"slot-symbol-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-13",
						0
					],
					"destination": [
						"slot-text-prepend-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-13",
						0
					],
					"destination": [
						"slot-texton-prepend-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-13",
						0
					],
					"destination": [
						"slot-display-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-13",
						0
					],
					"destination": [
						"slot-display-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						12
					],
					"destination": [
						"slot-held-select-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-13",
						0
					],
					"destination": [
						"slot-idle-style-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-13",
						1
					],
					"destination": [
						"slot-active-style-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-13",
						0
					],
					"destination": [
						"slot-display-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-13",
						0
					],
					"destination": [
						"slot-display-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						13
					],
					"destination": [
						"slot-symbol-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-14",
						0
					],
					"destination": [
						"slot-text-prepend-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-14",
						0
					],
					"destination": [
						"slot-texton-prepend-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-14",
						0
					],
					"destination": [
						"slot-display-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-14",
						0
					],
					"destination": [
						"slot-display-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						13
					],
					"destination": [
						"slot-held-select-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-14",
						0
					],
					"destination": [
						"slot-idle-style-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-14",
						1
					],
					"destination": [
						"slot-active-style-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-14",
						0
					],
					"destination": [
						"slot-display-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-14",
						0
					],
					"destination": [
						"slot-display-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						14
					],
					"destination": [
						"slot-symbol-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-15",
						0
					],
					"destination": [
						"slot-text-prepend-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-15",
						0
					],
					"destination": [
						"slot-texton-prepend-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-15",
						0
					],
					"destination": [
						"slot-display-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-15",
						0
					],
					"destination": [
						"slot-display-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						14
					],
					"destination": [
						"slot-held-select-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-15",
						0
					],
					"destination": [
						"slot-idle-style-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-15",
						1
					],
					"destination": [
						"slot-active-style-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-15",
						0
					],
					"destination": [
						"slot-display-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-15",
						0
					],
					"destination": [
						"slot-display-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						15
					],
					"destination": [
						"slot-symbol-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-16",
						0
					],
					"destination": [
						"slot-text-prepend-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-16",
						0
					],
					"destination": [
						"slot-texton-prepend-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-16",
						0
					],
					"destination": [
						"slot-display-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-16",
						0
					],
					"destination": [
						"slot-display-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						15
					],
					"destination": [
						"slot-held-select-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-16",
						0
					],
					"destination": [
						"slot-idle-style-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-16",
						1
					],
					"destination": [
						"slot-active-style-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-16",
						0
					],
					"destination": [
						"slot-display-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-16",
						0
					],
					"destination": [
						"slot-display-16",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						16
					],
					"destination": [
						"slot-symbol-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-17",
						0
					],
					"destination": [
						"slot-text-prepend-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-17",
						0
					],
					"destination": [
						"slot-texton-prepend-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-17",
						0
					],
					"destination": [
						"slot-display-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-17",
						0
					],
					"destination": [
						"slot-display-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						16
					],
					"destination": [
						"slot-held-select-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-17",
						0
					],
					"destination": [
						"slot-idle-style-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-17",
						1
					],
					"destination": [
						"slot-active-style-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-17",
						0
					],
					"destination": [
						"slot-display-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-17",
						0
					],
					"destination": [
						"slot-display-17",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						17
					],
					"destination": [
						"slot-symbol-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-18",
						0
					],
					"destination": [
						"slot-text-prepend-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-18",
						0
					],
					"destination": [
						"slot-texton-prepend-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-18",
						0
					],
					"destination": [
						"slot-display-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-18",
						0
					],
					"destination": [
						"slot-display-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						17
					],
					"destination": [
						"slot-held-select-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-18",
						0
					],
					"destination": [
						"slot-idle-style-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-18",
						1
					],
					"destination": [
						"slot-active-style-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-18",
						0
					],
					"destination": [
						"slot-display-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-18",
						0
					],
					"destination": [
						"slot-display-18",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						18
					],
					"destination": [
						"slot-symbol-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-19",
						0
					],
					"destination": [
						"slot-text-prepend-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-19",
						0
					],
					"destination": [
						"slot-texton-prepend-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-19",
						0
					],
					"destination": [
						"slot-display-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-19",
						0
					],
					"destination": [
						"slot-display-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						18
					],
					"destination": [
						"slot-held-select-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-19",
						0
					],
					"destination": [
						"slot-idle-style-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-19",
						1
					],
					"destination": [
						"slot-active-style-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-19",
						0
					],
					"destination": [
						"slot-display-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-19",
						0
					],
					"destination": [
						"slot-display-19",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						19
					],
					"destination": [
						"slot-symbol-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-20",
						0
					],
					"destination": [
						"slot-text-prepend-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-20",
						0
					],
					"destination": [
						"slot-texton-prepend-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-20",
						0
					],
					"destination": [
						"slot-display-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-20",
						0
					],
					"destination": [
						"slot-display-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						19
					],
					"destination": [
						"slot-held-select-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-20",
						0
					],
					"destination": [
						"slot-idle-style-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-20",
						1
					],
					"destination": [
						"slot-active-style-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-20",
						0
					],
					"destination": [
						"slot-display-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-20",
						0
					],
					"destination": [
						"slot-display-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						20
					],
					"destination": [
						"slot-symbol-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-21",
						0
					],
					"destination": [
						"slot-text-prepend-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-21",
						0
					],
					"destination": [
						"slot-texton-prepend-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-21",
						0
					],
					"destination": [
						"slot-display-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-21",
						0
					],
					"destination": [
						"slot-display-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						20
					],
					"destination": [
						"slot-held-select-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-21",
						0
					],
					"destination": [
						"slot-idle-style-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-21",
						1
					],
					"destination": [
						"slot-active-style-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-21",
						0
					],
					"destination": [
						"slot-display-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-21",
						0
					],
					"destination": [
						"slot-display-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						21
					],
					"destination": [
						"slot-symbol-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-22",
						0
					],
					"destination": [
						"slot-text-prepend-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-22",
						0
					],
					"destination": [
						"slot-texton-prepend-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-22",
						0
					],
					"destination": [
						"slot-display-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-22",
						0
					],
					"destination": [
						"slot-display-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						21
					],
					"destination": [
						"slot-held-select-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-22",
						0
					],
					"destination": [
						"slot-idle-style-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-22",
						1
					],
					"destination": [
						"slot-active-style-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-22",
						0
					],
					"destination": [
						"slot-display-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-22",
						0
					],
					"destination": [
						"slot-display-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						22
					],
					"destination": [
						"slot-symbol-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-23",
						0
					],
					"destination": [
						"slot-text-prepend-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-23",
						0
					],
					"destination": [
						"slot-texton-prepend-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-23",
						0
					],
					"destination": [
						"slot-display-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-23",
						0
					],
					"destination": [
						"slot-display-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						22
					],
					"destination": [
						"slot-held-select-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-23",
						0
					],
					"destination": [
						"slot-idle-style-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-23",
						1
					],
					"destination": [
						"slot-active-style-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-23",
						0
					],
					"destination": [
						"slot-display-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-23",
						0
					],
					"destination": [
						"slot-display-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						23
					],
					"destination": [
						"slot-symbol-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-24",
						0
					],
					"destination": [
						"slot-text-prepend-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-24",
						0
					],
					"destination": [
						"slot-texton-prepend-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-24",
						0
					],
					"destination": [
						"slot-display-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-24",
						0
					],
					"destination": [
						"slot-display-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						23
					],
					"destination": [
						"slot-held-select-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-24",
						0
					],
					"destination": [
						"slot-idle-style-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-24",
						1
					],
					"destination": [
						"slot-active-style-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-24",
						0
					],
					"destination": [
						"slot-display-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-24",
						0
					],
					"destination": [
						"slot-display-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-router",
						24
					],
					"destination": [
						"slot-symbol-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-25",
						0
					],
					"destination": [
						"slot-text-prepend-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-symbol-25",
						0
					],
					"destination": [
						"slot-texton-prepend-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-text-prepend-25",
						0
					],
					"destination": [
						"slot-display-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-texton-prepend-25",
						0
					],
					"destination": [
						"slot-display-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"held-router",
						24
					],
					"destination": [
						"slot-held-select-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-25",
						0
					],
					"destination": [
						"slot-idle-style-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-held-select-25",
						1
					],
					"destination": [
						"slot-active-style-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-idle-style-25",
						0
					],
					"destination": [
						"slot-display-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slot-active-style-25",
						0
					],
					"destination": [
						"slot-display-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"loadbang",
						0
					],
					"destination": [
						"initial-0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"initial-0",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"loadbang",
						0
					],
					"destination": [
						"initial-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"initial-1",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"loadbang",
						0
					],
					"destination": [
						"initial-2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"initial-2",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"loadbang",
						0
					],
					"destination": [
						"initial-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"initial-3",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"loadbang",
						0
					],
					"destination": [
						"initial-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"initial-4",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"loadbang",
						0
					],
					"destination": [
						"initial-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"initial-5",
						0
					],
					"destination": [
						"engine",
						0
					]
				}
			}
		],
		"parameters": {
			"key-menu": [
				"Key",
				"Key",
				0
			],
			"scale-menu": [
				"Scale",
				"Scale",
				0
			],
			"genre-menu": [
				"Genre",
				"Genre",
				0
			],
			"transpose-box": [
				"Transpose",
				"Transpose",
				0
			],
			"octave-box": [
				"Octave",
				"Octave",
				0
			],
			"base-box": [
				"Lowest Key",
				"Lowest Key",
				0
			],
			"extension-toggle-0": [
				"Chord Type Triad",
				"Chord Type Triad",
				0
			],
			"extension-toggle-1": [
				"Chord Type 7",
				"Chord Type 7",
				0
			],
			"extension-toggle-2": [
				"Chord Type 9",
				"Chord Type 9",
				0
			],
			"extension-toggle-3": [
				"Chord Type 11",
				"Chord Type 11",
				0
			],
			"extension-toggle-4": [
				"Chord Type 13",
				"Chord Type 13",
				0
			],
			"extension-toggle-5": [
				"Chord Type Sus",
				"Chord Type Sus",
				0
			],
			"extension-toggle-6": [
				"Chord Type 6/add9",
				"Chord Type 6/add9",
				0
			]
		},
		"dependency_cache": [],
		"autosave": 0
	}
}
