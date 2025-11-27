#
# Copyright (C) 2023 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# UN1CA debloat list
# - Add entries inside the specific partition containing that file (<PARTITION>_DEBLOAT+="")
# - DO NOT add the partition name at the start of any entry (eg. "/system/dpolicy_system")
# - DO NOT add a slash at the start of any entry (eg. "/dpolicy_system
# Samsung SIM Unlock
# Recovery restoration script
# Vendor sepolicy version
# Apps debloat
PRODUCT_DEBLOAT+="
app/DuoStub
"

SYSTEM_DEBLOAT+="
system/app/FBAppManager_NS
system/app/PlayAutoInstallConfig
system/app/SamsungPassAutofill_v1
system/app/SamsungTTSVoice_de_DE_f00
system/app/SamsungTTSVoice_en_GB_f00
system/app/SamsungTTSVoice_en_US_l03
system/app/SamsungTTSVoice_es_ES_f00
system/app/SamsungTTSVoice_es_MX_f00
system/app/SamsungTTSVoice_es_US_f00
system/app/SamsungTTSVoice_fr_FR_f00
system/app/SamsungTTSVoice_hi_IN_f00
system/app/SamsungTTSVoice_it_IT_f00
system/app/SamsungTTSVoice_pl_PL_f00
system/app/SamsungTTSVoice_pt_BR_f00
system/app/SamsungTTSVoice_ru_RU_f00
system/app/SamsungTTSVoice_th_TH_f00
system/app/SamsungTTSVoice_vi_VN_f00
system/app/SamsungTTSVoice_el_GR_f00
system/etc/permissions/com.samsung.feature.aremoji_v2.xml
system/etc/permissions/privapp-permissions-com.samsung.android.aremoji.xml
system/etc/permissions/privapp-permissions-com.samsung.android.aremojieditor.xml
system/etc/permissions/privapp-permissions-com.samsung.android.smartswitchassistant.xml
system/etc/permissions/privapp-permissions-com.sec.android.app.billing.xml
system/etc/permissions/privapp-permissions-com.sec.android.app.magnifier.xml
system/etc/permissions/signature-permissions-com.samsung.android.samsungpass.xml
system/etc/permissions/signature-permissions-com.samsung.android.samsungpassautofill.xml
system/etc/permissions/signature-permissions-com.samsung.android.spay.xml
system/etc/permissions/signature-permissions-com.samsung.android.spayfw.xml
system/etc/permissions/signature-permissions-com.sec.android.app.magnifier.xml
system/priv-app/AuthFramework
system/priv-app/DeviceKeystring
system/priv-app/DiagMonAgent94
system/priv-app/DigitalKey
system/priv-app/FBInstaller_NS
system/priv-app/FBServices
system/priv-app/FotaAgent
system/priv-app/OMCAgent5
system/priv-app/OneDrive_Samsung_v3
system/priv-app/PaymentFramework
system/priv-app/SOAgent75
system/priv-app/SPPPushClient
system/priv-app/SamsungBilling
system/priv-app/SamsungCarKeyFw
system/priv-app/SamsungMagnifier3
system/priv-app/SamsungPass
system/priv-app/SmartSwitchAssistant
system/priv-app/YourPhone_P1_5
"

PRODUCT_DEBLOAT+="
app/AssistantShell
app/Chrome64
app/Gmail2
app/Maps
app/Photos
app/YouTube
overlay/GmsConfigOverlaySearchSelector.apk
priv-app/SearchSelector
"

