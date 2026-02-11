{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.home-manager
    (pkgs.callPackage ./telegram.nix {})
  ];

  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      includes = [ "./hosts" ];
    };

    git = {
      enable = true;
      settings = {
        core = {
          pager = "less";
          editor = "nvim";
        };
        rebase.autoStash = true;
      };
    };

    gemini-cli = {
      enable = true;
      settings = {
        general = {
          preferredEditor = "nvim";
          previewFeatures = false;
          vimMode = true;
          enableAutoUpdate = false;

        };
        ide.enabled = false;
        privacy.usageStatisticsEnabled = false;
        security.auth.selectedType = "oauth-personal";
        ui.theme = "Default";
        tools = {
          sandbox = true;
          autoAccept = false;
        };
      };
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      initLua = ''
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
        vim.o.clipboard = "unnamedplus"
      '';
    };

    gitui.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    ripgrep-all.enable = true;
    fastfetch.enable = true;
  };
}
