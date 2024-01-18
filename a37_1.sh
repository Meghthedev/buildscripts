# Build Script for A37

#set -e

# Remove local_manifests directory
rm -rf .repo/local_manifests

# Clone the manifest
mkdir .repo/local_manifests
wget -P .repo/local_manifests/ https://gist.githubusercontent.com/Meghthedev/29db7999eb98e70054a3e3cdf08cbd6c/raw/faf6dba33d054373d406f7107f8c3b4da4fb9c4d/a37.xml

source build/envsetup.sh
croot

# Init LineageOS Ultra Legacy
repo init -u https://github.com/LineageOS-UL/android.git -b lineage-20.0 --git-lfs

# Force sync the repository
repo sync --force-sync -c -j $(nproc)

mkdir -p hardware/qcom/display && (rm -rf hardware/qcom/display || true) && git clone https://github.com/LineageOS-UL/android_hardware_qcom_display -b lineage-20.0 hardware/qcom/display

mkdir -p hardware/qcom/audio && (rm -rf hardware/qcom/audio || true) && git clone https://github.com/LineageOS-UL/android_hardware_qcom_audio -b lineage-20.0 hardware/qcom/audio

mkdir -p hardware/qcom/media && (rm -rf hardware/qcom/media || true) && git clone https://github.com/LineageOS-UL/android_hardware_qcom_media -b lineage-20.0 hardware/qcom/media

cp hardware/qcom-caf/msm8953/Android.mk hardware/qcom-caf/msm8916/
cp hardware/qcom-caf/msm8953/Android.bp hardware/qcom-caf/msm8916/

# Lunch for A37 device
lunch lineage_A37-eng

# Build for A37 device
mka bacon