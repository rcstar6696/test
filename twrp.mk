ifeq ($(BUILD_TWRP),true)

include $(DEVICE_PATH)/twrp.mk

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

ifeq ($(AB_OTA_UPDATER), true)
TARGET_RECOVERY_DEVICE_DIRS += $(PLATFORM_PATH)/recovery/twrp-ab

# TWRP specific build flags
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TW_RECOVERY_ADDITIONAL_RELINK_FILES := ${OUT_DIR}/target/product/jasmine_sprout/system/lib64/android.hardware.boot@1.0.so
TW_INCLUDE_REPACKTOOLS := true
else
TARGET_RECOVERY_DEVICE_DIRS += $(PLATFORM_PATH)/recovery/twrp
endif

# TWRP specific build flags
TW_THEME := portrait_hdpi
BOARD_HAS_NO_REAL_SDCARD := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXTRA_LANGUAGES := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_INCLUDE_NTFS_3G := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXCLUDE_TWRPAPP := true
TW_USE_TOOLBOX := true
TW_HAS_EDL_MODE := true
TW_INCLUDE_FBE := true
TW_IGNORE_MISC_WIPE_DATA := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Security Patch Hack to prevent Anti Rollback
BOARD_SUPPRESS_SECURE_ERASE := true

ALLOW_MISSING_DEPENDENCIES := true

# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
TW_INCLUDE_FUSE_NTFS := true

# Crypto
TW_INCLUDE_CRYPTO := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
endif
