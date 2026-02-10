{ stdenv, pkgs, fetchurl, lib, ... }:
stdenv.mkDerivation rec {
  pname = "Zen";
  version = "1.18.5b";
  buildInputs = [ pkgs.undmg ];
  sourceRoot = ".";
  phases = [
    "unpackPhase"
    "installPhase"
  ];

  installPhase = ''
    mkdir -p "$out/Applications"
    cp -r Zen.app "$out/Applications/Zen.app"
  '';
  src = fetchurl {
    name = "Zen-${version}.dmg";
    url = "https://github.com/zen-browser/desktop/releases/download/1.18.5b/zen.macos-universal.dmg";
    sha256 = "1gzxa2rqnx4xq83kb08a2yjyspxxq9lkr14wpclbyz4scs8q00xm";
  };
  meta = {
    description = "";
    homepage = "";
    platforms = lib.platforms.darwin;
  };
}
