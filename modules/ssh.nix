{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "./hosts" ];
  };
}
