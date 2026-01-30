{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish
    raycast
    mousecape
    neovim
    nodejs_24
    tree-sitter
    wget
  ];
}
