#!/usr/bin/env node

const assert = require("assert");
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const sampleRate = 2000;
// The underlying bounce is 12 seconds, although the useful clip ends at 4.
// This reproduces Live handing live.drop the uncropped source file.
const seconds = 12;
const sourceFrames = sampleRate * seconds;
const buffers = { xrev_source: [new Array(sourceFrames).fill(0), new Array(sourceFrames).fill(0)], xrev_render: [[], []] };

// Eight separated piano-like attacks, two per second.
for (let event = 0; event < 8; event++) {
  const onset = Math.round(event * sampleRate * 0.5);
  for (let i = onset; i < Math.min(sourceFrames, onset + sampleRate * 0.42); i++) {
    const age = (i - onset) / sampleRate;
    const envelope = Math.exp(-age * 8);
    buffers.xrev_source[0][i] += Math.sin(2 * Math.PI * (180 + event * 9) * age) * envelope * 0.7;
    buffers.xrev_source[1][i] += Math.sin(2 * Math.PI * (183 + event * 9) * age) * envelope * 0.7;
  }
}

class BufferMock {
  constructor(name) { this.name = name; }
  framecount() { return buffers[this.name][0].length; }
  length() { return this.framecount() * 1000 / sampleRate; }
  channelcount() { return buffers[this.name].length; }
  peek(channel, start, count) { return buffers[this.name][channel - 1].slice(start, start + count); }
  poke(channel, start, values) { buffers[this.name][channel - 1] = values.slice(); }
}
class TaskMock { constructor(fn, receiver) { this.fn = fn; this.receiver = receiver; } schedule() { this.fn.call(this.receiver); } }
class LiveApiMock {
  constructor(_callback, target) { this.id = 1; this.target = target || ""; }
  get(name) {
    if (this.target === "live_set view detail_clip") {
      return { file_path: "/tmp/eight-notes.wav", start_time: 16, end_time: 24 }[name];
    }
    return { tempo: 120, is_playing: 0, current_song_time: 0 }[name];
  }
}
const messages = [];
const context = {
  Buffer: BufferMock, Task: TaskMock, LiveAPI: LiveApiMock, Date, Math, isFinite,
  post() {}, arrayfromargs(args) { return Array.prototype.slice.call(args); },
  outlet(index, ...message) {
    messages.push([index, ...message]);
    if (index === 0 && message[0] === "sizeinsamps") buffers.xrev_render = [new Array(message[1]).fill(0), new Array(message[1]).fill(0)];
  }
};
vm.createContext(context);
vm.runInContext(fs.readFileSync(path.join(__dirname, "..", "xrev_engine.js"), "utf8"), context, { filename: "xrev_engine.js" });
assert.strictEqual(context.liveApiFilePath("Macintosh HD:/Users/test/XRev.wav"), "/Users/test/XRev.wav");
assert.strictEqual(context.liveApiFilePath("Samples:/Audio/XRev.wav"), "/Volumes/Samples/Audio/XRev.wav");
context.source("/tmp/eight-notes.wav");
context.sensitivity(62);
context.crossfade(30);
context.process();
assert.strictEqual(context.selectedClipDurationBeats, 8, "selected Arrangement duration must be captured");
assert.strictEqual(context.renderFrames, sampleRate * 4, "render must be hard-locked to the visible Live clip length");
assert.strictEqual(context.detectedEvents, 8, "the eight attacks should create eight cells");
for (const channel of buffers.xrev_render) {
  assert.strictEqual(channel.length, context.renderFrames, "render length must match the audible clip range");
  assert(channel.every(Number.isFinite), "all output samples must be finite");
  assert(channel.reduce((peak, value) => Math.max(peak, Math.abs(value)), 0) <= 0.981, "output ceiling");
  assert(Math.abs(channel[0]) < 1e-9 && Math.abs(channel[channel.length - 1]) < 1e-9, "click-free outer edges");
}
// The first cell is individually reversed: its early source attack moves near
// the end of that cell, while the second event remains in the second cell.
const firstCell = buffers.xrev_render[0].slice(0, sampleRate * 0.5);
const firstHalfEnergy = firstCell.slice(0, firstCell.length / 2).reduce((s, v) => s + v * v, 0);
const secondHalfEnergy = firstCell.slice(firstCell.length / 2).reduce((s, v) => s + v * v, 0);
assert(secondHalfEnergy > firstHalfEnergy * 3, "each cell must reverse independently");
const thirtyMsRender = buffers.xrev_render[0].slice();
const detectedBoundaries = context.analyzeBoundaries(
  buffers.xrev_source[0], buffers.xrev_source[1], context.renderFrames, sampleRate
);
context.crossfade(100);
context.process();
const hundredMsRender = buffers.xrev_render[0].slice();
for (let event = 1; event < detectedBoundaries.length - 1; event++) {
  assert(Math.abs(hundredMsRender[detectedBoundaries[event]]) < 1e-12,
    "the incoming sample at every reversed-cell boundary must be exactly zero");
  assert(Math.abs(hundredMsRender[detectedBoundaries[event] - 1]) < 1e-12,
    "the outgoing sample at every reversed-cell boundary must be exactly zero");
  const probe = detectedBoundaries[event] + Math.round(sampleRate * 0.015);
  assert(Math.abs(hundredMsRender[probe]) <= Math.abs(thirtyMsRender[probe]) + 1e-12,
    "a longer slice fade must attenuate the incoming edge of the next cell");
}
const tailStart = hundredMsRender.length - Math.round(sampleRate * 0.08);
const energy = (array) => array.slice(tailStart).reduce((sum, value) => sum + value * value, 0);
assert(energy(hundredMsRender) < energy(thirtyMsRender), "longer slice fade must soften the final reversed transient");
context.crossfade(120);
assert.strictEqual(context.crossfadeMs, 120, "long musical crossfades must be supported");
console.log("XRev invariants passed: 8 pieces, exact Arrangement length lock, finite click-safe output");
