{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "26.11";

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
  };

  nix.package = pkgs.lix;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;

    extra-substituters = [
      "https://vicinae.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  networking = {
    hostName = "home-desktop";
    networkmanager.enable = true;
  };

  users.users."vaslch0" = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "docker"
      "networkmanager"
      "audio"
      "video"
      "input"
      "uinput"
    ];
  };

  time.timeZone = "Europe/Minsk";

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    noto-fonts-cjk-sans
  ];

  programs = {
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };

    fish.enable = true;
    git.enable = true;
    neovim.enable = true;
  };

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.core-apps.enable = false;
    gnome.core-developer-tools.enable = false;
    gnome.games.enable = false;
    xserver.videoDrivers = [ "nvidia" ];

    dbus.implementation = "broker";
    # avahi.enable = false;
    # geoclue2.enable = false;
    # udisks2.enable = lib.mkForce false;
    # accounts-daemon.enable = lib.mkForce false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        AllowAgentForwarding = true;
        PermitEmptyPasswords = false;
        AllowTcpForwarding = false;
        MaxSessions = 2;
        PermitRootLogin = "no";
      };
    };

    chrony = {
      enable = true;
      enableNTS = true;
      servers = [
        "time.cloudflare.com iburst nts"
        "ntppool1.time.nl iburst nts"
        "nts.netnod.se iburst nts"
        "ptbtime1.ptb.de iburst nts"
        "time.dfm.dk iburst nts"
        "time.cifelli.xyz iburst nts"
      ];
    };

    udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", TAG+="uaccess"
    '';
  };

  environment = {
    gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

    systemPackages = with pkgs; [
      fzf
      btop
      wireplumber
      docker-compose
      volantes-cursors
      nixd
      ghostty
      home-manager
    ];
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  security = {
    sudo.enable = false;
    polkit.enable = true;
    run0 = {
      enable = true;
      enableSudoAlias = true;
    };

    protectKernelImage = true;
    forcePageTableIsolation = true;
    allowSimultaneousMultithreading = true;
  };
}
