.class public Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;
.super Landroid/content/ContentProvider;
.source "BluetoothDeviceClassContentProvider.java"


# static fields
.field private static final BASE_URI:Landroid/net/Uri;

.field public static final DEVICE_CLASS_URI:Landroid/net/Uri;

.field private static final uriMatcher:Landroid/content/UriMatcher;


# instance fields
.field private database:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 15
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v0, "content://com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider"

    .line 17
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->BASE_URI:Landroid/net/Uri;

    const-string v1, "device_class"

    .line 19
    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->DEVICE_CLASS_URI:Landroid/net/Uri;

    .line 29
    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v2, "com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 30
    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v1, "device_class/#"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v1, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1

    .line 89
    sget-object p2, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p2

    .line 90
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    const/4 p3, 0x0

    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    .line 91
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    .line 95
    :cond_0
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->database:Landroid/database/sqlite/SQLiteDatabase;

    new-array p2, v0, [Ljava/lang/String;

    aput-object p1, p2, p3

    const-string p1, "DeviceClass"

    const-string p3, "_id = ?"

    invoke-virtual {p0, p1, p3, p2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_1
    :goto_0
    return p3
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    .line 67
    sget-object p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const-string p0, "vnd.android.cursor.item/vnd.com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider.device_class"

    return-object p0

    .line 73
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown URI: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    const-string p0, "vnd.android.cursor.dir/vnd.com.github.teamjcd.android.settings.bluetooth.db.BluetoothDeviceClassContentProvider.device_class"

    return-object p0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 2

    .line 79
    sget-object v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 83
    :cond_0
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v0, "DeviceClass"

    .line 84
    invoke-virtual {p0, v0, v1, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    .line 83
    invoke-static {p1, p0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public onCreate()Z
    .locals 2

    .line 37
    new-instance v0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassDatabaseHelper;

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassDatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 38
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->database:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8

    .line 44
    sget-object p3, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p3

    const/4 p4, 0x0

    if-gez p3, :cond_0

    return-object p4

    :cond_0
    const/4 p5, 0x1

    if-ne p3, p5, :cond_1

    .line 51
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    new-array p4, p5, [Ljava/lang/String;

    const/4 p3, 0x0

    aput-object p1, p4, p3

    const-string p1, "_id = ?"

    move-object v3, p1

    move-object v4, p4

    goto :goto_0

    :cond_1
    move-object v3, p4

    move-object v4, v3

    .line 56
    :goto_0
    iget-object v0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->database:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "DeviceClass"

    move-object v2, p2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 100
    sget-object p3, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p3

    .line 101
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    const/4 p4, 0x1

    if-ne p3, p4, :cond_0

    .line 102
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    :cond_0
    const-string p3, "class"

    .line 103
    invoke-virtual {p2, p3}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 106
    :cond_1
    iget-object p0, p0, Lcom/github/teamjcd/android/settings/bluetooth/db/BluetoothDeviceClassContentProvider;->database:Landroid/database/sqlite/SQLiteDatabase;

    new-array p3, p4, [Ljava/lang/String;

    const/4 p4, 0x0

    aput-object p1, p3, p4

    const-string p1, "DeviceClass"

    const-string p4, "_id = ?"

    invoke-virtual {p0, p1, p2, p4, p3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    return p0
.end method
