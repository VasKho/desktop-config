class Generator {
  build = (conf) => {
    let binds = conf.binds.map((def) => this.#addBind(def));
    let prefixes = (conf.prefixes || []).reverse().map((def) => this.#registerPrefix(def));
    delete conf.binds;
    delete conf.prefixes;
    conf.manipulators = binds.concat(prefixes).flat();
    return conf;
  };

  ifVarSet = (varName) => ({
    name: varName,
    type: "variable_if",
    value: 1,
  });

  unlessVarSet = (varName) => ({
    name: varName,
    type: "variable_unless",
    value: 1,
  });

  setVar = (varName) => ({
    set_variable: {
      name: varName,
      value: 1,
    },
  });

  clearVar = (varName) => ({
    set_variable: {
      name: varName,
      value: 0,
    },
  });

  ifApps = (bundles) => ({
    bundle_identifiers: bundles,
    type: "frontmost_application_if",
  });

  unlessApps = (bundles) => ({
    bundle_identifiers: bundles,
    type: "frontmost_application_unless",
  });

  ifLayouts = (langs) => ({
    input_sources: langs.map((x) => {
      language: x;
    }),
    type: "input_source_if",
  });

  runSh = (cmd) => ({ shell_command: cmd });

  key = (params) => {
    let split = params.code.split("-");
    delete params.code;
    delete params.mods;
    params.key_code = split.pop();
    if (split.length != 0) {
      params.modifiers = split;
    }
    return params;
  };

  #fromParser = (rest) => {
    let key_code = { key_code: rest.code };
    let mMods = rest.mMods ? { mandatory: rest.mMods } : {};
    let oMods = rest.oMods ? { optional: rest.oMods } : {};
    let mods = { modifiers: { ...mMods, ...oMods } };
    if (JSON.stringify(mods) == '{"modifiers":{}}') {
      return { ...key_code };
    }
    return { ...key_code, ...mods };
  };

  #makePrefixConds = (prefixes) => {
    return prefixes.map((e) => this.ifVarSet(e));
  };

  #clearPrefixVars = (prefixes) => {
    return prefixes.map((e) => this.clearVar(e));
  };

  #breakPrefix = (params) => {
    let prefixVars = (params.prefixes || []).concat(params.code, params.onExit || []);
    return {
      type: "basic",
      from: { any: "key_code", modifiers: { optional: ["any"] } },
      to: this.#clearPrefixVars(prefixVars),
      conditions: this.#makePrefixConds(prefixVars),
    };
  };

  #addBind = (params) => {
    let prefs = params.prefixes || [];
    delete params.prefixes;
    params.from = this.#fromParser(params.from);
    params.to = params.to.concat(this.#clearPrefixVars(prefs));
    params.type = "basic";
    if (params.conditions) {
      params.conditions = params.conditions.concat(this.#makePrefixConds(prefs));
    } else if (prefs.length != 0) {
      params.conditions = this.#makePrefixConds(prefs);
    }
    return params;
  };

  #registerPrefix = (params) => {
    let split = params.code.split("-");
    let actions = params.actions || [];
    let breakBinds = this.#breakPrefix(params);
    let enterBind = this.#addBind({
      from: { code: split.pop(), mMods: split },
      to: actions.concat(this.setVar(params.code)),
      //   ...params.prefixes,
      conditions: params.conditions,
    });
    return [breakBinds, enterBind];
  };

  // keyCode = { code, mods ? null, ... }@rest:
  //   (lib.removeAttrs rest [ "code" "mods" ]) // {
  //     key_code = code;
  //   }
  //   // (if mods != null then { modifiers = mods; } else {});
}

module.exports = Generator;
