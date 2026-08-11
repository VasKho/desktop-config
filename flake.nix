{
  description = "vaslch0's nix config flake";

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

    xremap.url = "github:xremap/nix-flake";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: {
    darwinConfigurations."m1-pro" = nix-darwin.lib.darwinSystem {
      modules = [ ./hosts/m1-pro/configuration.nix ];
      specialArgs = { inherit self; };
    };

    homeConfigurations."vaslch0" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      modules = [
        inputs.zen-browser.homeModules.beta
        ./home/vaslch0/home.nix
      ];
      extraSpecialArgs = { inherit self; };
    };
  };
}
