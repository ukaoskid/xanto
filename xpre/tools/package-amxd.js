#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const source = path.join(root, "XPre.maxpat");
const destination = path.join(root, "XPre.amxd");
const patch = JSON.parse(fs.readFileSync(source, "utf8"));
const enginePath = "xpre_engine.js";

for (const entry of patch.patcher.boxes) {
  if (entry.box.id === "engine") {
    entry.box.text = `js ${enginePath}`;
    entry.box.saved_object_attributes = { filename: enginePath, parameter_enable: 0 };
  }
}
patch.patcher.dependency_cache = [{ name: enginePath, type: "TEXT", implicit: 1 }];
patch.patcher.project = {
  version: 1, creationdate: 3868759470, modificationdate: 3868759470,
  viewrect: [0, 0, 300, 500], autoorganize: 1, hideprojectwindow: 1,
  showdependencies: 1, autolocalize: 0, contents: { patchers: {} },
  layout: {}, searchpath: {}, detailsvisible: 0, amxdtype: 1633771873,
  readonly: 0, devpathtype: 0, devpath: ".", sortmode: 0, viewmode: 0
};

const patchJson = Buffer.from(`${JSON.stringify(patch, null, 2)}\n`, "utf8");
const formHeader = Buffer.concat([
  // `aaaa` declares a Max Audio Effect. (`iiii` is a Max Instrument.)
  Buffer.from("ampf", "ascii"), Buffer.from([0x04, 0, 0, 0]), Buffer.from("aaaa", "ascii")
]);
const metadata = Buffer.concat([
  Buffer.from("meta", "ascii"), Buffer.from([0x04, 0, 0, 0]), Buffer.alloc(4)
]);
const patchBody = Buffer.concat([patchJson, Buffer.from([0])]);
const patchHeader = Buffer.alloc(8);
patchHeader.write("ptch", 0, "ascii");
patchHeader.writeUInt32LE(patchBody.length, 4);
fs.writeFileSync(destination, Buffer.concat([formHeader, metadata, patchHeader, patchBody]));
console.log(`Packaged XPre.amxd (${patchBody.length} byte patch chunk)`);
