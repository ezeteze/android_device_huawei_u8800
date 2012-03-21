$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/u8800/u8800-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8800/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/u8800/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_u8800
PRODUCT_DEVICE := u8800
PRODUCT_MODEL := huawei u8800
PRODUCT_MANUFACTURER := huawei

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

PRODUCT_COPY_FILES += \
    device/huawei/u8800/init.u8800.rc:root/init.u8800.rc \
    device/huawei/u8800/ueventd.u8800.rc:root/ueventd.u8800.rc

$(call inherit-product-if-exists, vendor/huawei/u8800/u8800-vendor.mk)

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Term \
    overlay.default \
    gps.u8800 \
    lights.u8800 \
    gralloc.u8800 \
    libOmxCore \
    libOmxVidEnc \
    Torch \
    dexpreopt \
    Cyanbread \

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/huawei/u8800/qwerty.kl:system/usr/keylayout/qwerty.kl
    
# Firmware
PRODUCT_COPY_FILES += \
    device/huawei/u8800/firmware/vidc_720p_command_control.fw:/system/etc/firmware/vidc_720p_command_control.fw \
    device/huawei/u8800/firmware/vidc_720p_h263_dec_mc.fw:/system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_h264_dec_mc.fw:/system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_h264_enc_mc.fw:/system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_mp4_dec_mc.fw:/system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_mp4_enc_mc.fw:/system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_vc1_dec_mc.fw:/system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/huawei/u8800/firmware/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \
    device/huawei/u8800/firmware/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \

# Firmware wlan
PRODUCT_COPY_FILES += \
    device/huawei/u8800/firmware/wlan/qcom_fw.bin:/system/etc/firmware/wlan/qcom_fw.bin \
    device/huawei/u8800/firmware/wlan/qcom_wapi_fw.bin:/system/etc/firmware/wlan/qcom_wapi_fw.bin \
    device/huawei/u8800/firmware/wlan/qcom_wlan_nv.bin:/system/etc/firmware/wlan/qcom_wlan_nv.bin \
    device/huawei/u8800/firmware/wlan/cfg.dat:/system/etc/firmware/wlan/cfg.dat \
    device/huawei/u8800/firmware/wlan/hostapd_default.conf:/system/etc/firmware/wlan/hostapd_default.conf \
    device/huawei/u8800/firmware/wlan/qcom_cfg.ini:/system/etc/firmware/wlan/qcom_cfg.ini \

# EGL
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/egl/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/huawei/u8800/proprietry/lib/egl/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/huawei/u8800/proprietry/lib/egl/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/huawei/u8800/proprietry/lib/egl/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/huawei/u8800/proprietry/lib/libgsl.so:/system/lib/libgsl.so \

# Gralloc (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/hw/gralloc.msm7k.so:/system/lib/hw/gralloc.u8800.so \

# etc
PRODUCT_COPY_FILES += \
    device/huawei/u8800/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
    device/huawei/u8800/init.qcom.sdio.sh:/system/etc/init.qcom.sdio.sh \
    device/huawei/u8800/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh \
    device/huawei/u8800/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh \
    device/huawei/u8800/media_profiles.xml:/system/etc/media_profiles.xml \
    device/huawei/u8800/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/huawei/u8800/vold.fstab:/system/etc/vold.fstab \

# RIL (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/libril-qc-1.so:/system/lib/libril-qc-1.so \
    device/huawei/u8800/proprietry/lib/libril-qcril-hook-oem.so:/system/lib/libril-qcril-hook-oem.so \
    device/huawei/u8800/proprietry/lib/libdiag.so:/system/lib/libdiag.so \
    device/huawei/u8800/proprietry/lib/liboncrpc.so:/system/lib/liboncrpc.so \
    device/huawei/u8800/proprietry/lib/libqmi.so:/system/lib/libqmi.so \
    device/huawei/u8800/proprietry/lib/libdsm.so:/system/lib/libdsm.so \
    device/huawei/u8800/proprietry/lib/libqueue.so:/system/lib/libqueue.so \
    device/huawei/u8800/proprietry/lib/libdll.so:/system/lib/libdll.so \
    device/huawei/u8800/proprietry/lib/libcm.so:/system/lib/libcm.so \
    device/huawei/u8800/proprietry/lib/libmmgsdilib.so:/system/lib/libmmgsdilib.so \
    device/huawei/u8800/proprietry/lib/libgsdi_exp.so:/system/lib/libgsdi_exp.so \
    device/huawei/u8800/proprietry/lib/libgstk_exp.so:/system/lib/libgstk_exp.so \
    device/huawei/u8800/proprietry/lib/libwms.so:/system/lib/libwms.so \
    device/huawei/u8800/proprietry/lib/libnv.so:/system/lib/libnv.so \
    device/huawei/u8800/proprietry/lib/libwmsts.so:/system/lib/libwmsts.so \
    device/huawei/u8800/proprietry/lib/libpbmlib.so:/system/lib/libpbmlib.so \
    device/huawei/u8800/proprietry/lib/libdss.so:/system/lib/libdss.so \
    device/huawei/u8800/proprietry/lib/libauth.so:/system/lib/libauth.so \
    device/huawei/u8800/proprietry/lib/libicudata.so:/system/lib/libicudata.so \

# Gemini (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/libgemini.so:/system/lib/libgemini.so \

