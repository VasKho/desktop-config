{ config, lib, pkgs, ... }@rest:
{
  xdg.configFile."karabiner.json" = {
    enable = true;
    target = "karabiner/karabiner.json";
    text = import ./config/default.nix rest;
  };
}
