rm -rf ~/unicaa/out/target/a21s/work_dir/vendor/

mkdir ~/unicaa/out/target/a21s/work_dir/vendor/                                                                                       

cp -f target/a21s/patches/vndr/fs_config-vendor out/target/a21s/work_dir/configs/fs_config-vendor
cp -f target/a21s/patches/vndr/file_context-vendor out/target/a21s/work_dir/configs/file_context-vendor

cp -r target/a21s/patches/vndr/vndr/* ~/unicaa/out/target/a21s/work_dir/vendor/

#idk where else to add it
cat >> out/target/a21s/work_dir/configs/file_context-system <<'EOF'
/system/saiv/image_understanding u:object_r:system_file:s0
/system/saiv/image_understanding/db u:object_r:system_file:s0
EOF

cat >> out/target/a21s/work_dir/configs/fs_config-system <<'EOF'
system/saiv/image_understanding 0 0 755 
system/saiv/image_understanding/db 0 0 755 
EOF
