{pkgs,...}:
{
  programs.rofi = { 
    enable = true; 
    #package = pkgs.rofi-wayland; 
    theme = ./other/cloud.rasi; 
    extraConfig = { 
      font = "FiraCode Nerd Font 12"; 
      hide-scrollbar = true;
    };
  };
}
