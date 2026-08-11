{ self, pkgs, ... }: let
  user = "vaslch0";
in {
  system = {
    stateVersion = 6;
    primaryUser = user;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  nix.package = pkgs.lix;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  networking.hostName = "m1-pro";

  users.users."${user}" = {
    home = "/Users/${user}";
    shell = pkgs.fish;
  };

  time.timeZone = "Europe/Minsk";

  fonts.packages = [ pkgs.nerd-fonts.hack ];

  programs = {
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };

    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    fzf
    nixd
    wget
    colima
    docker
    docker-compose
    ghostty-bin
    raycast
    mousecape
    home-manager
  ];

  imports = [
    ./autostart.nix
    ./settings.nix
    ./brew.nix
  ];
}
