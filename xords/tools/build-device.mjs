import fs from 'node:fs'
import path from 'node:path'

const root = path.resolve(import.meta.dirname, '..')
const deviceDir = root
const engineSource = fs.readFileSync(path.join(root, 'xords_engine.js'), 'utf8')

const boxes = []
const lines = []
const parameters = {}

function addBox(id, maxclass, text, rect, extra = {}) {
  const box = { id, maxclass, numinlets: 1, numoutlets: 1, patching_rect: rect, ...extra }
  if (text) box.text = text
  boxes.push({ box })
  return id
}

function connect(source, sourceOutlet, destination, destinationInlet = 0) {
  lines.push({ patchline: { source: [source, sourceOutlet], destination: [destination, destinationInlet] } })
}

function liveMenu(id, name, values, initial, rect) {
  addBox(id, 'live.menu', '', rect, {
    numinlets: 1,
    numoutlets: 3,
    parameter_enable: 1,
    presentation: 1,
    presentation_rect: rect,
    varname: name,
    saved_attribute_attributes: {
      valueof: {
        parameter_enum: values,
        parameter_initial: [initial],
        parameter_initial_enable: 1,
        parameter_longname: name,
        parameter_mmax: values.length - 1,
        parameter_shortname: name,
        parameter_type: 2,
      },
    },
  })
  parameters[id] = [name, name, 0]
  return id
}

function liveNumber(id, name, min, max, initial, rect, presentation = true) {
  addBox(id, 'live.numbox', '', rect, {
    numinlets: 1,
    numoutlets: 2,
    parameter_enable: 1,
    presentation: presentation ? 1 : 0,
    presentation_rect: rect,
    varname: name,
    saved_attribute_attributes: {
      valueof: {
        parameter_initial: [initial],
        parameter_initial_enable: 1,
        parameter_longname: name,
        parameter_mmin: min,
        parameter_mmax: max,
        parameter_shortname: name,
        parameter_type: 0,
      },
    },
  })
  parameters[id] = [name, name, 0]
  return id
}

function liveToggle(id, name, initial, rect) {
  addBox(id, 'live.toggle', '', rect, {
    numinlets: 1,
    numoutlets: 1,
    parameter_enable: 1,
    presentation: 1,
    presentation_rect: rect,
    varname: name,
    saved_attribute_attributes: {
      valueof: {
        parameter_initial: [initial],
        parameter_initial_enable: 1,
        parameter_longname: name,
        parameter_mmin: 0,
        parameter_mmax: 1,
        parameter_shortname: name,
        parameter_type: 0,
      },
    },
  })
  parameters[id] = [name, name, 0]
  return id
}

// MIDI engine
addBox('note-in', 'newobj', 'notein', [25, 270, 45, 22], { numoutlets: 3, outlettype: ['int', 'int', 'int'] })
addBox('pack-note', 'newobj', 'pack 0 0', [25, 310, 62, 22], { numinlets: 2, numoutlets: 1, outlettype: ['list'] })
addBox('engine', 'newobj', 'v8', [125, 310, 205, 22], {
  filename: 'none',
  numoutlets: 2,
  outlettype: ['', ''],
  saved_object_attributes: { parameter_enable: 0 },
  textfile: { text: engineSource, filename: 'none', flags: 0, embed: 1, autowatch: 1 },
})
addBox('unpack-note', 'newobj', 'unpack 0 0', [368, 310, 74, 22], { numoutlets: 2, outlettype: ['int', 'int'] })
addBox('note-out', 'newobj', 'noteout', [480, 310, 52, 22], { numinlets: 3, numoutlets: 0 })
connect('note-in', 0, 'pack-note', 0)
connect('note-in', 1, 'pack-note', 1)
connect('pack-note', 0, 'engine', 0)
connect('engine', 0, 'unpack-note', 0)
connect('unpack-note', 0, 'note-out', 0)
connect('unpack-note', 1, 'note-out', 1)

