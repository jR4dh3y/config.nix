  { inputs, config, pkgs, ... }: 

  {
    # Enable Cachix (https://wiki.hyprland.org/Nix/Cachix/)
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    # Enable hyprland simple (https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/)
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    # Optional, hint electron apps to use wayland:
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # INSTALL PACKAGES
    environment.systemPackages = with pkgs; [
      kitty
      nemo
      cava
      waypaper
      nwg-look
    ];

  }
