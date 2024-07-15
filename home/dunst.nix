{ pkgs, config, ... }:

{
  services.dunst = {
    enable = true;

    iconTheme = {
        name = "Papirus-Light";
        package = pkgs.papirus-icon-theme;
    };

    catppuccin.enable = true;
    catppuccin.flavor = "mocha";

    settings = {
      global = {
        width = 400;
        height = "(0, 500)";
        origin = "top-right";
        offset = "25x25";
        corner_radius = 16;

        follow = "keyboard";
        sort = "yes";

        frame_width = 3;
        font = "FiraCode Nerd Font 12";
      };
    };
  };
}
