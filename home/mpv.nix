{ pkgs, ... }:
{
    programs.mpv = {
        enable = true;
        scripts = with pkgs.mpvScripts; [
            thumbnail
            mpris
        ];
        config = {
        };
    };
}
