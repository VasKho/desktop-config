gen: let
  excludeApps = ["Emacs" "com.mitchellh.ghostty" "dev.zed.Zed"];
in {
  description = "Emacs-style navigation";
  manipulators = gen.makeBindings {
    prefixes = [
      {
        conditions = [ (gen.unlessApps excludeApps) ];
        code = "control-x";
     }
    ];

    binds = [
      {
        from = { code = "spacebar"; mMods = ["control"]; };
        to = [ (gen.setVar "control-spacebar") ];
        conditions = [
          (gen.unlessVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "spacebar"; mMods = ["control"]; };
        to = [
          (gen.clearVar "control-spacebar")
          (gen.key { code = "left_arrow"; })
        ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "g"; mMods = ["control"]; };
        to = [
          (gen.clearVar "control-spacebar")
          (gen.key { code = "left_arrow"; })
        ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "escape"; };
        to = [
          (gen.clearVar "control-spacebar")
          (gen.key { code = "left_arrow"; })
        ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
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
        to = [ (gen.key { code = "control-shift-e"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "b"; mMods = ["control"]; oMods = ["option"]; };
        to = [ (gen.key { code = "shift-left_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "f"; mMods = ["control"]; oMods = ["option"]; };
        to = [ (gen.key { code = "shift-right_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "left_arrow"; oMods = ["option"]; };
        to = [ (gen.key { code = "shift-left_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "right_arrow"; oMods = ["option"]; };
        to = [ (gen.key { code = "shift-right_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
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
        to = [ (gen.key { code = "shift-up_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "down_arrow"; };
        to = [ (gen.key { code = "shift-down_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }
      {
        from = { code = "up_arrow"; };
        to = [ (gen.key { code = "shift-up_arrow"; }) ];
        conditions = [
          (gen.ifVarSet "control-spacebar")
          (gen.unlessApps excludeApps)
        ];
      }

      {
        from = { code = "d"; mMods = ["control"]; oMods = ["option"]; };
        to = [
          (gen.key { code = "delete_forward"; })
          (gen.clearVar "control-spacebar")
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
          (gen.key { code = "command-c"; })
          (gen.key { code = "delete_or_backspace"; })
          (gen.clearVar "control-spacebar")
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        from = { code = "y"; mMods = ["control"]; };
        to = [
          (gen.key { code = "command-v"; })
          (gen.clearVar "control-spacebar")
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
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        prefixes = ["control-x"];
        from = { code = "h"; };
        to = [
          (gen.key { code = "command-a"; })
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        prefixes = ["control-x"];
        from = { code = "k"; };
        to = [
          (gen.key { code = "command-w"; })
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }
      {
        prefixes = ["control-x"];
        from = { code = "s"; mMods = ["control"]; };
        to = [
          (gen.key { code = "command-s"; })
        ];
        conditions = [ (gen.unlessApps excludeApps) ];
      }

      # Option binds
      {
        from = { code = "w"; mMods = ["option"]; };
        to = [
          (gen.key { code = "command-c"; })
          (gen.clearVar "control-spacebar")
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
