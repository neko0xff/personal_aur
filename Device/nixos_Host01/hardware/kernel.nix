{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs = {
    overlays = [
      (self: super: {
        linuxZenWMuQSS = pkgs.linuxPackagesFor (pkgs.linux_zen.kernel.override {
          structuredExtraConfig = with lib.kernel; {
            SCHED_MUQSS = yes;
          };
          ignoreConfigErrors = true;
        });
      })
    ];
  };
}