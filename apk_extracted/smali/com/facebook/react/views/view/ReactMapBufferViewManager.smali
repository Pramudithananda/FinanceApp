.class public final Lcom/facebook/react/views/view/ReactMapBufferViewManager;
.super Ljava/lang/Object;
.source "ReactMapBufferViewManager.kt"

# interfaces
.implements Lcom/facebook/react/views/view/ReactViewManagerWrapper;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J4\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0008\u0010\u0015\u001a\u00020\u0016H\u0016J\u0010\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\nH\u0016J\"\u0010\u001a\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\n2\u0006\u0010\u001c\u001a\u00020\u000c2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0016J\"\u0010\u001a\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\n2\u0006\u0010\u001c\u001a\u00020\u00162\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0016J0\u0010\u001f\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\n2\u0006\u0010 \u001a\u00020\u000c2\u0006\u0010!\u001a\u00020\u000c2\u0006\u0010\"\u001a\u00020\u000c2\u0006\u0010#\u001a\u00020\u000cH\u0016J\u001a\u0010$\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\n2\u0008\u0010%\u001a\u0004\u0018\u00010\u0010H\u0016J\u001a\u0010&\u001a\u00020\u00182\u0006\u0010\'\u001a\u00020\n2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0010H\u0016J&\u0010(\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0019\u001a\u00020\n2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016R\u0018\u0010\u0003\u001a\u0006\u0012\u0002\u0008\u00030\u00048VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0006R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006)"
    }
    d2 = {
        "Lcom/facebook/react/views/view/ReactMapBufferViewManager;",
        "Lcom/facebook/react/views/view/ReactViewManagerWrapper;",
        "()V",
        "viewGroupManager",
        "Lcom/facebook/react/uimanager/ViewGroupManager;",
        "getViewGroupManager",
        "()Lcom/facebook/react/uimanager/ViewGroupManager;",
        "viewManager",
        "Lcom/facebook/react/views/view/ReactViewManager;",
        "createView",
        "Landroid/view/View;",
        "reactTag",
        "",
        "reactContext",
        "Lcom/facebook/react/uimanager/ThemedReactContext;",
        "props",
        "",
        "stateWrapper",
        "Lcom/facebook/react/uimanager/StateWrapper;",
        "jsResponderHandler",
        "Lcom/facebook/react/touch/JSResponderHandler;",
        "getName",
        "",
        "onDropViewInstance",
        "",
        "view",
        "receiveCommand",
        "root",
        "commandId",
        "args",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "setPadding",
        "left",
        "top",
        "right",
        "bottom",
        "updateExtraData",
        "extraData",
        "updateProperties",
        "viewToUpdate",
        "updateState",
        "ReactAndroid_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/facebook/react/views/view/ReactMapBufferViewManager;

.field private static final viewManager:Lcom/facebook/react/views/view/ReactViewManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/view/ReactMapBufferViewManager;-><init>()V

    sput-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->INSTANCE:Lcom/facebook/react/views/view/ReactMapBufferViewManager;

    .line 20
    new-instance v0, Lcom/facebook/react/views/view/ReactViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/view/ReactViewManager;-><init>()V

    sput-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createView(ILcom/facebook/react/uimanager/ThemedReactContext;Ljava/lang/Object;Lcom/facebook/react/uimanager/StateWrapper;Lcom/facebook/react/touch/JSResponderHandler;)Landroid/view/View;
    .locals 7

    const-string v0, "reactContext"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsResponderHandler"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    sget-object v1, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    .line 33
    instance-of v0, p3, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v4, v0

    move v2, p1

    move-object v3, p2

    move-object v5, p4

    move-object v6, p5

    .line 30
    invoke-virtual/range {v1 .. v6}, Lcom/facebook/react/views/view/ReactViewManager;->createView(ILcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/uimanager/ReactStylesDiffMap;Lcom/facebook/react/uimanager/StateWrapper;Lcom/facebook/react/touch/JSResponderHandler;)Landroid/view/View;

    move-result-object p1

    .line 36
    move-object p2, p1

    check-cast p2, Lcom/facebook/react/views/view/ReactViewGroup;

    .line 37
    instance-of p4, p3, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    if-eqz p4, :cond_1

    .line 38
    sget-object p4, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->INSTANCE:Lcom/facebook/react/views/view/ReactMapBufferViewManager;

    const-string p5, "view"

    invoke-static {p2, p5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Landroid/view/View;

    invoke-virtual {p4, p2, p3}, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->updateProperties(Landroid/view/View;Ljava/lang/Object;)V

    :cond_1
    const-string p2, "viewManager\n          .c\u2026            }\n          }"

    .line 33
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .line 72
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    invoke-virtual {v0}, Lcom/facebook/react/views/view/ReactViewManager;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "viewManager.name"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic getViewGroupManager()Lcom/facebook/react/uimanager/IViewGroupManager;
    .locals 1

    .line 19
    invoke-virtual {p0}, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->getViewGroupManager()Lcom/facebook/react/uimanager/ViewGroupManager;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/IViewGroupManager;

    return-object v0
.end method

.method public getViewGroupManager()Lcom/facebook/react/uimanager/ViewGroupManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/uimanager/ViewGroupManager<",
            "*>;"
        }
    .end annotation

    .line 75
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast v0, Lcom/facebook/react/uimanager/ViewGroupManager;

    return-object v0
.end method

.method public onDropViewInstance(Landroid/view/View;)V
    .locals 1

    const-string v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast p1, Lcom/facebook/react/views/view/ReactViewGroup;

    check-cast p1, Landroid/view/View;

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/view/ReactViewManager;->onDropViewInstance(Landroid/view/View;)V

    return-void
.end method

.method public receiveCommand(Landroid/view/View;ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 1

    const-string v0, "root"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast p1, Lcom/facebook/react/views/view/ReactViewGroup;

    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/views/view/ReactViewManager;->receiveCommand(Lcom/facebook/react/views/view/ReactViewGroup;ILcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public receiveCommand(Landroid/view/View;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 1

    const-string v0, "root"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "commandId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast p1, Lcom/facebook/react/views/view/ReactViewGroup;

    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/views/view/ReactViewManager;->receiveCommand(Lcom/facebook/react/views/view/ReactViewGroup;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public setPadding(Landroid/view/View;IIII)V
    .locals 7

    const-string v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    sget-object v1, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast p1, Lcom/facebook/react/views/view/ReactViewGroup;

    move-object v2, p1

    check-cast v2, Landroid/view/View;

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/facebook/react/views/view/ReactViewManager;->setPadding(Landroid/view/View;IIII)V

    return-void
.end method

.method public updateExtraData(Landroid/view/View;Ljava/lang/Object;)V
    .locals 1

    const-string v0, "root"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast p1, Lcom/facebook/react/views/view/ReactViewGroup;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/views/view/ReactViewManager;->updateExtraData(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    return-void
.end method

.method public updateProperties(Landroid/view/View;Ljava/lang/Object;)V
    .locals 2

    const-string v0, "viewToUpdate"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    instance-of v0, p2, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    if-nez v0, :cond_1

    .line 44
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast p1, Lcom/facebook/react/views/view/ReactViewGroup;

    check-cast p1, Landroid/view/View;

    instance-of v1, p2, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    if-eqz v1, :cond_0

    check-cast p2, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/views/view/ReactViewManager;->updateProperties(Landroid/view/View;Lcom/facebook/react/uimanager/ReactStylesDiffMap;)V

    goto :goto_1

    .line 46
    :cond_1
    sget-object v0, Lcom/facebook/react/views/view/ReactMapBufferPropSetter;->INSTANCE:Lcom/facebook/react/views/view/ReactMapBufferPropSetter;

    check-cast p1, Lcom/facebook/react/views/view/ReactViewGroup;

    sget-object v1, Lcom/facebook/react/views/view/ReactMapBufferViewManager;->viewManager:Lcom/facebook/react/views/view/ReactViewManager;

    check-cast p2, Lcom/facebook/react/common/mapbuffer/MapBuffer;

    invoke-virtual {v0, p1, v1, p2}, Lcom/facebook/react/views/view/ReactMapBufferPropSetter;->setProps(Lcom/facebook/react/views/view/ReactViewGroup;Lcom/facebook/react/views/view/ReactViewManager;Lcom/facebook/react/common/mapbuffer/MapBuffer;)V

    :goto_1
    return-void
.end method

.method public updateState(Landroid/view/View;Ljava/lang/Object;Lcom/facebook/react/uimanager/StateWrapper;)Ljava/lang/Object;
    .locals 0

    const-string p2, "view"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method
