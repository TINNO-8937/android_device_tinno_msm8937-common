ifneq ($(filter garlic wimlite hs2 hs3,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles)

endif
