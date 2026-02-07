gen: let
  pathTemplate = "~/Pictures/Screenshots/$(date +\"%Y-%m-%d_%H-%M-%S\").png";
in {
  description = "Screenshot keymaps";
  manipulators = gen.makeBindings {
    prefixes = [
      {
        code = "left_command-right_command-s";
        actions = [ (gen.runSh "~/.config/scripts/screenshot") ];
        onExit = [ (gen.runSh "pkill screenshot") ];
      }
    ];

    binds = [
      {
        prefixes = [ "left_command-right_command-s" ];
        from = { code = "a"; };
        to = [
          (gen.runSh "pkill screenshot")
          (gen.runSh "screencapture -ics")
        ];
      }

      {
        prefixes = [ "left_command-right_command-s" ];
        from = { code = "o"; };
        to = [
          (gen.runSh "pkill screenshot")
          (gen.runSh "screencapture -c")
        ];
      }

      {
        prefixes = [ "left_command-right_command-s" ];
        from = { code = "w"; };
        to = [
          (gen.runSh "pkill screenshot")
          (gen.runSh "screencapture -icw")
        ];
      }

      {
        prefixes = [ "left_command-right_command-s" ];
        from = { code = "a"; mMods = ["shift"]; };
        to = [
          (gen.runSh "pkill screenshot")
          (gen.runSh "screencapture -is ${pathTemplate}")
        ];
      }

      {
        prefixes = [ "left_command-right_command-s" ];
        from = { code = "o"; mMods = ["shift"]; };
        to = [
          (gen.runSh "pkill screenshot")
          (gen.runSh "screencapture ${pathTemplate}")
        ];
      }

      {
        prefixes = [ "left_command-right_command-s" ];
        from = { code = "2"; mMods = ["shift"]; };
        to = [
          (gen.runSh "pkill screenshot")
          (gen.runSh "screencapture -iw ${pathTemplate}")
        ];
      }

      {
        prefixes = [ "left_command-right_command-s" ];
        from = { code = "c"; };
        to = [
          (gen.runSh "pkill screenshot")
          (gen.runSh "open -a Screenshot")
        ];
      }
    ];
  };
}
