{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerdfonts;
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    
    theme = "Catppuccin-Mocha";

    keybindings = {
        "alt+j" = "previous_window";
        "alt+k" = "next_window";
        "alt+shift+j" = "move_window_backward";
        "alt+shift+k" = "move_window_forward";
    };

    settings = {
        hide_window_decorations = "no";
        wayland_titlebar_color = "#11111b";
    };
  };
}
