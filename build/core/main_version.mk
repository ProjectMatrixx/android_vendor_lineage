# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Matrixx properties
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.matrixx.battery?=$(MATRIXX_BATTERY) \
    ro.matrixx.build.variant=$(MATRIXX_BUILD_VARIANT) \
    ro.matrixx.build.version=$(LINEAGE_VERSION) \
    ro.matrixx.chipset?=$(MATRIXX_CHIPSET) \
    ro.matrixx.display_resolution?=$(MATRIXX_DISPLAY) \
    ro.matrixx.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.matrixx.maintainer=$(MATRIXX_MAINTAINER) \
    ro.matrixx.release.type=$(MATRIXX_BUILD_TYPE) \
    ro.matrixx.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(MATRIXX_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
