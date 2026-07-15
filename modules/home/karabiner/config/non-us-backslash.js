const gen = new (require("./generator.js"))();

module.exports = gen.build({
  description: "non-us-backslash remapping",
  enabled: true,
  binds: [
    {
      from: { code: "non_us_backslash", oMods: ["any"] },
      to: [gen.key({ code: "grave_accent_and_tilde" })],
    },
    {
      from: { code: "grave_accent_and_tilde", oMods: ["any"] },
      to: [gen.key({ code: "left_shift" })],
    },
  ],
});
