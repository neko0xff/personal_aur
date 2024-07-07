{ config, pkgs, ... }:

{
  # Virtualbox 環境
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
    enableHardening = true;
    addNetworkInterface = true;
  };
  users.extraGroups.vboxusers.members = [ 
    "user"
    "root" 
  ];
}