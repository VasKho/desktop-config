{ host, inputs, pkgs, lib, ... }:
{
  home.stateVersion = "25.11";
  home.homeDirectory = lib.mkForce (host.homeDirectory);

  imports = [
    inputs.zen-browser.homeModules.beta
    ./programs.nix
    ./fish/default.nix
    ./ghostty.nix
    ./zen-browser.nix
    ./emacs.nix
    ./karabiner/default.nix
  ];
}
