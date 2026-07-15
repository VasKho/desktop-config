const gen = new (require("./generator.js"))();
let excludeApps = ["Emacs", "com.mitchellh.ghostty", "dev.zed.Zed", "com.microsoft.rdc.macos"];

module.exports = gen.build({
  description: "Emacs-style actions",
  prefixes: [
    {
      conditions: [gen.unlessApps(excludeApps)],
      code: "control-x",
    },
  ],
  binds: [
    {
      prefixes: ["control-x"],
      from: { code: "c", mMods: ["control"] },
      to: [gen.key({ code: "command-q" })],
    },
    {
      prefixes: ["control-x"],
      from: { code: "h" },
      to: [gen.key({ code: "command-a" })],
    },
    {
      prefixes: ["control-x"],
      from: { code: "k" },
      to: [gen.key({ code: "command-w" })],
    },
    {
      prefixes: ["control-x"],
      from: { code: "s", mMods: ["control"] },
      to: [gen.key({ code: "command-s" })],
    },

    {
      from: { code: "d", mMods: ["control"], oMods: ["command"] },
      to: [gen.key({ code: "delete_forward" })],
      to_after_key_up: [gen.clearVar("control-spacebar")],
    },
    {
      from: { code: "delete_or_backspace", mMods: ["command"] },
      to: [gen.key({ code: "option-delete_or_backspace" })],
      to_after_key_up: [gen.clearVar("control-spacebar")],
    },

    {
      from: { code: "s", mMods: ["control"] },
      to: [gen.key({ code: "command-f" })],
      conditions: [gen.unlessApps(excludeApps)],
    },
    {
      from: { code: "w", mMods: ["control"] },
      to: [gen.key({ code: "command-c" }), gen.key({ code: "delete_or_backspace" }), gen.clearVar("control-spacebar")],
    },
    {
      from: { code: "y", mMods: ["control"] },
      to: [gen.key({ code: "command-v" }), gen.clearVar("control-spacebar")],
    },
    {
      from: { code: "w", mMods: ["command"] },
      to: [gen.key({ code: "command-c" }), gen.clearVar("control-spacebar")],
    },

    {
      from: { code: "slash", mMods: ["control"], oMods: ["shift"] },
      to: [gen.key({ code: "command-z" })],
    },
  ],
});
