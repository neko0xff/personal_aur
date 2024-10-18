{ config, pkgs, ... }:

{
  services = {
    libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
    power-profiles-daemon.enable = true;
    
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      videoDrivers = [ ];
      # Configure keymap in X11
      xkb.layout = "tw";
      xkb.variant = "";
    };

    # Enable the KDE Plasma Desktop Environment.
    desktopManager = {
      plasma6.enable = true;
    };
    displayManager = { 
      sddm.enable = true;
    };
    
  }; 
}