// Labels
const labels = [
  ['label-title', 'XORDS', [12, 10, 55, 18]],
  ['label-key', 'KEY', [82, 10, 55, 18]],
  ['label-scale', 'SCALE', [152, 10, 80, 18]],
  ['label-genre', 'GENRE', [257, 10, 130, 18]],
  ['label-transpose', 'TRANSPOSE', [412, 10, 65, 18]],
  ['label-octave', 'OCTAVE', [492, 10, 55, 18]],
  ['label-base', 'LOWEST KEY', [562, 10, 60, 18]],
]
labels.forEach(([id, text, rect]) => addBox(id, 'comment', text, rect, { numoutlets: 0, presentation: 1, presentation_rect: rect, fontsize: 9, textcolor: [0.58, 0.58, 0.56, 1] }))

// Automatable controls
liveMenu('key-menu', 'Key', ['C', 'C#', 'D', 'Eb', 'E', 'F', 'F#', 'G', 'Ab', 'A', 'Bb', 'B'], 0, [82, 29, 58, 24])
liveMenu('scale-menu', 'Scale', ['Major', 'Minor', 'Harmonic Minor', 'Melodic Minor', 'Dorian', 'Phrygian', 'Lydian', 'Mixolydian', 'Locrian', 'Phrygian Dominant'], 0, [152, 29, 94, 24])
liveMenu('genre-menu', 'Genre', ['Pop', 'Neo Soul', 'R&B', 'Soul', 'Gospel', 'Jazz', 'Lo-fi', 'House', 'Drum & Bass', 'Liquid DnB', 'UK Garage', 'Funk', 'Rock', 'Cinematic', 'Ambient', 'Latin'], 1, [257, 29, 143, 24])
liveNumber('transpose-box', 'Transpose', -12, 12, 0, [412, 29, 65, 24])
liveNumber('octave-box', 'Octave', -2, 2, 0, [492, 29, 55, 24])
liveNumber('base-box', 'Lowest Key', 0, 127, 48, [682, 210, 58, 24], false)
addBox('learn-base-button', 'textbutton', '', [562, 29, 58, 24], {
  numoutlets: 1,
  presentation: 1,
  presentation_rect: [562, 29, 58, 24],
  fontsize: 8,
  text: 'LEARN',
  texton: 'LEARN',
})
addBox('learn-base-message', 'message', 'learn_base', [682, 250, 72, 22])
connect('learn-base-button', 0, 'learn-base-message', 0)
connect('learn-base-message', 0, 'engine', 0)

const prepends = [
  ['key-prepend', 'prepend set_key', 'key-menu'],
  ['scale-prepend', 'prepend set_scale', 'scale-menu'],
  ['genre-prepend', 'prepend set_genre', 'genre-menu'],
  ['transpose-prepend', 'prepend set_transpose', 'transpose-box'],
  ['octave-prepend', 'prepend set_octave', 'octave-box'],
  ['base-prepend', 'prepend set_base', 'base-box'],
]
prepends.forEach(([id, text, source], index) => {
  addBox(id, 'newobj', text, [90 + index * 110, 210, 100, 22])
  connect(source, 0, id, 0)
  connect(id, 0, 'engine', 0)
})

// Individually selectable chord types. `pak` emits the complete flag set whenever one changes.
addBox('chord-types-label', 'comment', 'CHORD TYPES', [12, 166, 75, 18], {
  numoutlets: 0,
  presentation: 1,
  presentation_rect: [625, 61, 75, 16],
  fontsize: 9,
  textcolor: [0.58, 0.58, 0.56, 1],
})
const chordTypes = [
  ['Triad', 1], ['7', 1], ['9', 1], ['11', 0], ['13', 0], ['Sus', 0], ['6/add9', 0],
]
addBox('extension-pak', 'newobj', 'pak 1 1 1 0 0 0 0', [300, 250, 132, 22], { numinlets: 7, numoutlets: 1 })
addBox('extension-prepend', 'newobj', 'prepend set_extension_flags', [445, 250, 165, 22])
connect('extension-pak', 0, 'extension-prepend', 0)
connect('extension-prepend', 0, 'engine', 0)
chordTypes.forEach(([name, initial], index) => {
  const column = index % 2
  const row = Math.floor(index / 2)
  const x = 625 + column * 64
  const y = 78 + row * 21
  const toggleId = `extension-toggle-${index}`
  liveToggle(toggleId, `Chord Type ${name}`, initial, [x, y, 17, 17])
  addBox(`extension-label-${index}`, 'comment', name, [x + 21, y - 1, 43, 18], {
    numoutlets: 0,
    presentation: 1,
    presentation_rect: [x + 21, y - 1, 43, 18],
    fontsize: 9,
  })
  connect(toggleId, 0, 'extension-pak', index)
})

