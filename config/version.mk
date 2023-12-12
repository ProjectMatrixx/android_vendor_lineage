PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0

# Increase MATRIXX Version with each major release.
MATRIXX_VERSION := 10.6.0

MATRIXX_BUILD_TYPE ?= Unofficial

ifeq ($(WITH_GMS), true)
  MATRIXX_BUILD_VARIANT := Gapps
else
  MATRIXX_BUILD_VARIANT := Vanilla
endif

ifeq ($(MATRIXX_BUILD_TYPE), Official)
-include vendor/lineage-priv/keys/keys.mk
  OFFICIAL_DEVICES = $(shell cat vendor/lineage/matrixx.devices)
  FOUND_DEVICE =  $(filter $(LINEAGE_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(LINEAGE_BUILD))
      MATRIXX_BUILD_TYPE := Official
    else
      MATRIXX_BUILD_TYPE := Unofficial
    endif
endif

# Internal version
LINEAGE_VERSION := Matrixx$(MATRIXX_VARIANT)-v$(MATRIXX_VERSION)-$(MATRIXX_BUILD_TYPE)-$(LINEAGE_BUILD)-$(MATRIXX_BUILD_VARIANT)-$(shell date +%Y%m%d)

# Display version
LINEAGE_DISPLAY_VERSION := Matrixx-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-v$(MATRIXX_VERSION)

# Build info
MATRIXX_BUILD_INFO := $(LINEAGE_VERSION)
