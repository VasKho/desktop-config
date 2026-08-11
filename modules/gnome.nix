{ self, config, pkgs, lib, ... }: {
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
    config.gnome = {
      default = [ "gnome" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file://${config.xdg.dataHome}/wallpapers/tree_landscape.jpg";
      picture-uri-dark = "file://${config.xdg.dataHome}/wallpapers/tree_landscape.jpg";
      primary-color = "#000000";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.hm.gvariant.mkTuple [ "xkb" "us" ])
        (lib.hm.gvariant.mkTuple [ "xkb" "by+ru" ])
      ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "grp:caps_toggle" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "24h";
      clock-show-date = true;
      clock-show-seconds = false;
      clock-show-weekday = true;
      color-scheme = "prefer-light";
      cursor-theme = "volantes_light_cursors";
      font-name = "Hack Nerd Font 16";
      monospace-font-name = "Hack Nerd Font 16";
      document-font-name = "Hack Nerd Font 16";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-hinting = "none";
      locate-pointer = false;
      text-scaling-factor = 1.0;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Shift><Super>q"];
      move-to-workspace-left = ["<Shift><Super>Left"];
      move-to-workspace-right = ["<Shift><Super>Right"];
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = true;
      button-layout = "appmenu:minimize,maximize,close";
      focus-mode = "click";
      titlebar-font = "Hack Nerd Font 16";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      next = [ "AudioNext" ];
      play = [ "AudioPlay" ];
      previous = [ "AudioPrev" ];
      volume-down = [ "AudioLowerVolume" ];
      volume-up = [ "AudioRaiseVolume" ];
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        dash-to-dock.extensionUuid
        vicinae.extensionUuid
        xremap.extensionUuid
        user-themes.extensionUuid
        blur-my-shell.extensionUuid
      ];
      favorite-apps = [
        "zen-beta.desktop"
        "nemo.desktop"
        "writer.desktop"
        "org.inkscape.Inkscape.desktop"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      override-background = true;
      static-blur = true;
      style-dash-to-dock = 0;
      unblur-in-overview = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      brightness = 0.6;
      corner-radius = 0;
      force-light-text = false;
      override-background = false;
      unblur-in-overview = false;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "WhiteSur-Light";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = 0.74;
      custom-background-color = false;
      custom-theme-shrink = true;
      dash-max-icon-size = 50;
      disable-overview-on-startup = false;
      dock-fixed = false;
      dock-position = "BOTTOM";
      extend-height = false;
      height-fraction = 0.9;
      hot-keys = false;
      intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
      preferred-monitor = -2;
      preferred-monitor-by-connector = "HDMI-1";
      preview-size-scale = 0.0;
      running-indicator-style = "DOTS";
      show-mounts = false;
      transparency-mode = "DEFAULT";
    };

    "org/gnome/shell/extensions/vicinae" = {
      launcher-auto-close-focus-loss = false;
      show-status-indicator = false;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 249;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = (lib.hm.gvariant.mkTuple [ 103 103 ]);
      window-size = (lib.hm.gvariant.mkTuple [ 1190 660 ]);
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
  };
}
