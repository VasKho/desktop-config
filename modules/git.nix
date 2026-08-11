{
  programs.git = {
    enable = true;
    settings = {
      user.useConfigOnly = true;
      core.pager = "less";
      core.editor = "nvim";
      rebase.autoStash = true;
    };
    includes = [
      {
        condition = "hasconfig:remote.*.url:*gitlab.com*/**";
        path = "~/.config/git/gitlab";
      }
      {
        condition = "hasconfig:remote.*.url:*github.com*/**";
        path = "~/.config/git/github";
      }
    ];
  };

  xdg.configFile = {
    "git/github" = {
      text = ''
      [user]
        name = VasKho
        email = vasya.khoroshavin@gmail.com
      '';
    };
    "git/gitlab" = {
      text = ''
      [user]
        name = vaslch0
        email = vasya.khoroshavin@gmail.com
      '';
    };
  };
}
