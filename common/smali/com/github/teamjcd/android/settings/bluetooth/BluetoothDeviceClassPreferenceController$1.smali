.class Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController$1;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothDeviceClassPreferenceController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;


# direct methods
.method constructor <init>(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController$1;->this$0:Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 35
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 36
    iget-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController$1;->this$0:Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;

    invoke-static {p1}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->access$000(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;)V

    .line 37
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController$1;->this$0:Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;

    invoke-static {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->access$100(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;)Landroidx/preference/Preference;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassPreferenceController;->updateState(Landroidx/preference/Preference;)V

    :cond_0
    return-void
.end method
