{ config, pkgs, ... }:

{
  # Virtualbox 環境
  virtualisation.virtualbox.host = {
    enable = false;
    enableExtensionPack = true;
    enableHardening = true;
    addNetworkInterface = true;
  };
  environment.systemPackages = with pkgs; [
    # linuxKernel.packages.linux_xanmod_stable.virtualbox
    # linuxKernel.packages.linux_zen.virtualbox
  ];
  users.extraGroups.vboxusers.members = [ 
    "user"
    "root" 
  ];
}
