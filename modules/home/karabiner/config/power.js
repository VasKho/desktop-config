const gen = new (require("./generator.js"))();

module.exports = gen.build({
  description: "Power management commands",
  prefixes: [{ code: "shift-option-e" }],
  binds: [
    {
      prefixes: ["shift-option-e"],
      from: { code: "l" },
      to: [gen.runSh("open -g raycast://extensions/raycast/system/lock-screen")],
    },
    {
      prefixes: ["shift-option-e"],
      from: { code: "s" },
      to: [gen.runSh("open -g raycast://extensions/raycast/system/shut-down")],
    },
    {
      prefixes: ["shift-option-e"],
      from: { code: "r" },
      to: [gen.runSh("open -g raycast://extensions/raycast/system/restart")],
    },
  ],
});
