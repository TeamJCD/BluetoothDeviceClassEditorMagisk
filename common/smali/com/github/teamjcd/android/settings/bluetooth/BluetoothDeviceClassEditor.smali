.class public Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "BluetoothDeviceClassEditor.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor$ErrorDialog;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

.field private mBluetoothDeviceClassUri:Landroid/net/Uri;

.field private mClass:Landroidx/preference/EditTextPreference;

.field private mName:Landroidx/preference/EditTextPreference;

.field private mNewBluetoothDeviceClass:Z

.field private mReadOnlyBluetoothDeviceClass:Z

.field private mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    const-class v0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;)Ljava/lang/String;
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->validateBluetoothDeviceClassData()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private fillUI(Z)V
    .locals 3

    if-eqz p1, :cond_0

    .line 199
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mName:Landroidx/preference/EditTextPreference;

    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    invoke-virtual {v0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 200
    iget-boolean p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mNewBluetoothDeviceClass:Z

    if-nez p1, :cond_0

    .line 201
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    .line 202
    invoke-virtual {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getDeviceClass()I

    move-result p1

    .line 201
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    .line 203
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mClass:Landroidx/preference/EditTextPreference;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "000000"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 204
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 203
    invoke-virtual {v0, p1}, Landroidx/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 208
    :cond_0
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mName:Landroidx/preference/EditTextPreference;

    invoke-virtual {p1}, Landroidx/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 209
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mClass:Landroidx/preference/EditTextPreference;

    invoke-virtual {p0}, Landroidx/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private initBluetoothDeviceClassEditorUi()V
    .locals 1

    .line 191
    sget v0, Lcom/android/settings/R$xml;->bluetooth_device_class_editor:I

    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    const-string v0, "bluetooth_device_class_name"

    .line 193
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/EditTextPreference;

    iput-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mName:Landroidx/preference/EditTextPreference;

    const-string v0, "bluetooth_device_class_class"

    .line 194
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/EditTextPreference;

    iput-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mClass:Landroidx/preference/EditTextPreference;

    return-void
.end method

.method private showError()V
    .locals 0

    .line 258
    invoke-static {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor$ErrorDialog;->showError(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;)V

    return-void
.end method

.method private validateAndSaveBluetoothDeviceClassData()Z
    .locals 3

    .line 213
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->validateBluetoothDeviceClassData()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 215
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->showError()V

    const/4 p0, 0x0

    return p0

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    iget-object v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mName:Landroidx/preference/EditTextPreference;

    invoke-virtual {v1}, Landroidx/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->setName(Ljava/lang/String;)V

    .line 221
    iget-boolean v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mReadOnlyBluetoothDeviceClass:Z

    if-nez v0, :cond_1

    .line 222
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    iget-object v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mClass:Landroidx/preference/EditTextPreference;

    invoke-virtual {v1}, Landroidx/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseUnsignedInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->setDeviceClass(I)V

    .line 225
    :cond_1
    iget-boolean v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mNewBluetoothDeviceClass:Z

    if-eqz v0, :cond_2

    .line 226
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    invoke-virtual {v0, p0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->save(Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)Landroid/net/Uri;

    goto :goto_0

    .line 228
    :cond_2
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    invoke-virtual {v0, p0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->update(Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)I

    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private validateBluetoothDeviceClassData()Ljava/lang/String;
    .locals 3

    .line 237
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mName:Landroidx/preference/EditTextPreference;

    invoke-virtual {v0}, Landroidx/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v0

    .line 238
    iget-object v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mClass:Landroidx/preference/EditTextPreference;

    invoke-virtual {v1}, Landroidx/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v1

    .line 240
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lcom/android/settings/R$string;->error_name_empty:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 242
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 243
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lcom/android/settings/R$string;->error_device_class_empty:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    const/16 v2, 0x10

    .line 248
    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Integer;->parseUnsignedInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 250
    :catch_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/android/settings/R$string;->error_device_class_invalid:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_2
    :goto_1
    return-object v0
.end method


# virtual methods
.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x1a

    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 58
    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->TAG:Ljava/lang/String;

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 60
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 61
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 63
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    return-void

    .line 68
    :cond_0
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->initBluetoothDeviceClassEditorUi()V

    const/4 v2, 0x0

    const-string v3, "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.ACTION_BLUETOOTH_DEVICE_CLASS_EDIT"

    .line 71
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    .line 72
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 73
    sget-object p1, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    invoke-virtual {v2, p1}, Landroid/net/Uri;->isPathPrefixMatch(Landroid/net/Uri;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 74
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Edit request not for device class table. Uri: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    return-void

    :cond_1
    const-string v3, "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.ACTION_BLUETOOTH_DEVICE_CLASS_INSERT"

    .line 78
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 79
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassUri:Landroid/net/Uri;

    .line 80
    sget-object v1, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    invoke-virtual {p1, v1}, Landroid/net/Uri;->isPathPrefixMatch(Landroid/net/Uri;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 81
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Insert request not for device class table. Uri: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassUri:Landroid/net/Uri;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    return-void

    .line 85
    :cond_2
    iput-boolean v4, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mNewBluetoothDeviceClass:Z

    .line 91
    :cond_3
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->getBluetoothDeviceClassStore(Landroid/content/Context;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    move-result-object p1

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    if-eqz v2, :cond_4

    .line 94
    invoke-virtual {p1, v2}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->get(Landroid/net/Uri;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object p1

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    goto :goto_0

    .line 96
    :cond_4
    new-instance p1, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    invoke-direct {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;-><init>()V

    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    .line 99
    :goto_0
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    invoke-virtual {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->isUserEditable()Z

    move-result p1

    xor-int/2addr p1, v4

    iput-boolean p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mReadOnlyBluetoothDeviceClass:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    .line 102
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mClass:Landroidx/preference/EditTextPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 105
    :cond_5
    :goto_1
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/preference/PreferenceGroup;->getPreferenceCount()I

    move-result p1

    if-ge v0, p1, :cond_6

    .line 106
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->getPreference(I)Landroidx/preference/Preference;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_6
    return-void

    .line 87
    :cond_7
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    .line 129
    invoke-super {p0, p1, p2}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 131
    iget-boolean p2, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mNewBluetoothDeviceClass:Z

    const/4 v0, 0x0

    if-nez p2, :cond_0

    iget-boolean p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mReadOnlyBluetoothDeviceClass:Z

    if-nez p0, :cond_0

    const/4 p0, 0x1

    .line 132
    sget p2, Lcom/android/settings/R$string;->menu_delete_bluetooth_device_class:I

    invoke-interface {p1, v0, p0, v0, p2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p0

    sget p2, Lcom/android/settings/R$drawable;->ic_delete:I

    .line 133
    invoke-interface {p0, p2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    :cond_0
    const/4 p0, 0x2

    .line 136
    sget p2, Lcom/android/settings/R$string;->menu_save:I

    invoke-interface {p1, v0, p0, v0, p2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p0

    const p2, 0x108004e

    .line 137
    invoke-interface {p0, p2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    const/4 p0, 0x3

    .line 139
    sget p2, Lcom/android/settings/R$string;->menu_cancel:I

    invoke-interface {p1, v0, p0, v0, p2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p0

    const p1, 0x1080038

    .line 140
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 173
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_0

    return p3

    :cond_0
    const/4 p1, 0x4

    if-eq p2, p1, :cond_1

    return p3

    .line 179
    :cond_1
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->validateAndSaveBluetoothDeviceClassData()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 180
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    .line 145
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    .line 159
    invoke-super {p0, p1}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    .line 156
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    return v1

    .line 151
    :cond_1
    invoke-direct {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->validateAndSaveBluetoothDeviceClassData()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 152
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    :cond_2
    return v1

    .line 147
    :cond_3
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mStore:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->mBluetoothDeviceClassData:Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    invoke-virtual {v0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getId()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->delete(I)I

    .line 148
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    return v1
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    if-eqz p2, :cond_0

    .line 123
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    return p0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 165
    invoke-super {p0, p1, p2}, Landroidx/preference/PreferenceFragmentCompat;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 166
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    const/4 p0, 0x1

    .line 167
    invoke-virtual {p1, p0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 168
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 0

    .line 112
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onViewStateRestored(Landroid/os/Bundle;)V

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 113
    :goto_0
    invoke-direct {p0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassEditor;->fillUI(Z)V

    return-void
.end method
