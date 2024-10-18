{ config, pkgs, ... }:

{
  # KDE Wallet Setup
  security.pam.services = {
    sddm.enableKwallet = true;
    kwallet = {
      name = "kwallet";
       enableKwallet = true;
    };
  };
}