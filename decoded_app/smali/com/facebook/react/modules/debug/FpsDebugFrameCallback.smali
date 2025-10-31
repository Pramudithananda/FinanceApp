.class public Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;
.super Lcom/facebook/react/modules/core/ChoreographerCompat$FrameCallback;
.source "FpsDebugFrameCallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$FpsInfo;
    }
.end annotation


# static fields
.field private static final EXPECTED_FRAME_TIME:D = 16.9


# instance fields
.field private m4PlusFrameStutters:I

.field private mChoreographer:Lcom/facebook/react/modules/core/ChoreographerCompat;

.field private final mDidJSUpdateUiDuringFrameDetector:Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;

.field private mExpectedNumFramesPrev:I

.field private mFirstFrameTime:J

.field private mIsRecordingFpsInfoAtEachFrame:Z

.field private mLastFrameTime:J

.field private mNumFrameCallbacks:I

.field private mNumFrameCallbacksWithBatchDispatches:I

.field private final mReactContext:Lcom/facebook/react/bridge/ReactContext;

.field private mTimeToFps:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/Long;",
            "Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$FpsInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mUIManagerModule:Lcom/facebook/react/uimanager/UIManagerModule;


# direct methods
.method static bridge synthetic -$$Nest$fgetmChoreographer(Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;)Lcom/facebook/react/modules/core/ChoreographerCompat;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mChoreographer:Lcom/facebook/react/modules/core/ChoreographerCompat;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmChoreographer(Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;Lcom/facebook/react/modules/core/ChoreographerCompat;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mChoreographer:Lcom/facebook/react/modules/core/ChoreographerCompat;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 2

    .line 75
    invoke-direct {p0}, Lcom/facebook/react/modules/core/ChoreographerCompat$FrameCallback;-><init>()V

    const-wide/16 v0, -0x1

    .line 66
    iput-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    .line 67
    iput-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    const/4 v0, 0x0

    .line 68
    iput v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacks:I

    .line 69
    iput v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mExpectedNumFramesPrev:I

    .line 70
    iput v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->m4PlusFrameStutters:I

    .line 71
    iput v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacksWithBatchDispatches:I

    .line 72
    iput-boolean v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mIsRecordingFpsInfoAtEachFrame:Z

    .line 76
    iput-object p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mReactContext:Lcom/facebook/react/bridge/ReactContext;

    .line 77
    const-class v0, Lcom/facebook/react/uimanager/UIManagerModule;

    .line 78
    invoke-virtual {p1, v0}, Lcom/facebook/react/bridge/ReactContext;->getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/uimanager/UIManagerModule;

    invoke-static {p1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/uimanager/UIManagerModule;

    iput-object p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mUIManagerModule:Lcom/facebook/react/uimanager/UIManagerModule;

    .line 79
    new-instance p1, Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;

    invoke-direct {p1}, Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mDidJSUpdateUiDuringFrameDetector:Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 10

    .line 84
    iget-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 85
    iput-wide p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    .line 88
    :cond_0
    iget-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    .line 89
    iput-wide p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    .line 91
    iget-object v2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mDidJSUpdateUiDuringFrameDetector:Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;

    invoke-virtual {v2, v0, v1, p1, p2}, Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;->getDidJSHitFrameAndCleanup(JJ)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 92
    iget p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacksWithBatchDispatches:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacksWithBatchDispatches:I

    .line 95
    :cond_1
    iget p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacks:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacks:I

    .line 96
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getExpectedNumFrames()I

    move-result p1

    .line 97
    iget p2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mExpectedNumFramesPrev:I

    sub-int p2, p1, p2

    add-int/lit8 p2, p2, -0x1

    const/4 v0, 0x4

    if-lt p2, v0, :cond_2

    .line 99
    iget p2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->m4PlusFrameStutters:I

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->m4PlusFrameStutters:I

    .line 102
    :cond_2
    iget-boolean p2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mIsRecordingFpsInfoAtEachFrame:Z

    if-eqz p2, :cond_3

    .line 103
    iget-object p2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mTimeToFps:Ljava/util/TreeMap;

    invoke-static {p2}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    new-instance p2, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$FpsInfo;

    .line 106
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getNumFrames()I

    move-result v1

    .line 107
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getNumJSFrames()I

    move-result v2

    iget v4, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->m4PlusFrameStutters:I

    .line 110
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getFPS()D

    move-result-wide v5

    .line 111
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getJSFPS()D

    move-result-wide v7

    .line 112
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getTotalTimeMS()I

    move-result v9

    move-object v0, p2

    move v3, p1

    invoke-direct/range {v0 .. v9}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$FpsInfo;-><init>(IIIIDDI)V

    .line 113
    iget-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mTimeToFps:Ljava/util/TreeMap;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    :cond_3
    iput p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mExpectedNumFramesPrev:I

    .line 116
    iget-object p1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mChoreographer:Lcom/facebook/react/modules/core/ChoreographerCompat;

    if-eqz p1, :cond_4

    .line 117
    invoke-virtual {p1, p0}, Lcom/facebook/react/modules/core/ChoreographerCompat;->postFrameCallback(Lcom/facebook/react/modules/core/ChoreographerCompat$FrameCallback;)V

    :cond_4
    return-void
.end method

.method public get4PlusFrameStutters()I
    .locals 1

    .line 188
    iget v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->m4PlusFrameStutters:I

    return v0
.end method

.method public getExpectedNumFrames()I
    .locals 4

    .line 182
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getTotalTimeMS()I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x4030e66666666666L    # 16.9

    div-double/2addr v0, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    add-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method public getFPS()D
    .locals 6

    .line 160
    iget-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    iget-wide v2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 163
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getNumFrames()I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x41cdcd6500000000L    # 1.0E9

    mul-double v0, v0, v2

    iget-wide v2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    iget-wide v4, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    sub-long/2addr v2, v4

    long-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public getFpsInfo(J)Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$FpsInfo;
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mTimeToFps:Ljava/util/TreeMap;

    const-string v1, "FPS was not recorded at each frame!"

    invoke-static {v0, v1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 201
    iget-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mTimeToFps:Ljava/util/TreeMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 205
    :cond_0
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$FpsInfo;

    return-object p1
.end method

.method public getJSFPS()D
    .locals 6

    .line 167
    iget-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    iget-wide v2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 170
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->getNumJSFrames()I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x41cdcd6500000000L    # 1.0E9

    mul-double v0, v0, v2

    iget-wide v2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    iget-wide v4, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    sub-long/2addr v2, v4

    long-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public getNumFrames()I
    .locals 1

    .line 174
    iget v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacks:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getNumJSFrames()I
    .locals 1

    .line 178
    iget v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacksWithBatchDispatches:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getTotalTimeMS()I
    .locals 4

    .line 192
    iget-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    long-to-double v0, v0

    iget-wide v2, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    long-to-double v2, v2

    sub-double/2addr v0, v2

    double-to-int v0, v0

    const v1, 0xf4240

    div-int/2addr v0, v1

    return v0
.end method

.method public reset()V
    .locals 2

    const-wide/16 v0, -0x1

    .line 209
    iput-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mFirstFrameTime:J

    .line 210
    iput-wide v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mLastFrameTime:J

    const/4 v0, 0x0

    .line 211
    iput v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacks:I

    .line 212
    iput v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->m4PlusFrameStutters:I

    .line 213
    iput v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mNumFrameCallbacksWithBatchDispatches:I

    .line 214
    iput-boolean v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mIsRecordingFpsInfoAtEachFrame:Z

    const/4 v0, 0x0

    .line 215
    iput-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mTimeToFps:Ljava/util/TreeMap;

    return-void
.end method

.method public start()V
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mReactContext:Lcom/facebook/react/bridge/ReactContext;

    .line 123
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactContext;->getCatalystInstance()Lcom/facebook/react/bridge/CatalystInstance;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mDidJSUpdateUiDuringFrameDetector:Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;

    .line 124
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/CatalystInstance;->addBridgeIdleDebugListener(Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;)V

    .line 125
    iget-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mUIManagerModule:Lcom/facebook/react/uimanager/UIManagerModule;

    iget-object v1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mDidJSUpdateUiDuringFrameDetector:Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/UIManagerModule;->setViewHierarchyUpdateDebugListener(Lcom/facebook/react/uimanager/debug/NotThreadSafeViewHierarchyUpdateDebugListener;)V

    .line 127
    new-instance v0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$1;

    invoke-direct {v0, p0, p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$1;-><init>(Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;)V

    invoke-static {v0}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public startAndRecordFpsAtEachFrame()V
    .locals 1

    .line 138
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mTimeToFps:Ljava/util/TreeMap;

    const/4 v0, 0x1

    .line 139
    iput-boolean v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mIsRecordingFpsInfoAtEachFrame:Z

    .line 140
    invoke-virtual {p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->start()V

    return-void
.end method

.method public stop()V
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mReactContext:Lcom/facebook/react/bridge/ReactContext;

    .line 145
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactContext;->getCatalystInstance()Lcom/facebook/react/bridge/CatalystInstance;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mDidJSUpdateUiDuringFrameDetector:Lcom/facebook/react/modules/debug/DidJSUpdateUiDuringFrameDetector;

    .line 146
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/CatalystInstance;->removeBridgeIdleDebugListener(Lcom/facebook/react/bridge/NotThreadSafeBridgeIdleDebugListener;)V

    .line 147
    iget-object v0, p0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;->mUIManagerModule:Lcom/facebook/react/uimanager/UIManagerModule;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/UIManagerModule;->setViewHierarchyUpdateDebugListener(Lcom/facebook/react/uimanager/debug/NotThreadSafeViewHierarchyUpdateDebugListener;)V

    .line 149
    new-instance v0, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$2;

    invoke-direct {v0, p0, p0}, Lcom/facebook/react/modules/debug/FpsDebugFrameCallback$2;-><init>(Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;Lcom/facebook/react/modules/debug/FpsDebugFrameCallback;)V

    invoke-static {v0}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
