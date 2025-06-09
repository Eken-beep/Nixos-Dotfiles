{ colors, ... }:
{
    wayland.windowManager.sway = {
        enable = true;
        swaynag.enable = true;

        config = {
            window = {
                titlebar = false;
                hideEdgeBorders = "smart";
            };
        };
    };
}
