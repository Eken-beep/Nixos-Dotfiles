{pkgs,...}:

{
  programs.waybar = { 
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        height = 800;
        width = 70;
        output = [
          "DP-1"
          "DP-2"
        ];
        margin-left = 20;
        modules-left = [ "cpu" "custom/space" "memory" ];
        modules-center = [ "wlr/workspaces" ];
        modules-right = [ "clock" ];
  
        "wlr/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          on-click = "activate";
          active-only = false;
          format-icons = {
            "default" = "";
            "active" = "";
          };
          
        };

        "custom/space" = {
          format = " ";
          tooltip = false;
        };

        "clock" = {
          format = "{:%H\n%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          };

        "hyprland/window" = {
          seperate-outputs = true;
        };

        "cpu" = {
          format = "{usage}%";
        };
      };
    };
    style = builtins.readFile ./other/waybar.css;
  }; 
}

