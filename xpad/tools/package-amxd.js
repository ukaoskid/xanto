#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const source = path.join(root, "XPad.maxpat");
const destination = path.join(root, "XPad.amxd");

const patch = JSON.parse(fs.readFileSync(source, "utf8"));

// Live hosts an AMXD from an internal location and does not reliably add the
// source AMXD's sibling folder to Max's search path. During development, bind
// the two external dependencies to this workspace explicitly. The editable
// maxpat remains relative/portable; only the generated AMXD receives these
// absolute development paths.
const boxes = Object.fromEntries(
    patch.patcher.boxes.map((entry) => [entry.box.id, entry.box])
);
const generatorPath = path.join(root, "xpad_generate.js");
const voicePath = path.join(root, "xpad_voice.maxpat");

boxes.js.text = `js ${generatorPath}`;
boxes.js.saved_object_attributes = {
    filename: generatorPath,
    parameter_enable: 0
};
boxes.poly.text = `poly~ ${voicePath} 8 @steal 1`;

const patchJson = Buffer.from(`${JSON.stringify(patch, null, 2)}\n`, "utf8");

// Max's AMXD container is an AMPF stream with a metadata chunk followed by a
// null-terminated `ptch` JSON chunk. This matches Ableton Live 12's bundled
// Max Instrument template.
const formHeader = Buffer.concat([
    Buffer.from("ampf", "ascii"),
    Buffer.from([0x04, 0x00, 0x00, 0x00]),
    Buffer.from("iiii", "ascii")
]);
const metadata = Buffer.concat([
    Buffer.from("meta", "ascii"),
    Buffer.from([0x04, 0x00, 0x00, 0x00]),
    Buffer.alloc(4)
]);
const patchBody = Buffer.concat([patchJson, Buffer.from([0x00])]);
const patchHeader = Buffer.alloc(8);
patchHeader.write("ptch", 0, "ascii");
patchHeader.writeUInt32LE(patchBody.length, 4);

fs.writeFileSync(
    destination,
    Buffer.concat([formHeader, metadata, patchHeader, patchBody])
);

console.log(`Packaged ${path.basename(destination)} (${patchBody.length} byte patch chunk)`);
