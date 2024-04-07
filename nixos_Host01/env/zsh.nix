{ config, pkgs, ... }:

{
  # zsh 設置
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ 
    zsh 
  ];
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