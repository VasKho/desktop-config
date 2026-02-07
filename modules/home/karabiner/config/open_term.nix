gen: {
  description = "Open terminal";
  manipulators = gen.makeBindings {
    binds = [
      {
        from = { code = "return_or_enter"; mMods = ["command"]; };
        to = [ (gen.runSh "open -na Ghostty") ];
      }
    ];
  };
}
