gen: let
  ifRuLayout = gen.ifLayouts [ "^ru$" ];
in {
  description = "Russian layout mappings";
  manipulators = gen.makeBindings {
    binds = [
      {
        conditions = [ ifRuLayout ];
        from = {
          code = "grave_accent_and_tilde";
          oMods = [ "any" ];
        };
        to = [ (gen.keyCode { code = "backslash"; }) ];
      }

      {
        conditions = [ ifRuLayout ];
        from = { code = "slash"; };
        to = [ (gen.keyCode { mods = ["shift"]; code = "7"; }) ];
      }

      {
        conditions = [ ifRuLayout ];
        from = { mMods = ["shift"]; code = "slash"; };
        to = [ (gen.keyCode { mods = ["shift"]; code = "6"; }) ];
      }

      {
        conditions = [ ifRuLayout ];
        from = { mMods = ["shift"]; code = "7"; };
        to = [ (gen.keyCode { mods = ["shift"]; code = "slash"; }) ];
      }

      {
        conditions = [ ifRuLayout ];
        from = { code = "backslash"; };
        to = [ (gen.keyCode { code = "slash"; }) ];
      }
    ];
  };
}
