{ self, pkgs, ... }: {
  home = {
    username = "vaslch0";
    homeDirectory = "/home/vaslch0";
    shell.enableFishIntegration = true;
    stateVersion = "26.11";

    sessionVariables.GTK_THEME = "WhiteSur-Light";
  };

  home.packages = with pkgs; [
    android-tools
    nemo
    fragments
    libreoffice
    inkscape
    mpv
    swaybg
    # gnome-tweaks
    # gnome-themes-extra
    # gnomeExtensions.dash-to-dock
    # gnomeExtensions.vicinae
    # gnomeExtensions.xremap
    # gnomeExtensions.user-themes
    # gnomeExtensions.blur-my-shell
    (callPackage "${self}/pkgs/rudo-bin.nix" {})
  ];

  programs = {
    jq.enable = true;
    ripgrep.enable = true;
    ripgrep-all.enable = true;
    fastfetch.enable = true;
  };

  services = {
    gnome-keyring.enable = true;
    playerctld.enable = true;
    mako.enable = true;
    network-manager-applet.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Light";
      package = pkgs.whitesur-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "volantes_light_cursors";
      package = pkgs.volantes-cursors;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
    };
    colorScheme = "light";
  };

  imports = [
    "${self}/modules/zed/linux.nix"
    "${self}/modules/eww/default.nix"
    "${self}/modules/fish/default.nix"
    "${self}/modules/niri/default.nix"
    "${self}/modules/ghostty/linux.nix"
    "${self}/modules/xremap/default.nix"
    "${self}/modules/git.nix"
    "${self}/modules/ssh.nix"
    "${self}/modules/gnome.nix"
    "${self}/modules/neovim.nix"
    "${self}/modules/vicinae.nix"
    "${self}/modules/librewolf.nix"
  ];
}
