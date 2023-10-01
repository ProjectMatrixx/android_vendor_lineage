PRODUCT_VERSION_MAJOR = 13
PRODUCT_VERSION_MINOR = 0

# Increase MATRIXX Version with each major release.
MATRIXX_VERSION := 6.0

MATRIXX_BUILD_TYPE ?= Unofficial

ifeq ($(MATRIXX_BUILD_TYPE), Official)
  OFFICIAL_DEVICES = $(shell cat vendor/lineage/matrixx.devices)
  FOUND_DEVICE =  $(filter $(LINEAGE_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(LINEAGE_BUILD))
      MATRIXX_BUILD_TYPE := Official
    else
      MATRIXX_BUILD_TYPE := Unofficial
    endif
endif

# Internal version
LINEAGE_VERSION := Matrixx-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-v$(MATRIXX_VERSION)

# Display version
LINEAGE_DISPLAY_VERSION := Matrixx-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-v$(MATRIXX_VERSION)
