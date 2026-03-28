{ lib, ... }: let
  gen = import ./generator.nix lib;
in builtins.toJSON {
  global = {
    ask_for_confirmation_before_quitting = true;
    check_for_updates_on_startup = false;
    show_in_menu_bar = false;
  };

  profiles = [
    {
      name = "Default profile";
      selected = true;
      virtual_hid_keyboard = { keyboard_type_v2 = "ansi"; };

      simple_modifications = gen.makeBindings {
        binds = [
          {
            from = { code = "left_command"; };
            to = [ (gen.key { code = "left_option"; }) ];
          }
          {
            from = { code = "left_option"; };
            to = [ (gen.key { code = "left_command"; }) ];
          }
          {
            from = { code = "right_command"; };
            to = [ (gen.key { code = "right_option"; }) ];
          }
          {
            from = { code = "right_option"; };
            to = [ (gen.key { code = "right_command"; }) ];
          }
        ];
      };

      complex_modifications = {
        parameters = {
          "basic.simultaneous_threshold_milliseconds" = 50;
          "basic.to_delayed_action_delay_milliseconds" = 1000;
          "basic.to_if_alone_timeout_milliseconds" = 150;
          "basic.to_if_held_down_threshold_milliseconds" = 150;
          "mouse_motion_to_scroll.speed" = 100;
        };
        rules = [
          (import ./caps.nix gen)
          (import ./emacs.nix gen)
          (import ./window.nix gen)
          (import ./open_term.nix gen)
          (import ./toggle_messenger.nix gen)
          (import ./screenshot.nix gen)
        ];
      };
    }
  ];
}
