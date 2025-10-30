.class public Lcom/facebook/react/devsupport/InspectorPackagerConnection;
.super Ljava/lang/Object;
.source "InspectorPackagerConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;,
        Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatusProvider;,
        Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatus;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "InspectorPackagerConnection"


# instance fields
.field private mBundleStatusProvider:Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatusProvider;

.field private final mConnection:Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;

.field private final mInspectorConnections:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/Inspector$LocalConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final mPackageName:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetmInspectorConnections(Lcom/facebook/react/devsupport/InspectorPackagerConnection;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mmakePageIdPayload(Lcom/facebook/react/devsupport/InspectorPackagerConnection;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->makePageIdPayload(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$msendEvent(Lcom/facebook/react/devsupport/InspectorPackagerConnection;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->sendEvent(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msendWrappedEvent(Lcom/facebook/react/devsupport/InspectorPackagerConnection;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->sendWrappedEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatusProvider;)V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;

    invoke-direct {v0, p0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;-><init>(Lcom/facebook/react/devsupport/InspectorPackagerConnection;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mConnection:Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;

    .line 41
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    .line 42
    iput-object p2, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mPackageName:Ljava/lang/String;

    .line 43
    iput-object p3, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mBundleStatusProvider:Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatusProvider;

    return-void
.end method

.method private getPages()Lorg/json/JSONArray;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 151
    invoke-static {}, Lcom/facebook/react/bridge/Inspector;->getPages()Ljava/util/List;

    move-result-object v0

    .line 152
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 153
    iget-object v2, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mBundleStatusProvider:Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatusProvider;

    invoke-interface {v2}, Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatusProvider;->getBundleStatus()Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatus;

    move-result-object v2

    .line 154
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/bridge/Inspector$Page;

    .line 155
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 156
    invoke-virtual {v3}, Lcom/facebook/react/bridge/Inspector$Page;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "id"

    invoke-virtual {v4, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "title"

    .line 157
    invoke-virtual {v3}, Lcom/facebook/react/bridge/Inspector$Page;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "app"

    .line 158
    iget-object v6, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mPackageName:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "vm"

    .line 159
    invoke-virtual {v3}, Lcom/facebook/react/bridge/Inspector$Page;->getVM()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "isLastBundleDownloadSuccess"

    .line 160
    iget-object v5, v2, Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatus;->isLastDownloadSuccess:Ljava/lang/Boolean;

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "bundleUpdateTimestamp"

    .line 161
    iget-wide v5, v2, Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatus;->updateTimestamp:J

    invoke-virtual {v4, v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 162
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method private handleConnect(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "pageId"

    .line 90
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 91
    iget-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/Inspector$LocalConnection;

    if-nez v0, :cond_0

    .line 100
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    new-instance v1, Lcom/facebook/react/devsupport/InspectorPackagerConnection$1;

    invoke-direct {v1, p0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection$1;-><init>(Lcom/facebook/react/devsupport/InspectorPackagerConnection;Ljava/lang/String;)V

    .line 99
    invoke-static {v0, v1}, Lcom/facebook/react/bridge/Inspector;->connect(ILcom/facebook/react/bridge/Inspector$RemoteConnection;)Lcom/facebook/react/bridge/Inspector$LocalConnection;

    move-result-object v0

    .line 121
    iget-object v1, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to open page: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InspectorPackagerConnection"

    invoke-static {v2, v1, v0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string v0, "disconnect"

    .line 124
    invoke-direct {p0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->makePageIdPayload(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->sendEvent(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void

    .line 93
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Already connected: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private handleDisconnect(Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "pageId"

    .line 129
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 130
    iget-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/Inspector$LocalConnection;

    if-nez p1, :cond_0

    return-void

    .line 135
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/bridge/Inspector$LocalConnection;->disconnect()V

    return-void
.end method

.method private handleWrappedEvent(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "pageId"

    .line 139
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "wrappedEvent"

    .line 140
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 141
    iget-object v1, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/Inspector$LocalConnection;

    if-nez v1, :cond_0

    .line 144
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "PageID "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " is disconnected. Dropping event: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "InspectorPackagerConnection"

    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 147
    :cond_0
    invoke-virtual {v1, p1}, Lcom/facebook/react/bridge/Inspector$LocalConnection;->sendMessage(Ljava/lang/String;)V

    return-void
.end method

.method private makePageIdPayload(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 182
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "pageId"

    .line 183
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object v0
.end method

.method private sendEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 175
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "event"

    .line 176
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "payload"

    .line 177
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 178
    iget-object p1, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mConnection:Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;

    invoke-virtual {p1, v0}, Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;->send(Lorg/json/JSONObject;)V

    return-void
.end method

.method private sendWrappedEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 168
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "pageId"

    .line 169
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "wrappedEvent"

    .line 170
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->sendEvent(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method closeAllConnections()V
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 84
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/Inspector$LocalConnection;

    invoke-virtual {v1}, Lcom/facebook/react/bridge/Inspector$LocalConnection;->disconnect()V

    goto :goto_0

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public closeQuietly()V
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mConnection:Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;

    invoke-virtual {v0}, Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;->close()V

    return-void
.end method

.method public connect()V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mConnection:Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;

    invoke-virtual {v0}, Lcom/facebook/react/devsupport/InspectorPackagerConnection$Connection;->connect()V

    return-void
.end method

.method handleProxyMessage(Lorg/json/JSONObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "event"

    .line 63
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const-string v2, "getPages"

    const/4 v3, -0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x3

    goto :goto_0

    :sswitch_1
    const-string v1, "wrappedEvent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x2

    goto :goto_0

    :sswitch_2
    const-string v1, "connect"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x1

    goto :goto_0

    :sswitch_3
    const-string v1, "disconnect"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    :goto_0
    const-string v1, "payload"

    packed-switch v3, :pswitch_data_0

    .line 78
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown event: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 66
    :pswitch_0
    invoke-direct {p0}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->getPages()Lorg/json/JSONArray;

    move-result-object p1

    invoke-direct {p0, v2, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->sendEvent(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 69
    :pswitch_1
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->handleWrappedEvent(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 72
    :pswitch_2
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->handleConnect(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 75
    :pswitch_3
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->handleDisconnect(Lorg/json/JSONObject;)V

    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        0x1f9d589c -> :sswitch_3
        0x38b478ea -> :sswitch_2
        0x4f310915 -> :sswitch_1
        0x74f5960e -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public sendEventToAllConnections(Ljava/lang/String;)V
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/facebook/react/devsupport/InspectorPackagerConnection;->mInspectorConnections:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/Inspector$LocalConnection;

    .line 58
    invoke-virtual {v1, p1}, Lcom/facebook/react/bridge/Inspector$LocalConnection;->sendMessage(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method
