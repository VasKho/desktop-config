{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish
    raycast
    mousecape
    tree-sitter
    wget
  ];
}
