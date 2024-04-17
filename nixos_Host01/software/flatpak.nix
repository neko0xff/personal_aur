{ config, pkgs, ... }:

{
  # Flatpak 相關設置
  services.flatpak.enable = true;
  xdg.portal = {
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
    config.common.default = "qt";
  };
}
