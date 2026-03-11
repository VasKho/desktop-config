gen: {
  description = "Screenshot keymaps";
  manipulators = gen.makeBindings {
    binds = [
      {
        from = { code = "s"; mMods = ["left_command" "right_command"]; };
        to = [ (gen.runSh "open -a Screenshot") ];
      }
    ];
  };
}
