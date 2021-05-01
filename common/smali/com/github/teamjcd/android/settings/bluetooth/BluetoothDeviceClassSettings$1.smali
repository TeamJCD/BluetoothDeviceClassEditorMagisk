.class Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothDeviceClassSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;


# direct methods
.method constructor <init>(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings$1;->this$0:Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 51
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 52
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings$1;->this$0:Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;

    invoke-static {p0}, Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;->access$000(Lcom/github/teamjcd/android/settings/bluetooth/BluetoothDeviceClassSettings;)V

    :cond_0
    return-void
.end method
