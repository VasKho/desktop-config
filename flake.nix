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

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    vicinae.url = "github:vicinaehq/vicinae";
    xremap.url = "github:xremap/nix-flake";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: {
    nixosConfigurations."home-desktop" = nixpkgs.lib.nixosSystem {
      modules = [ ./hosts/home-desktop/configuration.nix ];
      specialArgs = { inherit inputs; };
    };

    darwinConfigurations."m1-pro" = nix-darwin.lib.darwinSystem {
      modules = [ ./hosts/m1-pro/configuration.nix ];
      specialArgs = { inherit self; };
    };

    homeConfigurations."vaslch0@home-desktop" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      extraSpecialArgs = { inherit self; inherit inputs; };
      modules = [
        inputs.vicinae.homeManagerModules.default
        inputs.xremap.homeManagerModules.default
        ./hosts/home-desktop/home.nix
      ];
    };

    homeConfigurations."vaslch0@m1-pro" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      modules = [
        inputs.zen-browser.homeModules.beta
        ./hosts/m1-pro/home.nix
      ];
      extraSpecialArgs = { inherit self; };
    };
  };
}
