#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q krita | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/256x256/apps/krita.png
export DESKTOP=/usr/share/applications/org.kde.krita.desktop
export STARTUPWMCLASS=krita
export OPTIMIZE_LAUNCH=1

# Deploy dependencies
quick-sharun /usr/bin/krita* \
  /usr/lib/kritaplugins/krita*.so* \
  /usr/lib/libkrita*.so* \
  /usr/share/color-schemes \
  /usr/share/color/icc/krita \
  /usr/share/krita* \
  /usr/lib/qt6/plugins/sqldrivers \
  /usr/lib/libproxy/libpxbackend-1.0.so

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the test fails due to the app
# having issues running in the CI use --simple-test instead
quick-sharun --test ./dist/*.AppImage
