#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const root = path.resolve(__dirname, "..");
const boxes = [];
const lines = [];
function box(id, maxclass, rect, extras = {}) { boxes.push({ box: { id, maxclass, patching_rect: rect, ...extras } }); }
function connect(source, outlet, destination, inlet = 0) { lines.push({ patchline: { source: [source, outlet], destination: [destination, inlet] } }); }

const ink = [0.96, 0.95, 0.92, 1];
const muted = [0.58, 0.60, 0.64, 1];
const green = [0.20, 0.78, 0.57, 1];
const violet = [0.42, 0.22, 0.74, 1];

box("brand", "comment", [20, 20, 100, 24], { text: "XREV", fontsize: 18, fontface: 1, textcolor: ink, presentation: 1, presentation_rect: [14, 8, 62, 24] });
box("tag", "comment", [100, 20, 230, 24], { text: "PER-EVENT REVERSE", fontsize: 9, textcolor: muted, presentation: 1, presentation_rect: [76, 12, 155, 18] });
box("drop", "live.drop", [20, 55, 310, 80], {
  decodemode: 0, fontsize: 12, numinlets: 1, numoutlets: 2, outlettype: ["", ""], parameter_enable: 1,
  varname: "source_drop", rounded: 8, bgcolor: [0.045, 0.075, 0.072, 1], activebgcolor: [0.08, 0.30, 0.24, 1],
  bordercolor: [0.18, 0.39, 0.34, 1], textcolor: ink, presentation: 1, presentation_rect: [14, 36, 294, 53],
  saved_attribute_attributes: { valueof: { parameter_invisible: 1, parameter_longname: "Source Audio Drop", parameter_shortname: "Source Drop", parameter_modmode: 0, parameter_type: 4 } }
});
box("sourceLabel", "comment", [20, 140, 310, 20], { text: "DROP AUDIO HERE", fontsize: 8, textcolor: muted, presentation: 1, presentation_rect: [15, 91, 293, 14] });

function dial(id, label, x, min, max, initial, unit) {
  box(id, "live.dial", [x, 55, 48, 48], {
    parameter_enable: 1, varname: id, min, size: max - min, floatoutput: 1, activebgcolor: violet, activeneedlecolor: green,
    presentation: 1, presentation_rect: [x - 94, 39, 38, 43],
    saved_attribute_attributes: { valueof: { parameter_longname: label, parameter_shortname: label, parameter_type: 0,
      parameter_mmin: min, parameter_mmax: max, parameter_units: unit, parameter_unitstyle: 9, parameter_steps: max - min + 1,
      parameter_initial_enable: 1, parameter_initial: [initial] } }
  });
  box(`${id}Label`, "comment", [x, 105, 50, 18], { text: label.toUpperCase(), fontsize: 7, textjustification: 1, textcolor: muted, presentation: 1, presentation_rect: [x - 99, 82, 48, 14] });
  box(`${id}Prepend`, "newobj", [x, 140, 100, 22], { text: `prepend ${id}` });
  connect(id, 0, `${id}Prepend`); connect(`${id}Prepend`, 0, "engine");
}
dial("sensitivity", "Sensitivity", 410, 0, 100, 62, "%");
dial("crossfade", "Slice Fade", 466, 0, 250, 18, "ms");

box("process", "live.text", [20, 175, 120, 40], { text: "PROCESS", texton: "PROCESS", mode: 0, parameter_enable: 0, activebgcolor: green, activebgoncolor: [0.35, 0.95, 0.70, 1], textcolor: [0.03, 0.08, 0.07, 1], presentation: 1, presentation_rect: [14, 117, 105, 32] });
box("preview", "live.text", [150, 175, 100, 40], { text: "PREVIEW", texton: "PREVIEW", mode: 0, parameter_enable: 0, activebgcolor: violet, textcolor: ink, presentation: 1, presentation_rect: [125, 117, 88, 32] });
box("place", "live.text", [260, 175, 100, 40], { text: "PLACE", texton: "PLACE", mode: 0, parameter_enable: 0, activebgcolor: [0.14, 0.42, 0.62, 1], textcolor: ink, presentation: 1, presentation_rect: [219, 117, 88, 32] });
box("status", "comment", [380, 178, 280, 20], { text: "DROP AN AUDIO CLIP", fontsize: 8, textcolor: ink, presentation: 1, presentation_rect: [316, 117, 204, 15] });
box("result", "comment", [380, 200, 280, 20], { text: "NOT PROCESSED", fontsize: 8, textcolor: muted, presentation: 1, presentation_rect: [316, 135, 204, 14] });

