{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };

    settings = {
      close_on_focus_loss =  false;
      encrypt_sensitive_data = true;
      keybinding = "emacs";
      search_files_in_root = false;
      font = {
        rendering = "native";
        normal = {
          family = "Hack Nerd Font";
          size = 16;
        };
      };

      theme.dark.name = "gruvbox-dark";
      telemetry.system_info = false;

      launcher_window = {
        client_side_decorations.enabled = true;
      };

      providers = {
        browser-extension.enabled = false;
        clipboard = {
          preferences = {
            eraseOnStartup = true;
            ignorePasswords = true;
            monitoring = true;
          };
        };
        core.enabled = false;
        developer.enabled = false;
        power = {
          entrypoints = {
            hibernate.enabled = false;
            soft-reboot.enabled = false;
            suspend.enabled = false;
          };
        };
        raycast-compat.enabled = false;
        scripts.enabled = false;
        snippets.enabled = false;
        system.enabled = false;
        theme.enabled = false;
      };
    };
  };
}
