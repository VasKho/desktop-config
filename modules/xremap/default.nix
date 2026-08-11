{ self, pkgs, ... }: {
  services.xremap = {
    enable = true;
    package = pkgs.callPackage "${self}/pkgs/xremap-gnome.nix" { };
    withGnome = true;
    yamlConfig = builtins.readFile ./config.yaml;
  };

  xdg.configFile = {
    "xremap/overview_toggle.sh".source = ./overview_toggle.sh;
  };
}
