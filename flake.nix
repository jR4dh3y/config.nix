{

  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    auto-cpufreq = {
            url = "github:AdnanHodzic/auto-cpufreq";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    lanzaboote = {
            url = "github:nix-community/lanzaboote/v0.3.0";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

  outputs = { self, nixpkgs, zen-browser, auto-cpufreq, home-manager, lanzaboote, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
    username = "radhey";
  in
  {
    nixosConfigurations = {
      pico-nix = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          auto-cpufreq.nixosModules.default
          lanzaboote.nixosModules.lanzaboote 
        ];
      };
    };

    homeConfigurations = {
      pico-nix = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        modules = [ ./home.nix ];
        # optionally: extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
