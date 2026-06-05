{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish
    raycast
    mousecape
    tree-sitter
    wget
    podman
    podman-compose
    nixd
    llama-cpp
  ];

  homebrew = {
    enable = true;
    enableFishIntegration = true;

    casks = [
      "telegram"
      "karabiner-elements"
      "zed"
      "transmission"
    ];
  };
}
