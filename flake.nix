{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url ="github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gbar.url = "github:Eken-beep/gBar";
    
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
    nixosConfigurations.Compootah = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 

        # Importing all the other garbage
        ./sys/boot.nix
        ./sys/locale.nix
        ./sys/pkgs.nix
        ./sys/etc.nix
        ./sys/users.nix
        ./sys/hardware-configuration.nix
        ./desktop/generic.nix
        ./desktop/gnome.nix
        ./desktop/xmonad.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.users.edvin = import ./home/home.nix;
        }
        hyprland.nixosModules.default
        { programs.hyprland = {
            enable = true; 
            nvidiaPatches = true;
          };
        } 
        {
          # Flake packages
          environment.systemPackages = [
            inputs.gbar
          ];
        }
      ];
    };
  };
}
