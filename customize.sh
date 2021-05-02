# BluetoothDeviceClassEditor
# by TeamJCD

# working directory variables
settingsbasename=Settings
settingspath=`find $(magisk --path)/.magisk/mirror/system_root -mindepth 2 -name $settingsbasename.apk | tail -n 1`
backupdir=$MODPATH/backup
toolsdir=$MODPATH/tools
archtoolsdir=$toolsdir/$ARCH
tmpdir=$TMPDIR/BluetoothDeviceClassEditor

# set up extracted files and directories
chmod -R 755 $archtoolsdir
alias xmlstarlet=$archtoolsdir/xmlstarlet
alias zip=$archtoolsdir/zip

baksmali() {
  ANDROID_DATA=$tmpdir ANDROID_ROOT=/system LD_LIBRARY_PATH=/system/lib dalvikvm \
    -classpath $toolsdir/baksmali-*-dexed.jar org.jf.baksmali.Main d \
    -o $2 \
    $1

  test $? != 0 && abort "Decompiling APK classes failed. Aborting...";
}

smali() {
  ANDROID_DATA=$tmpdir ANDROID_ROOT=/system LD_LIBRARY_PATH=/system/lib dalvikvm \
    -classpath $toolsdir/smali-*-dexed.jar org.jf.smali.Main a \
    -o $2
    $1

  test $? != 0 && abort "Rebuilding APK classes failed. Aborting...";
}

backup() {
  ui_print "- Backup $settingspath to $backupdir/$settingsbasename.apk"

  mkdir -p $backupdir
  cp -fp $settingspath $backupdir/$settingsbasename.apk
}

extract() {
  ui_print "- Extracting $backupdir/$settingsbasename.apk to $tmpdir/$settingsbasename"

  mkdir -p $tmpdir/$settingsbasename
  unzip -o $backupdir/$settingsbasename.apk -d $tmpdir/$settingsbasename >&2
}

decompile() {
  ui_print "- Decompiling $backupdir/$settingsbasename/classes.dex to $tmpdir/$settingsbasename/classout"
  baksmali $tmpdir/$settingsbasename/classes.dex $tmpdir/$settingsbasename/classout
}

patchsettings() {
  ui_print "- Copying common files to $tmpdir/$settingsbasename"
  cp -R common/* $tmpdir/$settingsbasename/

  ui_print "- Patching $tmpdir/$settingsbasename/AndroidManifest.xml"

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

  ui_print "- Patching $tmpdir/$settingsbasename/res/xml/bluetooth_screen.xml"

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

rebuild() {
  ui_print "- Rebuilding $tmpdir/$settingsbasename/classout to $tmpdir/$settingsbasename/classes.dex"
  smali $tmpdir/$settingsbasename/classout $tmpdir/$settingsbasename/classes.dex
}

repackage() {
  ui_print "- Repackaging $tmpdir/$settingsbasename to $tmpdir/$settingsbasename.apk"
  zip $tmpdir/$settingsbasename $tmpdir/$settingsbasename.apk
}

move() {
  ui_print "- Moving $settingsbasename.apk"
  mv $tmpdir/$settingsbasename.apk $settingspath
  set_perm $settingspath root root 644
}

#cleanup() {
#  ui_print "- Cleanup"
#  rm -rf $tmpdir
#}

otasurvival() {
  ui_print "- Creating OTA survival service"
  cp -f $ZIPFILE install.zip
  sed -i "s|previoussettingsmd5sum_tmp|previoussettingsmd5sum=`md5sum $settingspath`|" service.sh
}

backup
extract
decompile
patchsettings
rebuild
repackage
#move
#cleanup
otasurvival
