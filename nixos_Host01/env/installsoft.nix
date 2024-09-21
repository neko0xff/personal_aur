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
      vlc
      virt-viewer
      filezilla
      gnumake
      python3Full
      bun
      protobuf
      grpc-tools
      protoc-gen-grpc-web
   ];
  };

  #shellHook = ''
  #  export OPENSSL_DIR=${pkgs.openssl.dev}
  #  export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig
  #'';

}
