lib: let
  ifVarSet = varName: {
    name = varName;
    type = "variable_if";
    value = 1;
  };

  unlessVarSet = varName: {
    name = varName;
    type = "variable_unless";
    value = 1;
  };

  setVar = varName: {
    set_variable = {
      name = varName;
      value = 1;
    };
  };

  clearVar = varName: {
    set_variable = {
      name = varName;
      value = 0;
    };
  };

  fromParser = { code, mMods ? null, oMods ? null }: {
    key_code = code;
  }
  // (if mMods != null || oMods != null then {
    modifiers = {
    }
    // (if mMods != null then { mandatory = mMods; } else {})
    // (if oMods != null then { optional = oMods; } else {});
  } else {});

  makePrefixConds = prefixes: map (e: ifVarSet e) prefixes;

  clearPrefixVars = prefixes: map (e: clearVar e) prefixes;

  breakPrefix = { code, prefixes ? [], onExit ? [] }: {
    type = "basic";
    from = {
      any = "key_code";
      modifiers = { optional = ["any"]; };
    };
    to = (clearPrefixVars (prefixes ++ [code])) ++ onExit;
    conditions = makePrefixConds (prefixes ++ [code]);
  };

  addBind = { from, to, prefixes ? [], conditions ? [], ... }@rest:
    (lib.removeAttrs rest ["from" "to" "prefixes" "conditions"]) //
    {
      from = fromParser from;
      to = to ++ (clearPrefixVars prefixes);
      type = "basic";
    } // (if prefixes != [] || conditions != [] then {
      conditions = (makePrefixConds prefixes) ++ conditions;
    } else {});

  registerPrefix = { code, actions ? [], prefixes ? [], conditions ? [], onExit ? [] }:
    let split = lib.splitString "-" code;
    in [
      (breakPrefix {
        inherit code;
        inherit onExit;
        inherit prefixes;
      })

      (addBind {
        from = { code = lib.last split; mMods = lib.init split; };
        to = [ (setVar code) ] ++ actions;
        inherit prefixes;
        inherit conditions;
      })
    ];

in
rec {
  inherit ifVarSet;
  inherit unlessVarSet;
  inherit setVar;
  inherit clearVar;

  ifApps = bundles: {
    bundle_identifiers = bundles;
    type = "frontmost_application_if";
  };

  unlessApps = bundles: {
    bundle_identifiers = bundles;
    type = "frontmost_application_unless";
  };

  ifLayouts = langs: {
    input_sources = (map (e: { language = e; }) langs);
    type = "input_source_if";
  };

  runSh = cmd: { shell_command = cmd; };

  keyCode = { code, mods ? null, ... }@rest:
    (lib.removeAttrs rest [ "code" "mods" ]) // {
      key_code = code;
    }
    // (if mods != null then { modifiers = mods; } else {});

  key = { code, ... }@rest: let
    split = lib.splitString "-" code;
  in
    (lib.removeAttrs rest [ "code" "mods" ]) // {
      key_code = lib.last split;
    } // (if lib.length split != 1 then {
      modifiers = lib.init split;
    } else {});

  makeBindings = bindDefs:
    (map (def: addBind def) bindDefs.binds) ++
    (lib.flatten (map (def: registerPrefix def)
      (lib.reverseList bindDefs.prefixes or [])));
}
