{ config, pkgs, users,... }:

{
  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  users.users.user.extraGroups = [ "audio" ];
  security = {
    rtkit.enable = true;
    pam.loginLimits = [
      { domain = "@audio"; item = "memlock"; type = "-"   ; value = "unlimited"; }
      { domain = "@audio"; item = "rtprio" ; type = "-"   ; value = "99"       ; }
      { domain = "@audio"; item = "nofile" ; type = "soft"; value = "99999"    ; }
      { domain = "@audio"; item = "nofile" ; type = "hard"; value = "524288"   ; }
    ];
  };

  environment = {
    systemPackages =  with pkgs; [
      easyeffects
      lsp-plugins
    ];
    /*etc = {
      "pipewire.conf.d/rt.conf".source = ./pipewire.conf.d/rt.conf;
    };*/
  };
  
  # musnix.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;

    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };
  
}
