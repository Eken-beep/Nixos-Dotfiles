#!/bin/sh

keyboard_name="at-translated-set-2-keyboard"
hyprctl switchxkblayout at-translated-set-2-keyboard next
new_keyboard=$(hyprctl devices | grep $keyboard_name -A 2 | tail -n1)
notify-send "${new_keyboard}"
