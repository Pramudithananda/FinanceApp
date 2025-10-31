.class public Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;
.super Lcom/facebook/react/uimanager/ViewGroupManager;
.source "ReactDrawerLayoutManager.java"

# interfaces
.implements Lcom/facebook/react/viewmanagers/AndroidDrawerLayoutManagerInterface;


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "AndroidDrawerLayout"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager$DrawerEventEmitter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/ViewGroupManager<",
        "Lcom/facebook/react/views/drawer/ReactDrawerLayout;",
        ">;",
        "Lcom/facebook/react/viewmanagers/AndroidDrawerLayoutManagerInterface<",
        "Lcom/facebook/react/views/drawer/ReactDrawerLayout;",
        ">;"
    }
.end annotation


# static fields
.field public static final CLOSE_DRAWER:I = 0x2

.field public static final OPEN_DRAWER:I = 0x1

.field public static final REACT_CLASS:Ljava/lang/String; = "AndroidDrawerLayout"


# instance fields
.field private final mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/react/uimanager/ViewManagerDelegate<",
            "Lcom/facebook/react/views/drawer/ReactDrawerLayout;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lcom/facebook/react/uimanager/ViewGroupManager;-><init>()V

    .line 52
    new-instance v0, Lcom/facebook/react/viewmanagers/AndroidDrawerLayoutManagerDelegate;

    invoke-direct {v0, p0}, Lcom/facebook/react/viewmanagers/AndroidDrawerLayoutManagerDelegate;-><init>(Lcom/facebook/react/uimanager/BaseViewManagerInterface;)V

    iput-object v0, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;

    return-void
.end method

.method private setDrawerPositionInternal(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V
    .locals 3

    const-string v0, "left"

    .line 108
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const v1, 0x800003

    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    goto :goto_0

    :cond_0
    const-string v0, "right"

    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const p2, 0x800005

    .line 111
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    goto :goto_0

    .line 113
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "drawerPosition must be \'left\' or \'right\', received"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "ReactNative"

    invoke-static {v0, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected bridge synthetic addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Landroid/view/View;)V
    .locals 0

    .line 40
    check-cast p2, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/views/drawer/ReactDrawerLayout;)V

    return-void
.end method

