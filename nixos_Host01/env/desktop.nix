{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ ];
    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;  
    # Configure keymap in X11
    layout = "tw";
    xkbVariant = "";
    libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
  };
}