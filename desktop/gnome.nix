{ config, pkgs, ... }:

{
  services.xserver = {
    # WM, DE and displaymanager
    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };

    displayManager = {
      gdm.enable = true;
    };
  };

  # Extensions
  environment.systemPackages = with pkgs; [
    gtk-engine-murrine
    gnome.gnome-tweaks
    gnome.gnome-themes-extra
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    gnomeExtensions.paperwm
    gnomeExtensions.extension-list
    gnomeExtensions.workspace-indicator-2
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.gsconnect
    gnomeExtensions.dash-to-dock
    gnomeExtensions.material-shell
  ];

  environment = {
    # Variables
    variables = {
      EDITOR = "nvim";
    };
    pathsToLink = [ "/libexec" ];
    sessionVariables = rec {
      XDG_SESSION_TYPE="wayland";
    };
  };

  qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
  };
}
