const gen = new (require("./generator.js"))();

module.exports = gen.build({
  description: "System-wide shortcut actions",
  binds: [
    {
      from: { code: "s", mMods: ["left_command", "right_command"] },
      to: [gen.runSh("open -a Screenshot")],
    },
    {
      from: { code: "return_or_enter", mMods: ["command"] },
      to: [gen.runSh("open -na Ghostty")],
    },
    {
      from: { code: "m", mMods: ["command"] },
      to: [gen.runSh("~/.config/scripts/messenger")],
    },
  ],
});
