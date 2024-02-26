{pkgs,...}:
{
  programs.rofi = { 
    enable = true; 
    package = pkgs.rofi-wayland; 
    theme = ./other/mocha.rasi; 
    extraConfig = { 
      modi = "run,drun";
      font = "FiraCode Nerd Font 12"; 
      hide-scrollbar = true;
      terminal = "kitty";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = "   Apps ";
      display-run = "   Run ";
    };
  };
}
