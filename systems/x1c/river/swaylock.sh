#!/bin/sh

swayidle \
    timeout 300 'brightnessctl -s set 10' \
            resume 'brightnessctl -r' \
    timeout 360 'wlopm --off \*;pidof hyprlock || hyprlock' \
            resume 'wlopm --on \*' \
    timeout 1800 'systemctl-suspend' \
    before-sleep 'wlopm --off \*;pidof hyprlock || hyprlock' \
    after-resume 'wlopm --on \*' &
