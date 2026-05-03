const gen = new (require("./generator.js"))();

module.exports = gen.build({
  description: "Windows management commands",
  prefixes: [{ code: "command-w" }],
  binds: [
    {
      prefixes: ["command-w"],
      from: { code: "f" },
      to: [gen.runSh("open -g raycast://extensions/raycast/window-management/maximize")],
    },
    {
      prefixes: ["command-w"],
      from: { code: "r" },
      to: [gen.runSh("open -g raycast://extensions/raycast/window-management/restore")],
    },
    {
      prefixes: ["command-w"],
      from: { code: "n" },
      to: [gen.runSh("open -g raycast://extensions/raycast/window-management/next-desktop")],
    },
    {
      prefixes: ["command-w"],
      from: { code: "p" },
      to: [gen.runSh("open -g raycast://extensions/raycast/window-management/previous-desktop")],
    },
    {
      prefixes: ["command-w"],
      from: { code: "left_arrow" },
      to: [gen.key({ code: "control-option-command-left_arrow" })],
    },
    {
      prefixes: ["command-w"],
      from: { code: "right_arrow" },
      to: [gen.key({ code: "control-option-command-right_arrow" })],
    },
    {
      prefixes: ["command-w"],
      from: { code: "m" },
      to: [gen.key({ code: "option-command-m" })],
    },
    {
      prefixes: ["command-w"],
      from: { code: "c" },
      to: [gen.key({ code: "command-w" })],
    },
  ],
});
