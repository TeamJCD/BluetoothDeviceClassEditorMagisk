.class public Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;
.super Ljava/lang/Object;
.source "BluetoothDeviceClassStore.java"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->context:Landroid/content/Context;

    return-void
.end method

.method public static getBluetoothDeviceClassStore(Landroid/content/Context;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;
    .locals 1

    .line 25
    new-instance v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;

    invoke-direct {v0, p0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private getFromCursor(Landroid/database/Cursor;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;
    .locals 0

    .line 75
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p0

    if-lez p0, :cond_0

    .line 76
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 77
    invoke-static {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->readFromCursor(Landroid/database/Cursor;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public delete(I)I
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 113
    :cond_0
    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->delete(Landroid/net/Uri;)I

    move-result p0

    return p0
.end method

.method public delete(Landroid/net/Uri;)I
    .locals 1

    .line 117
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public get(I)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;
    .locals 1

    .line 49
    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->get(Landroid/net/Uri;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object p0

    return-object p0
.end method

.method public get(Landroid/net/Uri;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;
    .locals 7

    .line 57
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v3, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassDatabaseHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 68
    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->getFromCursor(Landroid/database/Cursor;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 71
    throw p0
.end method

.method public getAll()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;",
            ">;"
        }
    .end annotation

    .line 29
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    sget-object v2, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassDatabaseHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 39
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 41
    :cond_0
    invoke-static {p0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->readFromCursor(Landroid/database/Cursor;)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 44
    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object v0
.end method

.method public getDefault()Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;
    .locals 1

    const/4 v0, 0x1

    .line 53
    invoke-virtual {p0, v0}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->get(I)Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;

    move-result-object p0

    return-object p0
.end method

.method public save(Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)Landroid/net/Uri;
    .locals 1

    .line 88
    invoke-virtual {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->toContentValues()Landroid/content/ContentValues;

    move-result-object p1

    .line 89
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    invoke-virtual {p0, v0, p1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public saveDefault(Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)Landroid/net/Uri;
    .locals 0

    .line 84
    invoke-virtual {p0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->save(Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public update(ILcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)I
    .locals 1

    .line 97
    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->update(Landroid/net/Uri;Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)I

    move-result p0

    return p0
.end method

.method public update(Landroid/net/Uri;Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)I
    .locals 1

    .line 101
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    .line 103
    invoke-virtual {p2}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->toContentValues()Landroid/content/ContentValues;

    move-result-object p2

    const/4 v0, 0x0

    .line 101
    invoke-virtual {p0, p1, p2, v0, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public update(Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)I
    .locals 1

    .line 93
    invoke-virtual {p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;->getId()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassStore;->update(ILcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassData;)I

    move-result p0

    return p0
.end method
