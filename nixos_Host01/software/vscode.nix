{ config, pkgs, ... }:

{
    # VS Code配置
    environment.systemPackages = with pkgs; [ 
        vscode.fhs
    ];
    
}