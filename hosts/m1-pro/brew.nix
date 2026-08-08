{
  homebrew = {
    enable = true;
    enableFishIntegration = true;

    taps = [
     {
       name = "jurplel/tap";
       trusted = true;
     }
    ];

    casks = [
      "telegram"
      "karabiner-elements"
      "zed"
      "folx"
      "instant-space-switcher"
    ];
  };
}
