{ config, pkgs, ... }:

{
   # Xorg and graphical stuff
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = false;

    videoDrivers = [ "modesetting" ];

    # Keymap
    xkb = {
        layout = "us";
        variant = "altgr-intl";
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;

  xdg.portal.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
