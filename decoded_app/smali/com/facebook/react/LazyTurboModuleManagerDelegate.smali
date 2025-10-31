.class public abstract Lcom/facebook/react/LazyTurboModuleManagerDelegate;
.super Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;
.source "LazyTurboModuleManagerDelegate.java"


# annotations
.annotation runtime Lcom/facebook/react/common/annotations/UnstableReactNativeAPI;
.end annotation


# instance fields
.field private final mModules:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;",
            ">;"
        }
    .end annotation
.end field

.field private final mPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation
.end field

.field private final mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;-><init>()V

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->mModules:Ljava/util/Map;

    .line 38
    iput-object p2, p0, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->mPackages:Ljava/util/List;

    .line 39
    iput-object p1, p0, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method


# virtual methods
.method public getLegacyModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 1

    .line 97
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Legacy Modules are not supported"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getModule(Ljava/lang/String;)Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;
    .locals 4

    .line 45
    iget-object v0, p0, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->mModules:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-nez v0, :cond_2

    .line 54
    iget-object v1, p0, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->mPackages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/ReactPackage;

    .line 55
    instance-of v3, v2, Lcom/facebook/react/TurboReactPackage;

    if-eqz v3, :cond_1

    .line 56
    check-cast v2, Lcom/facebook/react/TurboReactPackage;

    .line 58
    :try_start_0
    iget-object v3, p0, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->mReactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-virtual {v2, p1, v3}, Lcom/facebook/react/TurboReactPackage;->getModule(Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    goto :goto_0

    :catch_0
    nop

    :goto_0
    if-eqz v0, :cond_0

    .line 67
    iget-object v1, p0, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->mModules:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    invoke-interface {v0}, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;->initialize()V

    return-object v0

    .line 72
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ReactPackage must be an instance of TurboReactPackage"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    return-object v0
.end method

.method public unstable_isLegacyModuleRegistered(Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public unstable_isModuleRegistered(Ljava/lang/String;)Z
    .locals 0

    .line 82
    invoke-virtual {p0, p1}, Lcom/facebook/react/LazyTurboModuleManagerDelegate;->getModule(Ljava/lang/String;)Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public unstable_shouldEnableLegacyModuleInterop()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public unstable_shouldRouteTurboModulesThroughLegacyModuleInterop()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
