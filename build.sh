!/usr/bin/bash

# install Ninja
brew install ninja


# install cmake
brew install cmake

# install Skia
cd $HOME
mkdir $HOME/deps
cd $HOME/deps
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
git clone https://github.com/google/skia.git
export PATH="${PWD}/depot_tools:${PATH}"
cd skia

#git checkout aseprite-m62
python tools/git-sync-deps

gn gen out/Release --args="is_component_build=true is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false"
ninja -C out/Release
ls -alh out/Release

gn gen out/Release --args="is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false"
ninja -C out/Release
ls -alh out/Release
