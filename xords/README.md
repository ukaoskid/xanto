# XOrds

XOrds is a Max for Live MIDI effect for playing a genre-aware, scale-aware
25-chord bank from a MIDI keyboard. It is a self-contained Max device with no
web application, browser runtime, package manager, or external dependencies.

## Files

- `XOrds.amxd` — packaged Max MIDI Effect, ready to load in Live.
- `XOrds.maxpat` — editable generated Max patch.
- `xords_engine.js` — self-contained harmony and Max message engine embedded
  in the device.
- `tools/build-device.mjs` — rebuilds the Max patch and packaged device.

## Build

```sh
node tools/build-device.mjs
```

## Load it in Ableton Live

1. Drag `XOrds.amxd` onto a MIDI track **before an Ableton or third-party
   instrument**. XOrds produces MIDI notes, not audio. The engine is embedded
   inside the `.amxd`; no sidecar file is required at runtime.
2. Play MIDI notes 48–72 by default. Click **Learn** under **Lowest Key**, then
   press the lowest key on your controller to map its 25 keys.
3. Use **Panic** if a downstream instrument ever leaves notes active.

XOrds is MIDI-only. It contains no synthesizer or audio generator and must
appear to the left of an instrument in the same Live device chain.

The device provides a visible 25-slot chord bank, genre, key, scale, individual
chord-type selectors, transpose, octave, lowest-key mapping, regeneration,
held-chord highlighting, and direct held-note MIDI transformation.
