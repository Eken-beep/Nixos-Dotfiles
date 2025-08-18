{ lib, ... }:
{
    options = {
        mpd.path = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
        };
        consoleKeymap = lib.mkOption {
            type = lib.types.str;
            default = "us";
        };
        enableTlp = lib.mkOption {
            type = lib.types.bool;
            default = false;
        };
    };
}
