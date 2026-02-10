gen: let
  excludeApps = ["Emacs" "com.mitchellh.ghostty"];
in {
  description = "Emacs-style navigation";
  manipulators = gen.makeBindings {
    prefixes = [
      {
        conditions = [ (gen.unlessApps excludeApps) ];
        code = "control-x";
        actions = [ (gen.runSh "~/.config/scripts/key_overlay C-x") ];
        onExit = [ (gen.runSh "pkill key_overlay") ];
      }
      {
        conditions = [ (gen.unlessApps excludeApps) ];
        code = "control-spacebar";
        actions = [ (gen.runSh "~/.config/scripts/key_overlay C-SPC") ];
        onExit = [ (gen.runSh "pkill key_overlay") ];
      }
    ];

    binds = [
      {
        from = { code = "a"; mMods = ["control"]; };
        to = [ (gen.key { code = "control-a"; }) ];
        conditions = [
          (gen.unlessVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "a"; mMods = ["control"]; };
        to = [ (gen.key { code = "control-shift-a"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "e"; mMods = ["control"]; };
        to = [ (gen.key { code = "control-e"; }) ];
        conditions = [
          (gen.unlessVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "e"; mMods = ["control"]; };
        to = [ (gen.key { code = "control-shift-e"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "b"; mMods = ["control"]; };
        to = [ (gen.key { code = "left_arrow"; }) ];
        conditions = [
          (gen.unlessVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "b"; mMods = ["control"]; };
        to = [ (gen.key { code = "shift-left_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "f"; mMods = ["control"]; };
        to = [ (gen.key { code = "right_arrow"; }) ];
        conditions = [
          (gen.unlessVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "f"; mMods = ["control"]; };
        to = [ (gen.key { code = "shift-right_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }

      {
        from = { code = "n"; mMods = ["control"]; };
        to = [ (gen.key { code = "down_arrow"; }) ];
        conditions = [
          (gen.unlessVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "n"; mMods = ["control"]; };
        to = [ (gen.key { code = "shift-down_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "p"; mMods = ["control"]; };
        to = [ (gen.key { code = "up_arrow"; }) ];
        conditions = [
          (gen.unlessVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "p"; mMods = ["control"]; };
        to = [ (gen.key { code = "shift-up_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }

      {
        from = { code = "d"; mMods = ["control"]; };
        to = [
          (gen.key { code = "delete_forward"; })
          (gen.clearVar "control-spacebar")
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }

      {
        from = { code = "s"; mMods = ["control"]; };
        to = [ (gen.key { code = "command-f"; }) ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }

      {
        from = { code = "w"; mMods = ["control"]; };
        to = [
          (gen.key { code = "command-x"; })
          (gen.clearVar "control-spacebar")
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        from = { code = "y"; mMods = ["control"]; };
        to = [
          (gen.key { code = "command-v"; })
          (gen.clearVar "control-spacebar")
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }

      {
        from = {
          code = "slash";
          mMods = ["control"];
          oMods = ["shift"];
        };
        to = [ (gen.key { code = "command-z"; }) ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }

      # control-x binds
      {
        prefixes = ["control-x"];
        from = { code = "c"; mMods = ["control"]; };
        to = [
          (gen.key { code = "command-q"; })
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        prefixes = ["control-x"];
        from = { code = "h"; };
        to = [
          (gen.key { code = "command-a"; })
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        prefixes = ["control-x"];
        from = { code = "k"; };
        to = [
          (gen.key { code = "command-w"; })
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        prefixes = ["control-x"];
        from = { code = "s"; mMods = ["control"]; };
        to = [
          (gen.key { code = "command-s"; })
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }

      {
        from = { code = "d"; mMods = ["option"]; };
        to = [
          (gen.key { code = "fn-option-delete_or_backspace"; })
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        from = { code = "b"; mMods = ["option"]; };
        to = [
          (gen.key { code = "option-left_arrow"; })
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        from = { code = "f"; mMods = ["option"]; };
        to = [
          (gen.key { code = "option-right_arrow"; })
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        from = { code = "w"; mMods = ["option"]; };
        to = [
          (gen.key { code = "command-c"; })
          (gen.clearVar "control-spacebar")
          (gen.runSh "pkill key_overlay")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        from = { code = "comma"; mMods = ["option" "shift"]; };
        to = [ (gen.key { code = "home"; }) ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        from = { code = "period"; mMods = ["option" "shift"]; };
        to = [ (gen.key { code = "end"; }) ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
    ];
  };
}
