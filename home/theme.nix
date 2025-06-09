{ pkgs, ... }:
let
    cursorThemeName = "catppuccin-latte-lavender-cursors";
    cursorPackage = pkgs.catppuccin-cursors.latteLavender;
    cursorSize = 32;
in {
    # Dconf crashes without this when gtk is enabled, what???
    home.packages = [ pkgs.dconf ];
    home.pointerCursor = {
        name = cursorThemeName;
        package = cursorPackage;
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
                flavor = "latte";
                accent = "lavender";
            };
            name = "Papirus-Light";
        };
        font = {
            name = "JetBrainsMono Nerd Font";
            package = pkgs.nerd-fonts.jetbrains-mono;
            size = 12;
        };
        theme = {
            name = "catppuccin-mocha-lavender-standard";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "lavender" ];
                size = "standard";
                variant = "latte";
            };
        };
        cursorTheme = {
            name = cursorThemeName;
            package = cursorPackage;
            size = cursorSize;
        };
    };

    catppuccin = {
        dunst = {
            enable = true;
            flavor = "latte";
        };
    };

    home.sessionVariables = {
        GTK_THEME = "catppuccin-latte-lavender-standard";
        XCURSOR_THEME = cursorThemeName;
        XCURSOR_SIZE = cursorSize;
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk3";
        style.name = "breeze";
    };
}
