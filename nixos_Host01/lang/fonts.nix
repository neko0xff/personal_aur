{ config, pkgs, ... }:

{
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