// Actions and feedback
addBox('regen-button', 'textbutton', '', [12, 67, 92, 28], { numoutlets: 1, presentation: 1, presentation_rect: [625, 29, 59, 24], fontsize: 8, text: 'GENERATE', texton: 'GENERATE' })
addBox('regen-message', 'message', 'regenerate', [20, 110, 70, 22])
connect('regen-button', 0, 'regen-message', 0)
connect('regen-message', 0, 'engine', 0)
addBox('panic-button', 'textbutton', '', [112, 67, 72, 28], { numoutlets: 1, presentation: 1, presentation_rect: [689, 29, 54, 24], fontsize: 8, text: 'PANIC', texton: 'PANIC' })
addBox('panic-message', 'message', 'panic', [112, 110, 50, 22])
connect('panic-button', 0, 'panic-message', 0)
connect('panic-message', 0, 'engine', 0)
addBox('state-route', 'newobj', 'route active slot status base held', [560, 310, 182, 22], { numoutlets: 6 })
addBox('active-number', 'number', '', [656, 68, 46, 24], { numinlets: 1, numoutlets: 2, presentation: 0 })
addBox('active-label', 'comment', 'ACTIVE SLOT', [612, 72, 75, 18], { numoutlets: 0, presentation: 0, fontsize: 9 })
connect('engine', 1, 'state-route', 0)
connect('state-route', 0, 'active-number', 0)
addBox('status-prepend', 'newobj', 'prepend set', [705, 310, 75, 22])
addBox('status-display', 'message', 'ENGINE NOT LOADED', [625, 157, 118, 12], {
  numinlets: 2,
  numoutlets: 1,
  presentation: 0,
  presentation_rect: [625, 157, 118, 12],
  fontsize: 7,
})
connect('state-route', 2, 'status-prepend', 0)
connect('status-prepend', 0, 'status-display', 0)
connect('state-route', 3, 'base-box', 0)

// Visible 25-slot bank using Live-native flat cells with explicit off/on colors.
addBox('slot-router', 'newobj', `route ${Array.from({ length: 25 }, (_, index) => index + 1).join(' ')}`, [650, 345, 520, 22], { numoutlets: 26 })
connect('state-route', 1, 'slot-router', 0)
addBox('held-router', 'newobj', `route ${Array.from({ length: 25 }, (_, index) => index + 1).join(' ')}`, [650, 370, 520, 22], { numoutlets: 26 })
connect('state-route', 4, 'held-router', 0)
for (let index = 0; index < 25; index += 1) {
  const column = index % 5
  const row = Math.floor(index / 5)
  const x = 12 + column * 121
  const y = 65 + row * 19
  const symbolId = `slot-symbol-${index + 1}`
  const textPrependId = `slot-text-prepend-${index + 1}`
  const textOnPrependId = `slot-texton-prepend-${index + 1}`
  const heldSelectId = `slot-held-select-${index + 1}`
  const idleStyleId = `slot-idle-style-${index + 1}`
  const activeStyleId = `slot-active-style-${index + 1}`
  const displayId = `slot-display-${index + 1}`
  addBox(symbolId, 'newobj', 'tosymbol', [650 + column * 105, 395 + row * 25, 55, 20])
  addBox(textPrependId, 'newobj', 'prepend text', [650 + column * 105, 525 + row * 25, 82, 20])
  addBox(textOnPrependId, 'newobj', 'prepend texton', [740 + column * 105, 525 + row * 25, 92, 20])
  addBox(heldSelectId, 'newobj', 'sel 0 1', [650 + column * 105, 655 + row * 25, 55, 20], { numoutlets: 3 })
  addBox(idleStyleId, 'message', 'bgcolor 0.12 0.12 0.12 1, activebgcolor 0.12 0.12 0.12 1, textcolor 0.78 0.78 0.76 1, activetextcolor 0.78 0.78 0.76 1', [650 + column * 105, 785 + row * 25, 400, 20])
  addBox(activeStyleId, 'message', 'bgcolor 0.78 0.94 0.27 1, activebgcolor 0.78 0.94 0.27 1, textcolor 0.04 0.04 0.03 1, activetextcolor 0.04 0.04 0.03 1', [650 + column * 105, 915 + row * 25, 400, 20])
  addBox(displayId, 'live.text', '', [x, y, 115, 17], {
    numinlets: 1,
    numoutlets: 2,
    outlettype: ['', ''],
    parameter_enable: 0,
    parameter_mappable: 0,
    presentation: 1,
    presentation_rect: [x, y, 115, 17],
    fontsize: 8,
    active: 1,
    mode: 1,
    ignoreclick: 1,
    rounded: 0,
    text: '—',
    texton: '—',
    bgcolor: [0.12, 0.12, 0.12, 1],
    activebgcolor: [0.12, 0.12, 0.12, 1],
    bgoncolor: [0.78, 0.94, 0.27, 1],
    activebgoncolor: [0.78, 0.94, 0.27, 1],
    bordercolor: [0.12, 0.12, 0.12, 1],
    focusbordercolor: [0.12, 0.12, 0.12, 1],
    textcolor: [0.78, 0.78, 0.76, 1],
    activetextcolor: [0.78, 0.78, 0.76, 1],
    activetextoncolor: [0.04, 0.04, 0.03, 1],
  })
  connect('slot-router', index, symbolId, 0)
  connect(symbolId, 0, textPrependId, 0)
  connect(symbolId, 0, textOnPrependId, 0)
  connect(textPrependId, 0, displayId, 0)
  connect(textOnPrependId, 0, displayId, 0)
  connect('held-router', index, heldSelectId, 0)
  connect(heldSelectId, 0, idleStyleId, 0)
  connect(heldSelectId, 1, activeStyleId, 0)
  connect(idleStyleId, 0, displayId, 0)
  connect(activeStyleId, 0, displayId, 0)
}

