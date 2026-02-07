{ stdenv, fetchzip }:
stdenv.mkDerivation {
  pname = "Telegram";
  version = "12.4.2,278481";

  src = fetchzip {
    url = "https://osx.telegram.org/updates/Telegram-12.4.2.278481.app.zip";
    sha256 = "sha256-QLyOt3FXu2PgoOWq4xfinncwoxudMDrBj1AUvpn//c4=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications/Telegram.app
    cp -R . $out/Applications/Telegram.app/

    runHook postInstall
  '';
}
