#!/usr/bin/env node

const assert = require("assert");
const fs = require("fs");
const path = require("path");
const vm = require("vm");

// A reduced mock sample rate keeps the Max-JS VM regression test fast while
// preserving the renderer's sample-length, reverb, normalization, and edge math.
const sampleRate = 1000;
const sourceFrames = sampleRate * 2;
const buffers = {
  xpre_source: [new Array(sourceFrames), new Array(sourceFrames)],
  xpre_render: [[], []]
};

for (let i = 0; i < sourceFrames; i += 1) {
  const envelope = Math.exp(-i / (sampleRate * 0.55));
  buffers.xpre_source[0][i] = Math.sin(i * 2 * Math.PI * 173 / sampleRate) * envelope;
  buffers.xpre_source[1][i] = Math.sin(i * 2 * Math.PI * 181 / sampleRate) * envelope;
}

class BufferMock {
  constructor(name) { this.name = name; }
  framecount() { return buffers[this.name][0].length; }
  length() { return this.framecount() * 1000 / sampleRate; }
  channelcount() { return buffers[this.name].length; }
  peek(channel, start, count) {
    return buffers[this.name][channel - 1].slice(start, start + count);
  }
  poke(channel, start, values) {
    const destination = buffers[this.name][channel - 1];
    for (let i = 0; i < values.length; i += 1) destination[start + i] = values[i];
  }
}

class TaskMock {
  constructor(fn, receiver, ...args) {
    this.fn = fn;
    this.receiver = receiver;
    this.args = args;
  }
  schedule() { this.fn.apply(this.receiver, this.args); }
}

class LiveApiMock {
  constructor(_callback, target) { this.target = target; this.id = 1; }
  get(property) {
    const values = {
      tempo: 174,
      signature_numerator: 4,
      signature_denominator: 4,
      is_playing: 0,
      current_song_time: 0
    };
    return values[property];
  }
}

const context = {
  Buffer: BufferMock,
  Task: TaskMock,
  LiveAPI: LiveApiMock,
  Date,
  Math,
  isFinite,
  post() {},
  arrayfromargs(args) { return Array.prototype.slice.call(args); },
  outlet(index, ...message) {
    if (index === 0 && message[0] === "sizeinsamps") {
      buffers.xpre_render = [new Array(message[1]).fill(0), new Array(message[1]).fill(0)];
    }
  }
};
vm.createContext(context);
vm.runInContext(
  fs.readFileSync(path.join(__dirname, "..", "xpre_engine.js"), "utf8"),
  context,
  { filename: "xpre_engine.js" }
);

assert.strictEqual(
  context.liveApiFilePath("Macintosh HD:/Users/test/Set/XPre.wav"),
  "/Users/test/Set/XPre.wav",
  "startup-disk paths must be converted for Live's API"
);
assert.strictEqual(
  context.liveApiFilePath("Samples SSD:/Audio/XPre.wav"),
  "/Volumes/Samples SSD/Audio/XPre.wav",
  "external-volume paths must be converted for Live's API"
);

context.source("/tmp/voice.wav");
context.reverb(65);
for (const mixValue of [0, 50, 100]) {
  context.mix(mixValue);
  context.generate();
  assert.strictEqual(buffers.xpre_render[0].length, sourceFrames, "output must match source sample length");
  assert.strictEqual(context.renderFrames, sourceFrames, "engine frame count must match source");
  assert(Math.abs(context.renderBeats - sourceFrames / sampleRate * 174 / 60) < 1e-9, "placement length in beats");
  for (const channel of buffers.xpre_render) {
    assert(channel.every(Number.isFinite), "all samples must be finite");
    const peak = channel.reduce((value, sample) => Math.max(value, Math.abs(sample)), 0);
    assert(peak <= 0.951, "safety ceiling");
    assert(Math.abs(channel[0]) < 1e-9, "silent leading edge");
    assert(Math.abs(channel[channel.length - 1]) < 1e-9, "silent trailing edge");
  }

  // Double reversal must preserve the source direction and pitch. Reverb may
  // add a precursor, but the original waveform remains strongly recognizable.
  const rendered = buffers.xpre_render[0];
  const source = buffers.xpre_source[0];
  const from = Math.floor(rendered.length * 0.05);
  const to = Math.floor(rendered.length * 0.95);
  let dot = 0;
  let renderedPower = 0;
  let sourcePower = 0;
  let differencePower = 0;
  for (let i = from; i < to; i += 1) {
    dot += rendered[i] * source[i];
    renderedPower += rendered[i] * rendered[i];
    sourcePower += source[i] * source[i];
    differencePower += Math.pow(rendered[i] - source[i], 2);
  }
  const correlation = Math.abs(dot / Math.sqrt(renderedPower * sourcePower));
  if (mixValue === 0) {
    assert(correlation > 0.999, `zero-reverb source correlation too low: ${correlation}`);
  } else if (mixValue === 50) {
    assert(correlation > 0.7, `normal reverb should retain the source: ${correlation}`);
  }
  const differenceRms = Math.sqrt(differencePower / (to - from));
  if (mixValue > 0) {
    assert(differenceRms > 0.07, `reverb must be clearly audible at ${mixValue}% mix: ${differenceRms}`);
  }
}

context.mix(65);
context.reverb(20);
context.generate();
const shortRoom = buffers.xpre_render[0].slice();
context.reverb(90);
context.generate();
const longRoom = buffers.xpre_render[0];
let roomDifference = 0;
for (let i = 0; i < sourceFrames; i += 1) {
  roomDifference += Math.pow(shortRoom[i] - longRoom[i], 2);
}
assert(Math.sqrt(roomDifference / sourceFrames) > 0.03, "REVERB must materially change room size and decay");

console.log("XPre pre-reverb invariants passed at 0%, 50%, and 100% mix");
