.class Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;
.super Lcom/facebook/react/modules/core/ChoreographerCompat$FrameCallback;
.source "FabricEventDispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/uimanager/events/FabricEventDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScheduleDispatchFrameCallback"
.end annotation


# instance fields
.field private volatile mIsPosted:Z

.field private mShouldStop:Z

.field final synthetic this$0:Lcom/facebook/react/uimanager/events/FabricEventDispatcher;


# direct methods
.method private constructor <init>(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->this$0:Lcom/facebook/react/uimanager/events/FabricEventDispatcher;

    invoke-direct {p0}, Lcom/facebook/react/modules/core/ChoreographerCompat$FrameCallback;-><init>()V

    const/4 p1, 0x0

    .line 129
    iput-boolean p1, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mIsPosted:Z

    .line 130
    iput-boolean p1, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mShouldStop:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;-><init>(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)V

    return-void
.end method

.method private post()V
    .locals 3

    .line 164
    invoke-static {}, Lcom/facebook/react/modules/core/ReactChoreographer;->getInstance()Lcom/facebook/react/modules/core/ReactChoreographer;

    move-result-object v0

    sget-object v1, Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;->TIMERS_EVENTS:Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;

    iget-object v2, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->this$0:Lcom/facebook/react/uimanager/events/FabricEventDispatcher;

    invoke-static {v2}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->-$$Nest$fgetmCurrentFrameCallback(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;

    move-result-object v2

    .line 165
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/modules/core/ReactChoreographer;->postFrameCallback(Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;Lcom/facebook/react/modules/core/ChoreographerCompat$FrameCallback;)V

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 2

    .line 134
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 136
    iget-boolean p1, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mShouldStop:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 137
    iput-boolean p1, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mIsPosted:Z

    goto :goto_0

    .line 139
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->post()V

    :goto_0
    const-string p1, "BatchEventDispatchedListeners"

    const-wide/16 v0, 0x0

    .line 142
    invoke-static {v0, v1, p1}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 144
    :try_start_0
    iget-object p1, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->this$0:Lcom/facebook/react/uimanager/events/FabricEventDispatcher;

    invoke-static {p1}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->-$$Nest$fgetmPostEventDispatchListeners(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;

    .line 145
    invoke-interface {p2}, Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;->onBatchEventDispatched()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 148
    :cond_1
    invoke-static {v0, v1}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v0, v1}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 149
    throw p1
.end method

.method public maybePost()V
    .locals 1

    .line 157
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mIsPosted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 158
    iput-boolean v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mIsPosted:Z

    .line 159
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->post()V

    :cond_0
    return-void
.end method

.method public maybePostFromNonUI()V
    .locals 2

    .line 169
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mIsPosted:Z

    if-eqz v0, :cond_0

    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->this$0:Lcom/facebook/react/uimanager/events/FabricEventDispatcher;

    invoke-static {v0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->-$$Nest$fgetmReactContext(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->isOnUiQueueThread()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 175
    invoke-virtual {p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->maybePost()V

    goto :goto_0

    .line 177
    :cond_1
    iget-object v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->this$0:Lcom/facebook/react/uimanager/events/FabricEventDispatcher;

    invoke-static {v0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher;->-$$Nest$fgetmReactContext(Lcom/facebook/react/uimanager/events/FabricEventDispatcher;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    new-instance v1, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback$1;

    invoke-direct {v1, p0}, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback$1;-><init>(Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;)V

    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->runOnUiQueueThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public stop()V
    .locals 1

    const/4 v0, 0x1

    .line 153
    iput-boolean v0, p0, Lcom/facebook/react/uimanager/events/FabricEventDispatcher$ScheduleDispatchFrameCallback;->mShouldStop:Z

    return-void
.end method
