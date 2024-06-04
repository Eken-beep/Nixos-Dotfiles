{ pkgs, ... }:
{
    # Allow unfree software
    nixpkgs.config.allowUnfree = true;

     nixpkgs.config.permittedInsecurePackages = [
      "freeimage-unstable-2021-11-01"
    ];
 
    # Programs
    home.packages = with pkgs; [
        # Games
        prismlauncher
        cubiomes-viewer
        minetest
        retroarch
        libretro.np2kai
        #dolphin-emu
        grapejuice
        (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
            enableIntro = false;
            enableFPS = true;
        })
       
        # Gui stuff
        chromium
        floorp
       
        amberol
        strawberry
        cuetools
        shntool
        flacon
        sox
        audacity
       
        tdesktop
        signal-desktop
        signal-desktop-beta
        discord
        element
       
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

        texmaker
        glow
        lapce
        jetbrains.idea-community

        distrobox
       
        # Stooooph
        hyprpaper
        pamixer
        pscircle
        swaylock
       
        grim
        slurp
        flameshot
       
        lxappearance 
        libsForQt5.qt5ct
       
        winePackages.stableFull
        playerctl
        filezilla
        lynx
       
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
        yt-dlp
        sshfs
        ffmpeg
        tree
        trash-cli
        unar
       
        neovim-gtk
        
        cabal-install
        ghc
        cargo
        rustc
        lua
        lua54Packages.luarocks-nix
        love
        zig
    ];
    programs.java = {
        enable = true;
        package = pkgs.jdk19;
    };
}
