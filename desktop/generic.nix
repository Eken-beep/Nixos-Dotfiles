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

    services.displayManager = {
        sessionPackages = [ pkgs.hyprland ];
        ly.enable = true;
        ly.settings = {
            bg = "0x00" + colors.base;
            fg = "0x00" + colors.text;
            border_fg = "0x00" + colors.blue;
            login_cmd = ''export XDG_CURRENT_DESKTOP=Hyprland; exec "$@" '';
        };
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
