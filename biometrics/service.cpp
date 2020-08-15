/*
 * Copyright (C) 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "android.hardware.biometrics.fingerprint@2.0-service-custom"

#include <binder/ProcessState.h>

#include <android/log.h>
#include <hidl/HidlSupport.h>
#include <hidl/HidlTransportSupport.h>
#include <android/hardware/biometrics/fingerprint/2.1/IBiometricsFingerprint.h>
#include <android/hardware/biometrics/fingerprint/2.1/types.h>
#include "BiometricsFingerprint.h"
#include <cutils/properties.h>
#include <errno.h>
#include <unistd.h>
#include <iostream>
#include <fstream>

using android::hardware::biometrics::fingerprint::V2_1::IBiometricsFingerprint;
using android::hardware::biometrics::fingerprint::V2_1::implementation::BiometricsFingerprint;
using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;
using android::sp;

#define fp_dev_file "/sys/devices/platform/fp_drv/fp_drv_info"

bool is_goodix = false;

static constexpr char kGoodixFpDev[] = "/dev/goodix_fp";

int32_t readFile(std::string filename, std::string& contents) {
    std::ifstream file(filename);

    if (file.is_open()) {
        getline(file, contents);
        file.close();
        return 0;
    }
    return -1;
}

int main() {

    std::string fp_dev;
    if (readFile(fp_dev_file, fp_dev)) {
        ALOGE("Loading Fingerprint HAL for sensor version " fp_dev);
        if (!strncmp(fp_dev.c_str(), "goodix_fp", 9)) {
            ALOGI("is_goodix = true");
            is_goodix = true;
        } else {
            ALOGI("is_goodix = false");
            is_goodix = false;
        }
    } else {
        ALOGE(fp_dev_file " cannot be read!  killing " log_tag " binder service!");
        return 1;
    }

    ALOGI("Start biometrics");
    android::sp<IBiometricsFingerprint> bio = BiometricsFingerprint::getInstance();

    if (is_goodix) {
        if (access(kGoodixFpDev, F_OK) != 0) {
            ALOGE("Cannot access %s (%s)", kGoodixFpDev, strerror(errno));
            return 1;
        }

        // the conventional HAL might start binder services
        android::ProcessState::initWithDriver("/dev/binder");
        android::ProcessState::self()->startThreadPool();
    }

    /* process Binder transaction as a single-threaded program. */
    configureRpcThreadpool(1, true /* callerWillJoin */);

    if (bio != nullptr) {
        if (::android::OK != bio->registerAsService()) {
            return 1;
        }
    } else {
        ALOGE("Can't create instance of BiometricsFingerprint, nullptr");
    }

    joinRpcThreadpool();

    return 0; // should never get here
}
