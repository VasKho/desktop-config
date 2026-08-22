{ self, config, ... }: {
  programs.noctalia = {
    enable = true;

    settings = {
      bar.default = {
        position = "top";
        shadow = false;
        margin_ends = 0;
        radius = 0;
        radius_top_left = 5;
        radius_top_right = 5;
        scale = 1.3;
        widget_spacing = 12;
        border = "on_surface_variant";
        border_width = 20.0;
        color = "on_primary";
        font_family = "Hack Nerd Font";
        hover_highlight = false;
        start = [ "session" "workspaces" ];
        center = [ "audio_visualizer" ];
        end = [ "tray" "privacy" "keyboard_layout" "notifications" "control-center" "clock" ];
      };

      control_center = {
        hidden_tabs = [ "media" "power" "network" "weather" "calendar" ];
        sidebar_section = "none";
        calendar.show_events_card = false;
        shortcuts = [ "bluetooth" "notification" "mic_mute" ];
      };

      dock = {
        enabled = true;
        auto_hide = true;
        background_opacity = 0.7;
        concave_edge_corners = false;
        cross_axis_padding = 0;
        icon_size = 50;
        item_spacing = 0;
        magnification_scale = 1.25;
        main_axis_padding = 0;
        reserve_space = false;
        shadow = false;
        show_dots = true;
        show_instance_count = false;
        launcher_position = "end";
        pinned = [ "librewolf" "nemo" "writer" "org.inkscape.Inkscape" ];
      };

      osd = {
        position = "bottom_center";
        kinds = {
          bluetooth = false;
          caffeine = false;
          keyboard_backlight = false;
          keyboard_layout = false;
          lock_keys = false;
          media = false;
          nightlight = false;
          power_profile = false;
          wifi = false;
        };
      };

      shell = {
        clipboard_enabled = false;
        clipboard_keep_from_closed_apps = false;
        font_family = "Hack Nerd Font";
        lang = "en";
        polkit_agent = true;

        panel = {
          control_center_placement = "floating";
          open_near_click_control_center = true;
          open_near_click_session = true;
          open_near_click_wallpaper = true;
          session_placement = "floating";
          wallpaper_placement = "floating";
        };

        screen_corners = {
          enabled = true;
          size = 20;
        };

        session = {
          grid = true;
          grid_columns = 1;
        };
      };

      theme = {
        mode = "light";
        source = "wallpaper";
        wallpaper_scheme = "m3-rainbow";

        templates = {
          builtin_ids = [ "btop" "gtk3" "gtk4" ];
          community_ids = [ "fastfetch" ];
        };
      };

      wallpaper = {
        fill_mode = "stretch";
        default = "${config.xdg.dataHome}/wallpapers/tree_landscape.jpg";
      };

      weather.enabled = false;

      widget = {
        clock.format = "{:%a %d %b %H:%M}";
        control-center.glyph = "adjustments-horizontal";
        notifications.hide_when_no_unread = true;
        tray.scale = 1.2;

        audio_visualizer = {
          width = 128;
          bands = 48;
          centered = false;
          color_1 = "on_primary";
          color_2 = "tertiary";
          scale = 1.2;
          actions.left = "panel-toggle control-center media";
        };

        keyboard_layout = {
          hide_when_single_layout = true;
          show_glyph = false;
        };

        privacy = {
          hide_inactive = true;
          icon_spacing = 6;
          type = "privacy";
        };

        session = {
          custom_image = "${config.xdg.dataHome}/extra-icons/nix-flake.svg";
          custom_image_colorize = true;
          glyph = "";
          scale = 1.2;
        };

        workspaces = {
          active_pill_size = 2.0;
          change_color_on_hover = false;
          focused_color = "on_primary";
          hide_when_empty = true;
          pill_scale = 0.65;
          show_labels = false;
        };
      };
    };
  };

  xdg.dataFile."extra-icons" = {
    source = "${self}/icons";
    recursive = true;
  };
}
