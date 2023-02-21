{ config, pkgs, ... }:

{
   # Xorg and graphical stuff
  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];

    # Keymap
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  # Wlroots portal for hyprland
  xdg.portal.wlr.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
}
