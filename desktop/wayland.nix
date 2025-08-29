{ pkgs, ... }:

{
    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-hyprland
            pkgs.xdg-desktop-portal-wlr
        ];
        config = {
            common = {
                default = [
                    "gtk"
                ];
            };
            river = {
                default = [ "gtk" ];

                "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
                "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];

                "org.freedesktop.impl.portal.Secret" = [
                    "gnome-keyring"
                ];
            };
            Hyprland = {
                default = [
                    "hyprland"
                ];
                "org.freedesktop.impl.portal.Secret" = [
                    "gnome-keyring"
                ];
            };
        };
    };

    environment = {
        # Variables
        variables = {
            EDITOR = "nvim";
        };
        pathsToLink = [ "/libexec" "/share/bash-completion" ];
        sessionVariables = rec {
            XDG_SESSION_TYPE = "wayland";
            XDG_CURRENT_DESKTOP = "river";
        };
    };
}
