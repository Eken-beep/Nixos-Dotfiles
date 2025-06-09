#!/bin/sh

if [ -z "$WAYLAND_DISPLAY" ] && [ $(tty) = "/dev/tty1" ]; then
    exec dbus-run-session river
fi
