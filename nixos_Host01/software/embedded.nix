{ config, pkgs, lib,... }:

{
  services.udev.packages = with pkgs; [ 
    platformio-core
    arduino-core
    openocd
    esptool
    screen
    gnumake
    avrdude
  ];
}