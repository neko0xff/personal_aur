################################################################################
# Mostly based on at32-work-bench package from AUR:
# https://aur.archlinux.org/packages/at32-work-bench
################################################################################

{ 
    libarchive,
    pkgs ? import <nixpkgs> {} 
}:

pkgs.stdenv.mkDerivation rec {
  pname = "at32-work-bench";
  version = "1.1.01";
  src = pkgs.fetchurl {
    url = "https://www.arterytek.com/download/TOOL/AT32_Work_Bench_Linux-x86_64_V${version}.zip";
    sha256 = "8fe3d39454d32fdf649dedf8196191a46c309204c64c9b64c2a3faad826c456a"; 
  };

  nativeBuildInputs = [ pkgs.libarchive pkgs.sed pkgs.makeWrapper ];
  buildInputs = [ pkgs.desktop-file-utils ];

  dontBuild = true;

  installPhase = ''
    tmpdir=$(mktemp -d)

    install -dm0755 $out/opt/artery32/

    bsdtar -xf ${src} -C $tmpdir
    bsdtar -xf $tmpdir/data.tar.xz -C $out
    mv $out/usr/local $out/opt/artery32/${pname}
    sed -i "s|/usr/local|/opt/artery32/${pname}|g" $out/usr/share/applications/AT32_Work_Bench.desktop
    makeWrapper $out/opt/artery32/${pname}/AT32_Work_Bench/AT32_Work_Bench.sh \
                $out/bin/${pname} --set PWD $out/opt/artery32/${pname}/AT32_Work_Bench

    # 設置權限
    find $out/ -type f -exec chmod 644 {} \;
    find $out/ -type d -exec chmod 755 {} \;

    # 設置可執行權限
    chmod +x $out/opt/artery32/${pname}/AT32_Work_Bench/AT32_Work_Bench*
  '';

  meta = with pkgs.lib; {
    description = "Artery AT32 MCU graphical pin configuration tool (generates C code)";
    license = pkgs.licenses.unfree;
    platforms = pkgs.lib.platforms.linux;
    maintainers = with pkgs.lib.maintainers; [ "taotieren" "neko0xff" ];
  };
}
