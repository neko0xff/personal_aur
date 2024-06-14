{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  environment.variables.EDITOR = "nano";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.partition-manager.enable = true;
  services.dbus.packages = [ 
    pkgs.libsForQt5.kpmcore
  ];

  # Do not forget to add an editor to edit configuration.nix! 
  # The Nano editor is also installed by default.
  environment.systemPackages = with pkgs; [
     nodejs
     linuxKernel.packages.linux_xanmod_stable.virtualbox
     git
     wget
     curl
     nettools
     github-desktop
     partition-manager
  ];
}