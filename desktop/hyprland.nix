{ pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
          exec-once = [
              "hyprpaper"
              "gBar bar 0"
              "gBar bar 1"
              "kitty"
              "firefox"
              "signal-desktop-beta"
          ];

          "$mod" = "SUPER";

          bind = [
              "$mod, D, exec, kitty"
              "$mod, G, killactive"
              "$mod, X, exit"
              "$mod, E, togglefloating"
              "$mod, F, fullscreen"
              "$mod, R, exec, rofi -show drun"
              "$mod SHIFT, R, exec, rofi -show run"
              "$mod, U, pseudo"
              "$mod, L, togglesplit"

              "$mod, left, movefocus, l"
              "$mod, right, movefocus, r"
              "$mod, up, movefocus, u"
              "$mod, down, movefocus, d"

              "$mod SHIFT, left, resizeactive,-10,0"
              "$mod SHIFT, right, resizeactive,10,0"
              "$mod SHIFT, up, resizeactive,0,-10"
              "$mod SHIFT, down, resizeactive,0,10"

              "$mod, 1, workspace, 1"
              "$mod, 2, workspace, 2"
              "$mod, 3, workspace, 3"
              "$mod, 4, workspace, 4"
              "$mod, 5, workspace, 5"
              "$mod, 6, workspace, 6"
              "$mod, 7, workspace, 7"
              "$mod, 8, workspace, 8"
              "$mod, 9, workspace, 9"

              "$mod SHIFT, 1, movetoworkspace, 1"
              "$mod SHIFT, 2, movetoworkspace, 2"
              "$mod SHIFT, 3, movetoworkspace, 3"
              "$mod SHIFT, 4, movetoworkspace, 4"
              "$mod SHIFT, 5, movetoworkspace, 5"
              "$mod SHIFT, 6, movetoworkspace, 6"
              "$mod SHIFT, 7, movetoworkspace, 7"
              "$mod SHIFT, 8, movetoworkspace, 8"
              "$mod SHIFT, 9, movetoworkspace, 9"
          ];
          bindm = [
              "$mod, mouse:272, movewindow"
              "$mod, mouse:273, resizewindow"
          ];
          general = {
              gaps_in = 5;
              gaps_out = 15;
              border_size = 3;
              "col.active_border" = "rgb(89b4fa) rgb(b4befe) 23deg";
              "col.inactive_border" = "rgb(45475a)";
   
              layout = "dwindle";
          };
          input = {
              kb_layout = "us";
              kb_variant = "altgr-intl";
              follow_mouse = true;
          };
          decoration = {
              active_opacity = 1;
              inactive_opacity = 1;
              fullscreen_opacity = 1;

              drop_shadow = true;
              shadow_range = 5;
              shadow_render_power = 4;

              dim_inactive = true;
              dim_strength = 0.2;
             
              rounding = 15;

              blur = {
                  enabled = true;
                  size = 20;
                  passes = 3;
              };
          };
          animations = {
              enabled = true;

              bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

              animation = [
                  "windows, 1, 7, default"
                  "windowsOut, 1, 7, default, popin 80%"
                  "border, 1, 10, default"
                  "fade, 1, 7, default"
                  "workspaces, 1, 6, default"
              ];
          };

          dwindle = {
              pseudotile = true;
              preserve_split = true;
          };
          master.new_is_master = true;

          monitor = [
              "DP-1,3440x1440@144,0x0,1"
              "DP-2,1920x1200@60,3440x120,1"
              ",preferred,auto,1"
          ];

          workspace = [
              "7, monitor:DP-2, defalut:true"
              "8, monitor:DP-2"
              "9, monitor:DP-2"
          ];

          windowrule = [
              "rounding[0],class:^(gBar)$,title:^(gBar)$"
              "workspace 7,class:^(discord)$"
              "workspace 7,class:^(Signal)$"
              "float,class:^(Paradox Launcher)$"
          ];
      };
      extraConfig = ''
          bind = $mod, P, exec, grim -g "$(slurp)" - | wl-copy
      '';
  };

  programs.gBar = {
    enable = true;
    config = {
        CPUThermalZone = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input";
        Location = "T";
        SuspendCommand = "systemctl suspend";
        LockCommand = "swaylock";
        ExitCommand = "killall Hyprland";
        DateTimeStyle = "%a %D %H:%M:%S";
        CenterTime = true;
        DiskPartition = "/home/";

        AudioRevealer = false;
        AudioInput = true;
        AudioMinVolume = 0;
        AudioMaxVolume = 6;

        EnableSNI = false;

        NetworkWidget = true;
        NetworkAdapter = "enp0s31f6";

        NumWorkspaces = 9;
        UseHyprlandIPC = true;
        WorkspaceSymbols = [
            " "
            " "
            " "
            " "
            " "
            " "
            " "
            " "
            " "
        ];
    };
    extraCSS = builtins.readFile ./gBar.css;
  };

  programs.swaylock.settings = {
    indicator-radius = 100;
    font-size = 24;
    color = "808080";
    line-color = "ffffff";
  };

  home.packages = [
      pkgs.wl-clipboard
      pkgs.nwg-look
      pkgs.nwg-dock-hyprland
      pkgs.nwg-drawer
      pkgs.nwg-panel

      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad
  ];

  services.copyq.enable = true;

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload=/home/edvin/Pictures/What_the_windows.png

    wallpaper=DP-1,/home/edvin/Pictures/What_the_windows.png
    wallpaper=DP-2,/home/edvin/Pictures/What_the_windows.png
  '';
}
