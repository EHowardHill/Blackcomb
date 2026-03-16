#!/bin/bash

# Define core paths
export WINEPREFIX="$HOME/.wine"
OPT_APPS="/opt/windows-apps"
PROG_FILES="$WINEPREFIX/drive_c/Program Files"

# Suppress all Wine dialogs and debug output so the user sees nothing
export WINEDEBUG=-all

# 1. Initialize the Windows C: Drive
# The '-u' flag updates/creates the prefix without launching a graphical window
wineboot -u

# 2. Wait for Wine to finish
# This is crucial. It halts the script until the virtual C: drive is completely built
wineserver -w

# 3. Inject the Windows Applications
# Creates symbolic links from the shared read-only /opt/ directory into the user's personal C: drive
ln -sf "$OPT_APPS/Explorer++" "$PROG_FILES/Explorer++"
ln -sf "$OPT_APPS/MPC-HC" "$PROG_FILES/MPC-HC"
ln -sf "$OPT_APPS/Notepad++" "$PROG_FILES/Notepad++"
ln -sf "$OPT_APPS/7-Zip" "$PROG_FILES/7-Zip"

# 4. Optional: Inject Windows Registry Tweaks
# If you have a .reg file for specific app settings, inject it here
# wine regedit "$HOME/.local/share/windows-tweaks.reg"
# wineserver -w

# 5. Self-Destruct
# Delete the .desktop file from autostart so this script only ever runs on the very first login
rm -f "$HOME/.config/autostart/wine-first-boot.desktop"