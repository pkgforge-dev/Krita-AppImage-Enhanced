#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    krita           \
    kseexpr         \
    kvantum         \
    libfbclient     \
    libheif         \
    libmypaint      \
    libproxy        \
    lxqt-qtplugin   \
    mariadb-libs    \
    poppler-qt6     \
    postgresql-libs \
    qt6ct           \
    unixodbc

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ffmpeg-mini
