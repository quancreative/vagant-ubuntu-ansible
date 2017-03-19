#!/bin/bash
#
# Example shell script to set up PAReview.sh.
#
# You also need to adjust your `config.yml` to add in some other dependencies.
#
#     ```
#     post_provision_scripts:
#       - "../examples/scripts/pareview.sh"
#    
#     composer_global_packages:
#       - { name: hirak/prestissimo, release: '^0.3' }
#       - { name: drupal/coder, release: '^' }
#    
#     nodejs_version: "6.x"
#     nodejs_npm_global_packages:
#       eslint
#     ```
#
# After running `vagrant provision`, `pareview.sh` should be available anywhere
# in your Vagrant user's $PATH, so you can run commands like:
#
#     $ pareview.sh /path/to/my/module
#     $ pareview.sh http://git.drupal.org/project/rules.git 8.x-1.x
#
# See: https://github.com/klausi/pareviewsh

HOME_PATH="/home/vagrant"

# Disable search online when using the Dash menu - Ubuntu version of Start Menu.
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

# Set various system options.
# gsettings set org.gnome.desktop.session idle-delay "uint32 300"
# gsettings set org.gnome.settings-daemon.plugins.power idle-dim true
# gsettings set org.gnome.desktop.screensaver lock-enabled true
# gsettings set org.gnome.desktop.screensaver lock-delay "uint32 0"
# gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true
# gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"
# gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/EnablePrimaryPaste': <0>}"
# gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']" 
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']" 
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<Super>t'
# gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>e'
# gsettings set org.compiz.integrated show-hud "['']"
# gsettings set com.canonical.indicator.sound visible true
# dconf write /org/compiz/profiles/unity/plugins/unityshell/show-launcher "'<Control><Super>'"

# Change default file manager to Nemo.
# xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

# Gnome-Do
# gconftool-2 --type bool --set /apps/gnome-do/preferences/Do/CorePreferences/QuietStart true
# gconftool-2 --type string --set /apps/gnome-do/preferences/Do/Platform/Common/AbstractKeyBindingService/Summon_Do "<Super>space"

# Clock tray
# dconf write /com/canonical/indicator/datetime/show-day true
# dconf write /com/canonical/indicator/datetime/show-date true
# dconf write /com/canonical/indicator/datetime/time-format "'24-hour'"
# dconf write /com/canonical/indicator/datetime/show-seconds true
# dconf write /com/canonical/indicator/datetime/show-auto-detected-location true

# Enable to always show hidden files
gsettings set org.gtk.Settings.FileChooser show-hidden false

gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ active-plugins "['core', 'composite', 'opengl', 'place', 'regex', 'session', 'workarounds', 'copytex', 'snap', 'resize', 'compiztoolbox', 'grid', 'mousepoll', 'imgpng', 'move', 'expo', 'scale', 'unitymtgrabhandles', 'unityshell']"

apt-get purge gnome-games-common gbrainy && apt-get autoremove
