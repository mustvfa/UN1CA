LOG "- Replacing fstab.exynos850 "
rm -f "$WORK_DIR/vendor/etc/fstab.exynos850"
cp -fa "$SRC_DIR/target/a21s/patches/vendor/vendor/etc/"*.exynos850 "$WORK_DIR/vendor/etc/"
