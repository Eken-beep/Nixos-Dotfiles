{ config, ... }:
{
    services.mpd = {
        enable = true;
        musicDirectory = "/mnt/data/media/music/lib";
        user = "edvin";
        extraConfig = ''
            audio_output {
                type "pipewire"
                name "Pipewire output"
            }
        '';
    };
    systemd.services.mpd.environment = {
        # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
        XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.edvin.uid}";
    };
}
