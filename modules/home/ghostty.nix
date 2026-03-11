{ config, lib, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;
    enableFishIntegration = true;
    package = pkgs.ghostty-bin;

    themes = {
      pink-rose = {
        background = "#282828";
        foreground = "#cfc9c2";
        cursor-color = "#cfc9c2";
        palette = [
          "0=#403E41"
          "1=#FF6188"
          "2=#A9DC76"
          "3=#FFD866"
          "4=#FC9867"
          "5=#AB9DF2"
          "6=#78DCE8"
          "7=#FCFCFA"
          "8=#727072"
          "9=#FF6188"
          "10=#A9DC76"
          "11=#FFD866"
          "12=#FC9867"
          "13=#AB9DF2"
          "14=#78DCE8"
          "15=#FCFCFA"
        ];
      };
    };

    settings = {
      theme = "pink-rose";
      cursor-style = "block";
      cursor-style-blink = false;
      selection-invert-fg-bg = true;
      cursor-invert-fg-bg = true;
      background-opacity = 0.7;
      background-blur = 7;
      font-size = 18;

      desktop-notifications = false;
      clipboard-read = "allow";
      clipboard-write = "allow";
      shell-integration-features = "no-cursor,ssh-terminfo,ssh-env";
      macos-auto-secure-input = true;
      macos-secure-input-indication = true;

      keybind = [
        "ctrl+x>ctrl+c=quit"
      ];
    };
  };
}
