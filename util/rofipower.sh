# start dmenu (a program launcher)
#bindsym $mod+d exec --no-startup-id dmenu_run
# A more modern dmenu replacement is rofi:
#bindsym $mod+d rofi -modi drun,run -show drun
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop

rofi -show p -modi p:rofi-power-menu \
#  -theme ~/.config/rofi/themes/paper \
#  -font "JetBrains Mono NF 16" \
#  -width 20 \
#  -lines 6


#rofi -show combi 
#-display-drun


