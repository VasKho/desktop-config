{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish
    raycast
    mousecape
    tree-sitter
    wget
    podman
    podman-compose
  ];

  homebrew = {
    enable = true;
    enableFishIntegration = true;

    casks = [
      "telegram"
      "karabiner-elements"
      "zed"
    ];
  };
}
