{ config, pkgs, ... }:

{
  # Virtualbox 環境
  virtualisation.virtualbox.host = {
    enable = false;
    enableExtensionPack = false;
    enableHardening = false;
    addNetworkInterface = false;
  };
  users.extraGroups.vboxusers.members = [ 
    "user"
    "root" 
  ];
}