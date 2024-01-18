#!/bin/bash

set -e

# Remove local_manifests directory
rm -rf .repo/local_manifests

# Clone the repository for local manifests
git clone https://github.com/Meghthedev/android_local_manifests --depth 1 -b 13 .repo/local_manifests

# Sync repositories
repo sync --force-sync -c -j "$(nproc)"

# Set up the build environment
source build/envsetup.sh

# Navigate to the top of the source tree
croot

# lunch for m307f
lunch lineage_m307f-userdebug

# Build LineageOS
mka bacon

# lunch for m307fn
lunch lineage_m307fn-userdebug

# Build LineageOS
mka bacon