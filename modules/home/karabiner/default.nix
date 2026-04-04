{ config, lib, pkgs, ... }@rest:
{
  home.packages = with pkgs; [ nodejs ];

  xdg.configFile."karabiner.json" = {
    enable = true;
    target = "karabiner/karabiner.json";
    text = import ./config/default.nix rest;
  };
}