.method protected addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/views/drawer/ReactDrawerLayout;)V
    .locals 1

    .line 64
    invoke-virtual {p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->getId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 69
    :cond_0
    new-instance v0, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager$DrawerEventEmitter;

    invoke-direct {v0, p2, p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager$DrawerEventEmitter;-><init>(Landroidx/drawerlayout/widget/DrawerLayout;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    invoke-virtual {p2, v0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->addDrawerListener(Landroidx/drawerlayout/widget/DrawerLayout$DrawerListener;)V

    return-void
.end method

.method public bridge synthetic addView(Landroid/view/View;Landroid/view/View;I)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->addView(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Landroid/view/View;I)V

    return-void
.end method

.method public bridge synthetic addView(Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->addView(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Landroid/view/View;I)V

    return-void
.end method

.method public addView(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Landroid/view/View;I)V
    .locals 2

    .line 245
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->getChildCount(Landroid/view/ViewGroup;)I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_2

    if-eqz p3, :cond_1

    const/4 v0, 0x1

    if-ne p3, v0, :cond_0

    goto :goto_0

    .line 250
    :cond_0
    new-instance p1, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "The only valid indices for drawer\'s child are 0 or 1. Got "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " instead."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 253
    :cond_1
    :goto_0
    invoke-virtual {p1, p2, p3}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->addView(Landroid/view/View;I)V

    .line 254
    invoke-virtual {p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerProperties()V

    return-void

    .line 246
    :cond_2
    new-instance p1, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;

    const-string p2, "The Drawer cannot have more than two children"

    invoke-direct {p1, p2}, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic closeDrawer(Landroid/view/View;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->closeDrawer(Lcom/facebook/react/views/drawer/ReactDrawerLayout;)V

    return-void
.end method

.method public closeDrawer(Lcom/facebook/react/views/drawer/ReactDrawerLayout;)V
    .locals 0

    .line 160
    invoke-virtual {p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->closeDrawer()V

    return-void
.end method

.method protected bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 40
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    move-result-object p1

    return-object p1
.end method

.method protected createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/drawer/ReactDrawerLayout;
    .locals 1

    .line 74
    new-instance v0, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-direct {v0, p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    return-object v0
.end method

.method public getCommandsMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 188
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "openDrawer"

    const-string v3, "closeDrawer"

    invoke-static {v2, v0, v3, v1}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getDelegate()Lcom/facebook/react/uimanager/ViewManagerDelegate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/uimanager/ViewManagerDelegate<",
            "Lcom/facebook/react/views/drawer/ReactDrawerLayout;",
            ">;"
        }
    .end annotation

    .line 259
    iget-object v0, p0, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->mDelegate:Lcom/facebook/react/uimanager/ViewManagerDelegate;

    return-object v0
.end method

.method public getExportedCustomDirectEventTypeConstants()Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 226
    invoke-super {p0}, Lcom/facebook/react/uimanager/ViewGroupManager;->getExportedCustomDirectEventTypeConstants()Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_0

    .line 228
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :cond_0
    const-string v1, "topDrawerSlide"

    const-string v2, "onDrawerSlide"

    const-string v3, "registrationName"

    .line 231
    invoke-static {v3, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v4, "topDrawerOpen"

    const-string v5, "onDrawerOpen"

    .line 232
    invoke-static {v3, v5}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    const-string v6, "topDrawerClose"

    const-string v7, "onDrawerClose"

    .line 233
    invoke-static {v3, v7}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v7

    const-string v8, "topDrawerStateChanged"

    const-string v9, "onDrawerStateChanged"

    .line 235
    invoke-static {v3, v9}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v9

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    move-object v8, v9

    .line 230
    invoke-static/range {v1 .. v8}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    .line 229
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object v0
.end method

.method public getExportedViewConstants()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const v0, 0x800003

    .line 220
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x800005

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Left"

    const-string v3, "Right"

    invoke-static {v2, v0, v3, v1}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "DrawerPosition"

    .line 219
    invoke-static {v1, v0}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "AndroidDrawerLayout"

    return-object v0
.end method

.method public needsCustomLayoutForChildren()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic openDrawer(Landroid/view/View;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->openDrawer(Lcom/facebook/react/views/drawer/ReactDrawerLayout;)V

    return-void
.end method

.method public openDrawer(Lcom/facebook/react/views/drawer/ReactDrawerLayout;)V
    .locals 0

    .line 155
    invoke-virtual {p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->openDrawer()V

    return-void
.end method

.method public bridge synthetic receiveCommand(Landroid/view/View;ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->receiveCommand(Lcom/facebook/react/views/drawer/ReactDrawerLayout;ILcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public bridge synthetic receiveCommand(Landroid/view/View;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->receiveCommand(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public receiveCommand(Lcom/facebook/react/views/drawer/ReactDrawerLayout;ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    const/4 p3, 0x1

    if-eq p2, p3, :cond_1

    const/4 p3, 0x2

    if-eq p2, p3, :cond_0

    goto :goto_0

    .line 199
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->closeDrawer()V

    goto :goto_0

    .line 196
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->openDrawer()V

    :goto_0
    return-void
.end method

.method public receiveCommand(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 207
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    const-string p3, "closeDrawer"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_1

    const-string p3, "openDrawer"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 209
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->openDrawer()V

    goto :goto_0

    .line 212
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->closeDrawer()V

    :goto_0
    return-void
.end method

.method public bridge synthetic setDrawerBackgroundColor(Landroid/view/View;Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "drawerBackgroundColor"
    .end annotation

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setDrawerBackgroundColor(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/Integer;)V

    return-void
.end method

.method public setDrawerBackgroundColor(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "drawerBackgroundColor"
    .end annotation

    return-void
.end method

.method public bridge synthetic setDrawerLockMode(Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "drawerLockMode"
    .end annotation

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setDrawerLockMode(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V

    return-void
.end method

.method public setDrawerLockMode(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "drawerLockMode"
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_3

    const-string v1, "unlocked"

    .line 141
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "locked-closed"

    .line 143
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p2, 0x1

    .line 144
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerLockMode(I)V

    goto :goto_1

    :cond_1
    const-string v1, "locked-open"

    .line 145
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 p2, 0x2

    .line 146
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerLockMode(I)V

    goto :goto_1

    .line 148
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown drawerLockMode "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "ReactNative"

    invoke-static {v1, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    invoke-virtual {p1, v0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerLockMode(I)V

    goto :goto_1

    .line 142
    :cond_3
    :goto_0
    invoke-virtual {p1, v0}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerLockMode(I)V

    :goto_1
    return-void
.end method

.method public bridge synthetic setDrawerPosition(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setDrawerPosition(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V

    return-void
.end method

.method public setDrawerPosition(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Lcom/facebook/react/bridge/Dynamic;)V
    .locals 4
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "drawerPosition"
    .end annotation

    .line 88
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->isNull()Z

    move-result v0

    const v1, 0x800003

    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    goto :goto_1

    .line 90
    :cond_0
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->getType()Lcom/facebook/react/bridge/ReadableType;

    move-result-object v0

    sget-object v2, Lcom/facebook/react/bridge/ReadableType;->Number:Lcom/facebook/react/bridge/ReadableType;

    const-string v3, "ReactNative"

    if-ne v0, v2, :cond_3

    .line 91
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->asInt()I

    move-result p2

    if-eq v1, p2, :cond_2

    const v0, 0x800005

    if-ne v0, p2, :cond_1

    goto :goto_0

    .line 96
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Unknown drawerPosition "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    goto :goto_1

    .line 94
    :cond_2
    :goto_0
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    goto :goto_1

    .line 99
    :cond_3
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->getType()Lcom/facebook/react/bridge/ReadableType;

    move-result-object v0

    sget-object v2, Lcom/facebook/react/bridge/ReadableType;->String:Lcom/facebook/react/bridge/ReadableType;

    if-ne v0, v2, :cond_4

    .line 100
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->asString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setDrawerPositionInternal(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    const-string p2, "drawerPosition must be a string or int"

    .line 102
    invoke-static {v3, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    :goto_1
    return-void
.end method

.method public setDrawerPosition(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V
    .locals 0

    if-nez p2, :cond_0

    const p2, 0x800003

    .line 80
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerPosition(I)V

    goto :goto_0

    .line 82
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setDrawerPositionInternal(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public bridge synthetic setDrawerWidth(Landroid/view/View;Ljava/lang/Float;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setDrawerWidth(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/Float;)V

    return-void
.end method

.method public setDrawerWidth(Lcom/facebook/react/views/drawer/ReactDrawerLayout;F)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultFloat = NaNf
        name = "drawerWidth"
    .end annotation

    .line 123
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p2, -0x1

    goto :goto_0

    .line 125
    :cond_0
    invoke-static {p2}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    .line 126
    :goto_0
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerWidth(I)V

    return-void
.end method

.method public setDrawerWidth(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/Float;)V
    .locals 0

    if-nez p2, :cond_0

    const/4 p2, -0x1

    goto :goto_0

    .line 134
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-static {p2}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    .line 135
    :goto_0
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerWidth(I)V

    return-void
.end method

.method public bridge synthetic setElevation(Landroid/view/View;F)V
    .locals 0

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setElevation(Lcom/facebook/react/views/drawer/ReactDrawerLayout;F)V

    return-void
.end method

.method public setElevation(Lcom/facebook/react/views/drawer/ReactDrawerLayout;F)V
    .locals 0

    .line 177
    invoke-static {p2}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p2

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayout;->setDrawerElevation(F)V

    return-void
.end method

.method public bridge synthetic setKeyboardDismissMode(Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "keyboardDismissMode"
    .end annotation

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setKeyboardDismissMode(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V

    return-void
.end method

.method public setKeyboardDismissMode(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "keyboardDismissMode"
    .end annotation

    return-void
.end method

.method public bridge synthetic setStatusBarBackgroundColor(Landroid/view/View;Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "statusBarBackgroundColor"
    .end annotation

    .line 40
    check-cast p1, Lcom/facebook/react/views/drawer/ReactDrawerLayout;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;->setStatusBarBackgroundColor(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/Integer;)V

    return-void
.end method

.method public setStatusBarBackgroundColor(Lcom/facebook/react/views/drawer/ReactDrawerLayout;Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "statusBarBackgroundColor"
    .end annotation

    return-void
.end method
