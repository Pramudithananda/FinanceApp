.class public Lcom/facebook/react/uimanager/UIImplementation;
.super Ljava/lang/Object;
.source "UIImplementation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/uimanager/UIImplementation$LayoutUpdateListener;
    }
.end annotation


# instance fields
.field protected final mEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

.field private mLastCalculateLayoutTime:J

.field protected mLayoutUpdateListener:Lcom/facebook/react/uimanager/UIImplementation$LayoutUpdateListener;

.field private final mMeasureBuffer:[I

.field private final mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

.field private final mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

.field protected final mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

.field protected final mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

.field private final mViewManagers:Lcom/facebook/react/uimanager/ViewManagerRegistry;

.field private volatile mViewOperationsEnabled:Z

.field protected uiImplementationThreadLock:Ljava/lang/Object;


# direct methods
.method protected constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/uimanager/ViewManagerRegistry;Lcom/facebook/react/uimanager/UIViewOperationQueue;Lcom/facebook/react/uimanager/events/EventDispatcher;)V
    .locals 3

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->uiImplementationThreadLock:Ljava/lang/Object;

    .line 46
    new-instance v0, Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-direct {v0}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    const/4 v1, 0x4

    new-array v1, v1, [I

    .line 50
    iput-object v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    const-wide/16 v1, 0x0

    .line 52
    iput-wide v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mLastCalculateLayoutTime:J

    const/4 v1, 0x1

    .line 60
    iput-boolean v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    .line 89
    iput-object p1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 90
    iput-object p2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewManagers:Lcom/facebook/react/uimanager/ViewManagerRegistry;

    .line 91
    iput-object p3, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    .line 92
    new-instance p1, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-direct {p1, p3, v0}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;-><init>(Lcom/facebook/react/uimanager/UIViewOperationQueue;Lcom/facebook/react/uimanager/ShadowNodeRegistry;)V

    iput-object p1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    .line 94
    iput-object p4, p0, Lcom/facebook/react/uimanager/UIImplementation;->mEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

    return-void
.end method

.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/uimanager/ViewManagerRegistry;Lcom/facebook/react/uimanager/events/EventDispatcher;I)V
    .locals 2

    .line 74
    new-instance v0, Lcom/facebook/react/uimanager/UIViewOperationQueue;

    new-instance v1, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    invoke-direct {v1, p2}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;-><init>(Lcom/facebook/react/uimanager/ViewManagerRegistry;)V

    invoke-direct {v0, p1, v1, p4}, Lcom/facebook/react/uimanager/UIViewOperationQueue;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;I)V

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/facebook/react/uimanager/UIImplementation;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/uimanager/ViewManagerRegistry;Lcom/facebook/react/uimanager/UIViewOperationQueue;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    return-void
.end method

