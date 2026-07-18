{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish
    raycast
    mousecape
    wget
    docker
    docker-compose
    colima
    nixd
    llama-cpp
  ];

  homebrew = {
    enable = true;
    enableFishIntegration = true;

    taps = [
     {
       name = "jurplel/tap";
       trusted = true;
     }
    ];

    casks = [
      "telegram"
      "karabiner-elements"
      "zed"
      "transmission"
      "instant-space-switcher"
    ];
  };
}
