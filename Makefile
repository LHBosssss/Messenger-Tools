THEOS_DEVICE_IP = 192.168.1.8
ARCHS = arm64e
INSTALL_TARGET_PROCESSES = LightSpeedApp Messenger
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MessengerTools
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

MessengerTools_FILES = Tweak.xm
MessengerTools_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += mstpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
