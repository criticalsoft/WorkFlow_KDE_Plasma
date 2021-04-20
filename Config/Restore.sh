#bash -c "killall plasmashell &"
bash -c "kquitapp5 plasmashell &"




cp ./config/* ~/.config/




#DoNot Delete Existing
#rm ~/.local/share/plasma_icons/*.desktop
cp ./PlasmaIcons/*.desktop ~/.local/share/plasma_icons/




sync
echo SYNC




bash -c "plasmashell &"

plasmashell --version




