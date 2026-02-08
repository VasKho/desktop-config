gen: {
  description = "Capslock rules";
  manipulators = gen.makeBindings {
    binds = [
      {
        from = { code = "caps_lock"; oMods = ["any"]; };
        to = [ (gen.key { code = "left_control"; lazy = true; }) ];
        to_if_alone = [ (gen.key { code = "fn"; }) ];
        to_if_held_down = [ (gen.key { code = "left_control"; }) ];
      }

      {
        conditions = [ (gen.ifVarSet "rshift pressed") ];
        from = { code = "right_shift"; oMods = ["any"]; };
        to = [ (gen.key { code = "caps_lock"; }) ];
      }
      {
        from = { code = "right_shift"; oMods = ["any"]; };
        to = [
          (gen.setVar "rshift pressed")
          (gen.key { code = "right_shift"; })
        ];
        to_delayed_action = {
          to_if_canceled = [ (gen.clearVar "rshift pressed") ];
          to_if_invoked = [ (gen.clearVar "rshift pressed") ];
        };
      }
    ];
  };
}
