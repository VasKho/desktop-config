{ pkgs, ... }:
{
  home.packages = with pkgs; [
    home-manager
    android-tools
    typst
    tinymist
    vlc-bin
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

    neovim = {
      enable = true;
      defaultEditor = true;
      withRuby = false;
      withPython3 = false;
      initLua = ''
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
        vim.o.clipboard = "unnamedplus"
      '';
    };

    jq.enable = true;
    ripgrep.enable = true;
    ripgrep-all.enable = true;
    fastfetch.enable = true;
  };
}
