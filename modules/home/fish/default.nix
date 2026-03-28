{ lib, pkgs, ... }:
let
  files = builtins.filter
    (f: f != ./. + "/default.nix")
    (lib.filesystem.listFilesRecursive ./.);

  result = builtins.concatStringsSep "\n" (map (f: builtins.readFile f) files);
in
{
  home = {
    packages = with pkgs; [
      fzf
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = result;

    plugins = [
      { name = "fzf"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];
  };
}
