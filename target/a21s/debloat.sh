# bloat/stuff that doesn't work
SYSTEM_DEBLOAT+="
system/app/BixbyWakeup
system/etc/permissions/privapp-permissions-com.samsung.android.bixby.wakeup.xml
system/etc/permissions/privapp-permissions-com.samsung.android.visionintelligence_v3.7.xml
system/etc/permissions/signature-permissions-com.samsung.android.visionintelligence_v3.7.xml
system/app/VisionIntelligence3.7
system/etc/permissions/privapp-permissions-com.samsung.android.app.interpreter.xml
system/etc/permissions/signature-permissions-com.samsung.android.app.interpreter.xml
system/priv-app/BixbyInterpreter
system/priv-app/BixbyVisionFramework3.5
system/etc/permissions/privapp-permissions-com.samsung.android.bixby.agent.xml
system/etc/permissions/signature-permissions-com.samsung.android.bixby.agent.xml
system/priv-app/Bixby
system/priv-app/StickerFaceARAvatar
system/etc/permissions/privapp-permissions-com.samsung.android.aremoji.xml
system/priv-app/AREmoji
system/app/WifiRROverlayAppLls
system/app/WifiRROverlayAppWifiLock
system/bin/mafpc_write
system/priv-app/GameDriver-EX2200
system/priv-app/DevGPUDriver-EX2200
system/etc/permissions/privapp-permissions-com.samsung.android.app.omcagent.xml
system/priv-app/OMCAgent5
"

SYSTEM_EXT_DEBLOAT+="
priv-app/AvatarPicker
"

PRODUCT_DEBLOAT+="
overlay/SoftapOverlayQC
"
