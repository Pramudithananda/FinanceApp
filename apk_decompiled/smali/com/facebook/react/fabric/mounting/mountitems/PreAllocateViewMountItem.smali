.class final Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;
.super Ljava/lang/Object;
.source "PreAllocateViewMountItem.java"

# interfaces
.implements Lcom/facebook/react/fabric/mounting/mountitems/MountItem;


# instance fields
.field private final mComponent:Ljava/lang/String;

.field private final mEventEmitterWrapper:Lcom/facebook/react/fabric/events/EventEmitterWrapper;

.field private final mIsLayoutable:Z

.field private final mProps:Ljava/lang/Object;

.field private final mReactTag:I

.field private final mStateWrapper:Lcom/facebook/react/uimanager/StateWrapper;

.field private final mSurfaceId:I


# direct methods
.method constructor <init>(IILjava/lang/String;Ljava/lang/Object;Lcom/facebook/react/uimanager/StateWrapper;Lcom/facebook/react/fabric/events/EventEmitterWrapper;Z)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p3}, Lcom/facebook/react/fabric/mounting/mountitems/FabricNameComponentMapping;->getFabricComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mComponent:Ljava/lang/String;

    .line 42
    iput p1, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mSurfaceId:I

    .line 43
    iput-object p4, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mProps:Ljava/lang/Object;

    .line 44
    iput-object p5, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mStateWrapper:Lcom/facebook/react/uimanager/StateWrapper;

    .line 45
    iput-object p6, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mEventEmitterWrapper:Lcom/facebook/react/fabric/events/EventEmitterWrapper;

    .line 46
    iput p2, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mReactTag:I

    .line 47
    iput-boolean p7, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mIsLayoutable:Z

    return-void
.end method


# virtual methods
.method public execute(Lcom/facebook/react/fabric/mounting/MountingManager;)V
    .locals 8

    .line 57
    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mSurfaceId:I

    invoke-virtual {p1, v0}, Lcom/facebook/react/fabric/mounting/MountingManager;->getSurfaceManager(I)Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;

    move-result-object v1

    if-nez v1, :cond_0

    .line 59
    sget-object p1, Lcom/facebook/react/fabric/FabricUIManager;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Skipping View PreAllocation; no SurfaceMountingManager found for ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mSurfaceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 64
    :cond_0
    iget-object v2, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mComponent:Ljava/lang/String;

    iget v3, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mReactTag:I

    iget-object v4, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mProps:Ljava/lang/Object;

    iget-object v5, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mStateWrapper:Lcom/facebook/react/uimanager/StateWrapper;

    iget-object v6, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mEventEmitterWrapper:Lcom/facebook/react/fabric/events/EventEmitterWrapper;

    iget-boolean v7, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mIsLayoutable:Z

    invoke-virtual/range {v1 .. v7}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->preallocateView(Ljava/lang/String;ILjava/lang/Object;Lcom/facebook/react/uimanager/StateWrapper;Lcom/facebook/react/fabric/events/EventEmitterWrapper;Z)V

    return-void
.end method

.method public getSurfaceId()I
    .locals 1

    .line 52
    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mSurfaceId:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PreAllocateViewMountItem ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mReactTag:I

    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] - component: "

    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mComponent:Ljava/lang/String;

    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " surfaceId: "

    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mSurfaceId:I

    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " isLayoutable: "

    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/PreAllocateViewMountItem;->mIsLayoutable:Z

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