box("dropRoute", "newobj", [20, 250, 75, 22], { text: "route none" });
box("dropTrigger", "newobj", [20, 280, 55, 22], { text: "t s s" });
box("replace", "newobj", [20, 315, 100, 22], { text: "prepend replace" });
box("sourcePrepend", "newobj", [130, 315, 95, 22], { text: "prepend source" });
box("sourceBuffer", "newobj", [20, 355, 190, 22], { text: "buffer~ xrev_source 1000 2" });
box("renderBuffer", "newobj", [235, 355, 190, 22], { text: "buffer~ xrev_render 1000 2" });
box("writeDone", "newobj", [435, 355, 115, 22], { text: "prepend write_done" });
box("engine", "newobj", [250, 280, 135, 22], { text: "js xrev_engine.js", saved_object_attributes: { filename: "xrev_engine.js", parameter_enable: 0 } });
box("processMsg", "newobj", [395, 280, 105, 22], { text: "prepend process" });
box("previewMsg", "newobj", [510, 280, 100, 22], { text: "prepend preview" });
box("placeMsg", "newobj", [620, 280, 90, 22], { text: "prepend place" });
box("play", "newobj", [235, 395, 130, 22], { text: "play~ xrev_render 2" });
box("gainL", "newobj", [235, 430, 80, 22], { text: "*~ 0.8" });
box("gainR", "newobj", [325, 430, 80, 22], { text: "*~ 0.8" });
box("plugin", "newobj", [20, 430, 55, 22], { text: "plugin~" });
box("out", "newobj", [120, 500, 58, 22], { text: "plugout~" });

connect("drop", 0, "dropRoute"); connect("dropRoute", 1, "dropTrigger");
connect("dropTrigger", 1, "replace"); connect("replace", 0, "sourceBuffer");
connect("dropTrigger", 0, "sourcePrepend"); connect("sourcePrepend", 0, "engine");
connect("engine", 0, "renderBuffer"); connect("renderBuffer", 1, "writeDone"); connect("writeDone", 0, "engine");
connect("engine", 1, "play"); connect("engine", 2, "status"); connect("engine", 3, "result"); connect("engine", 4, "sourceLabel");
connect("process", 0, "processMsg"); connect("processMsg", 0, "engine");
connect("preview", 0, "previewMsg"); connect("previewMsg", 0, "engine");
connect("place", 0, "placeMsg"); connect("placeMsg", 0, "engine");
connect("play", 0, "gainL"); connect("play", 1, "gainR"); connect("gainL", 0, "out", 0); connect("gainR", 0, "out", 1);
connect("plugin", 0, "out", 0); connect("plugin", 1, "out", 1);

const patch = { patcher: {
  fileversion: 1, appversion: { major: 8, minor: 6, revision: 0, architecture: "x64", modernui: 1 }, classnamespace: "box",
  rect: [80, 80, 760, 560], bgcolor: [0.025, 0.045, 0.043, 1], editing_bgcolor: [0.11, 0.12, 0.13, 1], bglocked: 0,
  openinpresentation: 1, default_fontsize: 12, default_fontface: 0, default_fontname: "Arial", gridonopen: 1,
  gridsize: [15, 15], toolbarvisible: 1, devicewidth: 530, boxes, lines,
  dependency_cache: [{ name: "xrev_engine.js", type: "TEXT", implicit: 1 }], autosave: 0
} };
fs.writeFileSync(path.join(root, "XRev.maxpat"), `${JSON.stringify(patch, null, 2)}\n`);
console.log(`Built XRev.maxpat (${boxes.length} boxes, ${lines.length} patch cords)`);
