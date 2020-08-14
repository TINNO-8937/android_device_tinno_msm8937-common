/*
   Copyright (c) 2016, The CyanogenMod Project
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/strings.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"

#define FP_DEV_FLE "/sys/devices/platform/fp_drv/fp_drv_info"

using android::base::Trim;
using android::base::GetProperty;
using android::base::ReadFileToString;
using android::init::property_set;

void init_fingerprint_properties()
{
    std::string fp_dev;

    if (ReadFileToString(FP_DEV_FLE, &fp_dev)) {
        LOG(INFO) << "Loading Fingerprint HAL for sensor version " << fp_dev;
        if (!strncmp(fp_dev.c_str(), "silead_fp", 9)) {
            property_set("ro.hardware.fingerprint", "silead");
            property_set("persist.sys.fp.goodix", "0");
        } else if (!strncmp(fp_dev.c_str(), "goodix_fp", 9)) {
            property_set("ro.hardware.fingerprint", "goodix");
            property_set("persist.sys.fp.goodix", "1");
        } else if (!strncmp(fp_dev.c_str(), "elan_fp", 7)) {
            property_set("ro.hardware.fingerprint", "elan");
            property_set("persist.sys.fp.goodix", "0");
        } else if (!strncmp(fp_dev.c_str(), "chipone_fp", 10)) {
            property_set("ro.hardware.fingerprint", "chipone");
            property_set("persist.sys.fp.goodix", "0");
        } else {
            LOG(ERROR) << "Unsupported fingerprint sensor: " << fp_dev;
            property_set("ro.hardware.fingerprint", "none");
            property_set("persist.sys.fp.goodix", "0");
        }
    }
    else {
        LOG(ERROR) << "Failed to detect sensor version";
        property_set("ro.hardware.fingerprint", "none");
        property_set("persist.sys.fp.goodix", "0");
    }
}

static void init_alarm_boot_properties()
{
    char const *boot_reason_file = "/proc/sys/kernel/boot_reason";
    char const *power_off_alarm_file = "/persist/alarm/powerOffAlarmSet";
    std::string boot_reason;
    std::string power_off_alarm;
    std::string reboot_reason = GetProperty("ro.boot.alarmboot", "");

    if (ReadFileToString(boot_reason_file, &boot_reason)
            && ReadFileToString(power_off_alarm_file, &power_off_alarm)) {
        /*
         * Setup ro.alarm_boot value to true when it is RTC triggered boot up
         * For existing PMIC chips, the following mapping applies
         * for the value of boot_reason:
         *
         * 0 -> unknown
         * 1 -> hard reset
         * 2 -> sudden momentary power loss (SMPL)
         * 3 -> real time clock (RTC)
         * 4 -> DC charger inserted
         * 5 -> USB charger insertd
         * 6 -> PON1 pin toggled (for secondary PMICs)
         * 7 -> CBLPWR_N pin toggled (for external power supply)
         * 8 -> KPDPWR_N pin toggled (power key pressed)
         */
         if ((Trim(boot_reason) == "3" || reboot_reason == "true")
                 && Trim(power_off_alarm) == "1") {
             property_set("ro.alarm_boot", "true");
         } else {
             property_set("ro.alarm_boot", "false");
         }
    }
}

void vendor_load_properties()
{
    init_alarm_boot_properties();
    init_fingerprint_properties();
}
