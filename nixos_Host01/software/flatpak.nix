{ config, pkgs, ... }:

{
  # Flatpak 相關設置
  services.flatpak.enable = true;
  xdg.portal = {
    extraPortals = [ 
      pkgs.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "qt";
  };
}
