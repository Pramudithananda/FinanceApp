.class public Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlayManager;
.super Lcom/facebook/react/uimanager/SimpleViewManager;
.source "TraceUpdateOverlayManager.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "TraceUpdateOverlay"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/SimpleViewManager<",
        "Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;",
        ">;"
    }
.end annotation


# static fields
.field public static final REACT_CLASS:Ljava/lang/String; = "TraceUpdateOverlay"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/facebook/react/uimanager/SimpleViewManager;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlayManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;

    move-result-object p1

    return-object p1
.end method

.method public createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;
    .locals 1

    .line 76
    new-instance v0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;

    invoke-direct {v0, p1}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "TraceUpdateOverlay"

    return-object v0
.end method

.method public bridge synthetic receiveCommand(Landroid/view/View;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 26
    check-cast p1, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlayManager;->receiveCommand(Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public receiveCommand(Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 11

    .line 35
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    const-string v0, "draw"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string v0, "TraceUpdateOverlay"

    if-nez p2, :cond_0

    .line 67
    new-instance p1, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    const-string p2, "Received unexpected command in TraceUpdateOverlayManager"

    invoke-direct {p1, p2}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    if-nez p3, :cond_1

    goto :goto_1

    :cond_1
    const/4 p2, 0x0

    .line 41
    invoke-interface {p3, p2}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_2

    return-void

    .line 47
    :cond_2
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 48
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 49
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge p2, v2, :cond_3

    .line 50
    invoke-virtual {v1, p2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "rect"

    .line 51
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "left"

    .line 52
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    double-to-float v4, v4

    const-string v5, "top"

    .line 53
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v5

    double-to-float v5, v5

    float-to-double v6, v4

    const-string v8, "width"

    .line 54
    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    add-double/2addr v6, v8

    double-to-float v6, v6

    float-to-double v7, v5

    const-string v9, "height"

    .line 55
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v9

    add-double/2addr v7, v9

    double-to-float v3, v7

    .line 56
    new-instance v7, Landroid/graphics/RectF;

    invoke-direct {v7, v4, v5, v6, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 57
    new-instance v3, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;

    const-string v4, "color"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v3, v2, v7}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;-><init>(ILandroid/graphics/RectF;)V

    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 60
    :cond_3
    invoke-virtual {p1, p3}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->setOverlays(Ljava/util/List;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "Failed to parse overlays: "

    .line 62
    invoke-static {v0, p2, p1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method
