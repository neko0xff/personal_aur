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
     systemPackages = with pkgs; [
      nodejs
      git
      wget
      curl
      nettools
      github-desktop
      partition-manager
      clang
      llvmPackages.bintools
      cargo
      cargo-auditable-cargo-wrapper
      rustc
      rustup
      rustfmt
      clippy
      k3b
      dvdplusrwtools
      cdrtools
      cdrdao
      ventoy-full # Web: sudo ventoy-web
   ];
  };
}
