#!/bin/sh

full_upgrade() {
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get full-upgrade
    sudo apt-get dist-upgrade
    flatpak update
    sudo snap refresh
}

full_clean() {
    sudo apt-get autoremove
    sudo apt-get autoclean
    sudo apt-get clean
    sudo apt-get autopurge
    docker system prune
}
