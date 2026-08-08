{ self, ... }: {
  home = {
    stateVersion = "26.11";
    username = "vaslch0";
    homeDirectory = "/Users/vaslch0";
  };

  imports = [
    "${self}/modules/home/fish/default.nix"
    "${self}/modules/home/karabiner/default.nix"
    "${self}/modules/home/zed/default.nix"
    "${self}/modules/home/ghostty.nix"
    "${self}/modules/home/programs.nix"
    "${self}/modules/home/zen-browser.nix"
  ];
}
