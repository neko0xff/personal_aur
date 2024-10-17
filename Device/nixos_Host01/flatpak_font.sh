#!/usr/bin/env bash

echo "Setup Flatpak Font"
ln -s /run/current-system/sw/share/X11/fonts /tmp/flatpak_fonts
flatpak --user override --filesystem=/tmp/flatpak_fonts
flatpak --user override --filesystem=$HOME/.icons
flatpak --user override --filesystem=host

