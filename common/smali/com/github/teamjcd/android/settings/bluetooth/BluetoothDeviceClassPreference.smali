.class public Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;
.super Landroidx/preference/Preference;
.source "BluetoothDeviceClassPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# static fields
.field private static mCurrentChecked:Landroid/widget/CompoundButton;

.field private static mSelectedKey:Ljava/lang/String;


# instance fields
.field private mHideDetails:Z

.field private mProtectFromCheckedChange:Z

.field private mSelectable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, v0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 36
    sget v0, Lcom/android/settings/R$attr;->bluetoothDeviceClassPreferenceStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mProtectFromCheckedChange:Z

    const/4 p2, 0x1

    .line 28
    iput-boolean p2, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectable:Z

    .line 29
    iput-boolean p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mHideDetails:Z

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 2

    .line 45
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    .line 47
    sget v0, Lcom/android/settings/R$id;->bluetooth_device_class_radiobutton:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 48
    instance-of v0, p1, Landroid/widget/RadioButton;

    if-eqz v0, :cond_2

    .line 49
    check-cast p1, Landroid/widget/RadioButton;

    .line 50
    iget-boolean v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectable:Z

    if-eqz v0, :cond_1

    .line 51
    invoke-virtual {p1, p0}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 53
    invoke-virtual {p0}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    sput-object p1, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    .line 56
    invoke-virtual {p0}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectedKey:Ljava/lang/String;

    :cond_0
    const/4 v1, 0x1

    .line 59
    iput-boolean v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mProtectFromCheckedChange:Z

    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    const/4 v0, 0x0

    .line 61
    iput-boolean v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mProtectFromCheckedChange:Z

    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/RadioButton;->setVisibility(I)V

    goto :goto_0

    :cond_1
    const/16 p0, 0x8

    .line 64
    invoke-virtual {p1, p0}, Landroid/widget/RadioButton;->setVisibility(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BluetoothDeviceClassPreference"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iget-boolean v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mProtectFromCheckedChange:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_2

    .line 103
    sget-object p2, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    if-eqz p2, :cond_1

    const/4 v0, 0x0

    .line 104
    invoke-virtual {p2, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 106
    :cond_1
    sput-object p1, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    .line 107
    invoke-virtual {p0}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectedKey:Ljava/lang/String;

    .line 108
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->callChangeListener(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    .line 110
    sput-object p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    .line 111
    sput-object p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectedKey:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method protected onClick()V
    .locals 5

    .line 71
    invoke-super {p0}, Landroidx/preference/Preference;->onClick()V

    .line 72
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 74
    iget-boolean v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mHideDetails:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 75
    sget p0, Lcom/android/settings/R$string;->cannot_change_bluetooth_device_class_toast:I

    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 76
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 80
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    .line 81
    sget-object v1, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    int-to-long v3, p0

    invoke-static {v1, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p0

    .line 82
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.github.teamjcd.android.settings.bluetooth.BluetoothDeviceClassSettings.ACTION_BLUETOOTH_DEVICE_CLASS_EDIT"

    invoke-direct {v1, v3, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 83
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 84
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public setChecked()V
    .locals 0

    .line 93
    invoke-virtual {p0}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectedKey:Ljava/lang/String;

    return-void
.end method

.method public setSelectable(Z)V
    .locals 0

    .line 116
    iput-boolean p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreference;->mSelectable:Z

    return-void
.end method
