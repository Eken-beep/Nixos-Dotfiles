{ pkgs, ... }:
{
    # Dconf crashes without this when gtk is enabled, what???
    home.packages = [ pkgs.dconf ];
    home.pointerCursor = {
        name = "Catppuccin-Mocha-Dark-Cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 16;
        gtk.enable = true;
    };

    gtk = {
        enable = true;
        iconTheme = {
            package = pkgs.catppuccin-papirus-folders.override {
                flavor = "mocha";
                accent = "sky";
            };
            name = "Papirus-Light";
        };
        font = {
            name = "FiraCode Nerd Font";
            package = pkgs.nerdfonts;
            size = 12;
        };
        theme = {
            name = "Catppuccin-Mocha-Standard-Sky-Dark";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "sky" ];
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

    home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Sky-Dark";

    qt = {
        enable = true;
        platformTheme = "gtk";
        style.name = "adwaita-qt";
    };
}
