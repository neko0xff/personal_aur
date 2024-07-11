{ config, pkgs, ... }:

{

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  # 透過 home.packages 安裝一些常用的軟體: 這些軟體將僅在目前使用者下可用，不會影響系統層級的配置
  # 建議將所有 GUI 軟體，以及與 OS 關係不大的 CLI 軟體，都透過 home.packages 安裝
  # 用户名稱&目錄

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "24.05";
    packages = with pkgs;[
      # archives
      zip
      xz
      unzip
      p7zip
      unrar

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder

      # networking tools
      mtr # A network diagnostic tool
      iperf3
      dnsutils  # `dig` + `nslookup`
      ldns # replacement of `dig`, it provide the command `drill`
      aria2 # A lightweight multi-protocol & multi-source command-line download utility
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing
      ipcalc  # it is a calculator for the IPv4/v6 addresses

      # misc
      cowsay
      file
      which
      tree
      gnused
      gnutar
      gawk
      zstd
      gnupg

      # nix related
      #
      # it provides the command `nom` works just like `nix`
      # with more details log output
      nix-output-monitor

      # productivity
      htop
      neofetch
      glow # markdown previewer in terminal
      iotop # io monitoring
      iftop # network monitoring

      # system call monitoring
      strace # system call monitoring
      ltrace # library call monitoring
      lsof # list open files

      # system tools
      ansible
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb

      # other
      mdbook
    ];
  };

  programs = {
    # git Setup
    git = {
      enable = true;
      userName = "neko0xff";
      userEmail = "neko_0xff@protonmail.com";
    };
    home-manager.enable = true; # Let Home Manager install and manage itself.
  };

}
