# BluetoothDeviceClassEditor
# by TeamJCD

# working directory variables
settingsbasename=Settings
settingspath=`find $(magisk --path)/.magisk/mirror/system -mindepth 2 -name $settingsbasename.apk | tail -n 1`
backupdir=$MODPATH/backup
toolsdir=$MODPATH/tools
archtoolsdir=$toolsdir/$ARCH
tmpdir=$TMPDIR/BluetoothDeviceClassEditor

# set up extracted files and directories
chmod -R 755 $archtoolsdir
alias xmlstarlet=$archtoolsdir/xmlstarlet

apktool_d() {
  ANDROID_DATA=$tmpdir ANDROID_ROOT=/system LD_LIBRARY_PATH=/system/lib dalvikvm -Xbootclasspath:/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/apache-xml.jar -classpath $toolsdir/apktool_*-dexed.jar brut.apktool.Main d --frame-path $tmpdir/framework -o $tmpdir/$(basename $1 .apk) $1
  test $? != 0 && abort "Decoding APK resources failed. Aborting..."
}

apktool_b() {
  ANDROID_DATA=$tmpdir ANDROID_ROOT=/system LD_LIBRARY_PATH=/system/lib dalvikvm -Xbootclasspath:/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/apache-xml.jar -classpath $toolsdir/apktool_*-dexed.jar brut.apktool.Main b --frame-path $tmpdir/framework --use-aapt2 --aapt $archtoolsdir/aapt2 --copy-original -o $1 $tmpdir/$1.apk
  test $? != 0 && abort "Rebuilding APK resources failed. Aborting..."
}

backup() {
  ui_print "- Backup $settingspath"

  mkdir -p $backupdir
  cp -fp $settingspath $backupdir/$settingsbasename.apk
}

decode() {
  ui_print "- Decoding $settingsbasename.apk"

  mkdir -p $tmpdir/$settingsbasename
  apktool_d $backupdir/$settingsbasename.apk
}

