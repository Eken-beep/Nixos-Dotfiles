{ pkgs, colors, ... }:

{
     # Xorg and graphical stuff
    services.xserver = {
        enable = true;

        videoDrivers = [ "modesetting" ];

        # Keymap
        xkb = {
            layout = "us";
            variant = "altgr-intl";
        };
    };

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    services.xserver.displayManager = {
        lightdm.enable = false;
    };

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;

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
