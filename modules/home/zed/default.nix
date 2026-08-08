{
  xdg.configFile = {
    "zed/settings.json".source = ./settings.json;
    "zed/keymap.json".source = ./keymap.json;
    "zed/themes" = {
      source = ./themes;
      recursive = true;
    };
  };
}
