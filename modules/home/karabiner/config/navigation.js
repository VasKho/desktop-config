const gen = new (require("./generator.js"))();

module.exports = gen.build({
  description: "Emacs-style navigation",
  binds: [
    {
      from: { code: "a", mMods: ["control"] },
      to: [gen.key({ code: "control-a" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "a", mMods: ["control"] },
      to: [gen.key({ code: "control-shift-a" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "e", mMods: ["control"] },
      to: [gen.key({ code: "control-e" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "e", mMods: ["control"] },
      to: [gen.key({ code: "control-shift-e" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },

    {
      from: { code: "b", mMods: ["control"] },
      to: [gen.key({ code: "left_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "b", mMods: ["control", "command"] },
      to: [gen.key({ code: "option-left_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "b", mMods: ["control"] },
      to: [gen.key({ code: "shift-left_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "b", mMods: ["control", "command"] },
      to: [gen.key({ code: "option-shift-left_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "f", mMods: ["control"] },
      to: [gen.key({ code: "right_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "f", mMods: ["control", "command"] },
      to: [gen.key({ code: "option-right_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "f", mMods: ["control"] },
      to: [gen.key({ code: "shift-right_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "f", mMods: ["control", "command"] },
      to: [gen.key({ code: "option-shift-left_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },

    {
      from: { code: "left_arrow" },
      to: [gen.key({ code: "shift-left_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "left_arrow", mMods: ["command"] },
      to: [gen.key({ code: "shift-option-left_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "right_arrow", oMods: ["command"] },
      to: [gen.key({ code: "shift-right_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "right_arrow", mMods: ["command"] },
      to: [gen.key({ code: "shift-option-right_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },

    {
      from: { code: "n", mMods: ["control"] },
      to: [gen.key({ code: "down_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "n", mMods: ["control", "command"] },
      to: [gen.key({ code: "option-down_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "n", mMods: ["control"] },
      to: [gen.key({ code: "shift-down_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "n", mMods: ["control", "command"] },
      to: [gen.key({ code: "shift-option-down_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "p", mMods: ["control"] },
      to: [gen.key({ code: "up_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "p", mMods: ["control", "command"] },
      to: [gen.key({ code: "option-up_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "p", mMods: ["control"] },
      to: [gen.key({ code: "shift-up_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "p", mMods: ["control", "command"] },
      to: [gen.key({ code: "shift-option-up_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "down_arrow" },
      to: [gen.key({ code: "shift-down_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "down_arrow", mMods: ["command"] },
      to: [gen.key({ code: "shift-option-down_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "up_arrow" },
      to: [gen.key({ code: "shift-up_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "up_arrow", mMods: ["command"] },
      to: [gen.key({ code: "shift-option-up_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },

    {
      from: { code: "comma", mMods: ["command", "shift"] },
      to: [gen.key({ code: "command-up_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "comma", mMods: ["command", "shift"] },
      to: [gen.key({ code: "command-shift-up_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "period", mMods: ["command", "shift"] },
      to: [gen.key({ code: "command-down_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "period", mMods: ["command", "shift"] },
      to: [gen.key({ code: "command-shift-down_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },

    {
      from: { code: "spacebar", mMods: ["control"] },
      to: [gen.setVar("control-spacebar")],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "spacebar", mMods: ["control"] },
      to: [gen.clearVar("control-spacebar")],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { any: "key_code" },
      to: [gen.clearVar("control-spacebar"), { from_event: true }],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
  ],
});