.method private assertNodeDoesNotNeedCustomLayoutForChildren(Lcom/facebook/react/uimanager/ReactShadowNode;)V
    .locals 3

    .line 919
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewManagers:Lcom/facebook/react/uimanager/ViewManagerRegistry;

    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getViewClass()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->get(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/ViewManager;

    .line 921
    instance-of v1, v0, Lcom/facebook/react/uimanager/IViewManagerWithChildren;

    if-eqz v1, :cond_2

    .line 922
    check-cast v0, Lcom/facebook/react/uimanager/IViewManagerWithChildren;

    if-eqz v0, :cond_1

    .line 929
    invoke-interface {v0}, Lcom/facebook/react/uimanager/IViewManagerWithChildren;->needsCustomLayoutForChildren()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 930
    :cond_0
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Trying to measure a view using measureLayout/measureLayoutRelativeToParent relative to an ancestor that requires custom layout for it\'s children ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 933
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getViewClass()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "). Use measure instead."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void

    .line 924
    :cond_2
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Trying to use view "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 926
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getViewClass()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " as a parent, but its Manager doesn\'t extends ViewGroupManager"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkOrAssertViewExists(ILjava/lang/String;)Z
    .locals 3

    .line 897
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return v1

    .line 902
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to execute operation "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " on view with tag: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", since the view does not exist"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ReactNative"

    .line 913
    invoke-static {p2, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method

.method private dispatchViewUpdatesIfNeeded()V
    .locals 1

    .line 639
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    .line 640
    invoke-virtual {p0, v0}, Lcom/facebook/react/uimanager/UIImplementation;->dispatchViewUpdates(I)V

    :cond_0
    return-void
.end method

.method private getRootViewNum()I
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->getNativeViewHierarchyManager()Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->getRootViewNum()I

    move-result v0

    return v0
.end method

.method private measureLayout(II[I)V
    .locals 4

    .line 833
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    .line 834
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v1, p2}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v1

    const-string v2, "Tag "

    if-eqz v0, :cond_3

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    if-eq v0, v1, :cond_2

    .line 841
    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getParent()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v3

    :goto_0
    if-eq v3, v1, :cond_2

    if-eqz v3, :cond_1

    .line 847
    invoke-interface {v3}, Lcom/facebook/react/uimanager/ReactShadowNode;->getParent()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v3

    goto :goto_0

    .line 844
    :cond_1
    new-instance p3, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " is not an ancestor of tag "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p3

    .line 851
    :cond_2
    invoke-direct {p0, v0, v1, p3}, Lcom/facebook/react/uimanager/UIImplementation;->measureLayoutRelativeToVerifiedAncestor(Lcom/facebook/react/uimanager/ReactShadowNode;Lcom/facebook/react/uimanager/ReactShadowNode;[I)V

    return-void

    .line 836
    :cond_3
    :goto_1
    new-instance p3, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    move p1, p2

    .line 837
    :goto_2
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " does not exist"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method private measureLayoutRelativeToParent(I[I)V
    .locals 2

    .line 855
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 859
    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getParent()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 864
    invoke-direct {p0, v0, v1, p2}, Lcom/facebook/react/uimanager/UIImplementation;->measureLayoutRelativeToVerifiedAncestor(Lcom/facebook/react/uimanager/ReactShadowNode;Lcom/facebook/react/uimanager/ReactShadowNode;[I)V

    return-void

    .line 861
    :cond_0
    new-instance p2, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "View with tag "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " doesn\'t have a parent!"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 857
    :cond_1
    new-instance p2, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No native view for tag "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " exists!"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private measureLayoutRelativeToVerifiedAncestor(Lcom/facebook/react/uimanager/ReactShadowNode;Lcom/facebook/react/uimanager/ReactShadowNode;[I)V
    .locals 5

    const/4 v0, 0x0

    if-eq p1, p2, :cond_1

    .line 871
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->isVirtual()Z

    move-result v1

    if-nez v1, :cond_1

    .line 872
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getLayoutX()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 873
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getLayoutY()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 874
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getParent()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v3

    :goto_0
    if-eq v3, p2, :cond_0

    .line 876
    invoke-static {v3}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 877
    invoke-direct {p0, v3}, Lcom/facebook/react/uimanager/UIImplementation;->assertNodeDoesNotNeedCustomLayoutForChildren(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    .line 878
    invoke-interface {v3}, Lcom/facebook/react/uimanager/ReactShadowNode;->getLayoutX()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    add-int/2addr v1, v4

    .line 879
    invoke-interface {v3}, Lcom/facebook/react/uimanager/ReactShadowNode;->getLayoutY()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    add-int/2addr v2, v4

    .line 880
    invoke-interface {v3}, Lcom/facebook/react/uimanager/ReactShadowNode;->getParent()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v3

    goto :goto_0

    .line 882
    :cond_0
    invoke-direct {p0, p2}, Lcom/facebook/react/uimanager/UIImplementation;->assertNodeDoesNotNeedCustomLayoutForChildren(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 885
    :goto_1
    aput v1, p3, v0

    const/4 p2, 0x1

    .line 886
    aput v2, p3, p2

    const/4 p2, 0x2

    .line 887
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getScreenWidth()I

    move-result v0

    aput v0, p3, p2

    const/4 p2, 0x3

    .line 888
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getScreenHeight()I

    move-result p1

    aput p1, p3, p2

    return-void
.end method

.method private notifyOnBeforeLayoutRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;)V
    .locals 2

    .line 939
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->hasUpdates()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 942
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 943
    invoke-interface {p1, v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getChildAt(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/facebook/react/uimanager/UIImplementation;->notifyOnBeforeLayoutRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 945
    :cond_1
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-interface {p1, v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->onBeforeLayout(Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;)V

    return-void
.end method

.method private removeShadowNodeRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;)V
    .locals 2

    .line 824
    invoke-static {p1}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;->handleRemoveNode(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    .line 825
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->removeNode(I)V

    .line 826
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    .line 827
    invoke-interface {p1, v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getChildAt(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/facebook/react/uimanager/UIImplementation;->removeShadowNodeRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 829
    :cond_0
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->removeAndDisposeAllChildren()V

    return-void
.end method


# virtual methods
.method public addUIBlock(Lcom/facebook/react/uimanager/UIBlock;)V
    .locals 1

    .line 1002
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueUIBlock(Lcom/facebook/react/uimanager/UIBlock;)V

    return-void
.end method

.method protected applyUpdatesRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;FFLjava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/uimanager/ReactShadowNode;",
            "FF",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ReactShadowNode;",
            ">;)V"
        }
    .end annotation

    .line 974
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->hasUpdates()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 978
    :cond_0
    invoke-interface {p1, p2, p3}, Lcom/facebook/react/uimanager/ReactShadowNode;->dispatchUpdatesWillChangeLayout(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 979
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->shouldNotifyOnLayout()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    .line 980
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->isRootNode(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 981
    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 984
    :cond_1
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->calculateLayoutOnChildren()Ljava/lang/Iterable;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 986
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/uimanager/ReactShadowNode;

    .line 989
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getLayoutX()F

    move-result v2

    add-float/2addr v2, p2

    .line 990
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getLayoutY()F

    move-result v3

    add-float/2addr v3, p3

    .line 987
    invoke-virtual {p0, v1, v2, v3, p4}, Lcom/facebook/react/uimanager/UIImplementation;->applyUpdatesRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;FFLjava/util/List;)V

    goto :goto_0

    .line 995
    :cond_2
    iget-object p4, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-interface {p1, p2, p3, p4, v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->dispatchUpdates(FFLcom/facebook/react/uimanager/UIViewOperationQueue;Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;)V

    .line 997
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->markUpdateSeen()V

    .line 998
    iget-object p2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-virtual {p2, p1}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;->onViewUpdatesCompleted(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    return-void
.end method

.method protected calculateRootLayout(Lcom/facebook/react/uimanager/ReactShadowNode;)V
    .locals 8

    const-string v0, "cssRoot.calculateLayout"

    const-wide/16 v1, 0x0

    .line 949
    invoke-static {v1, v2, v0}, Lcom/facebook/systrace/SystraceMessage;->beginSection(JLjava/lang/String;)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v0

    const-string v3, "rootTag"

    .line 950
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lcom/facebook/systrace/SystraceMessage$Builder;->arg(Ljava/lang/String;I)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v0

    .line 951
    invoke-virtual {v0}, Lcom/facebook/systrace/SystraceMessage$Builder;->flush()V

    .line 952
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 954
    :try_start_0
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getWidthMeasureSpec()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 955
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getHeightMeasureSpec()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 957
    invoke-static {v0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    const/high16 v7, 0x7fc00000    # Float.NaN

    if-nez v6, :cond_0

    const/high16 v0, 0x7fc00000    # Float.NaN

    goto :goto_0

    .line 959
    :cond_0
    invoke-static {v0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    int-to-float v0, v0

    .line 960
    :goto_0
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    if-nez v6, :cond_1

    goto :goto_1

    .line 962
    :cond_1
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    int-to-float v7, v5

    .line 956
    :goto_1
    invoke-interface {p1, v0, v7}, Lcom/facebook/react/uimanager/ReactShadowNode;->calculateLayout(FF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 964
    invoke-static {v1, v2}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 965
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, v3

    iput-wide v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mLastCalculateLayoutTime:J

    return-void

    :catchall_0
    move-exception p1

    .line 964
    invoke-static {v1, v2}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 965
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, v3

    iput-wide v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mLastCalculateLayoutTime:J

    .line 966
    throw p1
.end method

.method public clearJSResponder()V
    .locals 1

    .line 745
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueClearJSResponder()V

    return-void
.end method

.method public configureNextLayoutAnimation(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Callback;)V
    .locals 1

    .line 726
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueConfigureLayoutAnimation(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method protected createRootShadowNode()Lcom/facebook/react/uimanager/ReactShadowNode;
    .locals 3

    .line 98
    new-instance v0, Lcom/facebook/react/uimanager/ReactShadowNodeImpl;

    invoke-direct {v0}, Lcom/facebook/react/uimanager/ReactShadowNodeImpl;-><init>()V

    .line 99
    invoke-static {}, Lcom/facebook/react/modules/i18nmanager/I18nUtil;->getInstance()Lcom/facebook/react/modules/i18nmanager/I18nUtil;

    move-result-object v1

    .line 100
    iget-object v2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-virtual {v1, v2}, Lcom/facebook/react/modules/i18nmanager/I18nUtil;->isRTL(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    sget-object v1, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    invoke-interface {v0, v1}, Lcom/facebook/react/uimanager/ReactShadowNode;->setLayoutDirection(Lcom/facebook/yoga/YogaDirection;)V

    :cond_0
    const-string v1, "Root"

    .line 103
    invoke-interface {v0, v1}, Lcom/facebook/react/uimanager/ReactShadowNode;->setViewClassName(Ljava/lang/String;)V

    return-object v0
.end method

.method protected createShadowNode(Ljava/lang/String;)Lcom/facebook/react/uimanager/ReactShadowNode;
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewManagers:Lcom/facebook/react/uimanager/ViewManagerRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->get(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object p1

    .line 109
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-virtual {p1, v0}, Lcom/facebook/react/uimanager/ViewManager;->createShadowNodeInstance(Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object p1

    return-object p1
.end method

.method public createView(ILjava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 5

    const-string v0, "Root node with tag "

    .line 230
    iget-boolean v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v1, :cond_0

    return-void

    .line 234
    :cond_0
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->uiImplementationThreadLock:Ljava/lang/Object;

    monitor-enter v1

    .line 235
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/facebook/react/uimanager/UIImplementation;->createShadowNode(Ljava/lang/String;)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v2

    .line 236
    iget-object v3, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v3, p3}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v3

    .line 237
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " doesn\'t exist"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 238
    invoke-interface {v2, p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->setReactTag(I)V

    .line 239
    invoke-interface {v2, p2}, Lcom/facebook/react/uimanager/ReactShadowNode;->setViewClassName(Ljava/lang/String;)V

    .line 240
    invoke-interface {v3}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result p1

    invoke-interface {v2, p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->setRootTag(I)V

    .line 241
    invoke-interface {v3}, Lcom/facebook/react/uimanager/ReactShadowNode;->getThemedContext()Lcom/facebook/react/uimanager/ThemedReactContext;

    move-result-object p1

    invoke-interface {v2, p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->setThemedContext(Lcom/facebook/react/uimanager/ThemedReactContext;)V

    .line 243
    iget-object p1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {p1, v2}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->addNode(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    if-eqz p4, :cond_1

    .line 247
    new-instance p1, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    invoke-direct {p1, p4}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;-><init>(Lcom/facebook/react/bridge/ReadableMap;)V

    .line 248
    invoke-interface {v2, p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->updateProperties(Lcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 251
    :goto_0
    invoke-virtual {p0, v2, p3, p1}, Lcom/facebook/react/uimanager/UIImplementation;->handleCreateView(Lcom/facebook/react/uimanager/ReactShadowNode;ILcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    .line 252
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public dismissPopupMenu()V
    .locals 1

    .line 791
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueDismissPopupMenu()V

    return-void
.end method

.method public dispatchViewManagerCommand(IILcom/facebook/react/bridge/ReadableArray;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 751
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "dispatchViewManagerCommand: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 752
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/uimanager/UIImplementation;->checkOrAssertViewExists(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 757
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueDispatchCommand(IILcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public dispatchViewManagerCommand(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 2

    .line 762
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "dispatchViewManagerCommand: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 763
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/uimanager/UIImplementation;->checkOrAssertViewExists(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 768
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueDispatchCommand(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public dispatchViewUpdates(I)V
    .locals 9

    .line 613
    invoke-direct {p0}, Lcom/facebook/react/uimanager/UIImplementation;->getRootViewNum()I

    move-result v0

    if-gtz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "UIImplementation.dispatchViewUpdates"

    const-wide/16 v1, 0x0

    .line 619
    invoke-static {v1, v2, v0}, Lcom/facebook/systrace/SystraceMessage;->beginSection(JLjava/lang/String;)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v0

    const-string v3, "batchId"

    .line 621
    invoke-virtual {v0, v3, p1}, Lcom/facebook/systrace/SystraceMessage$Builder;->arg(Ljava/lang/String;I)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v0

    .line 622
    invoke-virtual {v0}, Lcom/facebook/systrace/SystraceMessage$Builder;->flush()V

    .line 623
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 625
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/uimanager/UIImplementation;->updateViewHierarchy()V

    .line 626
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;->onBatchComplete()V

    .line 627
    iget-object v3, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    iget-wide v7, p0, Lcom/facebook/react/uimanager/UIImplementation;->mLastCalculateLayoutTime:J

    move v4, p1

    invoke-virtual/range {v3 .. v8}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->dispatchViewUpdates(IJJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 629
    invoke-static {v1, v2}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v1, v2}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 630
    throw p1
.end method

.method public findSubviewIn(IFFLcom/facebook/react/bridge/Callback;)V
    .locals 1

    .line 517
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueFindTargetForTouch(IFFLcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public getProfiledBatchPerfCounters()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 225
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->getProfiledBatchPerfCounters()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method getUIViewOperationQueue()Lcom/facebook/react/uimanager/UIViewOperationQueue;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    return-object v0
.end method

.method protected handleCreateView(Lcom/facebook/react/uimanager/ReactShadowNode;ILcom/facebook/react/uimanager/ReactStylesDiffMap;)V
    .locals 1

    .line 257
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->isVirtual()Z

    move-result p2

    if-nez p2, :cond_0

    .line 258
    iget-object p2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getThemedContext()Lcom/facebook/react/uimanager/ThemedReactContext;

    move-result-object v0

    invoke-virtual {p2, p1, v0, p3}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;->handleCreateView(Lcom/facebook/react/uimanager/ReactShadowNode;Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    :cond_0
    return-void
.end method

.method protected handleUpdateView(Lcom/facebook/react/uimanager/ReactShadowNode;Ljava/lang/String;Lcom/facebook/react/uimanager/ReactStylesDiffMap;)V
    .locals 1

    .line 297
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->isVirtual()Z

    move-result v0

    if-nez v0, :cond_0

    .line 298
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;->handleUpdateView(Lcom/facebook/react/uimanager/ReactShadowNode;Ljava/lang/String;Lcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    :cond_0
    return-void
.end method

.method public manageChildren(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 20

    move-object/from16 v1, p0

    move/from16 v0, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    .line 318
    iget-boolean v7, v1, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v7, :cond_0

    return-void

    .line 322
    :cond_0
    iget-object v7, v1, Lcom/facebook/react/uimanager/UIImplementation;->uiImplementationThreadLock:Ljava/lang/Object;

    monitor-enter v7

    .line 323
    :try_start_0
    iget-object v8, v1, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v8, v0}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v8

    if-nez v2, :cond_1

    const/4 v10, 0x0

    goto :goto_0

    .line 325
    :cond_1
    invoke-interface/range {p2 .. p2}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v10

    :goto_0
    if-nez v4, :cond_2

    const/4 v11, 0x0

    goto :goto_1

    .line 326
    :cond_2
    invoke-interface/range {p4 .. p4}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v11

    :goto_1
    if-nez v6, :cond_3

    const/4 v12, 0x0

    goto :goto_2

    .line 327
    :cond_3
    invoke-interface/range {p6 .. p6}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v12

    :goto_2
    if-eqz v10, :cond_5

    if-eqz v3, :cond_4

    .line 329
    invoke-interface/range {p3 .. p3}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v13

    if-ne v10, v13, :cond_4

    goto :goto_3

    .line 330
    :cond_4
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    const-string v2, "Size of moveFrom != size of moveTo!"

    invoke-direct {v0, v2}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    :goto_3
    if-eqz v11, :cond_7

    if-eqz v5, :cond_6

    .line 333
    invoke-interface/range {p5 .. p5}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v13

    if-ne v11, v13, :cond_6

    goto :goto_4

    .line 334
    :cond_6
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    const-string v2, "Size of addChildTags != size of addAtIndices!"

    invoke-direct {v0, v2}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    :goto_4
    add-int v13, v10, v11

    .line 338
    new-array v14, v13, [Lcom/facebook/react/uimanager/ViewAtIndex;

    add-int v15, v10, v12

    .line 339
    new-array v9, v15, [I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 340
    :try_start_1
    new-array v1, v15, [I

    move/from16 v16, v13

    .line 341
    new-array v13, v12, [I

    if-lez v10, :cond_8

    .line 344
    invoke-static/range {p2 .. p2}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    invoke-static/range {p3 .. p3}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    :goto_5
    if-ge v0, v10, :cond_8

    move/from16 v17, v15

    .line 347
    invoke-interface {v2, v0}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v15

    .line 348
    invoke-interface {v8, v15}, Lcom/facebook/react/uimanager/ReactShadowNode;->getChildAt(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v2

    move-object/from16 v18, v13

    .line 349
    new-instance v13, Lcom/facebook/react/uimanager/ViewAtIndex;

    move-object/from16 v19, v8

    invoke-interface {v3, v0}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v8

    invoke-direct {v13, v2, v8}, Lcom/facebook/react/uimanager/ViewAtIndex;-><init>(II)V

    aput-object v13, v14, v0

    .line 350
    aput v15, v9, v0

    .line 351
    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    move-object/from16 v2, p2

    move/from16 v15, v17

    move-object/from16 v13, v18

    move-object/from16 v8, v19

    goto :goto_5

    :cond_8
    move-object/from16 v19, v8

    move-object/from16 v18, v13

    move/from16 v17, v15

    if-lez v11, :cond_9

    .line 356
    invoke-static/range {p4 .. p4}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    invoke-static/range {p5 .. p5}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    :goto_6
    if-ge v0, v11, :cond_9

    .line 359
    invoke-interface {v4, v0}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v2

    .line 360
    invoke-interface {v5, v0}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v3

    add-int v8, v10, v0

    .line 361
    new-instance v13, Lcom/facebook/react/uimanager/ViewAtIndex;

    invoke-direct {v13, v2, v3}, Lcom/facebook/react/uimanager/ViewAtIndex;-><init>(II)V

    aput-object v13, v14, v8

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_9
    if-lez v12, :cond_a

    .line 366
    invoke-static/range {p6 .. p6}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    :goto_7
    if-ge v0, v12, :cond_a

    .line 368
    invoke-interface {v6, v0}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v2

    move-object/from16 v3, v19

    .line 369
    invoke-interface {v3, v2}, Lcom/facebook/react/uimanager/ReactShadowNode;->getChildAt(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v4

    add-int v5, v10, v0

    .line 370
    aput v2, v9, v5

    .line 371
    aput v4, v1, v5

    .line 372
    aput v4, v18, v0

    add-int/lit8 v0, v0, 0x1

    move-object/from16 v19, v3

    goto :goto_7

    :cond_a
    move-object/from16 v3, v19

    .line 385
    sget-object v0, Lcom/facebook/react/uimanager/ViewAtIndex;->COMPARATOR:Ljava/util/Comparator;

    invoke-static {v14, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 386
    invoke-static {v9}, Ljava/util/Arrays;->sort([I)V

    add-int/lit8 v15, v17, -0x1

    const/4 v0, -0x1

    :goto_8
    if-ltz v15, :cond_c

    .line 391
    aget v2, v9, v15

    if-eq v2, v0, :cond_b

    .line 396
    invoke-interface {v3, v2}, Lcom/facebook/react/uimanager/ReactShadowNode;->removeChildAt(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    .line 398
    aget v0, v9, v15

    add-int/lit8 v15, v15, -0x1

    goto :goto_8

    .line 393
    :cond_b
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Repeated indices in Removal list for view tag: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    const/4 v0, 0x0

    :goto_9
    move/from16 v10, v16

    if-ge v0, v10, :cond_e

    .line 402
    aget-object v2, v14, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v4, v1

    move-object/from16 v1, p0

    .line 403
    :try_start_2
    iget-object v5, v1, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    iget v6, v2, Lcom/facebook/react/uimanager/ViewAtIndex;->mTag:I

    invoke-virtual {v5, v6}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v5

    if-eqz v5, :cond_d

    .line 408
    iget v2, v2, Lcom/facebook/react/uimanager/ViewAtIndex;->mIndex:I

    invoke-interface {v3, v5, v2}, Lcom/facebook/react/uimanager/ReactShadowNode;->addChildAt(Lcom/facebook/react/uimanager/ReactShadowNode;I)V

    add-int/lit8 v0, v0, 0x1

    move-object v1, v4

    move/from16 v16, v10

    goto :goto_9

    .line 405
    :cond_d
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Trying to add unknown view tag: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v2, Lcom/facebook/react/uimanager/ViewAtIndex;->mTag:I

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    move-object v4, v1

    move-object/from16 v1, p0

    .line 411
    iget-object v0, v1, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    move-object/from16 p1, v0

    move-object/from16 p2, v3

    move-object/from16 p3, v9

    move-object/from16 p4, v4

    move-object/from16 p5, v14

    move-object/from16 p6, v18

    invoke-virtual/range {p1 .. p6}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;->handleManageChildren(Lcom/facebook/react/uimanager/ReactShadowNode;[I[I[Lcom/facebook/react/uimanager/ViewAtIndex;[I)V

    const/4 v9, 0x0

    :goto_a
    if-ge v9, v12, :cond_f

    .line 415
    iget-object v0, v1, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    aget v2, v18, v9

    invoke-virtual {v0, v2}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/facebook/react/uimanager/UIImplementation;->removeShadowNode(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_a

    .line 417
    :cond_f
    monitor-exit v7

    return-void

    :catchall_0
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_b

    :catchall_1
    move-exception v0

    :goto_b
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method public measure(ILcom/facebook/react/bridge/Callback;)V
    .locals 1

    .line 542
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 550
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueMeasure(ILcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public measureInWindow(ILcom/facebook/react/bridge/Callback;)V
    .locals 1

    .line 559
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 563
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueMeasureInWindow(ILcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public measureLayout(IILcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V
    .locals 7

    .line 574
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 579
    :try_start_0
    iget-object v2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    invoke-direct {p0, p1, p2, v2}, Lcom/facebook/react/uimanager/UIImplementation;->measureLayout(II[I)V

    .line 580
    iget-object p1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    aget p1, p1, v0

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    .line 581
    iget-object p2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    aget p2, p2, v1

    int-to-float p2, p2

    invoke-static {p2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p2

    .line 582
    iget-object v2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    const/4 v3, 0x2

    aget v2, v2, v3

    int-to-float v2, v2

    invoke-static {v2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v2

    .line 583
    iget-object v4, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    int-to-float v4, v4

    invoke-static {v4}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v4

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    .line 584
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v6, v0

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v6, v1

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v6, v3

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v6, v5

    invoke-interface {p4, v6}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-array p2, v1, [Ljava/lang/Object;

    .line 586
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;->getMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p2, v0

    invoke-interface {p3, p2}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public measureLayoutRelativeToParent(ILcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V
    .locals 8

    .line 595
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 600
    :try_start_0
    iget-object v2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    invoke-direct {p0, p1, v2}, Lcom/facebook/react/uimanager/UIImplementation;->measureLayoutRelativeToParent(I[I)V

    .line 601
    iget-object p1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    aget p1, p1, v0

    int-to-float p1, p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    .line 602
    iget-object v2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    aget v2, v2, v1

    int-to-float v2, v2

    invoke-static {v2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v2

    .line 603
    iget-object v3, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    const/4 v4, 0x2

    aget v3, v3, v4

    int-to-float v3, v3

    invoke-static {v3}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v3

    .line 604
    iget-object v5, p0, Lcom/facebook/react/uimanager/UIImplementation;->mMeasureBuffer:[I

    const/4 v6, 0x3

    aget v5, v5, v6

    int-to-float v5, v5

    invoke-static {v5}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v5

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    .line 605
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v7, v0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v7, v1

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v7, v4

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v7, v6

    invoke-interface {p3, v7}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-array p3, v1, [Ljava/lang/Object;

    .line 607
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;->getMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p3, v0

    invoke-interface {p2, p3}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public onCatalystInstanceDestroyed()V
    .locals 1

    const/4 v0, 0x0

    .line 809
    iput-boolean v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    .line 810
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewManagers:Lcom/facebook/react/uimanager/ViewManagerRegistry;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->invalidate()V

    return-void
.end method

.method public onHostDestroy()V
    .locals 0

    return-void
.end method

.method public onHostPause()V
    .locals 1

    .line 803
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->pauseFrameCallback()V

    return-void
.end method

.method public onHostResume()V
    .locals 1

    .line 799
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->resumeFrameCallback()V

    return-void
.end method

.method public prependUIBlock(Lcom/facebook/react/uimanager/UIBlock;)V
    .locals 1

    .line 1006
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->prependUIBlock(Lcom/facebook/react/uimanager/UIBlock;)V

    return-void
.end method

.method public profileNextBatch()V
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->profileNextBatch()V

    return-void
.end method

.method public registerRootView(Landroid/view/View;ILcom/facebook/react/uimanager/ThemedReactContext;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(TT;I",
            "Lcom/facebook/react/uimanager/ThemedReactContext;",
            ")V"
        }
    .end annotation

    .line 151
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->uiImplementationThreadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 152
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/react/uimanager/UIImplementation;->createRootShadowNode()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v1

    .line 153
    invoke-interface {v1, p2}, Lcom/facebook/react/uimanager/ReactShadowNode;->setReactTag(I)V

    .line 154
    invoke-interface {v1, p3}, Lcom/facebook/react/uimanager/ReactShadowNode;->setThemedContext(Lcom/facebook/react/uimanager/ThemedReactContext;)V

    .line 156
    new-instance v2, Lcom/facebook/react/uimanager/UIImplementation$1;

    invoke-direct {v2, p0, v1}, Lcom/facebook/react/uimanager/UIImplementation$1;-><init>(Lcom/facebook/react/uimanager/UIImplementation;Lcom/facebook/react/uimanager/ReactShadowNode;)V

    invoke-virtual {p3, v2}, Lcom/facebook/react/uimanager/ThemedReactContext;->runOnNativeModulesQueueThread(Ljava/lang/Runnable;)V

    .line 165
    iget-object p3, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {p3, p2, p1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->addRootView(ILandroid/view/View;)V

    .line 166
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeLayoutUpdateListener()V
    .locals 1

    const/4 v0, 0x0

    .line 1032
    iput-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mLayoutUpdateListener:Lcom/facebook/react/uimanager/UIImplementation$LayoutUpdateListener;

    return-void
.end method

.method public removeRootShadowNode(I)V
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->uiImplementationThreadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 187
    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v1, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->removeRootNode(I)V

    .line 188
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeRootView(I)V
    .locals 1

    .line 171
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/UIImplementation;->removeRootShadowNode(I)V

    .line 172
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueRemoveRootView(I)V

    return-void
.end method

.method protected final removeShadowNode(Lcom/facebook/react/uimanager/ReactShadowNode;)V
    .locals 0

    .line 819
    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/UIImplementation;->removeShadowNodeRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    .line 820
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->dispose()V

    return-void
.end method

.method public removeSubviewsFromContainerWithID(I)V
    .locals 8

    .line 490
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 496
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v7

    const/4 v1, 0x0

    .line 497
    :goto_0
    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 498
    invoke-interface {v7, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move v2, p1

    .line 501
    invoke-virtual/range {v1 .. v7}, Lcom/facebook/react/uimanager/UIImplementation;->manageChildren(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void

    .line 492
    :cond_1
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Trying to remove subviews of an unknown view tag: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public replaceExistingNonRootView(II)V
    .locals 9

    .line 452
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->isRootNode(I)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p2}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->isRootNode(I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 456
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 461
    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getParent()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 466
    invoke-interface {v1, v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->indexOf(Lcom/facebook/react/uimanager/ReactShadowNode;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 471
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v6

    .line 472
    invoke-interface {v6, p2}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 474
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v7

    .line 475
    invoke-interface {v7, p1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 477
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v8

    .line 478
    invoke-interface {v8, p1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 480
    invoke-interface {v1}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/facebook/react/uimanager/UIImplementation;->manageChildren(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void

    .line 468
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Didn\'t find child tag in parent"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 463
    :cond_1
    new-instance p2, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Node is not attached to a parent: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 458
    :cond_2
    new-instance p2, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Trying to replace unknown view tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 453
    :cond_3
    new-instance p1, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    const-string p2, "Trying to add or replace a root tag!"

    invoke-direct {p1, p2}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public resolveRootTagFromReactTag(I)I
    .locals 2

    .line 1010
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->isRootNode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return p1

    .line 1014
    :cond_0
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/UIImplementation;->resolveShadowNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1017
    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getRootTag()I

    move-result p1

    goto :goto_0

    .line 1019
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Warning : attempted to resolve a non-existent react shadow node. reactTag="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ReactNative"

    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final resolveShadowNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object p1

    return-object p1
.end method

.method protected final resolveViewManager(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewManagers:Lcom/facebook/react/uimanager/ViewManagerRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->getViewManagerIfExists(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object p1

    return-object p1
.end method

.method public sendAccessibilityEvent(II)V
    .locals 1

    .line 795
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueSendAccessibilityEvent(II)V

    return-void
.end method

.method public setChildren(ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 4

    .line 428
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 432
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->uiImplementationThreadLock:Ljava/lang/Object;

    monitor-enter v0

    .line 433
    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v1, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object p1

    const/4 v1, 0x0

    .line 435
    :goto_0
    invoke-interface {p2}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 436
    iget-object v2, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 441
    invoke-interface {p1, v2, v1}, Lcom/facebook/react/uimanager/ReactShadowNode;->addChildAt(Lcom/facebook/react/uimanager/ReactShadowNode;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 438
    :cond_1
    new-instance p1, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Trying to add unknown view tag: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 439
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 444
    :cond_2
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mNativeViewHierarchyOptimizer:Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;

    invoke-virtual {v1, p1, p2}, Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;->handleSetChildren(Lcom/facebook/react/uimanager/ReactShadowNode;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 445
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setJSResponder(IZ)V
    .locals 3

    .line 730
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 738
    :cond_0
    :goto_0
    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getNativeKind()Lcom/facebook/react/uimanager/NativeKind;

    move-result-object v1

    sget-object v2, Lcom/facebook/react/uimanager/NativeKind;->NONE:Lcom/facebook/react/uimanager/NativeKind;

    if-ne v1, v2, :cond_1

    .line 739
    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getParent()Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    goto :goto_0

    .line 741
    :cond_1
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-interface {v0}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v0

    invoke-virtual {v1, v0, p1, p2}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueSetJSResponder(IIZ)V

    return-void
.end method

.method public setLayoutAnimationEnabledExperimental(Z)V
    .locals 1

    .line 710
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueSetLayoutAnimationEnabled(Z)V

    return-void
.end method

.method public setLayoutUpdateListener(Lcom/facebook/react/uimanager/UIImplementation$LayoutUpdateListener;)V
    .locals 0

    .line 1028
    iput-object p1, p0, Lcom/facebook/react/uimanager/UIImplementation;->mLayoutUpdateListener:Lcom/facebook/react/uimanager/UIImplementation$LayoutUpdateListener;

    return-void
.end method

.method public setViewHierarchyUpdateDebugListener(Lcom/facebook/react/uimanager/debug/NotThreadSafeViewHierarchyUpdateDebugListener;)V
    .locals 1

    .line 815
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->setViewHierarchyUpdateDebugListener(Lcom/facebook/react/uimanager/debug/NotThreadSafeViewHierarchyUpdateDebugListener;)V

    return-void
.end method

.method public setViewLocalData(ILjava/lang/Object;)V
    .locals 1

    .line 208
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-nez v0, :cond_0

    .line 211
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Attempt to set local data for view with unknown tag: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ReactNative"

    invoke-static {p2, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 215
    :cond_0
    invoke-interface {v0, p2}, Lcom/facebook/react/uimanager/ReactShadowNode;->setLocalData(Ljava/lang/Object;)V

    .line 217
    invoke-direct {p0}, Lcom/facebook/react/uimanager/UIImplementation;->dispatchViewUpdatesIfNeeded()V

    return-void
.end method

.method public showPopupMenu(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V
    .locals 1

    const-string v0, "showPopupMenu"

    .line 782
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/uimanager/UIImplementation;->checkOrAssertViewExists(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 787
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueShowPopupMenu(ILcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/Callback;)V

    return-void
.end method

.method public synchronouslyUpdateViewOnUIThread(ILcom/facebook/react/uimanager/ReactStylesDiffMap;)V
    .locals 1

    .line 291
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 292
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->getNativeViewHierarchyManager()Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->updateProperties(ILcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    return-void
.end method

.method public updateNodeSize(III)V
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-nez v0, :cond_0

    .line 198
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Tried to update size of non-existent tag: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ReactNative"

    invoke-static {p2, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    int-to-float p1, p2

    .line 201
    invoke-interface {v0, p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->setStyleWidth(F)V

    int-to-float p1, p3

    .line 202
    invoke-interface {v0, p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->setStyleHeight(F)V

    .line 204
    invoke-direct {p0}, Lcom/facebook/react/uimanager/UIImplementation;->dispatchViewUpdatesIfNeeded()V

    return-void
.end method

.method public updateRootView(III)V
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-nez v0, :cond_0

    .line 131
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Tried to update non-existent root tag: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ReactNative"

    invoke-static {p2, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 134
    :cond_0
    invoke-virtual {p0, v0, p2, p3}, Lcom/facebook/react/uimanager/UIImplementation;->updateRootView(Lcom/facebook/react/uimanager/ReactShadowNode;II)V

    return-void
.end method

.method public updateRootView(Lcom/facebook/react/uimanager/ReactShadowNode;II)V
    .locals 0

    .line 143
    invoke-interface {p1, p2, p3}, Lcom/facebook/react/uimanager/ReactShadowNode;->setMeasureSpecs(II)V

    return-void
.end method

.method public updateView(ILjava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 1

    .line 264
    iget-boolean v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewOperationsEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 268
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mViewManagers:Lcom/facebook/react/uimanager/ViewManagerRegistry;

    invoke-virtual {v0, p2}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->get(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 272
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v0

    if-eqz v0, :cond_2

    if-eqz p3, :cond_1

    .line 278
    new-instance p1, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    invoke-direct {p1, p3}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;-><init>(Lcom/facebook/react/bridge/ReadableMap;)V

    .line 279
    invoke-interface {v0, p1}, Lcom/facebook/react/uimanager/ReactShadowNode;->updateProperties(Lcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    .line 280
    invoke-virtual {p0, v0, p2, p1}, Lcom/facebook/react/uimanager/UIImplementation;->handleUpdateView(Lcom/facebook/react/uimanager/ReactShadowNode;Ljava/lang/String;Lcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    :cond_1
    return-void

    .line 274
    :cond_2
    new-instance p2, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Trying to update non-existent view with tag "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 270
    :cond_3
    new-instance p1, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Got unknown view type: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected updateViewHierarchy()V
    .locals 14

    const-string v0, "rootTag"

    const-string v1, "UIImplementation.updateViewHierarchy"

    const-wide/16 v2, 0x0

    .line 645
    invoke-static {v2, v3, v1}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    const/4 v1, 0x0

    .line 648
    :goto_0
    :try_start_0
    iget-object v4, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v4}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getRootNodeCount()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 649
    iget-object v4, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v4, v1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getRootTag(I)I

    move-result v4

    .line 650
    iget-object v5, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v5, v4}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object v4

    .line 652
    invoke-interface {v4}, Lcom/facebook/react/uimanager/ReactShadowNode;->getWidthMeasureSpec()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Lcom/facebook/react/uimanager/ReactShadowNode;->getHeightMeasureSpec()Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_1

    const-string v5, "UIImplementation.notifyOnBeforeLayoutRecursive"

    .line 653
    invoke-static {v2, v3, v5}, Lcom/facebook/systrace/SystraceMessage;->beginSection(JLjava/lang/String;)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v5

    .line 656
    invoke-interface {v4}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v6

    invoke-virtual {v5, v0, v6}, Lcom/facebook/systrace/SystraceMessage$Builder;->arg(Ljava/lang/String;I)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v5

    .line 657
    invoke-virtual {v5}, Lcom/facebook/systrace/SystraceMessage$Builder;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 659
    :try_start_1
    invoke-direct {p0, v4}, Lcom/facebook/react/uimanager/UIImplementation;->notifyOnBeforeLayoutRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 661
    :try_start_2
    invoke-static {v2, v3}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 664
    invoke-virtual {p0, v4}, Lcom/facebook/react/uimanager/UIImplementation;->calculateRootLayout(Lcom/facebook/react/uimanager/ReactShadowNode;)V

    const-string v5, "UIImplementation.applyUpdatesRecursive"

    .line 665
    invoke-static {v2, v3, v5}, Lcom/facebook/systrace/SystraceMessage;->beginSection(JLjava/lang/String;)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v5

    .line 667
    invoke-interface {v4}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v6

    invoke-virtual {v5, v0, v6}, Lcom/facebook/systrace/SystraceMessage$Builder;->arg(Ljava/lang/String;I)Lcom/facebook/systrace/SystraceMessage$Builder;

    move-result-object v5

    .line 668
    invoke-virtual {v5}, Lcom/facebook/systrace/SystraceMessage$Builder;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 670
    :try_start_3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v6, 0x0

    .line 671
    invoke-virtual {p0, v4, v6, v6, v5}, Lcom/facebook/react/uimanager/UIImplementation;->applyUpdatesRecursive(Lcom/facebook/react/uimanager/ReactShadowNode;FFLjava/util/List;)V

    .line 673
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/facebook/react/uimanager/ReactShadowNode;

    .line 674
    iget-object v7, p0, Lcom/facebook/react/uimanager/UIImplementation;->mEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

    const/4 v8, -0x1

    .line 677
    invoke-interface {v6}, Lcom/facebook/react/uimanager/ReactShadowNode;->getReactTag()I

    move-result v9

    .line 678
    invoke-interface {v6}, Lcom/facebook/react/uimanager/ReactShadowNode;->getScreenX()I

    move-result v10

    .line 679
    invoke-interface {v6}, Lcom/facebook/react/uimanager/ReactShadowNode;->getScreenY()I

    move-result v11

    .line 680
    invoke-interface {v6}, Lcom/facebook/react/uimanager/ReactShadowNode;->getScreenWidth()I

    move-result v12

    .line 681
    invoke-interface {v6}, Lcom/facebook/react/uimanager/ReactShadowNode;->getScreenHeight()I

    move-result v13

    .line 675
    invoke-static/range {v8 .. v13}, Lcom/facebook/react/uimanager/OnLayoutEvent;->obtain(IIIIII)Lcom/facebook/react/uimanager/OnLayoutEvent;

    move-result-object v6

    .line 674
    invoke-interface {v7, v6}, Lcom/facebook/react/uimanager/events/EventDispatcher;->dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 685
    :cond_0
    :try_start_4
    invoke-static {v2, v3}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 688
    iget-object v5, p0, Lcom/facebook/react/uimanager/UIImplementation;->mLayoutUpdateListener:Lcom/facebook/react/uimanager/UIImplementation$LayoutUpdateListener;

    if-eqz v5, :cond_1

    .line 689
    iget-object v6, p0, Lcom/facebook/react/uimanager/UIImplementation;->mOperationsQueue:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-virtual {v6, v4, v5}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueLayoutUpdateFinished(Lcom/facebook/react/uimanager/ReactShadowNode;Lcom/facebook/react/uimanager/UIImplementation$LayoutUpdateListener;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    .line 685
    invoke-static {v2, v3}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 686
    throw v0

    :catchall_1
    move-exception v0

    .line 661
    invoke-static {v2, v3}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 662
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 694
    :cond_2
    invoke-static {v2, v3}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void

    :catchall_2
    move-exception v0

    invoke-static {v2, v3}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 695
    throw v0
.end method

.method public viewIsDescendantOf(IILcom/facebook/react/bridge/Callback;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 528
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object p1

    .line 529
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIImplementation;->mShadowNodeRegistry:Lcom/facebook/react/uimanager/ShadowNodeRegistry;

    invoke-virtual {v0, p2}, Lcom/facebook/react/uimanager/ShadowNodeRegistry;->getNode(I)Lcom/facebook/react/uimanager/ReactShadowNode;

    move-result-object p2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    new-array v0, v0, [Ljava/lang/Object;

    .line 534
    invoke-interface {p1, p2}, Lcom/facebook/react/uimanager/ReactShadowNode;->isDescendantOf(Lcom/facebook/react/uimanager/ReactShadowNode;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v0, v1

    invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    return-void

    :cond_1
    :goto_0
    new-array p1, v0, [Ljava/lang/Object;

    .line 531
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    aput-object p2, p1, v1

    invoke-interface {p3, p1}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    return-void
.end method
