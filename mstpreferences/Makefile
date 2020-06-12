include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MSTPreferences
ARCHS = arm64e
DEBUG = 0

$(BUNDLE_NAME)_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

MSTPreferences_FILES = MessengerToolsRootListController.m
MSTPreferences_INSTALL_PATH = /Library/PreferenceBundles
MSTPreferences_FRAMEWORKS = UIKit
MSTPreferences_PRIVATE_FRAMEWORKS = Preferences
MSTPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MSTPreferences.plist$(ECHO_END)
