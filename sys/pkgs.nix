{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        dbus-broker
        dbus
        vim  
        wget
        libnotify
        killall
        zip
        gzip
        gcc
        btop
        xdotool
        piper
        xterm
        qmk
        qmk-udev-rules
        nautilus
        totem
        file-roller
        libimobiledevice
        ifuse
        stdmanpages
        man-pages-posix
    ];

    programs.steam = {
      enable = true;
    };

    # Fonts
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        fira-code
        fira-code-symbols
        jetbrains-mono
        dina-font
        proggyfonts
        font-awesome
        nerd-fonts.fira-code
        work-sans
        source-sans
        public-sans
        roboto
        roboto-mono
        roboto-slab
        go-font
        sudo-font
        hack-font
        freefont_ttf
        ttf_bitstream_vera
        jost
    ];

    documentation = {
        enable = true;
        man.enable = true;
        dev.enable = true;
    };

    nixpkgs.overlays = [
        (final: prev: {
            qt6Packages = prev.qt6Packages.overrideScope (_: kprev: {
                qt6gtk2 = kprev.qt6gtk2.overrideAttrs (_: {
                    version = "0.5-unstable-2025-03-04";
                    src = final.fetchFromGitLab {
                        domain = "opencode.net";
                        owner = "trialuser";
                        repo = "qt6gtk2";
                        rev = "d7c14bec2c7a3d2a37cde60ec059fc0ed4efee67";
                        hash = "sha256-6xD0lBiGWC3PXFyM2JW16/sDwicw4kWSCnjnNwUT4PI=";
                    };
                });
            });
        })
    ];

    # System version no toucha
    system.stateVersion = "22.05";
}
