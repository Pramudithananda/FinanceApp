.class public Lcom/facebook/react/uimanager/events/FabricEventDispatcher;
.super Ljava/lang/Object;
.source "FabricEventDispatcher.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/EventDispatcher;
.implements Lcom/facebook/react/bridge/LifecycleEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;
    }
.end annotation


# instance fields
.field private final mCurrentFrameCallback:Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;

.field private final mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/facebook/react/uimanager/events/EventDispatcherListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mPostEventDispatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

.field private final mReactEventEmitter:Lcom/facebook/react/uimanager/events/ReactEventEmitter;


# direct methods
.method static bridge synthetic -$$Nest$fgetmCurrentFrameCallback(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mCurrentFrameCallback:Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPostEventDispatchListeners(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mPostEventDispatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmReactContext(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mstopFrameCallback(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->stopFrameCallback()V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 28
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mPostEventDispatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 30
    new-instance v0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;-><init>(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback-IA;)V

    iput-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mCurrentFrameCallback:Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;

    .line 34
    iput-object p1, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 35
    invoke-virtual {p1, p0}, Lcom/facebook/react/bridge/ReactApplicationContext;->addLifecycleEventListener(Lcom/facebook/react/bridge/LifecycleEventListener;)V

    .line 36
    new-instance v0, Lcom/facebook/react/uimanager/events/ReactEventEmitter;

    invoke-direct {v0, p1}, Lcom/facebook/react/uimanager/events/ReactEventEmitter;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactEventEmitter:Lcom/facebook/react/uimanager/events/ReactEventEmitter;

    return-void
.end method

.method private maybePostFrameCallbackFromNonUI()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactEventEmitter:Lcom/facebook/react/uimanager/events/ReactEventEmitter;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mCurrentFrameCallback:Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->maybePostFromNonUI()V

    :cond_0
    return-void
.end method

.method private stopFrameCallback()V
    .locals 1

    .line 111
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 112
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mCurrentFrameCallback:Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->stop()V

    return-void
.end method


# virtual methods
.method public addBatchEventDispatchedListener(Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;)V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mPostEventDispatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public dispatchAllEvents()V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->maybePostFrameCallbackFromNonUI()V

    return-void
.end method

.method public dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 2

    .line 41
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactEventEmitter:Lcom/facebook/react/uimanager/events/ReactEventEmitter;

    invoke-virtual {p1, v0}, Lcom/facebook/react/uimanager/events/Event;->dispatchModern(Lcom/facebook/react/uimanager/events/RCTModernEventEmitter;)V

    .line 42
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/uimanager/events/EventDispatcherListener;

    .line 43
    invoke-interface {v1, p1}, Lcom/facebook/react/uimanager/events/EventDispatcherListener;->onEventDispatch(Lcom/facebook/react/uimanager/events/Event;)V

    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/events/Event;->dispose()V

    .line 47
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->maybePostFrameCallbackFromNonUI()V

    return-void
.end method

.method public onCatalystInstanceDestroyed()V
    .locals 1

    .line 101
    new-instance v0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$1;

    invoke-direct {v0, p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$1;-><init>(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)V

    invoke-static {v0}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onHostDestroy()V
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->stopFrameCallback()V

    return-void
.end method

.method public onHostPause()V
    .locals 0

    .line 92
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->stopFrameCallback()V

    return-void
.end method

.method public onHostResume()V
    .locals 0

    .line 87
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->maybePostFrameCallbackFromNonUI()V

    return-void
.end method

.method public registerEventEmitter(ILcom/facebook/react/uimanager/events/RCTEventEmitter;)V
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactEventEmitter:Lcom/facebook/react/uimanager/events/ReactEventEmitter;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/uimanager/events/ReactEventEmitter;->register(ILcom/facebook/react/uimanager/events/RCTEventEmitter;)V

    return-void
.end method

.method public registerEventEmitter(ILcom/facebook/react/uimanager/events/RCTModernEventEmitter;)V
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactEventEmitter:Lcom/facebook/react/uimanager/events/ReactEventEmitter;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/uimanager/events/ReactEventEmitter;->register(ILcom/facebook/react/uimanager/events/RCTModernEventEmitter;)V

    return-void
.end method

.method public removeBatchEventDispatchedListener(Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mPostEventDispatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public unregisterEventEmitter(I)V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->mReactEventEmitter:Lcom/facebook/react/uimanager/events/ReactEventEmitter;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/events/ReactEventEmitter;->unregister(I)V

    return-void
.end method
