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
  ],
});
