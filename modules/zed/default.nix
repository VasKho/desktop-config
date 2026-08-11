{
  xdg.configFile = {
    "zed/themes" = {
      source = ./themes;
      recursive = true;
    };
  };

  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];
    mutableUserKeymaps = false;
    mutableUserSettings = false;
    mutableUserTasks = false;
    userSettings = {
      cli_default_open_behavior = "new_window";
      default_open_behavior = "new_window";
      agent = {
        dock = "right";
        favorite_models = [];
        model_parameters = [];
      };
      git_panel = { dock = "left"; };
      outline_panel = { dock = "left"; };
      gutter = {
        line_numbers = true;
        min_line_number_digits = 3;
      };
      show_wrap_guides = false;
      soft_wrap = "editor_width";
      use_system_window_tabs = false;
      tabs = {
        file_icons = true;
        git_status = false;
      };
      tab_bar = { show = false; };
      title_bar = {
        show_branch_status_icon = true;
        show_user_menu = true;
        show_sign_in = false;
        show_onboarding_banner = true;
      };
      status_bar = {
        active_encoding_button = "enabled";
        active_language_button = true;
      };
      preferred_line_length = 120;
      tab_size = 2;
      toolbar = {
        code_actions = true;
        agent_review = false;
        selections_menu = true;
        quick_actions = true;
        breadcrumbs = true;
      };
      minimap = { max_width_columns = 120; };
      project_panel = {
        dock = "left";
        button = true;
        hide_hidden = false;
      };
      hide_mouse = "never";
      cursor_shape = "block";
      agent_ui_font_size = 15.0;
      ui_font_family = "Hack Nerd Font";
      buffer_font_family = "Hack Nerd Font";
      auto_update = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      session = { trust_all_worktrees = true; };
      base_keymap = "VSCode";
      ui_font_size = 17.0;
      buffer_font_size = 17.0;
      theme = {
        mode = "light";
        light = "rose";
        dark = "rose";
      };
      file_scan_exclusions = [".git" "target/"];
      languages = {
        Nix = { language_servers = ["nixd" "!nil"]; };
        Python = {
          language_servers = ["pylsp" "ruff"];
          tab_size = 4;
        };
      };
    };
  };
}
