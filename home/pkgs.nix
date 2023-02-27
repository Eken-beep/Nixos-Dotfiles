{ pkgs, ... }:
{
  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

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
