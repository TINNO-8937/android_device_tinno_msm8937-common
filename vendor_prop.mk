# Adreno
PRODUCT_PROPERTY_OVERRIDES += \
ro.qcom.adreno.qgl.ShaderStorageImageExtendedFormats=0

# ART
PRODUCT_PROPERTY_OVERRIDES += \
ro.sys.fw.dex2oat_thread_count=4

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
af.fast_track_multiplier=1 \
audio.deep_buffer.media=true \
audio.offload.min.duration.secs=30 \
audio.offload.video=true \
persist.vendor.audio.fluence.speaker=false \
persist.vendor.audio.fluence.voicecall=true \
persist.vendor.audio.fluence.voicerec=false \
persist.vendor.audio.speaker.prot.enable=false \
persist.vendor.bt.enable.splita2dp=false \
persist.vendor.audio.hw.binder.size_kbyte=1024 \
ro.config.media_vol_steps=25 \
ro.config.vc_call_vol_steps=7 \
ro.vendor.audio.sdk.fluencetype=fluence \
ro.af.client_heap_size_kbyte=7168 \
ro.vendor.audio.sdk.ssr=false \
vendor.audio.flac.sw.decoder.24bit=true \
vendor.audio.hw.aac.encoder=true \
vendor.audio.offload.buffer.size.kb=64 \
vendor.audio.offload.gapless.enabled=true \
vendor.audio.offload.multiaac.enable=true \
vendor.audio.offload.multiple.enabled=false \
vendor.audio.offload.passthrough=false \
vendor.audio.offload.pcm.16bit.enable=true \
vendor.audio.offload.pcm.24bit.enable=true \
vendor.audio.parser.ip.buffer.size=262144 \
vendor.audio.playback.mch.downsample=true \
vendor.audio.pp.asphere.enabled=false \
vendor.audio.safx.pbe.enabled=true \
vendor.audio.tunnel.encode=false \
vendor.audio.use.sw.alac.decoder=true \
vendor.audio.use.sw.ape.decoder=true \
vendor.audio_hal.period_size=192 \
vendor.voice.conc.fallbackpath=deep-buffer \
vendor.voice.path.for.pcm.voip=true \
vendor.voice.playback.conc.disabled=true \
vendor.voice.record.conc.disabled=false \
vendor.voice.voip.conc.disabled=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
bluetooth.hfp.client=1 \
persist.bt.enable.multicast=1 \
persist.bt.max.a2dp.connections=2 \
ro.qualcomm.bt.hci_transport=smd \
ro.bluetooth.hfp.ver=1.7 \
vendor.qcom.bluetooth.soc=smd

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
camera.hal1.packagelist=com.skype.raider,com.google.android.talk \
persist.vendor.camera.display.lmax=1280x720 \
persist.vendor.camera.display.umax=1920x1080 \
persist.vendor.camera.stats.test=5 \
persist.camera.gyro.android=1 \
persist.camera.is_type=1 \
persist.camera.time.monotonic=0

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
persist.cne.feature=1

# Display
PRODUCT_PROPERTY_OVERRIDES += \
debug.sf.enable_hwc_vds=1 \
debug.sf.hw=0 \
debug.sf.latch_unsignaled=1 \
debug.egl.hw=0 \
persist.hwc.mdpcomp.enable=true \
debug.mdpcomp.logs=0 \
dev.pm.dyn_samplingrate=1 \
persist.demo.hdmirotationlock=false \
debug.enable.sglscale=1 \
sdm.debug.disable_skip_validate=1 \
debug.sf.recomputecrop=0 \
vendor.display.enable_default_color_mode=1 \
vendor.gralloc.enable_fb_ubwc=1 \
vendor.display.disable_skip_validate=1 \
ro.opengles.version=196610 \
ro.qualcomm.cabl=0 \
ro.vendor.display.cabl=2 \
ro.sf.lcd_density=441 \
persist.debug.wfd.enable=1 \
persist.hwc.enable_vds=1

# FM radio
PRODUCT_PROPERTY_OVERRIDES += \
ro.fm.transmitter=false

# Factory Reset Protection
PRODUCT_PROPERTY_OVERRIDES += \
ro.frp.pst=/dev/block/bootdevice/by-name/config

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
persist.qfp=false

# Media
PRODUCT_PROPERTY_OVERRIDES += \
media.msm8956hw=0 \
mm.enable.smoothstreaming=true \
mmp.enable.3g2=true \
mm.enable.qcom_parser=1048303 \
media.aac_51_output_enabled=true \
persist.mm.sta.enable=0 \
qcom.hw.aac.encoder=true \
video.disable.ubwc=1 \
vendor.vidc.disable.split.mode=1 \
vendor.vidc.enc.narrow.searchrange=1 \
vendor.vidc.enc.disable.pq=true \
vidc.enc.dcvs.extra-buff-count=2

# Netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
ro.use_data_netmgrd=true \
persist.data.netmgrd.qos.enable=true \
persist.data.mode=concurrent

# NITZ
PRODUCT_PROPERTY_OVERRIDES += \
persist.rild.nitz_plmn="" \
persist.rild.nitz_long_ons_0="" \
persist.rild.nitz_long_ons_1="" \
persist.rild.nitz_long_ons_2="" \
persist.rild.nitz_long_ons_3="" \
persist.rild.nitz_short_ons_0="" \
persist.rild.nitz_short_ons_1="" \
persist.rild.nitz_short_ons_2="" \
persist.rild.nitz_short_ons_3=""

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.qti.sys.fw.bservice_enable=true

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.extension_library=libqti-perfd-client.so \
ro.vendor.qti.sys.fw.bg_apps_limit=60 \
ro.vendor.at_library=libqti-at.so \
ro.vendor.gt_library=libqti-gt.so

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
ro.emmc_size=16GB

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
ro.qualcomm.cabl=2

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
DEVICE_PROVISIONED=1 \
persist.radio.apm_sim_not_pwdn=1 \
persist.radio.calls.on.ims=true \
persist.radio.jbims=true \
persist.radio.ims.cmcc=true \
persist.radio.multisim.config=dsds \
ril.subscription.types=NV,RUIM \
rild.libargs=-d/dev/smd0 \
rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so \
ro.telephony.default_network=9 \
telephony.lteOnCdmaDevice=1 \
persist.vendor.radio.custom_ecc=1 \
persist.vendor.radio.rat_on=combine \
persist.vendor.radio.sib16_support=1 \
persist.vendor.radio.force_on_dc=true

# SVI
PRODUCT_PROPERTY_OVERRIDES += \
ro.qcom.svi.sensortype=2

# Time service
PRODUCT_PROPERTY_OVERRIDES += \
persist.timed.enable=true

# Trim properties
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.qti.am.reschedule_service=true \
ro.vendor.qti.core_ctl_max_cpu=4 \
ro.vendor.qti.core_ctl_min_cpu=2 \
ro.vendor.qti.sys.fw.bservice_age=5000 \
ro.vendor.qti.sys.fw.bservice_limit=5 \
ro.vendor.qti.sys.fw.empty_app_percent=50 \
ro.vendor.qti.sys.fw.trim_cache_percent=100 \
ro.vendor.qti.sys.fw.trim_empty_percent=100 \
ro.vendor.qti.sys.fw.trim_enable_memory=2147483648 \
ro.vendor.qti.sys.fw.use_trim_settings=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
wifi.interface=wlan0
