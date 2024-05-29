{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ ];
    # Configure keymap in X11
    xkb.layout = "tw";
    xkb.variant = "";
  };
  services.libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
  services.power-profiles-daemon.enable = true;
  
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager = {
    plasma6.enable =true;
  };
  services.displayManager = { 
    sddm.enable = true;
  };


}