# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results
      ./hardware-configuration.nix
      ./env/clean.nix
      ./env/zsh.nix
      ./software/de.nix
      ./software/flatpak.nix
      ./software/vbox.nix
      ./lang/fonts.nix
      ./lang/i18n.nix
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
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ ];
    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;  
    # Configure keymap in X11
    layout = "tw";
    xkbVariant = "";
    libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
  };

  # KDE Wallet Setup
  security.pam.services = {
    sddm.enableKwallet = true;
    kwallet = {
      name = "kwallet";
       enableKwallet = true;
    };
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ 
      "networkmanager"
      "wheel"
      "dialout"
      "docker"
      "vboxusers"
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
     linuxKernel.packages.linux_zen.virtualbox
     git
     wget
     curl
     nettools
     flutter
     dart
     android-studio
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
    # enable = true;
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

}
