{ config, pkgs, ... }:
{
  fonts.packages = [ pkgs.nerd-fonts.hack ];
  time.timeZone = "Europe/Minsk";

  imports = [
    ./apps.nix
    ./services.nix
    ./settings.nix
    ./autostart.nix
  ];
}
