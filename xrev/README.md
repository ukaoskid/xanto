# XRev

XRev is a Max for Live audio effect that reproduces the common “split every
note, reverse each slice, crossfade, and place it back” workflow.

## Use

1. Extract the complete XRev download and keep `XRev.amxd` and
   `xrev_engine.js` together. Add that folder to Live's Browser under
   **Places**.
2. Put `XRev.amxd` on an audio track.
3. Drag an audio clip (or an audio file from Finder/Live's Browser) onto the drop zone.
4. Click **PROCESS**. XRev detects note/chord attacks and reverses every detected
   cell independently, without moving it or changing the total sample length.
5. Click **PREVIEW** to audition it.
6. Put Live's Arrangement insertion cursor where the result should start and
   click **PLACE**. Keep transport stopped and make sure the target range is free.

**Sensitivity** controls how many attacks are detected. Raise it if separate
notes are being joined; lower it if one note is split into several pieces.
**Slice Fade** treats every detected piece as an independently chopped clip. It
fades the beginning of that piece in from zero and fades its reversed transient
out to zero, without overlapping or blending the adjacent audio. The range is
0–250 ms (default 18 ms); piano material will usually work around 15–60 ms.
XRev automatically shortens both fades when a detected piece is too small.

The generated WAV is stored next to the Live Set when the Set has been saved,
or next to the dropped source otherwise. When an Arrangement clip is dragged,
XRev reads the selected clip's actual left/right edges and hard-locks the render
to that exact duration. The device displays `CLIP LENGTH LOCKED` when this is
active. For Browser/Finder files without Arrangement metadata, it falls back to
removing a clearly long silent tail while preserving a short release margin.

## Development

```sh
node tools/build-patch.js
node tools/test-engine.js
node tools/package-amxd.js
```
