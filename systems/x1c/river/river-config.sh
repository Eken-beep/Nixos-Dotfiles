riverctl spawn "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
riverctl spawn "systemctl --user start xdg-desktop-portal-wlr"
riverctl spawn "systemctl --user start xdg-desktop-portal-gtk"

layout=rivercarro

wmenu_color="-M 11111b -m cdd6f4 -N 1e1e2e -n cdd6f4 -S cba6f4 -s 11111b -f 'JetbrainsMono Nerd Font 12'"

riverctl spawn '~/sysconfig/systems/x1c/river/swaylock.sh'

riverctl map normal Super Return spawn kitty

riverctl map normal Super C close

riverctl map normal Super+Control X exit

riverctl map normal Super Space spawn "wmenu-run -b -p run: $wmenu_color"
riverctl map normal Super+Shift Space spawn 'fuzzel'

riverctl map normal Super P spawn 'grim -g "$(slurp)" | wl-copy'

riverctl map normal Super J focus-view next
riverctl map normal Super K focus-view previous

riverctl map normal Super+Shift J swap next
riverctl map normal Super+Shift K swap previous

riverctl map normal Super I focus-output next

riverctl map normal Super+Shift I send-to-output next

# Super+Return to bump the focused view to the top of the layout stack
riverctl map normal Super A zoom

# Layout
riverctl map normal Super H send-layout-cmd $layout "main-ratio -0.05"
riverctl map normal Super L send-layout-cmd $layout "main-ratio +0.05"

riverctl map normal Super+Shift H send-layout-cmd $layout "main-count +1"
riverctl map normal Super+Shift L send-layout-cmd $layout "main-count -1"

riverctl map normal Super E toggle-float

riverctl map normal Super F toggle-fullscreen
riverctl map normal Super+Shift F send-layout-cmd $layout "main-location monocle"
riverctl map normal Super Tab       send-layout-cmd $layout "main-location-cycle left,monocle"
riverctl map normal Super+Shift Tab send-layout-cmd $layout "main-location-cycle right,monocle"

riverctl map normal Super Up    send-layout-cmd $layout "main-location top"
riverctl map normal Super Right send-layout-cmd $layout "main-location right"
riverctl map normal Super Down  send-layout-cmd $layout "main-location bottom"
riverctl map normal Super Left  send-layout-cmd $layout "main-location left"

# Super+Alt+{H,J,K,L} to move views
riverctl map normal Super+Alt H move left 100
riverctl map normal Super+Alt J move down 100
riverctl map normal Super+Alt K move up 100
riverctl map normal Super+Alt L move right 100

# Super+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right

# Super+Alt+Shift+{H,J,K,L} to resize views
riverctl map normal Super+Alt+Shift H resize horizontal -100
riverctl map normal Super+Alt+Shift J resize vertical 100
riverctl map normal Super+Alt+Shift K resize vertical -100
riverctl map normal Super+Alt+Shift L resize horizontal 100

# Super + Left Mouse Button to move views
riverctl map-pointer normal Super BTN_LEFT move-view

# Super + Right Mouse Button to resize views
riverctl map-pointer normal Super BTN_RIGHT resize-view

# Super + Middle Mouse Button to toggle float
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))

    # Super+[1-9] to focus tag [0-8]
    riverctl map normal Super $i set-focused-tags $tags

    # Super+Shift+[1-9] to tag focused view with tag [0-8]
    riverctl map normal Super+Shift $i set-view-tags $tags

    # Super+Control+[1-9] to toggle focus of tag [0-8]
    riverctl map normal Super+Control $i toggle-focused-tags $tags

    # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
    riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
done

# Super+0 to focus all tags
# Super+Shift+0 to tag focused view with all tags
all_tags=$(((1 << 32) - 1))
riverctl map normal Super 0 set-focused-tags $all_tags
riverctl map normal Super+Shift 0 set-view-tags $all_tags

# Declare a passthrough mode. This mode has only a single mapping to return to
# normal mode. This makes it useful for testing a nested wayland compositor
riverctl declare-mode passthrough

# Super+F11 to enter passthrough mode
riverctl map normal Super F11 enter-mode passthrough

# Super+F11 to return to normal mode
riverctl map passthrough Super F11 enter-mode normal

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
for mode in normal locked
do
    # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
    riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
    riverctl map $mode None XF86AudioNext  spawn 'playerctl next'

    riverctl map $mode None XF86AudioRaiseVolume spawn 'wpctl set-volume -l "1.0" @DEFAULT_AUDIO_SINK@ 5%+'
    riverctl map $mode None XF86AudioLowerVolume spawn 'wpctl set-volume -l "1.0" @DEFAULT_AUDIO_SINK@ 5%-'

    riverctl map $mode None XF86AudioMute spawn 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'
    riverctl map $mode None XF86AudioMicMute spawn 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'

    # Control screen backlight brightness with brightnessctl (https://github.com/Hummer12007/brightnessctl)
    riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +5%'
    riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
done

###### MPD shortcuts
riverctl map normal Super M spawn "mpc toggle"
riverctl map normal Super N spawn "mpc next"
riverctl map normal Super+Shift N spawn "mpc prev"

###### Window rules
riverctl rule-add -app-id "*" ssd
riverctl rule-add -app-id "bar" csd

##### Other junk
riverctl focus-follows-cursor always
riverctl set-cursor-warp on-focus-change
riverctl hide-cursor when-typing enabled

riverctl set-repeat 50 300

# Maintain this file so that slstatus can get the current layout
riverctl keyboard-layout cust
riverctl spawn 'printf "dvorak" > ~/keyboardlayout'

riverctl spawn "dunst"
riverctl spawn "kitty"
riverctl spawn 'zen-twilight'
riverctl spawn "signal-desktop"

#riverctl spawn '/home/edvin/projects/slstatus/result/bin/slstatus -s | /home/edvin/projects/creek/result/bin/creek -sao -nf 0xcdd6f4 -nb 0x1e1e2e -ff 0x11111b -fb 0xb4befe -fn "JetbrainsMono Nerd Font:size=14"'
riverctl spawn '/home/edvin/projects/slstatus/result/bin/slstatus -s | sandbar -font "JetbrainsMono Nerd Font:size=14" -active-fg-color "#1e1e2e" -active-bg-color "#89b4fa" -inactive-fg-color "#cdd6f4" -inactive-bg-color "#1e1e2e" -title-fg-color "#1e1e2e" -title-bg-color "#cba6f7" -urgent-fg-color "#1e1e2e" -urgent-bg-color "#f38ba8"'

riverctl default-layout $layout
rivercarro &
