#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const boxes = [];
const lines = [];

function box(id, maxclass, rect, extras = {}) {
  boxes.push({ box: { id, maxclass, patching_rect: rect, ...extras } });
}

function connect(source, outlet, destination, inlet = 0, order) {
  const patchline = { source: [source, outlet], destination: [destination, inlet] };
  if (order !== undefined) patchline.order = order;
  lines.push({ patchline });
}

const purple = [0.22, 0.08, 0.34, 1];
const red = [0.95, 0.08, 0.16, 1];
const cream = [1, 0.94, 0.88, 1];
const muted = [0.62, 0.56, 0.68, 1];

box("brand", "comment", [20, 20, 120, 25], {
  text: "XPRE", fontsize: 18, fontface: 1, textcolor: cream,
  presentation: 1, presentation_rect: [14, 8, 74, 24]
});
box("tag", "comment", [130, 20, 260, 25], {
  text: "ANTICIPATION CONSTRUCTOR", fontsize: 9, textcolor: muted,
  presentation: 1, presentation_rect: [80, 12, 180, 18]
});
box("drop", "live.drop", [20, 55, 310, 80], {
  // Match Cycling '74's official live.drop configuration. The previous
  // unsupported `types` attribute plus a disabled parameter prevented Live's
  // Browser/Finder drops from producing the pathname outlet.
  decodemode: 0, fontsize: 12, numinlets: 1, numoutlets: 2, outlettype: ["", ""],
  parameter_enable: 1, varname: "source_drop", rounded: 8,
  bgcolor: [0.095, 0.06, 0.13, 1], activebgcolor: purple, bordercolor: [0.36, 0.22, 0.46, 1],
  textcolor: cream, presentation: 1, presentation_rect: [14, 36, 300, 55],
  saved_attribute_attributes: { valueof: {
    parameter_invisible: 1, parameter_longname: "Source Audio Drop",
    parameter_modmode: 0, parameter_shortname: "Source Drop", parameter_type: 4
  }}
});
box("sourceLabel", "comment", [20, 140, 310, 20], {
  text: "NO SOURCE", fontsize: 8, textcolor: muted,
  presentation: 1, presentation_rect: [15, 93, 299, 14]
});

function dial(id, label, x, initial) {
  box(id, "live.dial", [x, 55, 48, 48], {
    parameter_enable: 1, varname: id, min: 0, size: 100, floatoutput: 1,
    activebgcolor: purple, activeneedlecolor: red,
    presentation: 1, presentation_rect: [x - 94, 39, 38, 43],
    saved_attribute_attributes: { valueof: {
      parameter_longname: label[0] + label.slice(1).toLowerCase(), parameter_shortname: label,
      parameter_type: 0, parameter_mmin: 0, parameter_mmax: 100,
      parameter_units: "%d%", parameter_unitstyle: 9, parameter_steps: 101,
      parameter_initial_enable: 1, parameter_initial: [initial]
    }}
  });
  box(`${id}Label`, "comment", [x, 105, 48, 18], {
    text: label, fontsize: 7, textjustification: 1, textcolor: muted,
    presentation: 1, presentation_rect: [x - 96, 82, 42, 14]
  });
  box(`${id}Prepend`, "newobj", [x, 140, 80, 22], { text: `prepend ${id}` });
  connect(id, 0, `${id}Prepend`, 0);
  connect(`${id}Prepend`, 0, "engine", 0);
}

dial("reverb", "REVERB", 434, 65);
dial("mix", "MIX", 484, 65);

box("generate", "live.text", [20, 175, 125, 40], {
  text: "GENERATE", texton: "GENERATE", mode: 0, parameter_enable: 0,
  activebgcolor: red, activebgoncolor: [1, 0.25, 0.22, 1], textcolor: cream,
  presentation: 1, presentation_rect: [14, 119, 112, 32]
});
box("preview", "live.text", [155, 175, 100, 40], {
  text: "PREVIEW", texton: "PREVIEW", mode: 0, parameter_enable: 0,
  activebgcolor: purple, textcolor: cream,
  presentation: 1, presentation_rect: [132, 119, 92, 32]
});
box("place", "live.text", [265, 175, 100, 40], {
  text: "PLACE", texton: "PLACE", mode: 0, parameter_enable: 0,
  activebgcolor: [0.15, 0.38, 0.3, 1], textcolor: cream,
  presentation: 1, presentation_rect: [230, 119, 92, 32]
});
box("status", "comment", [380, 178, 320, 20], {
  text: "DROP SOURCE AUDIO", fontsize: 8, textcolor: cream,
  presentation: 1, presentation_rect: [332, 119, 187, 15]
});
box("result", "comment", [380, 200, 320, 20], {
  text: "NO PRE-REVERB", fontsize: 8, textcolor: muted,
  presentation: 1, presentation_rect: [332, 137, 187, 14]
});

