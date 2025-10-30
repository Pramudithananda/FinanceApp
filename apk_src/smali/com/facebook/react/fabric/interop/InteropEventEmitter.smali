.class public Lcom/facebook/react/fabric/interop/InteropEventEmitter;
.super Ljava/lang/Object;
.source "InteropEventEmitter.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/RCTEventEmitter;


# instance fields
.field private mEventDispatcherOverride:Lcom/facebook/react/uimanager/events/EventDispatcher;

.field private final mReactContext:Lcom/facebook/react/bridge/ReactContext;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/facebook/react/fabric/interop/InteropEventEmitter;->mReactContext:Lcom/facebook/react/bridge/ReactContext;

    return-void
.end method


# virtual methods
.method overrideEventDispatcher(Lcom/facebook/react/uimanager/events/EventDispatcher;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/common/annotations/VisibleForTesting;
    .end annotation

    .line 63
    iput-object p1, p0, Lcom/facebook/react/fabric/interop/InteropEventEmitter;->mEventDispatcherOverride:Lcom/facebook/react/uimanager/events/EventDispatcher;

    return-void
.end method

.method public receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 3

    .line 43
    iget-object v0, p0, Lcom/facebook/react/fabric/interop/InteropEventEmitter;->mEventDispatcherOverride:Lcom/facebook/react/uimanager/events/EventDispatcher;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/fabric/interop/InteropEventEmitter;->mReactContext:Lcom/facebook/react/bridge/ReactContext;

    invoke-static {v0, p1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    .line 48
    :goto_0
    iget-object v1, p0, Lcom/facebook/react/fabric/interop/InteropEventEmitter;->mReactContext:Lcom/facebook/react/bridge/ReactContext;

    invoke-static {v1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getSurfaceId(Landroid/content/Context;)I

    move-result v1

    if-eqz v0, :cond_1

    .line 50
    new-instance v2, Lcom/facebook/react/fabric/interop/InteropEvent;

    invoke-direct {v2, p2, p3, v1, p1}, Lcom/facebook/react/fabric/interop/InteropEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;II)V

    invoke-interface {v0, v2}, Lcom/facebook/react/uimanager/events/EventDispatcher;->dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V

    :cond_1
    return-void
.end method

.method public receiveTouches(Ljava/lang/String;Lcom/facebook/react/bridge/WritableArray;Lcom/facebook/react/bridge/WritableArray;)V
    .locals 0

    .line 57
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "EventEmitter#receiveTouches is not supported by the Fabric Interop Layer"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
