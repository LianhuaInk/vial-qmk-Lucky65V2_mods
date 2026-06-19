# MCU name
MCU = WB32FQ95
PLATFORM_KEY = chibios

# Bootloader selection
BOOTLOADER = wb32-dfu

# Firmware version
SOFTWARE_VERSION = 5

# Build Options
#   change yes to no to disable
#
BOOTMAGIC_ENABLE = yes         # Enable Bootmagic Lite
MOUSEKEY_ENABLE = no          # Mouse keys
EXTRAKEY_ENABLE = yes          # Audio control and System control
NKRO_ENABLE = yes              # Enable N-Key Rollover
CONSOLE_ENABLE = no            # Console for debug
COMMAND_ENABLE = no            # Commands for debug and configuration
BACKLIGHT_ENABLE = no          # Enable keyboard backlight functionality
AUDIO_ENABLE = no              # Audio output
RGB_RECORD_ENABLE = no         # Light effect recording
SUSPEND_STOP_ENABLE = no       # Enter stop mode when the keyboard suspend
ENCODER_ENABLE = yes            # Encoder
LED_BLINK_ENABLE = no          # Led blink
RGBLIGHT_ENABLE = no          # Enable keyboard RGB underglow
RGB_MATRIX_ENABLE = yes        # RGB matrix
RGB_MATRIX_BLINK_ENABLE = yes  # RGB matrix blink
HAPTIC_ENABLE = no             # Haptic
MULTIMODE_ENABLE = yes         # three mode
SIGNALRGB_SUPPORT_ENABLE = yes

EEPROM_DRIVER = wear_leveling
WEAR_LEVELING_DRIVER = spi_flash

ifeq ($(strip $(MULTIMODE_ENABLE)), yes)
    MULTIMODE_DRIVER = uart3
endif

ifeq ($(strip $(RGB_MATRIX_ENABLE)), yes)
    RGB_MATRIX_DRIVER = ws2812
    WS2812_DRIVER = spi
endif

ifeq ($(strip $(SIGNALRGB_SUPPORT_ENABLE)), yes)
    SIGNALRGB_DIR := modules/signalrgb
    RAW_ENABLE = yes
    RGB_MATRIX_CUSTOM_USER = yes
    OPT_DEFS += -DSIGNALRGB_SUPPORT_ENABLE
    OPT_DEFS += -DSIGNALRGB_NO_RAW_HID_HOOKS
    OPT_DEFS += -DSIGNALRGB_DEVICE_UNIQUE_IDENTIFIER_BYTE_1=0
    OPT_DEFS += -DSIGNALRGB_DEVICE_UNIQUE_IDENTIFIER_BYTE_2=65
    OPT_DEFS += -DSIGNALRGB_DEVICE_UNIQUE_IDENTIFIER_BYTE_3=2
    VPATH += $(SIGNALRGB_DIR)
    SRC += $(SIGNALRGB_DIR)/signalrgb.c
endif

ifeq ($(strip $(RGBLIGHT_ENABLE)), yes)
    RGBLIGHT_DRIVER = custom
endif

ifeq ($(strip $(BACKLIGHT_ENABLE)), yes)
    BACKLIGHT_DRIVER = timer
endif

ifeq ($(strip $(CONSOLE_ENABLE)), yes)
    KEYBOARD_SHARED_EP = yes
endif

ifeq ($(strip $(HAPTIC_ENABLE)), yes)
    HAPTIC_DRIVER = solenoid
endif

ifeq ($(strip $(RGB_MATRIX_DRIVER)), WB32RGB)
    undefine DEBOUNCE_TYPE
endif

THIS_MK_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
include $(THIS_MK_DIR)/../multimode/multimode.mk
