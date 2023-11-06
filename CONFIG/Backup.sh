#Global Variable FIX: Differrent Date Before & After 24:00:00
DATE=$(date +"%Y%m%d")




rm -rf ./config/
mkdir -p ./config/


#Apple Magic Touchpad Sensivity & Pressure
cp -r ~/.config/touchpadrc ./config/


#Activities
cp -r ~/.config/kactivitymanagerdrc ./config/
#cp -r ~/.config/kactivitymanagerd-* ./config/


#Wallet System Tray
cp -r ~/.config/kwalletrc ./config/


#Window Rules
cp -r ~/.config/kwinrulesrc ./config/


#AutoMount HD
cp -r ~/.config/kded_device_automounterrc ./config/


#Notification Setting (Global & Applications)
cp -r ~/.config/*.notifyrc ./config/
#Trash Emptied
cp -r ~/.config/plasma_workspace.notifyrc ./config/


#Notification Show In Setting (Applications eg:Spectacle)
cp -r ~/.config/plasmanotifyrc ./config/


#FIX:Duplicated Yakuake StartUp (AutoStart & Desktop Session), Makes Yakuake Always Show Itis Window When Enter Desktop
cp -r ~/.config/ksmserverrc ./config/


#Adjust Date and Time - Time Zone
cp -r ~/.config/ktimezonedrc ./config/


#Default Application
cp -r ~/.config/mimeapps.list ./config/


#Global Shortcuts
cp -r ~/.config/kglobalshortcutsrc ./config/


#Custom Shortcuts
cp -r ~/.config/khotkeysrc ./config/


#CapsLock As Additional Hyper / Super / Meta
cp -r ~/.config/kxkbrc ./config/


#Window Behavior
#Compositor
#Window Decorations
#Desktop Effects
#Screen Edges
#Virtual Desktops
cp -r ~/.config/kwinrc ./config/


#Dolphin Confirmations
cp -r ~/.config/kiorc ./config/


#Runner PlugIn Setting
cp -r ~/.config/krunnerrc ./config/


#Launch Feedback
cp -r ~/.config/klaunchrc ./config/


#Language
cp -r ~/.config/plasma-localerc ./config/


#Input Devices - Mouse (Reverse scroll direction)
#Cursor Theme
cp -r ~/.config/kcminputrc ./config/


#Desktop Theme
cp -r ~/.config/plasmarc ./config/


#Splash Screen
cp -r ~/.config/ksplashrc ./config/


#Workspace Theme - Look And Feel
#Icons
#System Fonts
cp -r ~/.config/kdeglobals ./config/


#Screen Locking
cp -r ~/.config/kscreenlockerrc ./config/


#Panel
cp -r ~/.config/plasmashellrc ./config/
cp -r ~/.config/plasma-org.kde.plasma.desktop-appletsrc ./config/


rm -rf ./config_$DATE/
cp -r ./config/ ./config_$DATE/




#FOR: Multiple Panel, DoNot Delete Duplicated desktop File
#rm ~/.local/share/plasma_icons/*\(*\).desktop

rm -rf ./PlasmaIcons/
cp -r ~/.local/share/plasma_icons/ ./PlasmaIcons/

rm -rf ./PlasmaIcons_$DATE/
cp -r ./PlasmaIcons/ ./PlasmaIcons_$DATE/




# sync
# echo SYNC




# plasmashell --version



