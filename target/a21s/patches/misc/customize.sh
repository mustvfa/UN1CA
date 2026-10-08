LOG "-Disabling encryption"
# Encryption
LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.exynos850")
sed -i "${LINE}s/,fileencryption=ice//g" "$WORK_DIR/vendor/etc/fstab.exynos850"

# ODE
sed -i -e "/ODE/d" -e "/keydata/d" -e "/keyrefuge/d" "$WORK_DIR/vendor/etc/fstab.exynos850"
