{ lib, stdenvNoCC, fetchurl }:
stdenvNoCC.mkDerivation rec {
  pname = "Harbor";
  version = "1.6.0";
  src = fetchurl {
    url = "https://github.com/thsnkhn/harbor/releases/download/v${version}/${pname}.dmg";
    hash = "sha256-cLeke9mGR+/dL7pfEtXcL555/fkEiIbyAYiVexoGKRw=";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  unpackPhase = ''
    mkdir -p dmg-mount
    /usr/bin/hdiutil attach -readonly -mountpoint dmg-mount "$src"
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications/Harbor.app
    cp -R dmg-mount/Harbor.app $out/Applications/
    /usr/bin/hdiutil detach dmg-mount -force || true

    runHook postInstall
  '';

  meta = with lib; {
    description = "Beautiful native macOS download manager for direct links, magnets, and torrents.";
    homepage = "https://thsnkhn.github.io/harbor/";
    platforms = platforms.darwin;
  };
}
