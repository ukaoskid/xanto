# XPad

XPad is a generative Max for Live **MIDI instrument** for playable, evolving
pads. Incoming MIDI notes remain the performance source: play it from Ableton's
computer MIDI keyboard or any MIDI controller.

## Product rules

- **GENERATE** creates a new pad immediately.
- There is intentionally no previous/next preset browser and no history stack.
- The current generated architecture, its category/signature, and all visible
  knob values are stored with the Ableton Live Set. Reopening a Set restores
  that exact state; only pressing **GENERATE** replaces it.
- Generated synthesis architecture and effect character are internal rather
  than exposed as extra Live parameters, keeping the device compact.
- **ATTACK** and **RELEASE** run from 0–10,000 ms. Release controls the
  amplitude-envelope tail after a key is released and scales the hall decay so
  the complete audible tail follows the control even at high reverb levels.
  They are persistent user settings and are never changed by Generate.
- **FILTER** controls cutoff from 80–12,000 Hz. Generate supplies its starting
  value and the user can adjust it afterward.
- **CHORUS**, **DRIVE**, and **REVERB** run from 0–100%.
- Every generation combines a monotonic generation counter, the clock, and fresh
  entropy. The displayed six-character signature identifies the result.

## Files

- `XPad.amxd` — packaged Max for Live instrument, ready to drop into Live.
- `XPad.maxpat` — editable source patch.
- `xpad_voice.maxpat` — eight-voice hybrid subtractive/FM synth voice used by
  `poly~`.
- `xpad_generate.js` — one-way preset generator and pad-name/signature maker.

## Install / use

1. Extract the complete XPad download and keep `XPad.amxd`,
   `xpad_voice.maxpat`, and `xpad_generate.js` together.
2. Add the extracted XPad folder to Live's Browser under **Places**, then drag
   `XPad.amxd` onto a MIDI track, arm the track, and play notes.
3. Click **GENERATE** whenever you want to permanently leave the current pad.
4. Save the Live Set normally to preserve the current pad and knob positions.

Keep all three source files together while editing. Max will resolve
`xpad_voice.maxpat` and `xpad_generate.js` from the device's folder. Before
sharing the device, use **Freeze Device** in Max so its dependencies travel with
the `.amxd`.

After editing `XPad.maxpat`, rebuild the packaged device with:

```sh
node tools/package-amxd.js
```

## Sound design

Each generated sound first chooses one of twelve contrasting directions:
ominous, dark, melancholic, ambient, wet, luminous, frozen, dusty, harmonic,
unstable, celestial, or industrial. These are synthesis architectures rather
than cosmetic names. They vary saw/sine/pulse sources, harmonic or inharmonic
ratios, FM layers, four filter responses, noise and sub weight, modulation, and
hidden chorus/drive/reverb character. The visible Chorus, Drive, and Reverb
knobs remain the user's effect amounts. Generate never changes Attack or
Release. Velocity controls loudness.

Velocity is latched on note-on and held through the complete release stage. A
MIDI note-off therefore starts the envelope tail instead of cutting amplitude
immediately. Internally, nominal 0 ms Attack/Release settings use 5/10 ms safety
ramps to avoid waveform-discontinuity clicks.
