.class public Lcom/facebook/react/turbomodule/core/TurboModuleManager;
.super Ljava/lang/Object;
.source "TurboModuleManager.java"

# interfaces
.implements Lcom/facebook/react/bridge/JSIModule;
.implements Lcom/facebook/react/turbomodule/core/interfaces/TurboModuleRegistry;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;,
        Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;
    }
.end annotation


# instance fields
.field private final mDelegate:Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;

.field private final mEagerInitModuleNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mHybridData:Lcom/facebook/jni/HybridData;

.field private final mLegacyModuleProvider:Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;

.field private final mModuleCleanupLock:Ljava/lang/Object;

.field private mModuleCleanupStarted:Z

.field private final mModuleHolders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final mTurboModuleProvider:Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 45
    invoke-static {}, Lcom/facebook/react/turbomodule/core/NativeModuleSoLoader;->maybeLoadSoLibrary()V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;Lcom/facebook/react/turbomodule/core/interfaces/CallInvokerHolder;Lcom/facebook/react/turbomodule/core/interfaces/NativeMethodCallInvokerHolder;)V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupStarted:Z

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    .line 67
    iput-object p2, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;

    .line 68
    check-cast p3, Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;

    check-cast p4, Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;

    .line 69
    invoke-direct {p0, p1, p3, p4, p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->initHybrid(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;)Lcom/facebook/jni/HybridData;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 74
    invoke-direct {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->shouldEnableLegacyModuleInterop()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->installJSIBindings(Z)V

    if-nez p2, :cond_0

    .line 77
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;->getEagerInitModuleNames()Ljava/util/List;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mEagerInitModuleNames:Ljava/util/List;

    .line 79
    new-instance p1, Lcom/facebook/react/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda0;

    invoke-direct {p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda0;-><init>()V

    if-nez p2, :cond_1

    move-object p3, p1

    goto :goto_1

    .line 84
    :cond_1
    new-instance p3, Lcom/facebook/react/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda1;

    invoke-direct {p3, p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;)V

    :goto_1
    iput-object p3, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mTurboModuleProvider:Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;

    if-eqz p2, :cond_3

    .line 87
    invoke-direct {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->shouldEnableLegacyModuleInterop()Z

    move-result p3

    if-nez p3, :cond_2

    goto :goto_2

    .line 89
    :cond_2
    new-instance p1, Lcom/facebook/react/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda2;

    invoke-direct {p1, p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;)V

    :cond_3
    :goto_2
    iput-object p1, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mLegacyModuleProvider:Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;

    return-void
.end method

.method private getLegacyCxxModule(Ljava/lang/String;)Lcom/facebook/react/bridge/CxxModuleWrapper;
    .locals 2

    .line 162
    invoke-direct {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 163
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 164
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-eqz v0, :cond_0

    move-object v1, p1

    check-cast v1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    :cond_0
    return-object v1

    .line 171
    :cond_1
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return-object v1

    .line 175
    :cond_2
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 176
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-eqz v0, :cond_3

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-nez v0, :cond_3

    .line 177
    move-object v1, p1

    check-cast v1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    :cond_3
    return-object v1
.end method

.method private getLegacyJavaModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 2

    .line 138
    invoke-direct {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 139
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 140
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-nez v0, :cond_0

    move-object v1, p1

    :cond_0
    return-object v1

    .line 147
    :cond_1
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return-object v1

    .line 151
    :cond_2
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 152
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-nez v0, :cond_3

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-nez v0, :cond_3

    move-object v1, p1

    :cond_3
    return-object v1
.end method

.method private static getMethodDescriptorsFromModule(Lcom/facebook/react/bridge/NativeModule;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/NativeModule;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/turbomodule/core/TurboModuleInteropUtils$MethodDescriptor;",
            ">;"
        }
    .end annotation

    .line 130
    invoke-static {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleInteropUtils;->getMethodDescriptorsFromModule(Lcom/facebook/react/bridge/NativeModule;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private getOrCreateModule(Ljava/lang/String;Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;Z)Lcom/facebook/react/bridge/NativeModule;
    .locals 2

    .line 287
    monitor-enter p2

    .line 288
    :try_start_0
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->isDoneCreatingModule()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p3, :cond_0

    .line 290
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result p3

    invoke-static {p1, p3}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateCacheHit(Ljava/lang/String;I)V

    .line 293
    :cond_0
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    monitor-exit p2

    return-object p1

    .line 296
    :cond_1
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->isCreatingModule()Z

    move-result p3

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p3, :cond_2

    .line 299
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->startCreatingModule()V

    const/4 p3, 0x1

    goto :goto_0

    :cond_2
    const/4 p3, 0x0

    .line 301
    :goto_0
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-eqz p3, :cond_5

    .line 304
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result p3

    invoke-static {p1, p3}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateConstructStart(Ljava/lang/String;I)V

    .line 305
    iget-object p3, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mTurboModuleProvider:Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;

    invoke-interface {p3, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p3

    if-nez p3, :cond_3

    .line 308
    iget-object p3, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mLegacyModuleProvider:Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;

    invoke-interface {p3, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleProvider;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p3

    .line 311
    :cond_3
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateConstructEnd(Ljava/lang/String;I)V

    .line 312
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateSetUpStart(Ljava/lang/String;I)V

    if-eqz p3, :cond_4

    .line 315
    monitor-enter p2

    .line 316
    :try_start_1
    invoke-virtual {p2, p3}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->setModule(Lcom/facebook/react/bridge/NativeModule;)V

    .line 317
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 324
    invoke-interface {p3}, Lcom/facebook/react/bridge/NativeModule;->initialize()V

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 317
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    .line 326
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getOrCreateModule(): Unable to create module \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\". Was legacy: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ". Was turbo: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 326
    invoke-direct {p0, v0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->logError(Ljava/lang/String;)V

    .line 336
    :goto_1
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateSetUpEnd(Ljava/lang/String;I)V

    .line 337
    monitor-enter p2

    .line 338
    :try_start_3
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->endCreatingModule()V

    .line 339
    invoke-virtual {p2}, Ljava/lang/Object;->notifyAll()V

    .line 340
    monitor-exit p2

    return-object p3

    :catchall_1
    move-exception p1

    monitor-exit p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    .line 345
    :cond_5
    monitor-enter p2

    .line 347
    :goto_2
    :try_start_4
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->isCreatingModule()Z

    move-result p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-eqz p1, :cond_6

    .line 350
    :try_start_5
    invoke-virtual {p2}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_2

    :catch_0
    const/4 v1, 0x1

    goto :goto_2

    :cond_6
    if-eqz v1, :cond_7

    .line 362
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 365
    :cond_7
    invoke-virtual {p2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    monitor-exit p2

    return-object p1

    :catchall_2
    move-exception p1

    .line 366
    monitor-exit p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw p1

    :catchall_3
    move-exception p1

    .line 301
    :try_start_7
    monitor-exit p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw p1
.end method

.method private getTurboJavaModule(Ljava/lang/String;)Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;
    .locals 2

    .line 209
    invoke-direct {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 217
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    .line 221
    :cond_1
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 222
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-nez v0, :cond_2

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-eqz v0, :cond_2

    .line 223
    move-object v1, p1

    check-cast v1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    :cond_2
    return-object v1
.end method

.method private getTurboLegacyCxxModule(Ljava/lang/String;)Lcom/facebook/react/bridge/CxxModuleWrapper;
    .locals 2

    .line 186
    invoke-direct {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 194
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    .line 198
    :cond_1
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    .line 199
    instance-of v0, p1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    if-eqz v0, :cond_2

    instance-of v0, p1, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    if-eqz v0, :cond_2

    .line 200
    move-object v1, p1

    check-cast v1, Lcom/facebook/react/bridge/CxxModuleWrapper;

    :cond_2
    return-object v1
.end method

.method private native initHybrid(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;)Lcom/facebook/jni/HybridData;
.end method

.method private native installJSIBindings(Z)V
.end method

.method private isLegacyModule(Ljava/lang/String;)Z
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;->unstable_isLegacyModuleRegistered(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isTurboModule(Ljava/lang/String;)Z
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;->unstable_isModuleRegistered(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method static synthetic lambda$new$0(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$new$1(Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    .line 84
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;->getModule(Ljava/lang/String;)Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    move-result-object p0

    check-cast p0, Lcom/facebook/react/bridge/NativeModule;

    return-object p0
.end method

.method static synthetic lambda$new$2(Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 3

    .line 90
    invoke-virtual {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;->getLegacyModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 93
    instance-of v0, p0, Lcom/facebook/react/turbomodule/core/interfaces/TurboModule;

    xor-int/lit8 v0, v0, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "NativeModule \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" is a TurboModule"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(ZLjava/lang/String;)V

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private logError(Ljava/lang/String;)V
    .locals 2

    const-string v0, "TurboModuleManager"

    .line 407
    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    invoke-direct {p0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 409
    new-instance v1, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    invoke-direct {v1, p1}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private shouldEnableLegacyModuleInterop()Z
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;->unstable_shouldEnableLegacyModuleInterop()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private shouldRouteTurboModulesThroughLegacyModuleInterop()Z
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mDelegate:Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {v0}, Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;->unstable_shouldRouteTurboModulesThroughLegacyModuleInterop()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public getEagerInitModuleNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mEagerInitModuleNames:Ljava/util/List;

    return-object v0
.end method

.method public getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 3

    const-string v0, "getModule(): Tried to get module \""

    .line 237
    iget-object v1, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    monitor-enter v1

    .line 238
    :try_start_0
    iget-boolean v2, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupStarted:Z

    if-eqz v2, :cond_0

    .line 242
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\", but TurboModuleManager was tearing down. Returning null. Was legacy: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isLegacyModule(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ". Was turbo: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->isTurboModule(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 242
    invoke-direct {p0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->logError(Ljava/lang/String;)V

    .line 250
    monitor-exit v1

    const/4 p1, 0x0

    return-object p1

    .line 257
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 258
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    new-instance v2, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;

    invoke-direct {v2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;-><init>()V

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    :cond_1
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;

    .line 262
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    invoke-virtual {v0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v1

    invoke-static {p1, v1}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateStart(Ljava/lang/String;I)V

    const/4 v1, 0x1

    .line 265
    invoke-direct {p0, p1, v0, v1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getOrCreateModule(Ljava/lang/String;Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;Z)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 268
    invoke-virtual {v0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateEnd(Ljava/lang/String;I)V

    goto :goto_0

    .line 270
    :cond_2
    invoke-virtual {v0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModuleId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->moduleCreateFail(Ljava/lang/String;I)V

    :goto_0
    return-object v1

    :catchall_0
    move-exception p1

    .line 262
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getModules()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;"
        }
    .end annotation

    .line 371
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 372
    iget-object v1, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    monitor-enter v1

    .line 373
    :try_start_0
    iget-object v2, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 374
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 376
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 377
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;

    .line 378
    monitor-enter v2

    .line 380
    :try_start_1
    invoke-virtual {v2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 381
    invoke-virtual {v2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    :cond_0
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    return-object v1

    :catchall_1
    move-exception v0

    .line 374
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method public hasModule(Ljava/lang/String;)Z
    .locals 2

    .line 391
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    monitor-enter v0

    .line 392
    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;

    .line 393
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_1

    .line 396
    monitor-enter p1

    .line 397
    :try_start_1
    invoke-virtual {p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;->getModule()Lcom/facebook/react/bridge/NativeModule;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 398
    monitor-exit p1

    const/4 p1, 0x1

    return p1

    .line 400
    :cond_0
    monitor-exit p1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1

    :catchall_1
    move-exception p1

    .line 393
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method public initialize()V
    .locals 0

    return-void
.end method

.method public onCatalystInstanceDestroy()V
    .locals 4

    .line 436
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 437
    :try_start_0
    iput-boolean v1, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleCleanupStarted:Z

    .line 438
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 440
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 441
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 442
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;

    const/4 v3, 0x0

    .line 449
    invoke-direct {p0, v2, v1, v3}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getOrCreateModule(Ljava/lang/String;Lcom/facebook/react/turbomodule/core/TurboModuleManager$ModuleHolder;Z)Lcom/facebook/react/bridge/NativeModule;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 452
    invoke-interface {v1}, Lcom/facebook/react/bridge/NativeModule;->invalidate()V

    goto :goto_0

    .line 456
    :cond_1
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mModuleHolders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 459
    iget-object v0, p0, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->mHybridData:Lcom/facebook/jni/HybridData;

    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    return-void

    :catchall_0
    move-exception v1

    .line 438
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
