{ lib, ... }: {
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-light";
      cursor-theme = "volantes_light_cursors";
      font-name = "Hack Nerd Font 16";
      monospace-font-name = "Hack Nerd Font 16";
      document-font-name = "Hack Nerd Font 16";
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = true;
      button-layout = "appmenu:maximize,close";
      focus-mode = "click";
      titlebar-font = "Hack Nerd Font 16";
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
  };
}
