ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NotiClearerPrefs

NotiClearerPrefs_FILES = NCPRootListController.m
NotiClearerPrefs_INSTALL_PATH = /Library/PreferenceBundles
NotiClearerPrefs_FRAMEWORKS = UIKit
NotiClearerPrefs_PRIVATE_FRAMEWORKS = Preferences
NotiClearerPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NotiClearerPrefs.plist$(ECHO_END)
