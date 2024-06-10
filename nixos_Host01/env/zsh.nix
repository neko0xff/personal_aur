{ config, pkgs, ... }:

{
  # zsh 設置
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ 
    zsh 
  ];
  environment.variables = {
    CHROME_EXECUTABLE = "/var/lib/flatpak/app/com.google.Chrome/x86_64/stable/active/export/bin/com.google.Chrome";
    CXX = "clang++";
  };
  # enable zsh and oh my zsh
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
       enable = true;
       theme = "robbyrussell";
       plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
        ];
     };  
  };

}