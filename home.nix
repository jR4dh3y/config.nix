{ config, pkgs, ... }:

{

  home.username = "radhey";
  home.homeDirectory = "/home/radhey";

  # Installation ISO.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  # Home Manager dotfiles.
  
  home.file = {
      ".config/qtile".source = ./cfg/qtile;
      ".config/dunst".source = ./cfg/dunst;
      ".config/rofi".source = ./cfg/rofi;
      ".config/kitty".source = ./cfg/kitty;
      ".config/gtk-4.0".source = ./cfg/gtk4;
      ".config/gtk-3.0".source = ./cfg/gtk3;
      ".config/picom".source = ./cfg/picom;
      ".config/fish".source = ./cfg/fish;
      ".local/share" .source = ./cfg/local/share;
      ".config/nitrogen".source = ./cfg/nitrogen;
      ".config/fontconfig".source = ./cfg/fontconfig;
      ".config/cava".source = ./cfg/cava;
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
