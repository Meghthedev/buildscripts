# Build Script for CPH1859 and RMX1831

# Remove local_manifests directory
rm -rf .repo/local_manifests

# Clone the manifest repository
git clone https://github.com/Meghthedev/CPH1859_manifest --depth 1 -b 13 .repo/local_manifests

# Force sync the repository
repo sync --force-sync -c -j $(nproc)

# Set up the build environment
source build/envsetup.sh

# Navigate to frameworks/base directory
cd frameworks/base

# Cherry-pick changes for frameworks/base
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_base refs/changes/02/20002/5 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_base refs/changes/90/17690/3 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_base refs/changes/68/17768/2 && git cherry-pick FETCH_HEAD

# Return to the root of the source tree
croot

# Navigate to system/core directory
cd system/core

# Cherry-pick changes for system/core
git fetch https://review.arrowos.net/ArrowOS/android_system_core refs/changes/78/20278/1 && git cherry-pick FETCH_HEAD

# Return to the root of the source tree
croot

# Navigate to frameworks/opt/net/ims directory
cd frameworks/opt/net/ims

# Cherry-pick changes for frameworks/opt/net/ims
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_opt_net_ims refs/changes/94/17894/1 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_opt_net_ims refs/changes/95/17895/1 && git cherry-pick FETCH_HEAD

# Return to the root of the source tree
croot

# Navigate to packages/modules/Wifi directory
cd packages/modules/Wifi

# Cherry-pick changes for packages/modules/Wifi
git fetch https://review.arrowos.net/ArrowOS/android_packages_modules_Wifi refs/changes/96/17896/2 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_packages_modules_Wifi refs/changes/97/17897/2 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_packages_modules_Wifi refs/changes/98/17898/2 && git cherry-pick FETCH_HEAD
git fetch https://review.arrowos.net/ArrowOS/android_packages_modules_Wifi refs/changes/99/17899/3 && git cherry-pick FETCH_HEAD

# Return to the root of the source tree
croot

# Navigate to frameworks/opt/telephony directory
cd frameworks/opt/telephony

# Cherry-pick changes for frameworks/opt/telephony
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_opt_telephony refs/changes/00/17900/1 && git cherry-pick FETCH_HEAD

# Return to the root of the source tree
croot

# Lunch for CPH1859 device
lunch lineage_CPH1859-userdebug

# Build for CPH1859 device
mka bacon

# Lunch for RMX1831 device
lunch lineage_RMX1831-userdebug

# Build for RMX1831 device
mka bacon