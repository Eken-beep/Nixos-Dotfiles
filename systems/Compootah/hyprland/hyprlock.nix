{ colors, ... }:
{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                disable_loading_bar = true;
                immediate_render = true;
                hide_cursor = true;
            };

            animation = [
                "inputFieldDots, 1, 2, linear"
            ];

            background = [
                {
                    monitor = "";
                    path = "~/Pictures/walls/abstract-swirls.jpg";
                }
            ];

            input-field = [
                {
                    monitor = "DP-1";

                    size = "300, 50";
                    valign = "bottom";
                    position = "0%, 10%";
                    
                    outline_thickness = 3;
                    
                    font_color = "rgb(${colors.text})";
                    outer_color = "rgba(${colors.lavender}80)";
                    inner_color = "rgba(${colors.mantle}20)";
                    check_color = "rgba(${colors.flamingo})80";
                    fail_color = "rgba(${colors.red}80)";
                    
                    fade_on_empty = false;
                    placeholder_text = "Enter Password";
                    
                    dots_spacing = 0.2;
                    dots_center = true;
                    dots_fade_time = 100;
                    
                    shadow_color = "rgba(0, 0, 0, 0.1)";
                    shadow_size = 7;
                    shadow_passes = 2;
                }
            ];

            label = [
                {
                    monitor = "";
                    text = "$TIME";
                    font_size = 150;
                    color = "rgb(${colors.text})";

                    position = "0%, 30%";

                    valign = "center";
                    halign = "center";

                    shadow_color = "rgba(0, 0, 0, 0.1)";
                    shadow_size = 20;
                    shadow_passes = 2;
                    shadow_boost = 0.3;
                }
                {
                    monitor = "";
                    text = "cmd[update:3600000] date +'%a %b %d'";
                    font_size = 20;
                    color = "rgb(${colors.subtext1})";

                    position = "0%, 40%";

                    valign = "center";
                    halign = "center";

                    shadow_color = "rgba(0, 0, 0, 0.1)";
                    shadow_size = 20;
                    shadow_passes = 2;
                    shadow_boost = 0.3;
                }
            ];
        };
    };

    services.hypridle = {
        enable = true;

        settings = {
            general = {
                before_sleep_cmd = "loginctl lock-session";
                after_sleep_cmd = "hyprctl dispatch dpms on";
                ignore_dbus_inhibit = false;
                lock_cmd = "pidof hyprlock || hyprlock";
            };

            listener = [
                {
                    timeout = 600;
                    on-timeout = "loginctl lock-session";
                }
                {
                    timeout = 602;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
                {
                    timeout = 3600;
                    on-timeout = "systemctl suspend";
                }
            ];
        };
    };
}
