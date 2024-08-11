{ pkgs, ... }:
{
    programs.beets = {
        enable = true;
        package = (pkgs.beets.override { pluginOverrides = {
            beatport.enable = true;
            scrub.enable = true;
        }; });
        settings = {};
    };
}
