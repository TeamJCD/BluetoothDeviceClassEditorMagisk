.class public Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "BluetoothDeviceClassSettings.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 48
    new-instance v0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings$1;

    invoke-direct {v0, p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings$1;-><init>(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;)V

    iput-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->fillList()V

    return-void
.end method

.method private addNewBluetoothDeviceClass()V
    .locals 3

    .line 177
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    const-string v2, "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.ACTION_BLUETOOTH_DEVICE_CLASS_INSERT"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v1, 0x1

    .line 178
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 179
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private fillList()V
    .locals 9

    .line 142
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    invoke-virtual {v0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->getAll()Ljava/util/List;

    move-result-object v0

    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fillList(): codDataList - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "BluetoothDeviceClassSettings"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "bluetooth_device_class_list"

    .line 146
    invoke-virtual {p0, v1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/PreferenceGroup;

    .line 147
    invoke-virtual {v1}, Landroidx/preference/PreferenceGroup;->removeAll()V

    .line 149
    iget-object v3, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v3

    .line 150
    invoke-virtual {v3}, Landroid/bluetooth/BluetoothClass;->getClassOfDevice()I

    move-result v3

    .line 152
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    .line 153
    new-instance v5, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;-><init>(Landroid/content/Context;)V

    .line 155
    invoke-virtual {v4}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 156
    invoke-virtual {v4}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v6, 0x0

    .line 157
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->setPersistent(Z)V

    .line 158
    invoke-virtual {v5, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 160
    invoke-virtual {v4}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getDeviceClass()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    .line 161
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "000000"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 162
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v7, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 161
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 164
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "fillList(): codData.getDeviceClass - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    invoke-virtual {v4}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getDeviceClass()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " deviceClass - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 164
    invoke-static {v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-virtual {v4}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getDeviceClass()I

    move-result v4

    if-ne v4, v3, :cond_0

    .line 168
    invoke-virtual {v5}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->setChecked()V

    .line 171
    :cond_0
    invoke-virtual {v1, v5}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x19

    return p0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    .line 80
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 81
    sget p1, Lcom/android/settings/R$xml;->bluetooth_device_class_settings:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 65
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 67
    new-instance p1, Landroid/content/IntentFilter;

    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-direct {p1, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mIntentFilter:Landroid/content/IntentFilter;

    .line 68
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p1

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 69
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->getBluetoothDeviceClassStore(Landroid/content/Context;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    move-result-object p1

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    .line 73
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result p1

    if-nez p1, :cond_0

    .line 74
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {p0}, Landroid/bluetooth/BluetoothAdapter;->enable()Z

    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3

    .line 107
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->menu_new:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 106
    invoke-interface {p1, v1, v2, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sget v1, Lcom/android/settings/R$drawable;->ic_add_24dp:I

    .line 108
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 109
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 111
    invoke-super {p0, p1, p2}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 101
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onDestroy()V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 116
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 122
    invoke-super {p0, p1}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    .line 118
    :cond_0
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->addNewBluetoothDeviceClass()V

    return v1
.end method

.method public onPause()V
    .locals 1

    .line 94
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onPause()V

    .line 96
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, p0}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPreferenceChange(): Preference - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", newValue - "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", newValue type - "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "BluetoothDeviceClassSettings"

    .line 127
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 132
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->get(I)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 134
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    new-instance p2, Landroid/bluetooth/BluetoothClass;

    invoke-virtual {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getDeviceClass()I

    move-result p1

    invoke-direct {p2, p1}, Landroid/bluetooth/BluetoothClass;-><init>(I)V

    invoke-virtual {p0, p2}, Landroid/bluetooth/BluetoothAdapter;->setBluetoothClass(Landroid/bluetooth/BluetoothClass;)Z

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public onResume()V
    .locals 3

    .line 86
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 88
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 89
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->fillList()V

    return-void
.end method
