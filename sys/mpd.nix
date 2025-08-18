{ config, lib, ... }:
{
    services.mpd = {
        enable = lib.mkIf (config.mpd.path != null) true;
        musicDirectory = (if (config.mpd.path != null)
                           then config.mpd.path
                           else "");
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
