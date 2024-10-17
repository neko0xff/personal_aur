{ config, pkgs, lib,... }:

{
  services.udev.packages = with pkgs; [ 
    # wget -O get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
    platformio-core
    arduino-core
    openocd
    esptool
    stlink
    stm32flash
    stm32loader
    screen
    gnumake
    avrdude
  ];
}