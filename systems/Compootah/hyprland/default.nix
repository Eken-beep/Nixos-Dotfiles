{ pkgs, inputs, colors, ... }:

{
    imports = [
        ./hyprlock.nix
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
            exec-once = [
                "uwsm finalize"
                "swww-daemon"
                "gBar bar 0"
                "gBar bar 1"
                "uwsm app -- kitty"
                "uwsm app -- flatpak run app.zen_browser.zen"
                "uwsm app -- signal-desktop"
            ];

            env = [
                "HYPRCURSOR_THEME,catppuccin-mocha-dark-cursors"
                "HYPRCURSOR_SIZE,32"
            ];

            "$mod" = "SUPER";

            bind = let
                workspaces = builtins.concatLists (builtins.genList (
                    x:
                    let
                        ws = toString (x + 1);
                    in [
                        "$mod, ${ws}, workspace, ${ws}"
                        "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
                    ]
                ) 9);
            in workspaces ++ [
                "$mod, D, exec, uwsm app -- kitty"
                "$mod, G, killactive"
                "$mod, X, exec, uwsm stop"
                "$mod, E, togglefloating"
                "$mod, F, fullscreen"
                "$mod, R, exec, rofi -show drun -run-command 'uwsm app -- {cmd}'"
                "$mod SHIFT, R, exec, rofi -show run"
                "$mod, U, pseudo"
                "$mod, L, layoutmsg, togglesplit"
                "$mod, I, layoutmsg, focusmaster"
                "$mod, S, layoutmsg, swapwithmaster master"
                "$mod, K, layoutmsg, addmaster"
                "$mod SHIFT, K, layoutmsg, removemaster"

                "$mod, m, exec, mpc toggle"
                "$mod, n, exec, mpc next"
                "$mod SHIFT, n, exec, mpc prev"
                "$mod SHIFT, s, exec, mpc random"
                "$mod CTRL, s, exec, mpc single once"

                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                "$mod SHIFT, left, resizeactive,-10,0"
                "$mod SHIFT, right, resizeactive,10,0"
                "$mod SHIFT, up, resizeactive,0,-10"
                "$mod SHIFT, down, resizeactive,0,10"
            ];
            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];
            general = {
                gaps_in = 10;
                gaps_out = 20;
                border_size = 3;
                "col.active_border" = "rgb(${colors.red}) rgb(${colors.mauve}) rgb(${colors.lavender}) rgb(${colors.green}) rgb(${colors.yellow}) 23deg";
                "col.inactive_border" = "rgb(${colors.blue})";

                layout = "master";
            };
            input = {
                kb_layout = "us";
                kb_variant = "altgr-intl";
                follow_mouse = true;
            };
            decoration = {
                active_opacity = 0.92;
                inactive_opacity = 0.8;
                fullscreen_opacity = 1;

                shadow = {
                    enabled = true;
                    color = "rgb(${colors.crust})";
                    range = 10;
                };

                dim_inactive = false;

                rounding = 10;

                blur = {
                    enabled = true;
                    size = 8;
                    passes = 2;
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
            master.new_status = "master";

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
                "workspace 7,class:^(discord)$"
                "workspace 7,class:^(Signal)$"
                "float,class:^(Paradox Launcher)$"
            ];
            windowrulev2 = [
                "opacity 1.0 override 0.75 override, floating:1"
                "opacity 1.0 override, workspace:4"
            ];
        };
        extraConfig = ''
            bind = $mod, P, exec, grim -g "$(slurp)" - | wl-copy
            bind = $mod SHIFT, P, exec, grim -g "$(slurp)"
        '';
    };

    programs.gBar = {
        enable = true;
        config = {
            CPUThermalZone = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input";
            Location = "T";
            SuspendCommand = "systemctl suspend";
            LockCommand = "loginctl lock-session";
            ExitCommand = "uwsm stop";
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
                " "
                " "
            ];
        };
        extraConfig = ''
            WidgetsLeft: [Workspaces]

            WidgetsCenter: [Time]

            WidgetsRight: [Audio, Bluetooth, Network, Disk, VRAM, GPU, RAM, CPU, Power]
        '';
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
        pkgs.swww
        pkgs.hyprpicker

        inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
        inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad
    ];

    services.copyq.enable = true;
}
