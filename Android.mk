LOCAL_PATH := $(call my-dir)

# ✅ Force C++ STL
APP_STL := c++_static

include $(CLEAR_VARS)
LOCAL_MODULE := libdobby
LOCAL_SRC_FILES := core/cheat/hooks/dobby/arm64-v8a/libdobby.a
LOCAL_EXPORT_C_INCLUDES := core/cheat/hooks/dobby/
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Infinity

LOCAL_SRC_FILES := main.cpp \
        core/cheat/hooks/hooks.cpp \
        core/cheat/inits/inits.cpp \
        core/memory/memory.cpp \
        core/searcher/searcher.cpp \
        core/visuals/esp/esp.cpp \
        core/visuals/menu/menu.cpp \
        core/visuals/widgets/custom_widgets.cpp \
        $(wildcard $(LOCAL_PATH)/ImGui/*.cpp) \
        $(wildcard $(LOCAL_PATH)/ImGui/backends/*.cpp)

LOCAL_CFLAGS := -O2 -ffast-math -ffunction-sections -fdata-sections
LOCAL_CFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden

# ✅ IMPORTANT FIXES
LOCAL_CPPFLAGS := -std=c++17 -O2 -frtti -fexceptions

# ❌ REMOVE libc++ from here
LOCAL_LDLIBS := -llog -landroid -lEGL -lGLESv3

# ✅ CORRECT linking
LOCAL_STATIC_LIBRARIES := libdobby c++_static

include $(BUILD_SHARED_LIBRARY)