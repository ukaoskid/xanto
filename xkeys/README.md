# XKeys

XKeys is a generative Max for Live **MIDI instrument** for immediate,
expressive keyboard sounds. It explores piano-inspired voices, synth keys,
plucks, and hybrids between those families. It intentionally does not generate
organs and does not attempt sample-based acoustic-piano realism.

Incoming MIDI notes remain the performance source: play it from Ableton's
computer MIDI keyboard or any MIDI controller. Velocity controls loudness.

## Product rules

- **GENERATE** creates a new playable keys sound immediately.
- There is no previous/next preset browser and no history stack.
- The generated architecture, category/signature, and every visible control are
  stored with the Ableton Live Set. Reopening a Set restores that exact sound;
  only pressing **GENERATE** replaces it.
- Generated synthesis and effect character stay internal, keeping the device
  compact.
- **ATTACK** and **RELEASE** run from 0–10,000 ms and remain persistent user
  settings. Generate never moves them.
- **FILTER** controls cutoff from 80–12,000 Hz. Generate chooses its starting
  value; the player can adjust it afterward.
- **CHORUS**, **DRIVE**, and **REVERB** run from 0–100% and remain directly
  playable while their hidden character varies with each generation.
- Every generation combines a monotonic counter, the clock, and fresh entropy.
  The six-character signature identifies the result.

## Sound families

Each generation chooses one of twelve keyboard-focused directions: felt,
hammer, tine, glass, warm, bright, analog, digital, pluck, mallet, dusk, or
hybrid. These are synthesis recipes rather than cosmetic labels. They vary the
oscillator and FM balance, harmonic ratios, noise/transient weight, filter
response, decay and sustain contour, pitch drift, and effect character.

The engine is an eight-voice hybrid subtractive/FM synthesizer. Short internal
decays and low sustain values produce plucks and mallets; richer harmonic and FM
layers produce piano-like, tine, glass, analog, and digital keys. Nominal 0 ms
Attack/Release settings use small safety ramps to avoid clicks.

## Files

- `XKeys.amxd` — packaged Max for Live instrument, ready to drop into Live.
- `XKeys.maxpat` — editable source patch.
- `xkeys_voice.maxpat` — eight-voice synth used by `poly~`.
- `xkeys_generate.js` — one-way sound generator and signature maker.

## Install / use

1. Keep `XKeys.amxd`, `xkeys_voice.maxpat`, and `xkeys_generate.js` together
   during development. The AMXD package binds the two dependencies to their
   absolute workspace paths because Live does not reliably search beside an
   externally dragged AMXD.
2. Drag `XKeys.amxd` onto a MIDI track, arm the track, and play notes.
3. Click **GENERATE** whenever you want to permanently leave the current sound.
4. Save the Live Set normally to preserve the generated sound and controls.

Before sharing the device, use **Freeze Device** in Max so the dependencies
travel with the `.amxd`.

After editing `XKeys.maxpat`, rebuild the packaged device with:

```sh
node tools/package-amxd.js
```
