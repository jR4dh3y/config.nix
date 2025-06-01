{ config, pkgs, ... }:

{

  home.username = "radhey";
  home.homeDirectory = "/home/radhey";

  # Installation ISO.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  # Home Manager dotfiles.
  
  home.file = {
      ".config/qtile".source = ./cfg/Qtile/qtile;
      ".config/dunst".source = ./cfg/Qtile/dunst;
      ".config/rofi".source = ./cfg/Qtile/rofi;
      ".config/kitty".source = ./cfg/Qtile/kitty;
      ".config/gtk-4.0".source = ./cfg/Qtile/gtk-4.0;
      ".config/gtk-3.0".source = ./cfg/Qtile/gtk-3.0;
      ".config/picom".source = ./cfg/Qtile/picom;
      ".config/fish".source = ./cfg/Qtile/fish;
      ".config/nitrogen".source = ./cfg/Qtile/nitrogen;
      ".config/fontconfig".source = ./cfg/Qtile/fontconfig;
      ".config/cava".source = ./cfg/Qtile/cava;
      ".local/share/fonts".source = ./cfg/Qtile/local/share/fonts;
      ".local/share/icons".source = ./cfg/Qtile/local/share/icons;
      ".local/share/rofi".source = ./cfg/Qtile/local/share/rofi;
      ".local/share/themes".source = ./cfg/Qtile/local/share/themes;
      ".local/share/wallpapers".source = ./cfg/Qtile/local/share/wallpapers;
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
