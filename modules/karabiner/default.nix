{ pkgs, ... }:
let
  conf = pkgs.runCommand "generated-config" {
    buildInputs = [ pkgs.nodejs ];
  } ''
    cp -r ${./config} config
    node ./config/main.js > $out
  '';
in {
  xdg.configFile."karabiner.json" = {
    enable = true;
    target = "karabiner/karabiner.json";
    source = conf;
  };
}
