#!/usr/bin/env bash
# auto-deploy.sh: Automatically configure NixOS and Home Manager after a fresh install

set -e

DOTFILES_DIR="$HOME/config.nix"
REPO_URL="https://github.com/jR4dh3y/config.nix/" 
HOSTNAME="pico-nix"

# 1. Ensure git is installed
if ! command -v git &> /dev/null; then
    echo "[INFO] Installing git..."
    sudo nix-env -iA nixpkgs.git
fi

# 1.5. Enable flakes if not already enabled
NIX_CONF="/etc/nix/nix.conf"
if ! grep -q '^experimental-features.*flakes' "$NIX_CONF" 2>/dev/null; then
    echo "[INFO] Enabling flakes in $NIX_CONF ..."
    if [ "$(id -u)" -eq 0 ]; then
        echo 'experimental-features = nix-command flakes' >> "$NIX_CONF"
    else
        sudo sh -c "echo 'experimental-features = nix-command flakes' >> $NIX_CONF"
    fi
fi

# 2. Clone dotfiles repo if not present
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "[INFO] Cloning dotfiles repo..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# 3. Ensure home-manager is installed
if ! command -v home-manager &> /dev/null; then
    echo "[INFO] Installing Home Manager..."
    nix-shell '<home-manager>' -A install
fi

# 4. Rebuild and switch to NixOS config
if [ "$(id -u)" -eq 0 ]; then
    # Already root
    nixos-rebuild switch --flake .#"$HOSTNAME"
else
    echo "[INFO] Running nixos-rebuild as root..."
    sudo nixos-rebuild switch --flake .#"$HOSTNAME"
fi

# 5. Apply Home Manager config
home-manager switch --flake .#"$HOSTNAME"

echo -e "\n✅ Automatic NixOS and Home Manager configuration complete!"