// Initialize the engine deterministically.
addBox('loadbang', 'newobj', 'loadbang', [25, 360, 58, 22])
const initialMessages = ['set_key 0', 'set_scale 0', 'set_genre 1', 'set_extension_flags 1 1 1 0 0 0 0', 'set_transpose 0', 'set_octave 0']
initialMessages.forEach((text, index) => {
  const id = `initial-${index}`
  addBox(id, 'message', text, [100 + index * 105, 360, 96, 22])
  connect('loadbang', 0, id, 0)
  connect(id, 0, 'engine', 0)
})

const patch = {
  patcher: {
    fileversion: 1,
    appversion: { major: 8, minor: 6, revision: 5, architecture: 'x64', modernui: 1 },
    classnamespace: 'box',
    rect: [80, 80, 840, 450],
    openrect: [0, 0, 760, 169],
    bglocked: 0,
    openinpresentation: 1,
    default_fontsize: 10,
    default_fontface: 0,
    default_fontname: 'Ableton Sans Medium Regular',
    gridonopen: 1,
    gridsize: [8, 8],
    gridsnaponopen: 1,
    objectsnaponopen: 1,
    statusbarvisible: 2,
    toolbarvisible: 1,
    enablehscroll: 1,
    enablevscroll: 1,
    devicewidth: 760,
    description: 'Play a genre-aware chord bank from a 25-key MIDI controller.',
    digest: 'One-note chord performance and harmonic discovery.',
    tags: 'MIDI chord harmony XOrds',
    title: 'XOrds',
    boxes,
    lines,
    parameters,
    dependency_cache: [],
    autosave: 0,
  },
}

fs.mkdirSync(deviceDir, { recursive: true })
const json = `${JSON.stringify(patch, null, '\t')}\n`
fs.writeFileSync(path.join(deviceDir, 'XOrds.maxpat'), json)

const jsonBuffer = Buffer.from(`${json}\0`)
const header = Buffer.from('616d7066040000006d6d6d6d6d6574610400000000000000', 'hex')
const chunk = Buffer.alloc(8)
chunk.write('ptch', 0, 'ascii')
chunk.writeUInt32LE(jsonBuffer.length, 4)
fs.writeFileSync(path.join(deviceDir, 'XOrds.amxd'), Buffer.concat([header, chunk, jsonBuffer]))

process.stdout.write(`Built ${path.join(deviceDir, 'XOrds.amxd')}\n`)
