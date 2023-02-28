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

    #gbar.url = "github:Eken-beep/gBar";
    gBar.url = "github:scorpion-26/gBar";
    
  };

  outputs = { self, nixpkgs, home-manager, hyprland, gBar, ... }@inputs: {
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
          home-manager.users.edvin = {
            # Home manager version
            home.stateVersion = "22.05";
     
            # Let Home Manager install and manage itself.
            programs.home-manager.enable = true;
     
            # Enabling playerctl to control videos and music with the mediakeys
            services.playerctld.enable = true;

            # Imports of modules
            imports = [
                ./home/dunst.nix 
                ./home/fish.nix
                ./home/git.nix 
                #./home/gBar.nix
                ./home/kitty.nix 
                ./home/neovim.nix 
                ./home/picom.nix 
                ./home/pkgs.nix
                ./home/rofi.nix
                ./home/waybar.nix
            ];
          };
        }

        hyprland.nixosModules.default
        { programs.hyprland = {
            enable = true; 
            nvidiaPatches = true;
          };
        } 

        gBar.nixosModules.default 
        {
          programs.gBar = {
            enable = true;
          };
        }

        {
          # Flake packages
          environment.systemPackages = [
            gBar.defaultPackage.x86_64-linux
          ];
        }
      ];
    };
  };
}
