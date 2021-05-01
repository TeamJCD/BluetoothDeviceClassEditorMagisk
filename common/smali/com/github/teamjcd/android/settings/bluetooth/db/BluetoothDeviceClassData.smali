.class public Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;
.super Ljava/lang/Object;
.source "BluetoothDeviceClassData.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# instance fields
.field private deviceClass:I

.field private id:I

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0

    .line 25
    invoke-direct {p0, p2, p3}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;-><init>(Ljava/lang/String;I)V

    .line 26
    invoke-virtual {p0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->setId(I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->name:Ljava/lang/String;

    .line 21
    iput p2, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->deviceClass:I

    return-void
.end method

.method public static readFromCursor(Landroid/database/Cursor;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;
    .locals 4

    .line 61
    new-instance v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    const/4 v1, 0x0

    .line 62
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    .line 63
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    .line 64
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-direct {v0, v1, v2, p0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;-><init>(ILjava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public getDeviceClass()I
    .locals 0

    .line 49
    iget p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->deviceClass:I

    return p0
.end method

.method public getId()I
    .locals 0

    .line 33
    iget p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->id:I

    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 41
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->name:Ljava/lang/String;

    return-object p0
.end method

.method public isUserEditable()Z
    .locals 1

    .line 57
    iget p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->id:I

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setDeviceClass(I)V
    .locals 0

    .line 53
    iput p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->deviceClass:I

    return-void
.end method

.method public setId(I)V
    .locals 0

    .line 37
    iput p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->id:I

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->name:Ljava/lang/String;

    return-void
.end method

.method public toContentValues()Landroid/content/ContentValues;
    .locals 3

    .line 68
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 69
    iget-object v1, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->name:Ljava/lang/String;

    const-string v2, "name"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    iget p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->deviceClass:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v1, "class"

    invoke-virtual {v0, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method
