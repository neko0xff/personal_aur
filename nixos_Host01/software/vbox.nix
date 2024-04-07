{ config, pkgs, ... }:

{
  # Virtualbox 環境
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}