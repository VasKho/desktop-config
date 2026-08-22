{ pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "sr_mod" ];

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "root=/dev/disk/by-uuid/d8b1e00b-4536-4305-b008-d32e31c49dee"
      "rootflags=subvol=@root"
      "slab_nomerge"
      "init_on_alloc=1"
      "init_on_free=1"
      "page_alloc.shuffel=1"
    ];
    kernelModules = [ "kvm-amd" "uinput" ];

    kernel.sysctl = {
      "fs.suid_dumpable" = 0;
      "kernel.kptr_restrict" = 2;
      "vm.unprivileged_userfaultfd" = 0;
      "kernel.kexec_load_disabled" = 1;
      "kernel.sysrq" = 4;
      "net.ipv4.tcp_syncookies" = 1;
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.all.rp_filter" = 1;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      "net.ipv4.icmp_echo_ignore_all" = 1;
      "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
      "kernel.randomize_va_space" = 2;
      "kernel.exec-shield" = 1;
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/d8b1e00b-4536-4305-b008-d32e31c49dee";
      fsType = "btrfs";
      options = [ "subvol=@root" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/3863-5F90";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/d8b1e00b-4536-4305-b008-d32e31c49dee";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/398bcb58-5590-4941-99ac-388f845456a2";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
  };

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    uinput.enable = true;

    cpu.amd = {
      microcodePackage = pkgs.microcode-amd;
      updateMicrocode = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
    };
  };
}
