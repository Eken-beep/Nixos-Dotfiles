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

    slstatus = {
      url = "github:Eken-beep/slstatus";
      #url = "path:/home/edvin/projects/slstatus";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-old, home-manager, ... }@inputs:
  let
    # Catppuccin mocha
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
    # Catppuccin latte
            #colors = {
            #  rosewater = "dc8a78";
            #  flamingo = "dd7878";
            #  pink = "ea76cb";
            #  mauve = "8839ef";
            #  red = "d20f39";
            #  maroon = "e64553";
            #  peach = "fe640b";
            #  yellow = "df8e1d";
            #  green = "40a02b";
            #  teal = "179299";
            #  sky = "04a5e5";
            #  sapphire = "209fb5";
            #  blue = "1e66f5";
            #  lavender = "7287fd";
            #  text = "4c4f69";
            #  subtext1 = "5c5f77";
            #  subtext0 = "6c6f85";
            #  overlay2 = "7c7f93";
            #  overlay1 = "8c8fa1";
            #  overlay0 = "9ca0b0";
            #  surface2 = "acb0be";
            #  surface1 = "bcc0cc";
            #  surface0 = "ccd0da";
            #  base = "eff1f5";
            #  mantle = "e6e9ef";
            #  crust = "dce0e8";
            #};
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

            programs.zen-browser = {
                enable = true;
                policies = {
                    DisableAppUpdates = true;
                };
            };

            catppuccin.flavor = "mocha";

            # Imports of modules
            imports = [
                ./systems/Compootah/hyprland
                ./systems/Compootah/river

                ./home/bash.nix
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
                inputs.zen-browser.homeModules.twilight
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

        ./systems/x1c/etc.nix
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

            programs.zen-browser = {
                enable = true;
                policies = {
                    DisableAppUpdates = true;
                };
            };
            catppuccin.flavor = "mocha";

            # Imports of modules
            imports = [
                ./systems/x1c/hyprland
                ./systems/x1c/river

                ./home/bash.nix
                #./home/beets.nix
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
                #./home/rofi.nix
                ./home/theme.nix
                inputs.gBar.homeManagerModules.x86_64-linux.default 
                inputs.catppuccin.homeModules.catppuccin
                inputs.zen-browser.homeModules.twilight
            ];
          };
        }
      ];
    };
  };
}
