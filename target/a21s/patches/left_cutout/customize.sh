LOG "- Applying left camera cutout patch"
APPLY_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
    "$MODPATH/cutout/SystemUI.apk/0001-Add-left-cutout-support.patch"
