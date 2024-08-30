# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ 
      # Include the results
      ./hardware-configuration.nix
      ./env/clean.nix
      ./env/zsh.nix
      ./env/network.nix
      ./env/sound.nix
      ./env/users.nix
      ./env/desktop.nix
      ./env/installsoft.nix
      ./software/flatpak.nix
      ./software/vbox.nix
      ./software/kdewallet.nix
      ./software/embedded.nix
      ./software/vscode.nix
      ./software/androidDev.nix
      ./software/kvm.nix
      ./lang/fonts.nix
      ./lang/i18n.nix
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # nix-channel --list | grep nixos
  # nix-channel --add https://nixos.org/channels/nixos-24.05 nixos
  
  system = {
    stateVersion = "24.05";
    autoUpgrade ={
      enable = true;
      allowReboot = true;
    };
  };
 
  
}
