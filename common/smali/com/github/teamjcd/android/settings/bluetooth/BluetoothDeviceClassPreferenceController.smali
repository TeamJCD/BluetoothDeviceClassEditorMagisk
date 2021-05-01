.class public Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;
.super Lcom/android/settings/core/BasePreferenceController;
.source "BluetoothDeviceClassPreferenceController.java"

# interfaces
.implements Lcom/android/settingslib/core/lifecycle/LifecycleObserver;
.implements Lcom/android/settingslib/core/lifecycle/events/OnStart;
.implements Lcom/android/settingslib/core/lifecycle/events/OnStop;


# static fields
.field private static final TAG:Ljava/lang/String; = "BluetoothDeviceClassPrefCtrl"


# instance fields
.field private mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mPreference:Landroidx/preference/Preference;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/android/settings/core/BasePreferenceController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 32
    new-instance p2, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController$1;

    invoke-direct {p2, p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController$1;-><init>(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;)V

    iput-object p2, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 45
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p2

    iput-object p2, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez p2, :cond_0

    const-string p0, "BluetoothDeviceClassPrefCtrl"

    const-string p1, "Bluetooth is not supported on this device"

    .line 47
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 51
    :cond_0
    invoke-static {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->getBluetoothDeviceClassStore(Landroid/content/Context;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    move-result-object p1

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    return-void
.end method

.method static synthetic access$000(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->saveInitialValue()V

    return-void
.end method

.method static synthetic access$100(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;)Landroidx/preference/Preference;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mPreference:Landroidx/preference/Preference;

    return-object p0
.end method

.method private saveInitialValue()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    invoke-virtual {v0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->getDefault()Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object v0

    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveInitialValue(): defaultClass - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "BluetoothDeviceClassPrefCtrl"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v0

    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveInitialValue(): bluetoothClass - "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    new-instance v1, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    .line 123
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothClass;->getClassOfDevice()I

    move-result v0

    const-string v2, "Default"

    invoke-direct {v1, v2, v0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;-><init>(Ljava/lang/String;I)V

    .line 121
    invoke-virtual {p0, v1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->saveDefault(Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)Landroid/net/Uri;

    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic copy()V
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->copy()V

    return-void
.end method

.method public displayPreference(Landroidx/preference/PreferenceScreen;)V
    .locals 1

    .line 56
    invoke-super {p0, p1}, Lcom/android/settings/core/BasePreferenceController;->displayPreference(Landroidx/preference/PreferenceScreen;)V

    .line 57
    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->getPreferenceKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mPreference:Landroidx/preference/Preference;

    return-void
.end method

.method public getAvailabilityStatus()I
    .locals 0

    .line 99
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 p0, 0x3

    :goto_0
    return p0
.end method

.method public bridge synthetic getBackgroundWorkerClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/android/settings/slices/SliceBackgroundWorker;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->getBackgroundWorkerClass()Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getIntentFilter()Landroid/content/IntentFilter;
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object p0

    return-object p0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .locals 4

    .line 81
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v0

    .line 86
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothClass;->getClassOfDevice()I

    move-result v0

    .line 88
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    invoke-virtual {p0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->getAll()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    .line 89
    invoke-virtual {v2}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getDeviceClass()I

    move-result v3

    if-ne v3, v0, :cond_1

    .line 90
    invoke-virtual {v2}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v1
.end method

.method public handlePreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 2

    .line 104
    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->getPreferenceKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 105
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.BLUETOOTH_DEVICE_CLASS_SETTINGS"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, ":settings:show_fragment_as_subsetting"

    const/4 v1, 0x1

    .line 106
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 107
    iget-object p0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return v1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic hasAsyncUpdate()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->hasAsyncUpdate()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isCopyableSlice()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isCopyableSlice()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isPublicSlice()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isPublicSlice()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isSliceable()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isSliceable()Z

    move-result p0

    return p0
.end method

.method public onStart()V
    .locals 3

    .line 62
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 63
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 64
    iget-object v1, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 65
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->saveInitialValue()V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public updateState(Landroidx/preference/Preference;)V
    .locals 1

    .line 75
    invoke-virtual {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 76
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setVisible(Z)V

    return-void
.end method

.method public bridge synthetic useDynamicSliceSummary()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->useDynamicSliceSummary()Z

    move-result p0

    return p0
.end method
