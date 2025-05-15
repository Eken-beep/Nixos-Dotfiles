{ pkgs, ... }:
let
    cursorThemeName = "catppuccin-mocha-dark-cursors";
    cursorSize = 32;
in {
    # Dconf crashes without this when gtk is enabled, what???
    home.packages = [ pkgs.dconf ];
    home.pointerCursor = {
        name = cursorThemeName;
        package = pkgs.catppuccin-cursors.mochaDark;
#name = "Bibata-Modern-Classic";
#package = pkgs.bibata-cursors;
        size = cursorSize;
        gtk.enable = true;
        x11.enable = true;
    };

    gtk = {
        enable = true;
        iconTheme = {
            package = pkgs.catppuccin-papirus-folders.override {
                flavor = "mocha";
                accent = "lavender";
            };
            name = "Papirus-Light";
        };
        font = {
            name = "FiraCode Nerd Font";
            package = pkgs.nerd-fonts.fira-code;
            size = 12;
        };
        theme = {
            name = "catppuccin-mocha-lavender-standard";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "lavender" ];
                size = "standard";
                variant = "mocha";
            };
        };
        cursorTheme = {
            name = cursorThemeName;
            package = pkgs.catppuccin-cursors.mochaDark;
            size = cursorSize;
        };
    };

    catppuccin = {
        dunst = {
            enable = true;
            flavor = "mocha";
        };
    };

    home.sessionVariables = {
        GTK_THEME = "catppuccin-mocha-lavender-standard";
        XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
        XCURSOR_SIZE = 32;
    };

    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.name = "breeze";
    };
}
