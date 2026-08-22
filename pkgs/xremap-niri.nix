{ stdenv, lib, fetchzip }: let
  currentSystem = stdenv.hostPlatform.system;
  arch = builtins.head (builtins.split "-" currentSystem);
in stdenv.mkDerivation rec {
  pname = "xremap";
  version = "0.15.9";

  src = fetchzip {
    url = "https://github.com/k0kubun/xremap/releases/download/v${version}/xremap-linux-${arch}-niri.zip";
    sha256 = "sha256-fPwj3y7X/hhQdwh9qtYBtSEN8NPWrDwNgG9gEbqZ3TA=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp xremap $out/bin/

    runHook postInstall
  '';

  meta = with lib; {
    description = "A key remapper for Linux with Niri support";
    homepage = "https://github.com/k0kubun/xremap";
    license = licenses.asl20;
    maintainers = [ maintainers.yourname ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "xremap";
  };
}
