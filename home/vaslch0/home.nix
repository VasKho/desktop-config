{ self, ... }: {
  home.stateVersion = "25.11";

  imports = [
    "${self}/modules/home/fish/default.nix"
    "${self}/modules/home/karabiner/default.nix"
    "${self}/modules/home/zed/default.nix"
    "${self}/modules/home/ghostty/default.nix"
    "${self}/modules/home/programs/default.nix"
    "${self}/modules/home/zen-browser/default.nix"
  ];
}
