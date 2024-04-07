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
  system.fsPackages = [ pkgs.bindfs ];
      fileSystems = let
        mkRoSymBind = path: {
          device = path;
          fsType = "fuse.bindfs";
          options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
          };
        aggregatedFonts = pkgs.buildEnv {
          name = "system-fonts";
          paths = config.fonts.packages;
          pathsToLink = [ "/share/fonts" ];
        };
      in {
        # Create an FHS mount to support flatpak host icons/fonts
        "/usr/share/icons" = mkRoSymBind (config.system.path + "/share/icons");
        "/usr/share/fonts" = mkRoSymBind (aggregatedFonts + "/share/fonts");
      };

}
