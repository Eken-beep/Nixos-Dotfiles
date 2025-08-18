#!/bin/sh

case "$(cat ~/keyboardlayout)" in
    "dvorak")
        riverctl keyboard-layout se
        echo "se" > ~/keyboardlayout ;;
    "se")
        riverctl keyboard-layout cust
        echo "dvorak" > ~/keyboardlayout
esac

notify-send "Keyboard layout changed!"
