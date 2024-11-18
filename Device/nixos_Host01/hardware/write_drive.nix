{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # k3b
      dvdplusrwtools
      cdrtools
      cdrdao
      ventoy-full # Web: sudo ventoy-web
      flashrom
    ];
  };
}