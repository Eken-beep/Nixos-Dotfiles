{ config, pkgs, ... }: {
  # Home manager version
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Enabling playerctl to control videos and music with the mediakeys
  services.playerctld.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  # Imports of modules
  imports = [
      ./dunst.nix 
      ./fish.nix
      ./git.nix 
      ./kitty.nix 
      ./neovim.nix 
      ./picom.nix 
      ./rofi.nix
      ./waybar.nix
  ];

  # Programs
  home.packages = with pkgs; [
    # Games
    prismlauncher
    steam
    lutris
    amidst
    cubiomes-viewer
    minecraft
    heroic
    grapejuice
    superTux
    superTuxKart

    # Gui stuff
    firefox
    chromium

    spotify
    spicetify-cli

    tdesktop
    signal-desktop
    discord
    discocss

    gimp
    kdenlive

    feh
    pavucontrol

    vscode

    qbittorrent

    obs-studio
    arduino
     
    libreoffice

    freetube

    keepassxc

    kicad

    boxes

    # Stooooph
    hyprpaper
    pscircle
    libsForQt5.qtstyleplugin-kvantum
    flameshot
    lxappearance 
    wine
    playerctl
    filezilla

    socat
    jq
    python3Full
    pfetch
    neofetch
    ranger
    tetex
    unzip
    zlib
    pkg-config
    python310Packages.youtube-dl
    
    cabal-install
    ghc

    papirus-icon-theme
    papirus-folders
  ];
}
