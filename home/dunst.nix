{ pkgs, config, ... }:

{
  services.dunst = {
    enable = true;

    iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
    };

    settings = {
      global = {
        width = 400;
        height = "(0, 500)";
        origin = "top-right";
        offset = "25x25";
        corner_radius = 16;

        follow = "keyboard";
        sort = "yes";

        frame_color = "#89dceb";
        frame_width = 3;
        font = "FiraCode Nerd Font 12";
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#94e2d5";
        timeout = 6;
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 10;
      };
      urgency_critical = {
          background = "#1e1e2e";
          foreground = "#f38ba8";
          frame_color = "#f38ba8";
          timeout = 0;
      };
    };
  };
}
