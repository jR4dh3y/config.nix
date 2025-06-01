# dotfiles for NixOS

This repository contains my personal NixOS system configuration, Home Manager setup, and user dotfiles. It is designed to provide a reproducible, declarative, and modular setup for my Linux workstation.

## Features

- **NixOS System Configuration**: All system-level settings, hardware configuration, and package management are handled via `configuration.nix` and `hardware-configuration.nix`.
- **Home Manager**: User-level configuration and dotfiles are managed declaratively with Home Manager (`home.nix`).
- **Flakes**: Uses Nix flakes for reproducibility and easy management of dependencies and modules (`flake.nix`).
- **Desktop Environments**: Supports both Qtile (tiled WM) and Plasma 6 (KDE) desktop environments.
- **Custom Packages**: Integrates custom and external packages such as Zen Browser and auto-cpufreq via flake inputs.
- **Fonts & Themes**: Pre-configured fonts, themes, and wallpapers for a beautiful and consistent desktop experience.
- **Pipewire Audio**: Modern audio stack with Pipewire and WirePlumber.
- **Bluetooth, Printing, and More**: Out-of-the-box support for Bluetooth, printing, and other essential services.

## Directory Structure

```
configuration.nix         # Main NixOS system configuration
hardware-configuration.nix # Hardware-specific config (auto-generated)
home.nix                  # Home Manager user configuration
flake.nix                 # Flake entrypoint and inputs
cfg/Qtile/                # Qtile WM and related dotfiles
system/                   # Modular system configs (e.g., qtile.nix, hypr.nix)
```

## Getting Started

### Prerequisites
- NixOS (preferably latest unstable)
- [Home Manager](https://nix-community.github.io/home-manager/)
- Flakes enabled (`nix.settings.experimental-features = [ "nix-command" "flakes" ];`)

### Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/<your-username>/dotfiles.git
   cd dotfiles
   ```
2. **Edit hardware-configuration.nix** as needed for your machine.
3. **Rebuild your system:**
   ```sh
   sudo nixos-rebuild switch --flake .#pico-nix
   ```
4. **Apply Home Manager config:**
   ```sh
   home-manager switch --flake .#pico-nix
   ```

## Customization
- **Qtile, themes, and scripts**: Edit files under `cfg/Qtile/`.
- **System modules**: Add or modify files in `system/` and reference them in `configuration.nix`.
- **User packages and settings**: Update `home.nix`.
