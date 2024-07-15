{ pkgs, ... }:
{
    # Dconf crashes without this when gtk is enabled, what???
    home.packages = [ pkgs.dconf ];
    home.pointerCursor = {
        name = "Catppuccin-Mocha-Dark-Cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
#name = "Bibata-Modern-Classic";
#package = pkgs.bibata-cursors;
        size = 24;
        gtk.enable = true;
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
            package = pkgs.nerdfonts;
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
        gtk3.extraConfig = {
            Settins = ''
                gtk-application-prefer-dark-theme=1
            '';
        };
        gtk4.extraConfig = {
            Settins = ''
                gtk-application-prefer-dark-theme=1
            '';
        };
    };

    home.sessionVariables.GTK_THEME = "catppuccin-mocha-lavender-standard";

    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.name = "adwaita-qt";
    };
}
