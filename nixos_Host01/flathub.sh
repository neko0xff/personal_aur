#!/usr/bin/env bash

echo "Enable Flathub repo"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Install need Package"
flatpak install flathub org.telegram.desktop \
                        com.google.Chrome \
                        com.getpostman.Postman