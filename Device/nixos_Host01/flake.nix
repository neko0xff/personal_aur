{
  description = "NixOS flake configuration";
  # home-manager, used for managing user configuration
  # 將 home-manager 配置為 nixos 的一個 module
  # 這樣在 nixos-rebuild switch 時，home-manager 配置也會自動部署

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, flake-utils, ... }:   
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      nixosConfigurations = {
      # default
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
           ./configuration.nix
          home-manager.nixosModules.home-manager{
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.user = import ./home.nix; # 導入用戶配置
            };      
          }
        ];
      };
      # Host(Host01) Setup
      Host01= nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
           ./configuration.nix
          home-manager.nixosModules.home-manager{
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.user = import ./home.nix; # 導入用戶配置
            };
          }
        ];
      };
    };

      # DevShell configuration
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cmake
          gdb
          qt6.full
          qt6.qtbase
          qtcreator
          qt6.wrapQtAppsHook
          makeWrapper
          bashInteractive
        ];
        # Set the environment variables that Qt apps expect
        shellHook = ''
          bashdir=$(mktemp -d)
          makeWrapper "$(type -p bash)" "$bashdir/bash" "''${qtWrapperArgs[@]}"
          exec "$bashdir/bash"
        '';
      };
  };
}
