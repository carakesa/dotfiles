# i3wm Settings

These are cobbled together from various sources to include the Manjaro and EndeavourOS i3 configs.  
Current config uses bumblebee-status-git instead of i3 blocks.



20 June 2022   It works!  


Breakdown
  /autostart -- Discord, Firewall Applet, Geary on login
  /config
	/bwm -- bitwarden menu.  Just a skeleton
	/dunst -- mostly a skeleton. Don't remember any custom changes
	/i3 -- This is the important stuff!  Includes scripts from Distro installs.  Some stragglers/optional configs.
		keybindings refernces defaults from Endeavour, needs corrected.
	/i3blocks - Endeavouros Config, not currently used
	/kitty - kitty terminal
	/mpd  - stil defaults
	/nitrogen - set wallpapers; probably don't need this in the dotfiles
	picom.conf - picom compositor, dim inactive, set transparencies, etc
	/ranger - still defaults
	/rofi - power menus, run commands,  and things.  pretty nifty
	/terminology - another terminal emulator.
	/tmux -- Needs fixed
	/volumeicon -- it's a terminal based volume icon; might be redundant.
	/xfce4 -- EndeavourOS xfce4 terminal configs		
 
 /conky -- currently useless
 ctags -- not currently integrated
 dircolors  -- assign colors to filetypes.  Currently stragglers?
 dir_colors -- assign colors to filetypes.  Currently stragglers?
 dmenurc -- defines dmenu layout
 dotfile.setup -- notes on files I've pilfered.  Somewhat out of date
 fdignore -- ignores .git .svn
 /fonts -- it's fonts
 .git/ -- for git
 inputrc -- sets auto complete, disables bell.  Options for vim editing (disabled)
 install.conf.yaml -- dotbot configs.  Currently not Used
 keyboards.sh.working-ddmmmyy -- gnome/pop-os key bindings; not for i3 use
 LICENSE -- MIT license; not mine...still needed?  IDK
 nanorc -- custom nano bindings 
 packages-qe --- explicitily installed packages (per pacman; should match yay)
 profile -- deinfes default Terminal as kitty. (can remove?)
 README.md -- This File
 rgignore -- ignores .git .svn
 todo -- a list of things to do... 
 /util   various scripts, some obsolete.  Was called via bashrc and/or i3wm/config
 xterm-256color.terminfo --  'acquired' from various stuff.  Not sure what's calling it, if anything.
	
