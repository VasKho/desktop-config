{
  description = "vaslch0's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		home-manager = {
			url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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
    in {
      darwinConfigurations."${host.name}" = nix-darwin.lib.darwinSystem {
        modules = [
          (baseDarwinConfig host)

          ./modules/system/default.nix

          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              extraSpecialArgs = { inherit host; inherit inputs; };
              users.${host.username} = import ./modules/home/default.nix;
            };
          }
        ];
      };
    };
}
