{ pkgs, lib, ... }: {
  imports = [ ./default.nix ];

  programs.ghostty = {
    package = lib.mkForce pkgs.ghostty;
  };
}
