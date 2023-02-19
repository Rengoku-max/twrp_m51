#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/m51

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Prebuilt AVB key for GSIs
BOARD_AVB_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_SYSTEM_ALGORITHM := SHA256_RSA2048

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

# 2nd Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

TARGET_SUPPORTS_64_BIT_APPS := true

# CPUSets and Sched
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# UEFI
TARGET_USES_UEFI := true

# Assert
TARGET_OTA_ASSERT_DEVICE := m51

ALLOW_MISSING_DEPENDENCIES := true

# Kernel
TARGET_KERNEL_SOURCE        := kernel/samsung/m51
TARGET_KERNEL_ARCH          := arm64
TARGET_KERNEL_HEADER_ARCH   := arm64
TARGET_LINUX_KERNEL_VERSION := 4.14
BOARD_KERNEL_CMDLINE += console=null androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 printk.devkmsg=on firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_NAME               := SRPTJ06B001
BOARD_KERNEL_BASE            := 0x00000000
BOARD_KERNEL_PAGESIZE        := 4096
BOARD_RAMDISK_OFFSET         := 0x02000000
BOARD_KERNEL_OFFSET          := 0x00008000
BOARD_KERNEL_TAGS_OFFSET     := 0x01e00000
BOARD_KERNEL_IMAGE_NAME      := Image.gz-dtb
BOARD_KERNEL_SEPARATED_DTBO  := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board $(BOARD_NAME)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)

# Platform: Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sm6150

# Platform: Board
TARGET_BOARD_PLATFORM := sm6150
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Encryption: Rollback for Encryption
PLATFORM_VERSION := 127
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Encryption: Setup it
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
BOARD_USES_METADATA_PARTITION := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false

# File systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE     := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Target copy out
TARGET_COPY_OUT_VENDOR := vendor

# Extras
BOARD_ROOT_EXTRA_FOLDERS := persist efs firmware
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Partition: Size
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 81788928
BOARD_BOOTIMAGE_PARTITION_SIZE     := 67108864
BOARD_DTBOIMAGE_PARTITION_SIZE     := 10485760

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_FLASH_BLOCK_SIZE := 262144
LZMA_RAMDISK_TARGETS := recovery

# Partitions
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_SUPER_PARTITION_SIZE := 8053063680
BOARD_MAIN_SIZE := 8053063680
BOARD_MAIN_PARTITION_LIST := system odm vendor product

# TWRP Configuration: Basic config
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT_FUSE := true
TW_Y_OFFSET := 142
TW_H_OFFSET := -142
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"

# TWRP Configuration: Brightness/CPU
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone17/temp
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 365
TW_DEFAULT_BRIGHTNESS := 219

# Backups
TW_BACKUP_EXCLUSIONS := /data/fonts