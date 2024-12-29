{ pkgs, pkgs-old, inputs, ... }:
let
    tex = (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-full
            csquotes
            biblatex;
    });
in {
    # Allow unfree software
    nixpkgs.config.allowUnfree = true;
 
    # Programs
    home.packages = with pkgs; [
        # Games
        prismlauncher
        cubiomes-viewer
        minetest
        retroarch
        libretro.np2kai
        #dolphin-emu
        (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
            enableIntro = false;
            enableFPS = true;
        })
       
        # Gui stuff
        inputs.zen-browser.packages."${system}".specific
        chromium
       
        amberol
        deadbeef
        strawberry
        pkgs-old.cantata
        mpc-cli
        ncmpcpp
        cuetools
        shntool
        flacon
        sox
        audacity
       
        tdesktop
        signal-desktop
        discord
        element
        freetube
       
        gimp
        kdenlive
        krita
       
        megasync

        libreoffice-fresh
       
        imv
        pavucontrol
       
        qbittorrent
        nicotine-plus
       
        obs-studio
        handbrake
        arduino
       
        vocal
       
        keepassxc
        protonvpn-gui
       
        szyszka
        picard
       
        tiled

        tex
        glow
        lapce
        jetbrains.idea-community
        notepadqq

        distrobox
       
        # Stooooph
        hyprpaper
        pamixer
        pscircle
        swaylock
        imagemagick
       
        grim
        slurp
        flameshot
        ydotool
        ripgrep
       
        lxappearance 
        libsForQt5.qt5ct
        gparted
       
        winePackages.stableFull
        playerctl
        filezilla
        lynx
        zathura
       
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
       
        neovim-gtk
        
        cabal-install
        ghc
        perl
        cargo
        rustc
        lua
        lua54Packages.luarocks-nix
        love
        zig
        nodejs
        netlify-cli
    ];
    programs.java = {
        enable = true;
        package = pkgs.jdk;
    };
}
