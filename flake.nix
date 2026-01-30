{
  description = "vaslch0's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      host = {
        name = "Vasilis-MacBook-Pro";
        arch = "aarch64-darwin";
        username = "vaslch0";
        homeDirectory = "/Users/vaslch0";
        shell = "fish";
      };

      baseDarwinConfig = host: { pkgs, ... }:
        {
          nixpkgs.hostPlatform = host.arch;
          nixpkgs.config.allowUnfree = true;

          system.stateVersion = 6;
          system.primaryUser = host.username;

          nix.settings.experimental-features = "nix-command flakes";
          programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;
        };
    in
      {
        darwinConfigurations."${host.name}" = let
          hostBase = baseDarwinConfig host;
        in nix-darwin.lib.darwinSystem {
          modules = [
            hostBase

            ./modules/system/default.nix

            home-manager.darwinModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                verbose = true;
                extraSpecialArgs = { inherit host; };
                users.${host.username} = import ./modules/home/default.nix;
              };
            }
          ];
        };
      };
}
