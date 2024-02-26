{ pkgs, ... }:

{
  xdg.portal = {
      enable = true;
      extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-hyprland
      ];
      config = {
          common = {
              default = [
                  "gtk"
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
    pathsToLink = [ "/libexec" ];
    sessionVariables = rec {
      XDG_SESSION_TYPE = "wayland";
    };
  };

  qt = {
      enable = true;
      platformTheme = "gtk2";
      style = "adwaita";
  };
}
