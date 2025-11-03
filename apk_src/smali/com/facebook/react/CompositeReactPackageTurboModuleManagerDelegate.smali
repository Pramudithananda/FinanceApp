.class public Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate;
.super Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;
.source "CompositeReactPackageTurboModuleManagerDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate$Builder;
    }
.end annotation


# direct methods
.method private constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;",
            "Ljava/util/List<",
            "Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;",
            ">;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V

    .line 30
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;

    .line 31
    invoke-direct {p0, p2}, Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate;->addTurboModuleManagerDelegate(Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;Ljava/util/List;Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method private native addTurboModuleManagerDelegate(Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;)V
.end method


# virtual methods
.method protected native initHybrid()Lcom/facebook/jni/HybridData;
.end method
