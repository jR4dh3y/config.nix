{ config, pkgs, ... }:

{

  home.username = "radhey";
  home.homeDirectory = "/home/radhey";

  # Installation ISO.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Home Manager dotfiles.
  home.file = {

      # ".config/anyrun" .source = ./cfg/anyrun;
      # ".config/hypr" .source = ./cfg/hypr;
      # ".config/rofi" .source = ./cfg/rofi;
      # ".config/wlogout" .source = ./cfg/wlogout;
      # ".config/waybar" .source = ./cfg/waybar;
      # ".config/wallust" .source = ./cfg/wallust;
      # ".local/bin/" .source = ./cfg/bin;
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