# other bin (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/bin/rmt_oeminfo:/system/bin/rmt_oeminfo \
    device/huawei/u8800/proprietry/bin/rmt_storage:/system/bin/rmt_storage \
    device/huawei/u8800/proprietry/bin/hw_diag_app:/system/bin/hw_diag_app \
    device/huawei/u8800/proprietry/bin/oem_rpc_svc:/system/bin/oem_rpc_svc \
    device/huawei/u8800/proprietry/bin/load_oemlogo:/system/bin/load_oemlogo \
    device/huawei/u8800/proprietry/bin/qmuxd:/system/bin/qmuxd \
    device/huawei/u8800/proprietry/bin/hostapd:/system/bin/hostapd \
    device/huawei/u8800/proprietry/bin/hostapd_cli:/system/bin/hostapd_cli \
# Bluetooth bin
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/bin/btwlancoex:/system/bin/btwlancoex \
#    device/huawei/u8800/proprierty/etc/main.conf:/system/etc/bluetooth/main.conf \
    device/huawei/u8800/proprietry/bin/hci_qcomm_init:/system/bin/hci_qcomm_init \
    
# Camera (Proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/libmmjpeg.so:/system/lib/libmmjpeg.so \
    device/huawei/u8800/proprietry/lib/libmmipl.so:/system/lib/libmmipl.so \

    
# Sensors (Proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/hw/sensors.default.so:/system/lib/hw/sensors.u8800.so \
    device/huawei/u8800/proprietry/bin/compassd:/system/bin/compassd \
    
# Sensors (Prebuilt)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/prebuilt/lib/libsensorservice.so:/system/lib/libsensorservice.so \

# Wifi 
PRODUCT_COPY_FILES += \
    device/huawei/u8800/prebuilt/modules/libra.ko:/system/lib/modules/libra.ko \
    device/huawei/u8800/prebuilt/modules/librasdioif.ko:/system/lib/modules/librasdioif.ko \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.build.baseband_version=129005 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false \



PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \


PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hwfeature_slavecamera=yes \
    ro.config.hwcameraset=63 \
    hw.secondary_mic=0 \
    ro.config.hw_addsettingsdbex=1 \
    ro.config.hw_gcf_mms=true \
    ro.config.wifi_chip_is_bcm=false \
    ro.config.hwft_PNN_function=true \
    persist.cust.tel.adapt=1 \
    persist.cust.tel.eons=1 \
    ro.config.hwfeature_gps_test=0 \
    ro.config.hwfeature_ecc=true \
    ro.config.lowbattery_shutdown=1 \
    ro.config.hwfeature_wakeupkey=1 \
    ro.config.endkeybehavior=true \
    ro.config.hw_menu_unlockscreen=false \
    ro.media.enc.lprof.duration=30 \
    ro.config.PicMaxSize=5mp \
    ro.config.hw_temperature_warn=true \
    ro.config.hw_clocksetting=0 \
    mot.proximity.delay=150 \
    ro.additionalmounts=/HWUserData \
    ro.vold.switchablepair=/mnt/sdcard,/HWUserData \
    ro.vold.umsdirtyratio=20 \

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240
 
# u8800 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

# Huawei libs(proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/libhwrpc.so:/system/lib/libhwrpc.so \
    device/huawei/u8800/proprietry/lib/libhwrpc.so:/obj/lib/libhwrpc.so \
    device/huawei/u8800/proprietry/lib/liboem_rapi.so:/system/lib/liboem_rapi.so \
    device/huawei/u8800/proprietry/lib/liboeminfo.so:/system/lib/liboeminfo.so \

$(call inherit-product-if-exists, vendor/huawei/u8800/u8800-vendor.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# libcamera
$(call inherit-product, device/huawei/u8800/libcamera/Android.mk)

#system patch  from dzo
PRODUCT_COPY_FILES += \
    device/huawei/u8800/DZO/lib/libOmxVenc.so:/system/lib/libOmxVenc.so \
#    device/huawei/u8800/DZO/lib/camera/libcamera_client.so:/system/lib/libcamera_client.so \
#    device/huawei/u8800/DZO/lib/camera/libcamera.so:/system/lib/libcamera.so \
    device/huawei/u8800/DZO/lib/libmedia_jni.so:/system/lib/libmedia_jni.so \
    device/huawei/u8800/DZO/lib/libmm-omxcore.so:/system/lib/libmm-omxcore.so \
    device/huawei/u8800/DZO/lib/libOmxCore.so:/system/lib/libOmxCore.so \
    device/huawei/u8800/DZO/lib/libOmxVdec.so:/system/lib/libOmxVdec.so \
    device/huawei/u8800/DZO/lib/liboverlay.so:/system/lib/liboverlay.so \
    device/huawei/u8800/DZO/lib/hw/overlay.default.so:/system/lib/hw/overlay.default.so \
    device/huawei/u8800/DZO/lib/libstagefright_color_conversion.so:/system/lib/libstagefright_color_conversion.so \
    device/huawei/u8800/DZO/lib/libstagefright_foundation.so:/system/lib/libstagefright_foundation.so \
    device/huawei/u8800/DZO/lib/libstagefrighthw.so:/system/lib/libstagefrighthw.so \
    device/huawei/u8800/DZO/lib/libstagefright_omx.so:/system/lib/libstagefright_omx.so \
    device/huawei/u8800/DZO/lib/libstagefright.so:/system/lib/libstagefright.so \
#    device/huawei/u8800/DZO/lib/camera/libcameraservice.so:/system/lib/libcameraservice.so \
