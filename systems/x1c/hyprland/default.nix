{ pkgs, inputs, colors, ... }:

{
    imports = [
        ./gBar.nix
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
                "uwsm app -- kitty"
                "uwsm app -- firefox"
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
            in workspaces ++
                [
                # Compositor commands
                "$mod, C, killactive"
                "$mod, E, togglefloating"
                "$mod, F, fullscreen"
                "$mod SHIFT, X, exec, uwsm stop"

                "$mod CTRL, K, exec, sh -c ~/sysconfig/desktop/scripts/swap_keyboard.sh"

                # Layout
                "$mod, U, pseudo"
                "$mod, L, layoutmsg, togglesplit"
                "$mod, O, layoutmsg, focusmaster"
                "$mod, S, layoutmsg, swapwithmaster auto"
                "$mod, K, layoutmsg, addmaster"
                "$mod SHIFT, K, layoutmsg, removemaster"

                # Launchers
                "$mod, Return, exec, uwsm app -- kitty"
                "$mod, Space, exec, rofi -show drun -run-command 'uwsm app -- {cmd}'"
                "$mod SHIFT, R, exec, rofi -show run"

                # MPD
                "$mod, m, exec, mpc toggle"
                "$mod, n, exec, mpc next"
                "$mod SHIFT, n, exec, mpc prev"
                "$mod SHIFT, s, exec, mpc random"
                "$mod CTRL, s, exec, mpc single once"

                # Navigation
                "$mod, h, layoutmsg, cycleprev"
                "$mod, l, layoutmsg, cyclenext"

                "$mod, left, movefocus, l"
                "$mod, down, movefocus, d"
                "$mod, up, movefocus, u"
                "$mod, right, movefocus, r"

                "$mod SHIFT, h, resizeactive, -10,0"
                "$mod SHIFT, l, resizeactive, 10,0"

                "$mod SHIFT, left, resizeactive,-10,0"
                "$mod SHIFT, down, resizeactive,0,10"
                "$mod SHIFT, up, resizeactive,0,-10"
                "$mod SHIFT, right, resizeactive,10,0"
            ];

            # Built in keys need hold down thing sometimes
            bindel = [
                ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
                ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
            ];
            bindl = [
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
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
                follow_mouse = true;
                kb_layout = "cust,se";
                kb_variant = ",nodeadkeys";

                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 0.9;
                };
            };
            decoration = {
                active_opacity = 1;
                inactive_opacity = 1;
                fullscreen_opacity = 1;

                shadow = {
                    enabled = false;
                    color = "rgb(${colors.crust})";
                    range = 10;
                };

                dim_inactive = false;

                rounding = 10;

                blur = {
                    enabled = false;
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
                "w[tv1], gapsout:0, gapsin:0"
                "f[1], gapsout:0, gapsin:0"
            ];

            windowrule = [
                "bordersize 0, floating:0, onworkspace:w[tv1]"
                "rounding 0, floating:0, onworkspace:w[tv1]"
                "bordersize 0, floating:0, onworkspace:f[1]"
                "rounding 0, floating:0, onworkspace:f[1]"
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
        pkgs.brightnessctl

        inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
        inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad
    ];

    services.copyq.enable = true;
}
