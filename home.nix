{ config, pkgs, ... }:

{

  home.username = "radhey";
  home.homeDirectory = "/home/radhey";

  # Installation ISO.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Home Manager dotfiles.
  home.file = {
    ".config/cava" .source = ./cfg/cava;
    ".config/kitty" .source = ./cfg/kitty;
    ".config/rofi" .source = ./cfg/rofi;
    ".config/picom" .source = ./cfg/picom;
    ".config/qtile" .source = ./cfg/qtile;
    ".config/gtk-4.0" .source = ./cfg/gtk4;
    ".config/gtk-3.0" .source = ./cfg/gtk3;
    ".config/dunst" .source = ./cfg/dunst;
    ".config/fontconfig" .source = ./cfg/fontconfig;
    
    #local
    ".local/share/fonts" .source = ./cfg/local/share/fonts;
    ".local/share/icons" .source = ./cfg/local/share/icons;
    ".local/share/rofi" .source = ./cfg/local/share/rofi;
    ".local/share/themes" .source = ./cfg/local/share/themes;
    ".local/share/wallpapers" .source = ./cfg/local/share/wallpapers;  
  };

  # Home Manager can also manage your environment variables.
  home.sessionVariables = {
    EDITOR = "code";
  };


  programs.git = {
    enable = true;
    userName  = "jR4dh3y";
    userEmail = "radheykalra901@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
