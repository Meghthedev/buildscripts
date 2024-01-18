# Build Script for A37

#set -e

source build/envsetup.sh
croot
repo init -u https://github.com/LineageOS-UL/android.git -b lineage-20.0 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
rm -rf device/oppo/A37 device/cyanogen/msm8916-common kernel/oppo/msm8939 vendor/oppo hardware/qcom-caf/msm8916/display hardware/qcom-caf/msm8916/audio hardware/qcom-caf/msm8916/media hardware/qcom/display hardware/qcom/audio hardware/qcom/media device/qcom/sepolicy-legacy vendor/qcom/opensource/power hardware/qcom-caf/wlan

git clone https://github.com/Meghthedev/device_oppo_A37 -b lineage-20 device/oppo/A37
git clone https://github.com/Meghthedev/device_cyanogen_msm8916-common -b lineage-20 device/cyanogen/msm8916-common
git clone https://gitlab.com/Meghthedev/android_kernel_oppo_msm8916 -b lineage-20.0 kernel/oppo/msm8939
git clone https://gitlab.com/TipzTeam/android-trees/proprietary_vendor_oppo_A37 -b lineage-19.1 vendor/oppo
git clone https://github.com/Meghthedev/android_hardware_qcom_display -b lineage-20.0-caf-msm8916 hardware/qcom-caf/msm8916/display
git clone https://github.com/Meghthedev/android_hardware_qcom_audio -b lineage-20.0-caf-msm8916 hardware/qcom-caf/msm8916/audio
git clone https://github.com/Meghthedev/android_hardware_qcom_media -b lineage-20.0-caf-msm8916 hardware/qcom-caf/msm8916/media
git clone https://github.com/LineageOS-UL/android_hardware_qcom_display -b lineage-20.0 hardware/qcom/display
git clone https://github.com/LineageOS-UL/android_hardware_qcom_audio -b lineage-20.0 hardware/qcom/audio
git clone https://github.com/LineageOS-UL/android_hardware_qcom_media -b lineage-20.0 hardware/qcom/media
git clone https://github.com/LineageOS-UL/android_device_qcom_sepolicy -b lineage-20.0-legacy device/qcom/sepolicy-legacy
git clone https://github.com/LineageOS/android_hardware_sony_timekeep hardware/sony/timekeep
git clone https://github.com/LineageOS-UL/android_vendor_qcom_opensource_power -b lineage-20.0 vendor/qcom/opensource/power 
git clone https://github.com/Meghthedev/android_hardware_qcom_wlan hardware/qcom-caf/wlan

cp hardware/qcom-caf/msm8953/Android.mk hardware/qcom-caf/msm8916/
cp hardware/qcom-caf/msm8953/Android.bp hardware/qcom-caf/msm8916/

# Lunch for A37 device
lunch lineage_A37-eng

# Build for A37 device
mka bacon