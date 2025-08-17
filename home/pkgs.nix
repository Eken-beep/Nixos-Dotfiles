{ pkgs, pkgs-old, config, ... }:
let
    tex = (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-full
            csquotes
            biblatex;
    });
in {
    # Programs
    home.packages = with pkgs; [
        # Games
        prismlauncher
        cubiomes-viewer

        # Gui stuff
        chromium

        amberol
        pkgs-old.cantata
        mpc-cli
        ncmpcpp
        cuetools
        shntool
        flacon
        audacity

        signal-desktop
        discord
        freetube
        catgirl

        libreoffice-fresh

        imv
        pavucontrol

        qbittorrent
        nicotine-plus

        obs-studio
        arduino

        picard

        tiled

        tex
        glow
        notepadqq

        # Stooooph
        pamixer
        swaylock
        imagemagick
        waypaper
        wmenu

        grim
        slurp
        ydotool
        ripgrep

        lxappearance 
        libsForQt5.qt5ct

        winePackages.stableFull
        playerctl
        filezilla
        lynx
        zathura
        spotdl

        socat
        jq
        python3Full
        pfetch
        ranger
        unzip
        zlib
        pkg-config
        yt-dlp
        sshfs
        ffmpeg
        tree
        trash-cli
        unar
        (pkgs.fortune.override{ withOffensive = true; })
        figlet
        neo-cowsay
        sqlitebrowser

        stdmanpages
        cabal-install
        perl
        lua
        lua54Packages.luarocks-nix
        zig
        nodejs
    ];
    programs.java = {
        enable = true;
        package = pkgs.jdk;
    };

    # Allow unfree software
    nixpkgs.config.allowUnfree = true;
}
