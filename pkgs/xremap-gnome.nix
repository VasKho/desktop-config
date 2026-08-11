{ stdenv, lib, fetchzip }: let
  currentSystem = stdenv.hostPlatform.system;
  arch = builtins.head (builtins.split "-" currentSystem);
in stdenv.mkDerivation rec {
  pname = "xremap";
  version = "0.15.9";

  src = fetchzip {
    url = "https://github.com/k0kubun/xremap/releases/download/v${version}/xremap-linux-${arch}-gnome.zip";
    sha256 = "sha256-qej1vonUYz8J2yqbn5oRJGdoNvSRV7K29uR0Jh+3JeE=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp xremap $out/bin/

    runHook postInstall
  '';

  meta = with lib; {
    description = "A key remapper for Linux with GNOME support";
    homepage = "https://github.com/k0kubun/xremap";
    license = licenses.asl20;
    maintainers = [ maintainers.yourname ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "xremap";
  };
}
