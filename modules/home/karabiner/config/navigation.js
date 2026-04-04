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
      from: { code: "b", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "left_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "b", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "shift-left_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "f", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "right_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "f", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "shift-right_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },

    {
      from: { code: "left_arrow", oMods: ["option"] },
      to: [gen.key({ code: "shift-left_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "right_arrow", oMods: ["option"] },
      to: [gen.key({ code: "shift-right_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },

    {
      from: { code: "n", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "down_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "n", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "shift-down_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "p", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "up_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "p", mMods: ["control"], oMods: ["option"] },
      to: [gen.key({ code: "shift-up_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "down_arrow", oMods: ["option"] },
      to: [gen.key({ code: "shift-down_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "up_arrow", oMods: ["option"] },
      to: [gen.key({ code: "shift-up_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },

    {
      from: { code: "comma", mMods: ["option", "shift"] },
      to: [gen.key({ code: "command-up_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "comma", mMods: ["option", "shift"] },
      to: [gen.key({ code: "command-shift-up_arrow" })],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
    {
      from: { code: "period", mMods: ["option", "shift"] },
      to: [gen.key({ code: "command-down_arrow" })],
      conditions: [gen.unlessVarSet("control-spacebar")],
    },
    {
      from: { code: "period", mMods: ["option", "shift"] },
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
      from: { code: "escape" },
      to: [gen.clearVar("control-spacebar")],
      conditions: [gen.ifVarSet("control-spacebar")],
    },
  ],
});
