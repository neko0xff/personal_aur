{ config, pkgs, ... }:

{
  programs.adb.enable = true;
  users.users.user.extraGroups = [
    "kvm"
    "adbusers"
  ];
  services.udev.packages = with pkgs; [
    android-udev-rules
  ];
  # 如果使用 Flatpak: flutter config --android-studio-dir /var/lib/flatpak/app/com.google.AndroidStudio/
  environment.systemPackages = with pkgs; [
    # android-studio
    jdk
    android-tools
    flutter
    clang
  ];
}

