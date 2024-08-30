{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.partition-manager.enable = true;
  services.dbus.packages = [ 
    pkgs.libsForQt5.kpmcore
  ];

  # Do not forget to add an editor to edit configuration.nix! 
  # The Nano editor is also installed by default.
  environment = {
     variables.EDITOR = "nano";
     variables.OPENSSL_DIR = "${pkgs.openssl.dev}";
     variables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
     systemPackages = with pkgs; [
      nodejs
      git
      wget
      curl
      nettools
      github-desktop
      partition-manager
      clang
      clang-tools
      k3b
      dvdplusrwtools
      cdrtools
      cdrdao
      ventoy-full # Web: sudo ventoy-web
      vlc
      virt-viewer
      filezilla
      # rust
      cargo-cross
      cargo-expand
      cargo-mommy
      cargo-nextest
      cargo-auditable-cargo-wrapper
      rustc
      rustup-toolchain-install-master
      rustfmt
      clippy
      pkg-config
      openssl.dev
      llvmPackages.bintools
      llvmPackages.libcxxStdenv
      llvmPackages.libunwind
      llvmPackages.libcxx
      llvmPackages.clangUseLLVM
      llvmPackages.lld
      llvmPackages.llvm
      tokei
      gnumake
      libiconv
      zlib
      flashrom
      python3Full

   ];
  };

  #shellHook = ''
  #  export OPENSSL_DIR=${pkgs.openssl.dev}
  #  export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig
  #'';

}
