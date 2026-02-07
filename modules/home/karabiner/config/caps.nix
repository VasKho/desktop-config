gen: {
  description = "Capslock rules";
  manipulators = gen.makeBindings {
    binds = [
      {
        from = { code = "caps_lock"; };
        to = [ (gen.keyCode { code = "left_control"; lazy = true; }) ];
        to_if_alone = [ (gen.keyCode { code = "fn"; }) ];
        to_if_held_down = [ (gen.keyCode { code = "left_control"; }) ];
      }
    ];
  };
}
