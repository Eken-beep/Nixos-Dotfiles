{ pkgs, ... }:
{
    programs.mpv = {
        enable = true;
        scripts = with pkgs.mpvScripts; [
            thumbnail
            mpris
            uosc
        ];
        config = {
            osc = "no";
            osd-bar="no";
        };
    };
}
