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
    # Optimise storage
    # you can also optimise the store manually via:
    #    nix-store --optimise
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    settings.auto-optimise-store = true;
  };
  boot.loader.systemd-boot.configurationLimit = 5;
  
}
