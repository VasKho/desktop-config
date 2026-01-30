{ host, pkgs, lib, ... }:
{
  home.stateVersion = "25.05";
  home.homeDirectory = lib.mkForce (host.homeDirectory);
  home = {
    packages = with pkgs; [
      fzf
    ];
  };

  imports = [
    ./fish/default.nix
  ];
}
