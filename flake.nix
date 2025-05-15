{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:NixOS/nixpkgs/nixos-24.11";

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

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { self, nixpkgs, nixpkgs-old, home-manager, ... }@inputs:
  let
    # Catppuccin theme
    colors = {
      rosewater = "f5e0dc";
      flamingo = "f2cdcd";
      pink = "f5c2e7";
      mauve = "cba6f7";
      red = "f38ba8";
      maroon = "eba0ac";
      peach = "fab387";
      yellow = "f9e2af";
      green = "a6e3a1";
      teal = "94e2d5";
      sky = "89dceb";
      sapphire = "74c7ec";
      blue = "89b4fa";
      lavender = "b4befe";
      text = "cdd6f4";
      subtext1 = "bac2de";
      subtext0 = "a6adc8";
      overlay2 = "9399b2";
      overlay1 = "7f849c";
      overlay0 = "6c7086";
      surface2 = "585b70";
      surface1 = "45475a";
      surface0 = "313244";
      base = "1e1e2e";
      mantle = "181825";
      crust = "11111b";
    };
  in {
    nixosConfigurations.Compootah = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs; inherit colors;};

      modules = [ 
        # Importing all the other garbage
        ./systems/Compootah/boot.nix
        ./sys/locale.nix
        ./sys/pkgs.nix
        ./sys/etc.nix
        ./sys/users.nix
        ./sys/mpd.nix
        ./systems/Compootah/hardware-configuration.nix

        ./desktop/generic.nix
        # Some parts of hyprland has to be outside home manager
        ./desktop/wayland.nix
        #./desktop/gnome.nix
        #./desktop/xmonad.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs;
            pkgs-old = import nixpkgs-old {
              system = "x86_64-linux";
            };
            colors = colors;
          };
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-backup";
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
                ./systems/Compootah/hyprland.nix
                ./home/beets.nix
                ./home/cava.nix
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
                inputs.catppuccin.homeModules.catppuccin
            ];
          };
        }
      ];
    };

    nixosConfigurations.x1c = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs; inherit colors;};

      modules = [ 
        # Importing all the other garbage
        ./systems/x1c/boot.nix
        ./sys/locale.nix
        ./sys/pkgs.nix
        ./sys/etc.nix
        ./sys/users.nix
        ./sys/mpd.nix
        ./systems/x1c/hardware-configuration.nix

        ./desktop/generic.nix
        ./desktop/wayland.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs;
            pkgs-old = import nixpkgs-old {
              system = "x86_64-linux";
            };
            colors = colors;
          };
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-backup";
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
                ./systems/x1c/hyprland.nix
                ./home/beets.nix
                ./home/cava.nix
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
                inputs.catppuccin.homeModules.catppuccin
            ];
          };
        }
      ];
    };
  };
}
