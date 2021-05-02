# BluetoothDeviceClassEditor
# by TeamJCD

settingsbasename=Settings
settingspath=`find $(magisk --path)/.magisk/mirror/system_root -mindepth 2 -name $settingsbasename.apk | tail -n 1`
backupdir=$MODPATH/backup

restore() {
  ui_print "- Restoring $settingsbasename.apk"
  mv $backupdir/$settingsbasename.apk $settingspath
  set_perm $settingspath root root 644
}

restore
