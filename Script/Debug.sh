mkdir ~/.local/share/applications/
tee ~/.local/share/applications/plasmashell_interactive_console.desktop << EOF
[Desktop Entry]
Name=PlasmaShell Interactive Console
Exec=qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.showInteractiveConsole; notify-send --icon=application-x-plasma --expire-time=0 --app-name='PlasmaShell Interactive Console' 'Danger: 1. Open, Modify, Clear, Open Same File, Save, Overwrite To Same File, You Will Lost All 2. Some Times Ctrl + S DoesNot Save To Original File 3. Some Times It Crash Plasma After Close 4. CanNot Remember Save As Path 5. Some Times Code Not Update With KWin Script Running 6. Some Times KWin Script Interactive Console Result Is Different 7. Run KWin Script, Open With Interactive Console KWin Execute, Reload With kwin --replace & 8. DoesNot Have Error Line Number';
Icon=plasmashell
Type=Application
EOF




SCRIPT=/home/$USER/.local/share/kwin/scripts/Grid_WM/contents/code/main.js

#dbus-send --print-reply --dest=org.kde.KWin /Scripting org.kde.kwin.Scripting.unloadScript string:"$SCRIPT"
#num=$(dbus-send --print-reply --dest=org.kde.KWin /Scripting org.kde.kwin.Scripting.loadScript string:"$SCRIPT" | awk 'END {print $2}')
#dbus-send --print-reply --dest=org.kde.KWin /$num org.kde.kwin.Scripting.run

qdbus org.kde.KWin /Scripting unloadScript $SCRIPT
num=$(qdbus org.kde.KWin /Scripting loadScript $SCRIPT)
qdbus org.kde.KWin /$num run




