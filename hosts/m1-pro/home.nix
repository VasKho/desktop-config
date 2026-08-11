{ self, pkgs, ... }: {
  home = {
    stateVersion = "26.11";
    username = "vaslch0";
    homeDirectory = "/Users/vaslch0";

    packages = with pkgs; [
      android-tools
      typst
      tinymist
      mpv-unwrapped
      kubectl
      k9s
      kubernetes-helm
    ];
  };

  programs = {
    jq.enable = true;
    ripgrep.enable = true;
    ripgrep-all.enable = true;
    fastfetch.enable = true;

    man.generateCaches = false;
  };

  imports = [
    "${self}/modules/zed/darwin.nix"
    "${self}/modules/fish/default.nix"
    "${self}/modules/ghostty/darwin.nix"
    "${self}/modules/karabiner/default.nix"
    "${self}/modules/git.nix"
    "${self}/modules/ssh.nix"
    "${self}/modules/neovim.nix"
    "${self}/modules/zen-browser.nix"
  ];
}
