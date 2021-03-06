{ stdenv, fetchurl, makeWrapper, jre, jdk, gcc, xlibs
, chromedriver, chromeSupport ? true }:

with stdenv.lib;

let
  arch = if stdenv.system == "x86_64-linux" then "amd64"
         else if stdenv.system == "i686-linux" then "i386"
         else "";

in stdenv.mkDerivation rec {
  name = "selenium-server-standalone-${version}";
  version = "2.44.0";

  src = fetchurl {
    url = "http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar";
    sha256 = "1n53pyrxpmfh9lvr68d1l9rsiw7qr36farirpl3ivkyvnpm5iwm5";
  };

  unpackPhase = "true";

  buildInputs = [ jre makeWrapper ];

  # Patch launcher binaries for opera
  patchPhase = optionalString (arch!="") ''
    cp $src $TMPDIR/${name}.jar
    export src=$TMPDIR/${name}.jar

    ${jdk}/bin/jar xf $src launchers/launcher-linux-amd64
    patchelf \
      --set-interpreter "$(cat $NIX_GCC/nix-support/dynamic-linker)" \
      --set-rpath "${gcc.gcc}/lib/:${gcc.gcc}/lib64:${xlibs.libX11}/lib" \
      launchers/launcher-linux-${arch}
    ${jdk}/bin/jar uf $src launchers/launcher-linux-${arch}
  '';

  installPhase = ''
    mkdir -p $out/share/lib/${name}
    cp $src $out/share/lib/${name}/${name}.jar
    makeWrapper ${jre}/bin/java $out/bin/selenium-server \
      --add-flags "-jar $out/share/lib/${name}/${name}.jar" \
      --add-flags ${optionalString chromeSupport "-Dwebdriver.chrome.driver=${chromedriver}/bin/chromedriver"}
  '';

  meta = {
    homepage = https://code.google.com/p/selenium;
    description = "Selenium Server for remote WebDriver";
    maintainers = with maintainers; [ coconnor offline ];
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
