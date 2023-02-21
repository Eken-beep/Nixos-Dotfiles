{ pkgs, config, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 500;
        height = 200;
        origin = "top-right";
        offset = "8x8";
        corner_radius = 12;

        follow = "keyboard";

        frame_color = "#3d85c6";
        frame_width = 4;
        font = "Iosevka Nerd Font 12";
      };

      urgency_normal = {
        background = "#1f1f1f";
        foreground = "#dfdfdf";
        timeout = 10;
      };
    };
  };
}
