# XPre

XPre is a focused Max for Live **audio effect** that creates a pre-reverb from
a dropped audio file. It automates one familiar studio operation:

1. Reverse the source.
2. Add reverb.
3. Render/consolidate to the source's exact sample length.
4. Reverse the result again.

There are no generative recipes, pitch effects, or musical-length controls.
The output keeps the source pitch and has exactly the same sample count and
duration as the dropped file.

- **REVERB** controls the room size and feedback/decay of a hybrid-style engine:
  convolution-like early reflections feeding a bright, highly diffused
  algorithmic tail with subtle slow stereo movement.
- **MIX** controls the dry/wet balance independently. Toward 100%, it also
  suppresses voice-like early reflections in favor of the diffuse late tail.

## Workflow

1. Extract the complete XPre download and keep `XPre.amxd` and
   `xpre_engine.js` together. Add that folder to Live's Browser under
   **Places**.
2. Put `XPre.amxd` on a dedicated Arrangement audio track.
3. Drop an audio file from Live's Browser or Finder into the source area.
4. Set **REVERB** and **MIX**.
5. Press **GENERATE**. Generating again replaces the current internal result.
6. Press **PREVIEW** to audition it.
7. Stop Live and put the Arrangement cursor where the generated clip should
   begin.
8. Press **PLACE**. XPre writes a unique WAV beside the saved Live Set and
   creates an audio clip on XPre's own track at that position.

PLACE refuses overlaps and never deletes existing clips. An unsaved Set falls
back to writing beside the source file.

## Files

- `XPre.amxd` — packaged development device ready to load in Live.
- `XPre.maxpat` — editable Max patch.
- `xpre_engine.js` — pre-reverb renderer and Live placement logic.
- `tools/build-patch.js` — regenerates the source patch.
- `tools/package-amxd.js` — packages the audio-effect AMXD.
- `tools/test-engine.js` — verifies length, pitch/source correlation, edge
  safety, output ceiling, and Max/Live path conversion.

```sh
node tools/test-engine.js
node tools/build-patch.js
node tools/package-amxd.js
```

Before distributing XPre, use **Freeze Device** in Max so the JavaScript
dependency travels with the AMXD.
