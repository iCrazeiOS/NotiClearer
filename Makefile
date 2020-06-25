ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NotiClearer

NotiClearer_FILES = Tweak.xm
NotiClearer_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += noticlearerprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
