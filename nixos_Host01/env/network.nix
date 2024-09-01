{ config, pkgs, lib, ... }:

{
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
  
  networking = {
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true; # Enable networking
    hostName = "Host01"; # Define your hostname.
    
    # Open ports in the firewall Or disable the firewall altogether.
    firewall = {
      # enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };

    # wireless = {
    #    enable = true;  # Enables wireless support via wpa_supplicant.
    #    network = {
    #      free.wifi = {};  # Public wireless network
    #    };
    #};

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Set your time zone.
  time.timeZone = "Asia/Taipei";
  # Enable CUPS to print documents.
  services.printing.enable = false;

  environment.systemPackages =  with pkgs; [
    stevenblack-blocklist
  ];

}
