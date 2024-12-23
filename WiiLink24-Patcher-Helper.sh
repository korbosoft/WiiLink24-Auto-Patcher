#!/usr/bin/sh
WL24PHVer="1.0.0"
echo "
╔════════════════════════╗
║┌───┐                   ║
║│Wii│Link Patcher Helper║
║\`───┘v$WL24PHVer             ║
╚════════════════════════╝
"
OS=$(uname)
arch=$(uname -m)
if [[ $OS == "Darwin" ]]; then
  OS="MacOS"
fi
echo Reported OS: "$OS"

if [[ $arch == *"x86_64"* ]]; then
  arch="x64"
elif [[ $arch == *"arm64"* ]]; then
  arch="ARM64"
else
  echo "Architecture unknown or incompatible, Aborting..."
fi
echo Reported Architecture: "$arch"

echo Downloading latest version to /tmp/WL24-Patcher...
gh release download -R WiiLink24/WiiLink24-Patcher -p WiiLinkPatcher_"$OS"-"$arch"* -O /tmp/WL24-Patcher --clobber

echo Starting Patcher...
chmod +x /tmp/WL24-Patcher
/tmp/WL24-Patcher

exit
