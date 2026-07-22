# Xanto

Creative Max for Live instruments, MIDI tools, and audio effects for Ableton
Live.

[Project site](https://ukaoskid.github.io/xanto/) · [GitHub repository](https://github.com/ukaoskid/xanto)

Xanto is a growing collection of focused devices designed to make one musical
idea immediate: generate a playable sound, discover a chord, reverse a phrase,
or build a pre-reverb without leaving Live.

## Devices

| Device | Type | Purpose |
| --- | --- | --- |
| [XPad](xpad/) | MIDI instrument | Generates evolving pads with playable synthesis and effects. |
| [XKeys](xkeys/) | MIDI instrument | Generates expressive keys, plucks, mallets, and hybrid keyboard sounds. |
| [XOrds](xords/) | MIDI effect | Maps a genre-aware, scale-aware bank of 25 chords across a MIDI keyboard. |
| [XRev](xrev/) | Audio effect | Detects musical slices and reverses each one in place. |
| [XPre](xpre/) | Audio effect | Creates a source-length pre-reverb from dropped audio. |

Each project contains an editable `.maxpat`, a packaged `.amxd`, its engine or
voice files, a focused README, and build tooling where needed.

## Repository layout

```text
xanto/
├── xpad/    # Generative pad instrument
├── xkeys/   # Generative keyboard instrument
├── xords/   # Chord-bank MIDI effect
├── xrev/    # Per-slice reverse audio effect
├── xpre/    # Pre-reverb audio effect
└── docs/    # GitHub Pages site
```

## Development

The build commands are intentionally local to each device. See the README in
the relevant folder for its workflow.

Most devices can be rebuilt with Node.js and their script under `tools/`. XOrds
is self-contained and has no package-manager dependencies:

```sh
node xords/tools/build-device.mjs
```

XRev and XPre also include engine tests:

```sh
node xrev/tools/test-engine.js
node xpre/tools/test-engine.js
```

## Max for Live packaging note

XOrds embeds its engine and is self-contained. The development builds of XPad,
XKeys, XRev, and XPre resolve sidecar files from their checkout location. When
preparing those devices for distribution, open them in Max and use **Freeze
Device** so their dependencies travel with the `.amxd`.

## Documentation

The project site is published from [`docs/`](docs/).
