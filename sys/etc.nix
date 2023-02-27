{ config, pkgs, ... }:

{
  environment = {
    # Variables
    variables = {
      EDITOR = "nvim";
    };
    pathsToLink = [ "/libexec" ];
    sessionVariables = rec {
      LIBVA_DRIVER_NAME="nvidia";
      XDG_SESSION_TYPE="wayland";
      #GBM_BACKEND="nvidia-drm";
      #__GLX_VENDOR_LIBRARY_NAME="nvidia";
      WLR_NO_HARDWARE_CURSORS="1";
    };
  };

  # Something
  security.rtkit.enable = true;

  # Unfree software and flakes
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # extra Services
  services = {
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    openssh.enable = true;

    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    flatpak.enable = true;
    ratbagd.enable = true;
  };
}