patchsettings() {
  ui_print "- Patching $settingsbasename.apk"
  cp -R common/* $tmpdir/$settingsbasename/

  xmlstarlet ed -L -S \
    --subnode '/manifest/application' \
    --type elem -n provider \
    --insert '//provider[not(@android:name)]' \
    --type attr -n android:enabled -v "true" \
    --insert '//provider[not(@android:name)]' \
    --type attr -n android:authorities -v "com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider" \
    --insert '//provider[not(@android:name)]' \
    --type attr -n android:name -v "com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider" \
    $tmpdir/$settingsbasename/AndroidManifest.xml

  xmlstarlet ed -L -S \
    --subnode '/manifest/application' \
    --type elem -n activity \
    --subnode '//activity[not(@android:name)]' \
    --type elem -n intent-filter \
    --insert '//activity[not(@android:name)]/intent-filter' \
    --type attr -n android:priority -v 1 \
    --subnode '//activity[not(@android:name)]/intent-filter' \
    --type elem -n action \
    --insert '//activity[not(@android:name)]/intent-filter/action' \
    --type attr -n android:name -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.BLUETOOTH_DEVICE_CLASS_SETTINGS" \
    --subnode '//activity[not(@android:name)]/intent-filter' \
    --type elem -n category \
    --insert '//activity[not(@android:name)]/intent-filter/category' \
    --type attr -n android:name -v "android.intent.category.DEFAULT" \
    --subnode '//activity[not(@android:name)]' \
    --type elem -n intent-filter \
    --subnode '//activity[not(@android:name)]/intent-filter[2]' \
    --type elem -n action \
    --insert '//activity[not(@android:name)]/intent-filter[2]/action' \
    --type attr -n android:name -v "android.intent.action.MAIN" \
    --subnode '//activity[not(@android:name)]/intent-filter[2]' \
    --type elem -n category \
    --insert '//activity[not(@android:name)]/intent-filter[2]/category' \
    --type attr -n android:name -v "android.intent.category.DEFAULT" \
    --subnode '//activity[not(@android:name)]' \
    --type elem -n meta-data \
    --insert '//activity[not(@android:name)]/meta-data' \
    --type attr -n android:name -v "com.android.settings.FRAGMENT_CLASS" \
    --insert '//activity[not(@android:name)]/meta-data' \
    --type attr -n android:value -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings" \
    --insert '//activity[not(@android:name)]' \
    --type attr -n android:configChanges -v "orientation|keyboardHidden|screenSize" \
    --insert '//activity[not(@android:name)]' \
    --type attr -n android:label -v "@string/bluetooth_device_class_settings" \
    --insert '//activity[not(@android:name)]' \
    --type attr -n android:name -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettingsActivity" \
    $tmpdir/$settingsbasename/AndroidManifest.xml

  xmlstarlet ed -L -S \
    --subnode '/manifest/application' \
    --type elem -n activity \
    --subnode '//activity[not(@android:name)]' \
    --type elem -n intent-filter \
    --subnode '//activity[not(@android:name)]/intent-filter' \
    --type elem -n action \
    --insert '//activity[not(@android:name)]/intent-filter/action' \
    --type attr -n android:name -v "android.intent.action.VIEW" \
    --subnode '//activity[not(@android:name)]/intent-filter' \
    --type elem -n action \
    --insert '//activity[not(@android:name)]/intent-filter/action[2]' \
    --type attr -n android:name -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.ACTION_BLUETOOTH_DEVICE_CLASS_EDIT" \
    --subnode '//activity[not(@android:name)]/intent-filter' \
    --type elem -n category \
    --insert '//activity[not(@android:name)]/intent-filter/category' \
    --type attr -n android:name -v "android.intent.category.DEFAULT" \
    --subnode '//activity[not(@android:name)]/intent-filter' \
    --type elem -n data \
    --insert '//activity[not(@android:name)]/intent-filter/data' \
    --type attr -n android:mimeType -v "vnd.android.cursor.item/vnd.com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider.device_class" \
    --subnode '//activity[not(@android:name)]' \
    --type elem -n intent-filter \
    --subnode '//activity[not(@android:name)]/intent-filter[2]' \
    --type elem -n action \
    --insert '//activity[not(@android:name)]/intent-filter[2]/action' \
    --type attr -n android:name -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.ACTION_BLUETOOTH_DEVICE_CLASS_INSERT" \
    --subnode '//activity[not(@android:name)]/intent-filter[2]' \
    --type elem -n category \
    --insert '//activity[not(@android:name)]/intent-filter[2]/category' \
    --type attr -n android:name -v "android.intent.category.DEFAULT" \
    --subnode '//activity[not(@android:name)]/intent-filter[2]' \
    --type elem -n data \
    --insert '//activity[not(@android:name)]/intent-filter[2]/data' \
    --type attr -n android:mimeType -v "vnd.android.cursor.dir/vnd.com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider.device_class" \
    --subnode '//activity[not(@android:name)]' \
    --type elem -n meta-data \
    --insert '//activity[not(@android:name)]/meta-data' \
    --type attr -n android:name -v "com.android.settings.FRAGMENT_CLASS" \
    --insert '//activity[not(@android:name)]/meta-data' \
    --type attr -n android:value -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassEditor" \
    --insert '//activity[not(@android:name)]' \
    --type attr -n android:configChanges -v "orientation|keyboardHidden|screenSize" \
    --insert '//activity[not(@android:name)]' \
    --type attr -n android:label -v "@string/bluetooth_device_class_edit" \
    --insert '//activity[not(@android:name)]' \
    --type attr -n android:name -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassEditorActivity" \
    $tmpdir/$settingsbasename/AndroidManifest.xml

  xmlstarlet ed -L -S \
    --append '/PreferenceScreen/Preference[@android:key="bluetooth_screen_bt_pair_rename_devices"]' \
    --type elem -n Preference \
    --insert '/PreferenceScreen/Preference[not(@android:key)]' \
    --type attr -n android:title -v "@string/bluetooth_device_class" \
    --insert '/PreferenceScreen/Preference[not(@android:key)]' \
    --type attr -n settings:controller -v "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassPreferenceController" \
    --insert '/PreferenceScreen/Preference[not(@android:key)]' \
    --type attr -n android:key -v "bluetooth_screen_bt_pair_change_device_class" \
    $tmpdir/$settingsbasename/res/xml/bluetooth_screen.xml
}

build() {
  ui_print "- Rebuilding $settingsbasename.apk"
  apktool_b $tmpdir/$settingsbasename
}

move() {
  ui_print "- Moving $settingsbasename.apk"
  mv $tmpdir/$settingsbasename.apk $settingspath
  set_perm $settingspath root root 644
}

cleanup() {
  ui_print "- Cleanup"
  rm -rf $tmpdir
}

otasurvival() {
  ui_print "- Creating OTA survival service"
  cp -f $ZIPFILE install.zip
  sed -i "s|previoussettingsmd5sum_tmp|previoussettingsmd5sum=`md5sum $settingspath`|" service.sh
}

backup
decode
patchsettings
build
#move
#cleanup
otasurvival
