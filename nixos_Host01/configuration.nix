# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./de.nix
    ];

  # Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    # kernelPackages = pkgs.linuxPackages_latest;
  };

  # zsh 設置
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;  

  networking.hostName = "Host01"; # Define your hostname.
  #networking.wireless = {
  #    enable = true;  # Enables wireless support via wpa_supplicant.
  #    network = {
  #      free.wifi = {};  # Public wireless network
  #    };
  #};

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Taipei";
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "zh_TW.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_TW.UTF-8";
      LC_IDENTIFICATION = "zh_TW.UTF-8";
      LC_MEASUREMENT = "zh_TW.UTF-8";
      LC_MONETARY = "zh_TW.UTF-8";
      LC_NAME = "zh_TW.UTF-8";
      LC_NUMERIC = "zh_TW.UTF-8";
      LC_PAPER = "zh_TW.UTF-8";
      LC_TELEPHONE = "zh_TW.UTF-8";
      LC_TIME = "zh_TW.UTF-8";
    };
    inputMethod = {
      # 輸入法: Fcitx5
      enabled = "fcitx5"; 
      fcitx5 = {
         addons = with pkgs; [ 
            fcitx5-mozc     # 日文
            fcitx5-chewing  # 注音
            fcitx5-table-other # 其它輸入法
            fcitx5-table-extra # 其它輸入法
            fcitx5-chinese-addons # 簡中輸入
            fcitx5-m17n
            fcitx5-configtool # 設置工具
          ];
        };
    };
  };
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager = {
      # Enable the KDE Plasma Desktop Environment.
      sddm.enable = true;
      plasma5.enable = true;
    };
    # Configure keymap in X11
    layout = "tw";
    xkbVariant = "";
  };
  
  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ 
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      firefox
      kate
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "user";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  environment.variables.EDITOR = "nano";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Do not forget to add an editor to edit configuration.nix! 
  # The Nano editor is also installed by default.
  environment.systemPackages = with pkgs; [
     nodejs
     virtualbox
     linuxKernel.packages.linux_zen.virtualbox
     git
     wget
     curl
     nettools
     flutter
     dart  
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall Or disable the firewall altogether.
  networking.firewall = {
    enable = enable;
    # allowedTCPPorts = [ ... ];
    # allowedUDPPorts = [ ... ];
  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  
  # Flatpak 相關設置 
  services.flatpak.enable = true;
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];
    config.common.default = "qt";
  }; 

  # Virtualbox 環境
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  # 字體
  fonts = {
        enableDefaultPackages = true;
        fontDir.enable = true;
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-color-emoji
            noto-fonts-extra
            source-code-pro
            source-han-sans
            source-han-serif
            sarasa-gothic
        ];
        fontconfig = {
            defaultFonts = {
                emoji = [
                    "Noto Color Emoji"
                ];
                monospace = [
                    "Noto Sans Mono CJK SC"
                    "Sarasa Mono SC"
                    "DejaVu Sans Mono"
                ];
                sansSerif = [
                    "Noto Sans CJK SC"
                    "Source Han Sans SC"
                    "DejaVu Sans"
                ];
                serif = [
                    "Noto Serif CJK SC"
                    "Source Han Serif SC"
                    "DejaVu Serif"
                ];
            };
      };
   };

}
