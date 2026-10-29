#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    krita             \
    krita-plugin-gmic \
    kseexpr           \
    kvantum           \
    libfbclient       \
    libheif           \
    libmypaint        \
    libproxy          \
    lxqt-qtplugin     \
    mariadb-libs      \
    poppler-qt6       \
    postgresql-libs   \
    python            \
    python-pyqt6      \
    qt6ct             \
    unixodbc

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ffmpeg-mini
