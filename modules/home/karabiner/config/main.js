let conf = {
  global: {
    ask_for_confirmation_before_quitting: true,
    check_for_updates_on_startup: false,
    show_in_menu_bar: false,
  },

  profiles: [
    {
      name: "Default profile",
      selected: true,
      virtual_hid_keyboard: { keyboard_type_v2: "ansi" },

      complex_modifications: {
        parameters: {
          "basic.simultaneous_threshold_milliseconds": 50,
          "basic.to_delayed_action_delay_milliseconds": 1000,
          "basic.to_if_alone_timeout_milliseconds": 150,
          "basic.to_if_held_down_threshold_milliseconds": 150,
          "mouse_motion_to_scroll.speed": 100,
        },
        rules: [
          require("./non-us-backslash.js"),
          require("./caps.js"),
          require("./navigation.js"),
          require("./emacs.js"),
          require("./window.js"),
          require("./actions.js"),
        ],
      },
    },
  ],
};

console.log(JSON.stringify(conf));
