{ pkgs, lib, ... }: {
  imports = [ ./default.nix ];

  programs.ghostty = {
    package = lib.mkForce pkgs.ghostty-bin;
    settings = {
      macos-auto-secure-input = true;
      macos-secure-input-indication = true;
      key-remap = "command=option";
    };
  };
}
