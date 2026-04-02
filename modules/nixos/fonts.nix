# Fonts — Nerd Fonts for terminal (Ghostty) and IDE
{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-color-emoji
    ];
    fontconfig.defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" "FiraCode Nerd Font" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
