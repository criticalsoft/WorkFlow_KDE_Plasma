######## Desktop Environment ########
sudo apt install -y plasma-desktop
#FIX:Some Widget Missing In New Version Of Plasma, eg My Notes
sudo apt install -y plasma-widgets-addons




#FIX_Plasma Notification Replaced By XFCE Notification Daemon
#sudo apt purge xfce4-notifyd
sudo mv /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service.Disabled
#ReLogIn




#FIX:Failed to connect browser
sudo apt install -y plasma-browser-integration


#FIX:Network Indicator Disapear
sudo apt install -y plasma-nm

#FIX:KDE Display Setting Missing
sudo apt install -y kscreen




#FIX:Web Widget
sudo apt install -y qml-module-qtwebengine


#Terminal Widget DEP
#Crash (You Need Compile Old Version From GitHub) (https://store.kde.org/p/1169451)
#sudo apt install -y qml-module-qmltermwidget




sudo apt install -y kde-spectacle

#tc="xdotool search --class 'Spectacle'"
#sudo sed -i "/Exec=/c\Exec=if [ \`$tc |wc -l\` -eq 0 ]; then \`spectacle\`; else if [ \`xwininfo -id \$($tc |tail -1) |grep IsViewable |wc -l\` -eq 0 ]; then $tc windowactivate %@; else $tc windowminimize %@; fi; fi &" /usr/share/applications/org.kde.spectacle.desktop




#Share Tab
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


cp ./Panel/*.svg ~/.local/share/icons/


tee ~/.local/share/applications/shortcut_activity-manage.desktop << EOF
[Desktop Entry]
Name=Activity Manage Shortcut
Exec=qdbus org.kde.kglobalaccel /component/plasmashell invokeShortcut 'manage activities'
Icon=activity_manage_
Type=Application
OnlyShowIn=KDE;
EOF


tee ~/.local/share/applications/shortcut_desktop-grid.desktop << EOF
[Desktop Entry]
Name=Desktop Grid Shortcut
Exec=qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'ShowDesktopGrid'
Icon=desktop_grid_
Type=Application
OnlyShowIn=KDE;
EOF


tee ~/.local/share/applications/shortcut_window-present.desktop << EOF
[Desktop Entry]
Name=Window Present Shortcut
Exec=qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'Expose'
Icon=window_present_
Type=Application
OnlyShowIn=KDE;
EOF


tee ~/.local/share/applications/panel_krunner.desktop << EOF
[Desktop Entry]
Name=KRunner Panel
Exec=krunner
Icon=run_
Type=Application
EOF




######## Config ########
#bash -c 'killall plasmashell' &
cd ./Config/
./Restore.sh
cd -
#bash -c 'plasmashell' &




#FOR: Move Window To Activity
sudo apt install -y xdotool
sudo apt install -y xautomation
#xte 'keyup Shift_L' 'keyup Super_L' 'keydown Super_L' 'key f' 'keyup Super_L' 'sleep 1' 'keydown Alt_L' 'key t' 'keyup Alt_L' 'key Return' 'sleep 1' 'keydown Super_L' 'key f' 'keyup Super_L' 'sleep 1' 'keydown Alt_L' 'key t' 'keyup Alt_L' 'key Down' 'key Down' 'key Down' 'key Down' 'key Return'
#xdotool key --clearmodifiers Super+f; sleep 0.5; xdotool key --clearmodifiers Alt+t; xdotool key --clearmodifiers Return; sleep 0.5; xdotool key --clearmodifiers Super+f; sleep 0.5; xdotool key --clearmodifiers Alt+t; xdotool key --clearmodifiers Down Down Down Down Return;




notify-send --icon=preferences-system-linux --expire-time=0 --app-name="WorkFlow" "
ReStart
"




######## Restart Service ########
tee ~/.local/share/applications/kwin_replace.desktop << EOF
[Desktop Entry]
Name=KWin Replace
#Exec=kwin_x11 --replace &
Exec=kwin --replace &
Icon=kwin
Type=Application
OnlyShowIn=KDE;
EOF


tee ~/.local/share/applications/plasma_restart.desktop << EOF
[Desktop Entry]
Name=Plasma Restart
Exec=kquitapp5 plasmashell; plasmashell &
Icon=preferences-system-windows-actions
Type=Application
OnlyShowIn=KDE;
EOF




######## Script (Manual Tiling) ########
mkdir -p ~/.local/share/kwin/scripts/
mkdir -p ~/.local/share/kservices5/


#Plasma Decoration (FIX: GTK Workspace)
#GTK No CSD (FIX: Duplicated Close Button), But It Will Disable GTK Transparent Theme
#sudo apt install -y gtk3-nocsd
#ReLogIn

#FIX: GTK Transparent Not Working
#sudo apt purge gtk3-nocsd
#ReLogIn

#FIX: GTK Blur InSide KDE Plasma
#FIX: Falkon Blur Not Working
rm -r ~/.local/share/kwin/scripts/forceblur/
cp -r ./Script/forceblur/ ~/.local/share/kwin/scripts/
ln -sf ~/.local/share/kwin/scripts/forceblur/metadata.desktop ~/.local/share/kservices5/forceblur.desktop
#ReLogIn


rm -r ~/.local/share/kwin/scripts/Grid_WM/
cp -r ./Script/Grid_WM/ ~/.local/share/kwin/scripts/
#Enable KWin Scripts Configure Button
ln -sf ~/.local/share/kwin/scripts/Grid_WM/metadata.desktop ~/.local/share/kservices5/Grid_WM.desktop


#Clear Old ShortCut Key
#xdg-open ~/.config/kglobalshortcutsrc
#ReLogIn
#kcmshell5 keys


#FIX: DidNot Automatically Runing After Fresh Install
#notify-send --icon=application-x-plasma --expire-time=0 --app-name="KWin Scripts" "
#UnCheck & Check
#"
kcmshell5 kwinscripts
#OR
#bash -c "kwin --replace &"
#OR
#ReLogIn




######## Plasmoid ########
#mkdir -p ~/.local/share/plasma/plasmoids/
#rm -r ~/.local/share/plasma/plasmoids/*
cp -r ./Plasmoid/*/ ~/.local/share/plasma/plasmoids/




######## Keyboard + Mouse ########
sudo apt install -y xbindkeys


#DEP: UnSet WM Shortcut First
#FOR: Key + Mouse & Continus Key
#Alt Only + Mouse Wheel Conflict With Other App
#kcmshell5 mouse Scrolling: Invert scroll direction
#"qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'Grid-Tiling: Tile/Float'"
tee ~/.xbindkeysrc_kde << EOF
"qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'Window Maximize'"
    mod4 + b:5
"qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'Window Shade'"
    mod4 + b:2
"qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'Window Minimize'"
    mod4 + b:4

"qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'view_zoom_in'"
    mod4 + alt + b:4
"qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'view_zoom_out'"
    mod4 + alt + b:5
EOF


tee ~/.local/share/applications/xbindkeys_kde_restart.desktop << EOF
[Desktop Entry]
Name=KDE Custom Key ReStart
Exec=bash -c 'killall xbindkeys; xbindkeys --file ~/.xbindkeysrc_kde &'
Icon=preferences-desktop-mouse
Type=Application
OnlyShowIn=KDE;
EOF
ln -sf ~/.local/share/applications/xbindkeys_kde_restart.desktop ~/.config/autostart/
bash -c 'killall xbindkeys; xbindkeys --file ~/.xbindkeysrc_kde &'



