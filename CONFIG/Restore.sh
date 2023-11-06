# bash -c "killall plasmashell &"
bash -c "kquitapp5 plasmashell &"




cp ./config/* ~/.config/

# FIX: Some Setting Didnot Restore Correctly (Activity, Wallpaper)
chmod 775 ~/.config/*.desktop-appletsrc
chmod 775 ~/.config/kactivitymanagerdrc




# DoNot Delete Existing
# rm ~/.local/share/plasma_icons/*.desktop
cp ./PlasmaIcons/*.desktop ~/.local/share/plasma_icons/




# sync
# echo SYNC




bash -c "plasmashell &"




# plasmashell --version



