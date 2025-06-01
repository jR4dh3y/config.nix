{ config, pkgs, lib, inputs, ... }:

{
    services.xserver.windowManager.qtile = {
        enable = true;
        extraPackages = python3Packages: with python3Packages; [
            qtile-extras
        ];
    };

    services.displayManager.sessionPackages = [ pkgs.qtile-unwrapped ];

    environment.systemPackages = with pkgs; [
        python313Packages.cffi
        python313Packages.cairocffi
        python313Packages.xcffib
        python313Packages.dbus-next
        scrot
        xclip
        nitrogen
        brightnessctl
        feh
        playerctl
        rofi
        python313Packages.psutil
        dunst
        alsa-utils
        kitty
        # picom-pijulius
        picom
    ];
}