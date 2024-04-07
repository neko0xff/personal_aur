{ config, pkgs, ... }:

{
  # 刪除舊有的建置
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 5d";
      dates = "Sun 19:00";
    };
    optimise = {
      automatic = true;
      dates = [ "03:45" ];
    };
  };
  
}