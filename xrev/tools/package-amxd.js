#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const root = path.resolve(__dirname, "..");
const patch = JSON.parse(fs.readFileSync(path.join(root, "XRev.maxpat"), "utf8"));
const enginePath = path.join(root, "xrev_engine.js");
for (const entry of patch.patcher.boxes) {
  if (entry.box.id === "engine") {
    entry.box.text = `js ${enginePath}`;
    entry.box.saved_object_attributes = { filename: enginePath, parameter_enable: 0 };
  }
}
patch.patcher.dependency_cache = [{ name: enginePath, type: "TEXT", implicit: 1 }];
const patchBody = Buffer.concat([Buffer.from(`${JSON.stringify(patch, null, 2)}\n`, "utf8"), Buffer.from([0])]);
const formHeader = Buffer.concat([Buffer.from("ampf", "ascii"), Buffer.from([0x04, 0, 0, 0]), Buffer.from("aaaa", "ascii")]);
const metadata = Buffer.concat([Buffer.from("meta", "ascii"), Buffer.from([0x04, 0, 0, 0]), Buffer.alloc(4)]);
const patchHeader = Buffer.alloc(8);
patchHeader.write("ptch", 0, "ascii"); patchHeader.writeUInt32LE(patchBody.length, 4);
fs.writeFileSync(path.join(root, "XRev.amxd"), Buffer.concat([formHeader, metadata, patchHeader, patchBody]));
console.log(`Packaged XRev.amxd (${patchBody.length} byte patch chunk)`);
