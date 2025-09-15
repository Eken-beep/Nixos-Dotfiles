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
        cantata
        mpc-cli
        ncmpcpp
        cuetools
        shntool
        flacon
        audacity

        signal-desktop
        discord
        freetube

        libreoffice-fresh

        imv
        pavucontrol

        qbittorrent
        nicotine-plus

        obs-studio

        picard

        tiled

        tex
        glow

        # Stooooph
        nix-tree

        pamixer
        imagemagick
        waypaper
        wmenu

        grim
        slurp
        ydotool
        ripgrep

        winePackages.stableFull
        playerctl
        filezilla
        lynx
        zathura
        spotdl

        socat
        jq
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
