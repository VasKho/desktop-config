{ self, pkgs, ... }: {
  imports = [ ./dconf.nix ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      spawn-at-startup = [
        { sh = "noctalia"; }
      ];

      hotkey-overlay.skip-at-startup = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";
      animations.slowdown = 0.8;

      input = {
        keyboard = {
          numlock = true;
          xkb.layout = "us,ru";
          xkb.options = "grp:caps_toggle";
        };
      };

      cursor = {
        theme = "volantes_light_cursors";
        size = 24;
      };

      layout = {
        gaps = 3;
        background-color = "transparent";
        focus-ring.enable = false;
        border.enable = false;
        shadow = {
          enable = true;
          softness = 5;
          spread = 3;
          offset = { x = 0; y = 5; };
          color = "#0007";
        };
      };

      layer-rules = [
        {
          matches = [ { namespace = "^noctalia-wallpaper"; } ];
          place-within-backdrop = true;
        }
      ];

      window-rules = [
        {
          matches = [ { app-id = "mpv"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "firefox$"; title = "^Picture-in-Picture$"; } ];
          open-floating = true;
        }
        {
          matches = [ { app-id = "dev.noctalia.Noctalia"; } ];
          open-floating = true;
          default-column-width.fixed = 1080;
          default-window-height.fixed = 920;
        }
        {
          matches = [ { app-id = "nm-connection-editor"; } ];
          open-floating = true;
        }
      ];

      binds = {
        "Mod+Shift+Slash".action.show-hotkey-overlay = [];

        "Super+Shift+L".action.spawn = [ "noctalia" "msg" "session" "lock" ];

        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "volume-up" ];
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "volume-down" ];
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "volume-mute" ];
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "mic-mute" ];
        };

        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "brightness-up" ];
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "brightness-down" ];
        };

        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "media" "toggle" ];
        };
        "XF86AudioStop" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "media" "stop" ];
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "media" "previous" ];
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action.spawn = [ "noctalia" "msg" "media" "next" ];
        };

        "f3" = { repeat = false; action.toggle-overview = []; };

        "Mod+Shift+Q" = { repeat = false; action.close-window = []; };

        "Mod+Left".action.focus-column-left = [];
        "Mod+Right".action.focus-column-right = [];

        "Mod+Ctrl+Left".action.move-column-left = [];
        "Mod+Ctrl+Down".action.move-window-down = [];
        "Mod+Ctrl+Up".action.move-window-up = [];
        "Mod+Ctrl+Right".action.move-column-right = [];

        "Mod+Home".action.focus-column-first = [];
        "Mod+End".action.focus-column-last = [];
        "Mod+Ctrl+Home".action.move-column-to-first = [];
        "Mod+Ctrl+End".action.move-column-to-last = [];

        "Mod+Shift+Left".action.focus-monitor-left = [];
        "Mod+Shift+Down".action.focus-monitor-down = [];
        "Mod+Shift+Up".action.focus-monitor-up = [];
        "Mod+Shift+Right".action.focus-monitor-right = [];

        "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
        "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
        "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
        "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];

        "Mod+Page_Down".action.focus-workspace-down = [];
        "Mod+Page_Up".action.focus-workspace-up = [];
        "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [];
        "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [];

        "Mod+Shift+Page_Down".action.move-workspace-down = [];
        "Mod+Shift+Page_Up".action.move-workspace-up = [];


        "Mod+WheelScrollDown" = { cooldown-ms = 150; action.focus-workspace-down = []; };
        "Mod+WheelScrollUp" = { cooldown-ms = 150; action.focus-workspace-up = []; };
        "Mod+Ctrl+WheelScrollDown" = { cooldown-ms = 150; action.move-column-to-workspace-down = []; };
        "Mod+Ctrl+WheelScrollUp" = { cooldown-ms = 150; action.move-column-to-workspace-up = []; };

        "Mod+WheelScrollRight".action.focus-column-right = [];
        "Mod+WheelScrollLeft".action.focus-column-left = [];
        "Mod+Ctrl+WheelScrollRight".action.move-column-right = [];
        "Mod+Ctrl+WheelScrollLeft".action.move-column-left = [];

        "Mod+Shift+WheelScrollDown".action.focus-column-right = [];
        "Mod+Shift+WheelScrollUp".action.focus-column-left = [];
        "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = [];
        "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = [];

        "Mod+Up".action.maximize-column = [];
        "Mod+M".action.maximize-window-to-edges = [];

        "Mod+V".action.toggle-window-floating = [];
        "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];
        "Mod+W".action.toggle-column-tabbed-display = [];

        "Print".action.screenshot = [];
        "Ctrl+Print".action.screenshot-screen = [];
        "Alt+Print".action.screenshot-window = [];

        "Ctrl+Alt+Delete".action.quit = [];
      };
    };
  };

  home.packages = with pkgs; [
    xwayland-satellite
  ];

  xdg.dataFile."wallpapers" = {
    source = "${self}/wallpapers";
    recursive = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.niri = {
      default = [ "gnome" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };
}
