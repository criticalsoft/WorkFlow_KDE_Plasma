######## Desktop Environment ########
sudo apt install -y plasma-desktop

# FIX: Some Widget Missing In New Version Of Plasma, eg My Notes
sudo apt install -y plasma-widgets-addons

sudo apt install -y plasma-workspace-wayland

# sudo apt install -y plasma-wayland-session
# sudo apt install -y plasma-wayland-protocols




#FIX_Plasma Notification Replaced By XFCE Notification Daemon
#sudo apt purge xfce4-notifyd
sudo mv /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service.Disabled
#ReLogIn




# FIX: Failed to connect browser
sudo apt install -y plasma-browser-integration


# FIX: Network Indicator Disapear
sudo apt install -y plasma-nm

sudo apt install -y plasma-firewall

# FIX: KDE Display Setting Missing
sudo apt install -y kscreen

# FIX: Dolphin Plasma Desktop Icon Thumbnail Disapear
sudo apt install -y kio-extras




# FIX: Web Widget
sudo apt install -y qml-module-qtwebengine


# Terminal Widget DEP
# Crash (You Need Compile Old Version From GitHub) (https://store.kde.org/p/1169451)
# sudo apt install -y qml-module-qmltermwidget




sudo apt install -y kde-spectacle

# tc="xdotool search --class 'Spectacle'"
# sudo sed -i "/Exec=/c\Exec=if [ \`$tc |wc -l\` -eq 0 ]; then \`spectacle\`; else if [ \`xwininfo -id \$($tc |tail -1) |grep IsViewable |wc -l\` -eq 0 ]; then $tc windowactivate %@; else $tc windowminimize %@; fi; fi &" /usr/share/applications/org.kde.spectacle.desktop




# Share Tab
sudo apt install -y kdenetwork-filesharing




#ln -sf /usr/share/applications/org.kde.knotes.desktop ~/.config/autostart/




#Disable kaccessibleapp AutoStart
#May Purge The Whole System
#sudo apt purge kaccessible




######## Panel Icon ########
#FIX: Icon Disapear In Plasma
#mkdir -p ~/.icons/
#cp ./grid.png ~/.icons/
#cp ./expose.png ~/.icons/

#FIX: Icon Disapear In Plasma
#sudo cp ./grid.png /usr/share/icons/
#sudo cp ./expose.png /usr/share/icons/


cp ./Panel/Icon/*.svg ~/.local/share/icons/

tee ~/.local/share/applications/shortcut_activity-manage.desktop << EOF
[Desktop Entry]
Name=Activity Manage Shortcut
Exec=qdbus org.kde.kglobalaccel /component/plasmashell invokeShortcut 'manage activities'
Icon=activity_manage_
Type=Application
OnlyShowIn=KDE;
StartupNotify=false
EOF

tee ~/.local/share/applications/shortcut_desktop-grid.desktop << EOF
[Desktop Entry]
Name=Desktop Grid Shortcut
Exec=qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'ShowDesktopGrid'
Icon=desktop_grid_
Type=Application
OnlyShowIn=KDE;
StartupNotify=false
EOF

tee ~/.local/share/applications/shortcut_window-present.desktop << EOF
[Desktop Entry]
Name=Window Present Shortcut
Exec=qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'Expose'
Icon=window_present_
Type=Application
OnlyShowIn=KDE;
StartupNotify=false
EOF

tee ~/.local/share/applications/panel_krunner.desktop << EOF
[Desktop Entry]
Name=KRunner Panel
Exec=krunner
Icon=run_
Type=Application
StartupNotify=false
EOF




#FOR: Move Window To Activity
#xte 'keyup Shift_L' 'keyup Super_L' 'keydown Super_L' 'key f' 'keyup Super_L' 'sleep 1' 'keydown Alt_L' 'key t' 'keyup Alt_L' 'key Return' 'sleep 1' 'keydown Super_L' 'key f' 'keyup Super_L' 'sleep 1' 'keydown Alt_L' 'key t' 'keyup Alt_L' 'key Down' 'key Down' 'key Down' 'key Down' 'key Return'
#xdotool key --clearmodifiers Super+f; sleep 0.5; xdotool key --clearmodifiers Alt+t; xdotool key --clearmodifiers Return; sleep 0.5; xdotool key --clearmodifiers Super+f; sleep 0.5; xdotool key --clearmodifiers Alt+t; xdotool key --clearmodifiers Down Down Down Down Return;
sudo apt install -y xdotool
sudo apt install -y xautomation


cp ./Panel/Icon/*.svg ~/.local/share/icons/

tee ~/.local/share/applications/popup_net_log.desktop << EOF
[Desktop Entry]
Name=Net Log PopUp
#Exec=xdotool key --clearmodifiers Control+Shift+Alt+F5
Exec=xte 'keydown Control_L' 'keydown Shift_L' 'keydown Alt_L' 'key F5' 'keyup Alt_L' 'keyup Shift_L' 'keyup Control_L'
Icon=view_certificate_
Type=Application
StartupNotify=false
EOF

tee ~/.local/share/applications/popup_auth_log.desktop << EOF
[Desktop Entry]
Name=Auth Log PopUp
#Exec=xdotool key --clearmodifiers Control+Shift+Alt+F6
Exec=xte 'keydown Control_L' 'keydown Shift_L' 'keydown Alt_L' 'key F6' 'keyup Alt_L' 'keyup Shift_L' 'keyup Control_L'
Icon=view_certificate_
Type=Application
StartupNotify=false
EOF




######## Config ########
# # bash -c "killall plasmashell &"
# bash -c "kquitapp5 plasmashell &"
cd ./CONFIG/
./Restore.sh
cd ../
# bash -c "plasmashell &"




# FIX: Differrent Version DoesNot Load Config
notify-send --icon=preferences-system-linux --expire-time=0 --app-name="WorkFlow" "
Shortcuts: Import Scheme
Custom Shortcuts: Edit -> Import
"

kcmshell5 kcm_keys




kcmshell5 kcm_hotkeys




notify-send --icon=preferences-system-linux --expire-time=0 --app-name="WorkFlow" "
ReStart
"




######## Plasmoid ########
#mkdir -p ~/.local/share/plasma/plasmoids/
#rm -rf ~/.local/share/plasma/plasmoids/*
cp -r ./Plasmoid/*/ ~/.local/share/plasma/plasmoids/



