gen: {
  description = "Toggle Telegram";
  manipulators = gen.makeBindings {
    binds = [
      {
        from = { code = "m"; mMods = ["command"]; };
        to = [ (gen.runSh "~/.config/scripts/messenger") ];
      }
    ];
  };
}