SYSTEM_DEBLOAT+="
system/app/BookmarkProvider
system/app/FactoryAirCommandManager
system/app/GearManagerStub
system/app/MAPSAgent
system/app/MDMApp
system/app/Rampart
system/app/WifiGuider
system/etc/default-permissions/default-permissions-com.sec.spp.push.xml
system/etc/permissions/authfw.xml
system/etc/permissions/com.samsung.feature.ipsgeofence.xml
system/etc/permissions/com.samsung.feature.samsungpositioning.xml
system/etc/permissions/privapp-permissions-com.microsoft.skydrive.xml
system/etc/permissions/privapp-permissions-com.samsung.android.authfw.xml
system/etc/permissions/privapp-permissions-com.samsung.android.carkey.xml
system/etc/permissions/privapp-permissions-com.samsung.android.providers.factory.xml
system/etc/permissions/privapp-permissions-com.samsung.android.ipsgeofence.xml
system/etc/permissions/privapp-permissions-com.samsung.android.samsungpass.xml
system/etc/permissions/privapp-permissions-com.samsung.android.samsungpositioning.xml
system/etc/permissions/privapp-permissions-com.samsung.android.spayfw.xml
system/etc/permissions/privapp-permissions-com.sec.android.app.factorykeystring.xml
system/etc/permissions/privapp-permissions-com.sem.factoryapp.xml
system/etc/permissions/privapp-permissions-com.sec.imslogger.xml
system/etc/permissions/privapp-permissions-com.sec.spp.push.xml
system/etc/permissions/privapp-permissions-com.skms.android.agent.xml
system/etc/PF_TA
system/etc/sysconfig/preinstalled-packages-com.samsung.android.dkey.xml
system/etc/sysconfig/preinstalled-packages-com.samsung.android.spayfw.xml
system/etc/sysconfig/samsungauthframework.xml
system/etc/sysconfig/samsungpassapp.xml
system/etc/sysconfig/samsungpushservice.xml
system/hidden/SmartTutor
system/preload/Facebook_stub_preload
system/priv-app/AvatarEmojiSticker
system/priv-app/EnhancedAttestationAgent
system/priv-app/FacAtFunction
system/priv-app/KLMSAgent
system/priv-app/ImsLogger
system/priv-app/IpsGeofence
system/priv-app/ModemServiceMode
system/priv-app/LinkToWindowsService
system/priv-app/OdaService
system/priv-app/SamsungPositioning
system/priv-app/TalkbackSE
"

# Camera SDK
SYSTEM_DEBLOAT+="
system/etc/default-permissions/default-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/default-permissions/default-permissions-com.samsung.petservice.xml
system/etc/permissions/cameraservice.xml
system/etc/permissions/privapp-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/permissions/privapp-permissions-com.samsung.petservice.xml
system/etc/permissions/sec_camerax_impl.xml
system/etc/permissions/sec_camerax_service.xml
system/priv-app/GlobalPostProcMgr
system/priv-app/PetService
system/priv-app/SCameraSDKService
system/priv-app/sec_camerax_service
"

#extra debloat
SYSTEM_DEBLOAT+="
system/app/LiveTranscribe
system/app/AREmoji
system/app/KidsHome_Installer
system/app/ParentalCare
system/app/SamsungCalendar
system/app/PartnerBookmarksProvider
system/app/StickerCenter
system/app/SmartSwitchAgent
system/app/SmartSwitchStub
system/app/BixbyWakeup
system/app/FactoryCameraFB
system/app/ARCore
system/app/BBCAgent
system/priv-app/AREmoji
system/priv-app/AREmojiEditor
system/priv-app/BixbyInterpreter
system/priv-app/BixbyVisionFramework3.5
system/priv-app/Bixby
system/priv-app/StickerFaceARAvatar
system/priv-app/SamsungCalendarProvider
system/priv-app/BadgeProvider_N
system/priv-app/AvatarPicker
system/app/SketchBook
system/app/UnifiedWFC
system/priv-app/AutoDoodle
system/priv-app/VexScanner
"

PRODUCT_DEBLOAT+="
app/com.google.mainline.telemetry
app/com.google.mainline.adservices
app/SpeechServicesByGoogle
priv-app/AiWallpaper
priv-app/GooglePartnerSetup
"
