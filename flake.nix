{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url ="github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #gBar.url = "path:/home/edvin/projects/gBar";
    gBar = {
        url = "github:scorpion-26/gBar";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    hyprland-contrib = {
        url = "github:hyprwm/contrib";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker = {
        url = "github:hyprwm/hyprpicker";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.Compootah = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};

      modules = [ 
        # Importing all the other garbage
        ./sys/boot.nix
        ./sys/locale.nix
        ./sys/pkgs.nix
        ./sys/etc.nix
        ./sys/users.nix
        ./sys/hardware-configuration.nix

        ./desktop/generic.nix
        # Some parts of hyprland has to be outside home manager
        ./desktop/wayland.nix
#./desktop/gnome.nix
        #./desktop/xmonad.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useUserPackages = true;
          home-manager.users.edvin = {
            # Home manager version
            home.stateVersion = "22.05";
     
            # Let Home Manager install and manage itself.
            programs.home-manager.enable = true;
     
            # Enabling playerctl to control videos and music with the mediakeys
            services.playerctld.enable = true;

            catppuccin.flavor = "mocha";

            # Imports of modules
            imports = [
                ./desktop/hyprland.nix
                ./home/dunst.nix 
                ./home/fastfetch.nix
                ./home/firefox.nix
                ./home/fish.nix
                ./home/fzf.nix
                ./home/git.nix 
                ./home/kitty.nix
                ./home/mpv.nix
                ./home/neovim.nix 
                ./home/pkgs.nix
                ./home/rofi.nix
                ./home/theme.nix
                inputs.gBar.homeManagerModules.x86_64-linux.default 
                inputs.catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
      ];
    };
  };
}
