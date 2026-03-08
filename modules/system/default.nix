{ config, pkgs, ... }:
{
  fonts.packages = [ pkgs.nerd-fonts.hack ];
  time.timeZone = "Europe/Minsk";

  imports = [
    ./apps.nix
    ./settings.nix
    ./autostart.nix
  ];
}