box("dropTrigger", "newobj", [20, 280, 55, 22], { text: "t s s" });
box("dropRoute", "newobj", [20, 250, 75, 22], { text: "route none" });
box("replace", "newobj", [20, 315, 100, 22], { text: "prepend replace" });
box("sourcePrepend", "newobj", [130, 315, 95, 22], { text: "prepend source" });
box("sourceBuffer", "newobj", [20, 355, 185, 22], { text: "buffer~ xpre_source 1000 2" });
box("renderBuffer", "newobj", [235, 355, 185, 22], { text: "buffer~ xpre_render 1000 2" });
box("writeDone", "newobj", [430, 355, 115, 22], { text: "prepend write_done" });
box("engine", "newobj", [250, 280, 130, 22], {
  text: "js xpre_engine.js", saved_object_attributes: { filename: "xpre_engine.js", parameter_enable: 0 }
});
box("generateMsg", "newobj", [390, 280, 105, 22], { text: "prepend generate" });
box("previewMsg", "newobj", [505, 280, 100, 22], { text: "prepend preview" });
box("placeMsg", "newobj", [615, 280, 90, 22], { text: "prepend place" });
box("play", "newobj", [235, 395, 130, 22], { text: "play~ xpre_render 2" });
box("gain", "newobj", [235, 430, 80, 22], { text: "*~ 0.8" });
box("gainR", "newobj", [325, 430, 80, 22], { text: "*~ 0.8" });
box("plugin", "newobj", [20, 430, 55, 22], { text: "plugin~" });
box("out", "newobj", [120, 500, 58, 22], { text: "plugout~" });

connect("drop", 0, "dropRoute", 0);
connect("dropRoute", 1, "dropTrigger", 0);
connect("dropTrigger", 1, "replace", 0);
connect("replace", 0, "sourceBuffer", 0);
connect("dropTrigger", 0, "sourcePrepend", 0);
connect("sourcePrepend", 0, "engine", 0);
connect("engine", 0, "renderBuffer", 0);
connect("renderBuffer", 1, "writeDone", 0);
connect("writeDone", 0, "engine", 0);
connect("engine", 1, "play", 0);
connect("engine", 2, "status", 0);
connect("engine", 3, "result", 0);
connect("engine", 4, "sourceLabel", 0);
connect("generate", 0, "generateMsg", 0);
connect("generateMsg", 0, "engine", 0);
connect("preview", 0, "previewMsg", 0);
connect("previewMsg", 0, "engine", 0);
connect("place", 0, "placeMsg", 0);
connect("placeMsg", 0, "engine", 0);
connect("play", 0, "gain", 0);
connect("play", 1, "gainR", 0);
connect("gain", 0, "out", 0);
connect("gainR", 0, "out", 1);
connect("plugin", 0, "out", 0);
connect("plugin", 1, "out", 1);

const patch = {
  patcher: {
    fileversion: 1,
    appversion: { major: 8, minor: 6, revision: 0, architecture: "x64", modernui: 1 },
    classnamespace: "box",
    rect: [80, 80, 760, 560],
    bgcolor: [0.055, 0.035, 0.075, 1],
    editing_bgcolor: [0.12, 0.11, 0.14, 1],
    bglocked: 0,
    openinpresentation: 1,
    default_fontsize: 12,
    default_fontface: 0,
    default_fontname: "Arial",
    gridonopen: 1,
    gridsize: [15, 15],
    toolbarvisible: 1,
    devicewidth: 530,
    boxes,
    lines,
    dependency_cache: [{ name: "xpre_engine.js", type: "TEXT", implicit: 1 }],
    autosave: 0
  }
};

fs.writeFileSync(path.join(root, "XPre.maxpat"), `${JSON.stringify(patch, null, 2)}\n`);
console.log(`Built XPre.maxpat (${boxes.length} boxes, ${lines.length} patch cords)`);
