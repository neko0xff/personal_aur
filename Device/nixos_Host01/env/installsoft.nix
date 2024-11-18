{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.partition-manager.enable = true;
  services.dbus.packages = with pkgs; [ 
    libsForQt5.kpmcore
  ];

  # Do not forget to add an editor to edit configuration.nix! 
  # The Nano editor is also installed by default.
  environment = {
     variables.EDITOR = "nano";
     variables.OPENSSL_DIR = "${pkgs.openssl_3_3.dev}";
     variables.PKG_CONFIG_PATH = "${pkgs.openssl_3_3.dev}/lib/pkgconfig";
     variables.OPENSSL_STATIC = "1";
     systemPackages = with pkgs; [
      git
      wget
      curl
      nettools
      github-desktop
      partition-manager
      vlc
      virt-viewer
      filezilla
      gnumake
      python3Full
      pkg-config
      openssl_3_3.dev
      libressl_3_8
      perl
      smartmontools
      glib
      cachix
      qtcreator
      gdb
      cmake
      glibc
      libcxx
      gccStdenv
      gcc-unwrapped
      makeWrapper
      bashInteractive
      libclang
      clang
      clang-tools
      clang_multi
      hddtemp
      libffi
      zlib
   ];
   pathsToLink = [
      "/include"
      "/lib"
    ];
  };

  /*shellHook = ''
    export OPENSSL_DIR=${pkgs.openssl_3_3.dev}
    export PKG_CONFIG_PATH=${pkgs.openssl_3_3.dev}/lib/pkgconfig
    bashdir=$(mktemp -d)
    makeWrapper "$(type -p bash)" "$bashdir/bash" "''${qtWrapperArgs[@]}"
    exec "$bashdir/bash"
  '';*/

}
