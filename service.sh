# BluetoothDeviceClassEditor
# ota survival script
# by TeamJCD

previoussettingsmd5sum_tmp

settingspath=`find $(magisk --path)/.magisk/mirror/system_root -mindepth 2 -name Settings.apk | tail -n 1`

if [[ $previoussettingsmd5sum != `md5sum $settingspath` ]]; then
  magisk --install-module /data/adb/modules/BluetoothDeviceClassEditor/install.zip
else
  exit
fi
