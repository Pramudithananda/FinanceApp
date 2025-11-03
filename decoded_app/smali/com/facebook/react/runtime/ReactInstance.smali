.class final Lcom/facebook/react/runtime/ReactInstance;
.super Ljava/lang/Object;
.source "ReactInstance.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ReactInstance"

.field private static volatile sIsLibraryLoaded:Z


# instance fields
.field private final mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

.field private mComponentNameResolverManager:Lcom/facebook/react/uimanager/ComponentNameResolverManager;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

.field private final mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

.field private final mHybridData:Lcom/facebook/jni/HybridData;

.field private final mJavaTimerManager:Lcom/facebook/react/modules/core/JavaTimerManager;

.field private final mQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;

.field private final mReactPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation
.end field

.field private final mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

.field private mUIConstantsProviderManager:Lcom/facebook/react/uimanager/UIConstantsProviderManager;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mViewManagers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$TV5UxXY5Wdp4uxqvPS5PY9JjyJo(Lcom/facebook/react/runtime/ReactInstance;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->lambda$new$0()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$p1qbHeQQ7LB39Lz_tJvunspPJW0(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/bridge/NativeMap;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->lambda$new$1()Lcom/facebook/react/bridge/NativeMap;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmBridgelessReactContext(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/runtime/BridgelessReactContext;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmJavaTimerManager(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/modules/core/JavaTimerManager;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/runtime/ReactInstance;->mJavaTimerManager:Lcom/facebook/react/modules/core/JavaTimerManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcreateViewManager(Lcom/facebook/react/runtime/ReactInstance;Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactInstance;->createViewManager(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetViewManagerNames(Lcom/facebook/react/runtime/ReactInstance;)Ljava/util/Collection;
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getViewManagerNames()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mloadJSBundleFromAssets(Lcom/facebook/react/runtime/ReactInstance;Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactInstance;->loadJSBundleFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mloadJSBundleFromFile(Lcom/facebook/react/runtime/ReactInstance;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactInstance;->loadJSBundleFromFile(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 103
    invoke-static {}, Lcom/facebook/react/runtime/ReactInstance;->loadLibraryIfNeeded()V

    return-void
.end method

.method constructor <init>(Lcom/facebook/react/runtime/BridgelessReactContext;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/devsupport/interfaces/DevSupportManager;Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Z)V
    .locals 14

    move-object v9, p0

    move-object v10, p1

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v9, Lcom/facebook/react/runtime/ReactInstance;->mViewManagers:Ljava/util/Map;

    .line 116
    iput-object v10, v9, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    move-object/from16 v11, p2

    .line 117
    iput-object v11, v9, Lcom/facebook/react/runtime/ReactInstance;->mDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    const-string v0, "ReactInstance.initialize"

    const-wide/16 v12, 0x0

    .line 119
    invoke-static {v12, v13, v0}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    const-string v0, "v_native"

    .line 126
    invoke-static {v0}, Lcom/facebook/react/bridge/queue/MessageQueueThreadSpec;->newBackgroundThreadSpec(Ljava/lang/String;)Lcom/facebook/react/bridge/queue/MessageQueueThreadSpec;

    move-result-object v0

    .line 128
    invoke-static {}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec;->builder()Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec$Builder;

    move-result-object v1

    const-string v2, "v_js"

    .line 129
    invoke-static {v2}, Lcom/facebook/react/bridge/queue/MessageQueueThreadSpec;->newBackgroundThreadSpec(Ljava/lang/String;)Lcom/facebook/react/bridge/queue/MessageQueueThreadSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec$Builder;->setJSQueueThreadSpec(Lcom/facebook/react/bridge/queue/MessageQueueThreadSpec;)Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec$Builder;

    move-result-object v1

    .line 130
    invoke-virtual {v1, v0}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec$Builder;->setNativeModulesQueueThreadSpec(Lcom/facebook/react/bridge/queue/MessageQueueThreadSpec;)Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec$Builder;

    move-result-object v0

    .line 131
    invoke-virtual {v0}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec$Builder;->build()Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec;

    move-result-object v0

    move-object/from16 v1, p5

    .line 132
    invoke-static {v0, v1}, Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;->create(Lcom/facebook/react/bridge/queue/ReactQueueConfigurationSpec;Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;)Lcom/facebook/react/bridge/queue/ReactQueueConfigurationImpl;

    move-result-object v0

    iput-object v0, v9, Lcom/facebook/react/runtime/ReactInstance;->mQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;

    .line 133
    sget-object v1, Lcom/facebook/react/runtime/ReactInstance;->TAG:Ljava/lang/String;

    const-string v2, "Calling initializeMessageQueueThreads()"

    invoke-static {v1, v2}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    invoke-virtual {p1, v0}, Lcom/facebook/react/runtime/BridgelessReactContext;->initializeMessageQueueThreads(Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;)V

    .line 135
    invoke-interface {v0}, Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;->getJSQueueThread()Lcom/facebook/react/bridge/queue/MessageQueueThread;

    move-result-object v2

    .line 137
    invoke-interface {v0}, Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;->getNativeModulesQueueThread()Lcom/facebook/react/bridge/queue/MessageQueueThread;

    move-result-object v3

    .line 139
    invoke-static {}, Lcom/facebook/react/modules/core/ReactChoreographer;->initialize()V

    if-eqz p7, :cond_0

    .line 141
    invoke-interface/range {p4 .. p4}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->startInspector()V

    .line 143
    :cond_0
    invoke-static {}, Lcom/facebook/react/runtime/ReactInstance;->createJSTimerExecutor()Lcom/facebook/react/runtime/JSTimerExecutor;

    move-result-object v5

    .line 144
    new-instance v4, Lcom/facebook/react/modules/core/JavaTimerManager;

    .line 148
    invoke-static {}, Lcom/facebook/react/modules/core/ReactChoreographer;->getInstance()Lcom/facebook/react/modules/core/ReactChoreographer;

    move-result-object v0

    move-object/from16 v1, p4

    invoke-direct {v4, p1, v5, v0, v1}, Lcom/facebook/react/modules/core/JavaTimerManager;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/modules/core/JavaScriptTimerExecutor;Lcom/facebook/react/modules/core/ReactChoreographer;Lcom/facebook/react/devsupport/interfaces/DevSupportManager;)V

    iput-object v4, v9, Lcom/facebook/react/runtime/ReactInstance;->mJavaTimerManager:Lcom/facebook/react/modules/core/JavaTimerManager;

    .line 151
    new-instance v0, Lcom/facebook/react/runtime/ReactInstance$1;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/ReactInstance$1;-><init>(Lcom/facebook/react/runtime/ReactInstance;)V

    invoke-virtual {p1, v0}, Lcom/facebook/react/runtime/BridgelessReactContext;->addLifecycleEventListener(Lcom/facebook/react/bridge/LifecycleEventListener;)V

    .line 169
    invoke-interface/range {p2 .. p2}, Lcom/facebook/react/runtime/ReactHostDelegate;->getJsEngineInstance()Lcom/facebook/react/runtime/JSEngineInstance;

    move-result-object v1

    .line 170
    invoke-interface/range {p2 .. p2}, Lcom/facebook/react/runtime/ReactHostDelegate;->getBindingsInstaller()Lcom/facebook/react/runtime/BindingsInstaller;

    move-result-object v7

    .line 173
    invoke-static {v12, v13}, Lcom/facebook/systrace/Systrace;->isTracing(J)Z

    move-result v8

    move-object v0, p0

    move-object/from16 v6, p6

    .line 175
    invoke-direct/range {v0 .. v8}, Lcom/facebook/react/runtime/ReactInstance;->initHybrid(Lcom/facebook/react/runtime/JSEngineInstance;Lcom/facebook/react/bridge/queue/MessageQueueThread;Lcom/facebook/react/bridge/queue/MessageQueueThread;Lcom/facebook/react/modules/core/JavaTimerManager;Lcom/facebook/react/runtime/JSTimerExecutor;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Lcom/facebook/react/runtime/BindingsInstaller;Z)Lcom/facebook/jni/HybridData;

    move-result-object v0

    iput-object v0, v9, Lcom/facebook/react/runtime/ReactInstance;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 185
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getUnbufferedRuntimeExecutor()Lcom/facebook/react/bridge/RuntimeExecutor;

    move-result-object v0

    .line 188
    new-instance v1, Lcom/facebook/react/uimanager/ComponentNameResolverManager;

    new-instance v2, Lcom/facebook/react/runtime/ReactInstance$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/facebook/react/runtime/ReactInstance$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/runtime/ReactInstance;)V

    invoke-direct {v1, v0, v2}, Lcom/facebook/react/uimanager/ComponentNameResolverManager;-><init>(Lcom/facebook/react/bridge/RuntimeExecutor;Ljava/lang/Object;)V

    iput-object v1, v9, Lcom/facebook/react/runtime/ReactInstance;->mComponentNameResolverManager:Lcom/facebook/react/uimanager/ComponentNameResolverManager;

    const-string v1, "ReactInstance.initialize#initTurboModules"

    .line 203
    invoke-static {v12, v13, v1}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 206
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface/range {p2 .. p2}, Lcom/facebook/react/runtime/ReactHostDelegate;->getReactPackages()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v9, Lcom/facebook/react/runtime/ReactInstance;->mReactPackages:Ljava/util/List;

    .line 207
    new-instance v2, Lcom/facebook/react/runtime/CoreReactPackage;

    .line 209
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessReactContext;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v3

    .line 210
    invoke-virtual {p1}, Lcom/facebook/react/runtime/BridgelessReactContext;->getDefaultHardwareBackBtnHandler()Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/facebook/react/runtime/CoreReactPackage;-><init>(Lcom/facebook/react/devsupport/interfaces/DevSupportManager;Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;)V

    .line 207
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    invoke-interface/range {p2 .. p2}, Lcom/facebook/react/runtime/ReactHostDelegate;->getTurboModuleManagerDelegateBuilder()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    move-result-object v2

    .line 215
    invoke-virtual {v2, v1}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;->setPackages(Ljava/util/List;)Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    move-result-object v1

    .line 216
    invoke-virtual {v1, p1}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;->setReactApplicationContext(Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    move-result-object v1

    .line 217
    invoke-virtual {v1}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;->build()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;

    move-result-object v1

    .line 219
    new-instance v2, Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    .line 224
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;

    move-result-object v3

    .line 225
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getNativeMethodCallInvokerHolder()Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;

    move-result-object v4

    invoke-direct {v2, v0, v1, v3, v4}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;-><init>(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/turbomodule/core/TurboModuleManagerDelegate;Lcom/facebook/react/turbomodule/core/interfaces/CallInvokerHolder;Lcom/facebook/react/turbomodule/core/interfaces/NativeMethodCallInvokerHolder;)V

    iput-object v2, v9, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    .line 228
    invoke-virtual {v2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getEagerInitModuleNames()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 229
    iget-object v3, v9, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    invoke-virtual {v3, v2}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    goto :goto_0

    .line 232
    :cond_1
    invoke-static {v12, v13}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 238
    sget-boolean v1, Lcom/facebook/react/config/ReactFeatureFlags;->useNativeViewConfigsInBridgelessMode:Z

    if-eqz v1, :cond_2

    .line 239
    new-instance v1, Lcom/facebook/react/uimanager/UIConstantsProviderManager;

    new-instance v2, Lcom/facebook/react/runtime/ReactInstance$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/facebook/react/runtime/ReactInstance$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/runtime/ReactInstance;)V

    invoke-direct {v1, v0, v2}, Lcom/facebook/react/uimanager/UIConstantsProviderManager;-><init>(Lcom/facebook/react/bridge/RuntimeExecutor;Ljava/lang/Object;)V

    iput-object v1, v9, Lcom/facebook/react/runtime/ReactInstance;->mUIConstantsProviderManager:Lcom/facebook/react/uimanager/UIConstantsProviderManager;

    :cond_2
    const-string v0, "ReactInstance.initialize#initFabric"

    .line 256
    invoke-static {v12, v13, v0}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 259
    new-instance v0, Lcom/facebook/react/uimanager/ViewManagerRegistry;

    new-instance v1, Lcom/facebook/react/runtime/ReactInstance$2;

    invoke-direct {v1, p0}, Lcom/facebook/react/runtime/ReactInstance$2;-><init>(Lcom/facebook/react/runtime/ReactInstance;)V

    invoke-direct {v0, v1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;-><init>(Lcom/facebook/react/uimanager/ViewManagerResolver;)V

    .line 273
    new-instance v6, Lcom/facebook/react/fabric/events/EventBeatManager;

    invoke-direct {v6}, Lcom/facebook/react/fabric/events/EventBeatManager;-><init>()V

    .line 274
    new-instance v1, Lcom/facebook/react/fabric/FabricUIManager;

    iget-object v2, v9, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    invoke-direct {v1, v2, v0, v6}, Lcom/facebook/react/fabric/FabricUIManager;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/uimanager/ViewManagerRegistry;Lcom/facebook/react/uimanager/events/BatchEventDispatchedListener;)V

    iput-object v1, v9, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    .line 277
    iget-object v0, v9, Lcom/facebook/react/runtime/ReactInstance;->mDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    iget-object v2, v9, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    invoke-interface {v0, v2}, Lcom/facebook/react/runtime/ReactHostDelegate;->getReactNativeConfig(Lcom/facebook/react/turbomodule/core/TurboModuleManager;)Lcom/facebook/react/fabric/ReactNativeConfig;

    move-result-object v8

    .line 280
    iget-object v0, v9, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    invoke-static {v0}, Lcom/facebook/react/uimanager/DisplayMetricsHolder;->initDisplayMetricsIfNotInitialized(Landroid/content/Context;)V

    .line 282
    new-instance v2, Lcom/facebook/react/fabric/BindingImpl;

    invoke-direct {v2}, Lcom/facebook/react/fabric/BindingImpl;-><init>()V

    .line 284
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getBufferedRuntimeExecutor()Lcom/facebook/react/bridge/RuntimeExecutor;

    move-result-object v3

    .line 285
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getRuntimeScheduler()Lcom/facebook/react/bridge/RuntimeScheduler;

    move-result-object v4

    move-object v5, v1

    move-object/from16 v7, p3

    .line 283
    invoke-interface/range {v2 .. v8}, Lcom/facebook/react/fabric/Binding;->register(Lcom/facebook/react/bridge/RuntimeExecutor;Lcom/facebook/react/bridge/RuntimeScheduler;Lcom/facebook/react/fabric/FabricUIManager;Lcom/facebook/react/fabric/events/EventBeatManager;Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/fabric/ReactNativeConfig;)V

    .line 290
    invoke-static {v12, v13}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 293
    invoke-virtual {v1}, Lcom/facebook/react/fabric/FabricUIManager;->initialize()V

    return-void
.end method

.method private static native createJSTimerExecutor()Lcom/facebook/react/runtime/JSTimerExecutor;
.end method

.method private createViewManager(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 5
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 495
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mViewManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 496
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mViewManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/uimanager/ViewManager;

    return-object p1

    .line 498
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mReactPackages:Ljava/util/List;

    .line 499
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactInstance;->mDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    if-eqz v1, :cond_3

    if-eqz v0, :cond_3

    .line 501
    monitor-enter v0

    .line 502
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/ReactPackage;

    .line 503
    instance-of v3, v2, Lcom/facebook/react/ViewManagerOnDemandReactPackage;

    if-eqz v3, :cond_1

    .line 504
    check-cast v2, Lcom/facebook/react/ViewManagerOnDemandReactPackage;

    iget-object v3, p0, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    .line 506
    invoke-interface {v2, v3, p1}, Lcom/facebook/react/ViewManagerOnDemandReactPackage;->createViewManager(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 508
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactInstance;->mViewManagers:Ljava/util/Map;

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    monitor-exit v0

    return-object v2

    .line 513
    :cond_2
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 519
    :cond_3
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/ReactPackage;

    .line 520
    iget-object v2, p0, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    .line 521
    invoke-interface {v1, v2}, Lcom/facebook/react/ReactPackage;->createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object v1

    .line 522
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/uimanager/ViewManager;

    .line 523
    iget-object v3, p0, Lcom/facebook/react/runtime/ReactInstance;->mViewManagers:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/facebook/react/uimanager/ViewManager;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 527
    :cond_5
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mViewManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/uimanager/ViewManager;

    return-object p1
.end method

.method private native getBufferedRuntimeExecutor()Lcom/facebook/react/bridge/RuntimeExecutor;
.end method

.method private native getJSCallInvokerHolder()Lcom/facebook/react/turbomodule/core/CallInvokerHolderImpl;
.end method

.method private native getNativeMethodCallInvokerHolder()Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;
.end method

.method private native getRuntimeScheduler()Lcom/facebook/react/bridge/RuntimeScheduler;
.end method

.method private getUIManagerConstants()Lcom/facebook/react/bridge/NativeMap;
    .locals 4

    .line 553
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 556
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactInstance;->mReactPackages:Ljava/util/List;

    .line 557
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/ReactPackage;

    .line 558
    instance-of v3, v3, Lcom/facebook/react/ViewManagerOnDemandReactPackage;

    if-nez v3, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    :goto_0
    if-eqz v2, :cond_2

    .line 565
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getViewManagerNames()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 566
    invoke-direct {p0, v2}, Lcom/facebook/react/runtime/ReactInstance;->createViewManager(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 571
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/ReactPackage;

    .line 572
    iget-object v3, p0, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    .line 573
    invoke-interface {v2, v3}, Lcom/facebook/react/ReactPackage;->createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object v2

    .line 574
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 577
    :cond_3
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 578
    invoke-static {v0, v1, v2}, Lcom/facebook/react/uimanager/UIManagerModule;->createConstants(Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 579
    invoke-static {v0}, Lcom/facebook/react/bridge/Arguments;->makeNativeMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableNativeMap;

    move-result-object v0

    return-object v0
.end method

.method private native getUnbufferedRuntimeExecutor()Lcom/facebook/react/bridge/RuntimeExecutor;
.end method

.method private getViewManagerNames()Ljava/util/Collection;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 531
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 532
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactInstance;->mDelegate:Lcom/facebook/react/runtime/ReactHostDelegate;

    if-eqz v1, :cond_2

    .line 533
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactInstance;->mReactPackages:Ljava/util/List;

    if-eqz v1, :cond_2

    .line 535
    monitor-enter v1

    .line 536
    :try_start_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/ReactPackage;

    .line 537
    instance-of v4, v3, Lcom/facebook/react/ViewManagerOnDemandReactPackage;

    if-eqz v4, :cond_0

    .line 538
    check-cast v3, Lcom/facebook/react/ViewManagerOnDemandReactPackage;

    iget-object v4, p0, Lcom/facebook/react/runtime/ReactInstance;->mBridgelessReactContext:Lcom/facebook/react/runtime/BridgelessReactContext;

    .line 540
    invoke-interface {v3, v4}, Lcom/facebook/react/ViewManagerOnDemandReactPackage;->getViewManagerNames(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/Collection;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 542
    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 546
    :cond_1
    monitor-exit v1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :goto_1
    return-object v0
.end method

.method private native handleMemoryPressureJs(I)V
.end method

.method private native initHybrid(Lcom/facebook/react/runtime/JSEngineInstance;Lcom/facebook/react/bridge/queue/MessageQueueThread;Lcom/facebook/react/bridge/queue/MessageQueueThread;Lcom/facebook/react/modules/core/JavaTimerManager;Lcom/facebook/react/runtime/JSTimerExecutor;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Lcom/facebook/react/runtime/BindingsInstaller;Z)Lcom/facebook/jni/HybridData;
    .param p7    # Lcom/facebook/react/runtime/BindingsInstaller;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method private native installGlobals(Z)V
.end method

.method private synthetic lambda$new$0()[Ljava/lang/String;
    .locals 4

    .line 194
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getViewManagerNames()Ljava/util/Collection;

    move-result-object v0

    .line 195
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ge v1, v2, :cond_0

    .line 196
    sget-object v0, Lcom/facebook/react/runtime/ReactInstance;->TAG:Ljava/lang/String;

    const-string v1, "No ViewManager names found"

    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-array v0, v3, [Ljava/lang/String;

    return-object v0

    :cond_0
    new-array v1, v3, [Ljava/lang/String;

    .line 199
    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method private synthetic lambda$new$1()Lcom/facebook/react/bridge/NativeMap;
    .locals 1

    .line 251
    invoke-direct {p0}, Lcom/facebook/react/runtime/ReactInstance;->getUIManagerConstants()Lcom/facebook/react/bridge/NativeMap;

    move-result-object v0

    return-object v0
.end method

.method private native loadJSBundleFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;)V
.end method

.method private native loadJSBundleFromFile(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private static declared-synchronized loadLibraryIfNeeded()V
    .locals 2

    const-class v0, Lcom/facebook/react/runtime/ReactInstance;

    monitor-enter v0

    .line 297
    :try_start_0
    sget-boolean v1, Lcom/facebook/react/runtime/ReactInstance;->sIsLibraryLoaded:Z

    if-nez v1, :cond_0

    const-string v1, "rninstance"

    .line 298
    invoke-static {v1}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    const/4 v1, 0x1

    .line 299
    sput-boolean v1, Lcom/facebook/react/runtime/ReactInstance;->sIsLibraryLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private native registerSegmentNative(ILjava/lang/String;)V
.end method


# virtual methods
.method native callFunctionOnModule(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/NativeArray;)V
.end method

.method destroy()V
    .locals 2

    .line 417
    sget-object v0, Lcom/facebook/react/runtime/ReactInstance;->TAG:Ljava/lang/String;

    const-string v1, "ReactInstance.destroy() is called."

    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;

    invoke-interface {v0}, Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;->destroy()V

    .line 419
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    invoke-virtual {v0}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->onCatalystInstanceDestroy()V

    .line 420
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    invoke-virtual {v0}, Lcom/facebook/react/fabric/FabricUIManager;->onCatalystInstanceDestroy()V

    .line 421
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mHybridData:Lcom/facebook/jni/HybridData;

    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    const/4 v0, 0x0

    .line 422
    iput-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mComponentNameResolverManager:Lcom/facebook/react/uimanager/ComponentNameResolverManager;

    .line 423
    iput-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mUIConstantsProviderManager:Lcom/facebook/react/uimanager/UIConstantsProviderManager;

    return-void
.end method

.method getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;
    .locals 1

    .line 481
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    invoke-virtual {v0}, Lcom/facebook/react/fabric/FabricUIManager;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    return-object v0
.end method

.method public getNativeModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/NativeModule;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 352
    const-class v0, Lcom/facebook/react/module/annotations/ReactModule;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/module/annotations/ReactModule;

    if-eqz p1, :cond_0

    .line 354
    invoke-interface {p1}, Lcom/facebook/react/module/annotations/ReactModule;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/facebook/react/runtime/ReactInstance;->getNativeModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getNativeModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 360
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    monitor-enter v0

    .line 361
    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    invoke-virtual {v1, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    .line 362
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getNativeModules()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;"
        }
    .end annotation

    .line 348
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    invoke-virtual {v1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->getModules()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getReactQueueConfiguration()Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;
    .locals 1

    .line 304
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mQueueConfiguration:Lcom/facebook/react/bridge/queue/ReactQueueConfiguration;

    return-object v0
.end method

.method getUIManager()Lcom/facebook/react/fabric/FabricUIManager;
    .locals 1

    .line 486
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    return-object v0
.end method

.method public handleMemoryPressure(I)V
    .locals 2

    .line 468
    :try_start_0
    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/ReactInstance;->handleMemoryPressureJs(I)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 470
    :catch_0
    sget-object p1, Lcom/facebook/react/runtime/ReactInstance;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    const-string v1, "Native method handleMemoryPressureJs is called earlier than librninstance.so got ready."

    invoke-direct {v0, v1}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public hasNativeModule(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)Z"
        }
    .end annotation

    .line 340
    const-class v0, Lcom/facebook/react/module/annotations/ReactModule;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/module/annotations/ReactModule;

    if-eqz p1, :cond_0

    .line 342
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mTurboModuleManager:Lcom/facebook/react/turbomodule/core/TurboModuleManager;

    invoke-interface {p1}, Lcom/facebook/react/module/annotations/ReactModule;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/react/turbomodule/core/TurboModuleManager;->hasModule(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public loadJSBundle(Lcom/facebook/react/bridge/JSBundleLoader;)V
    .locals 3

    const-string v0, "ReactInstance.loadJSBundle"

    const-wide/16 v1, 0x0

    .line 309
    invoke-static {v1, v2, v0}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 310
    new-instance v0, Lcom/facebook/react/runtime/ReactInstance$3;

    invoke-direct {v0, p0}, Lcom/facebook/react/runtime/ReactInstance$3;-><init>(Lcom/facebook/react/runtime/ReactInstance;)V

    invoke-virtual {p1, v0}, Lcom/facebook/react/bridge/JSBundleLoader;->loadScript(Lcom/facebook/react/bridge/JSBundleLoaderDelegate;)Ljava/lang/String;

    .line 336
    invoke-static {v1, v2}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void
.end method

.method prerenderSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V
    .locals 5

    const-string v0, "ReactInstance.prerenderSurface"

    const-wide/16 v1, 0x0

    .line 366
    invoke-static {v1, v2, v0}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 367
    sget-object v0, Lcom/facebook/react/runtime/ReactInstance;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "call prerenderSurface with surface: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getModuleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceHandler()Lcom/facebook/react/interfaces/fabric/SurfaceHandler;

    move-result-object v3

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v4, 0x0

    invoke-virtual {v0, v3, p1, v4}, Lcom/facebook/react/fabric/FabricUIManager;->startSurface(Lcom/facebook/react/interfaces/fabric/SurfaceHandler;Landroid/content/Context;Landroid/view/View;)V

    .line 369
    invoke-static {v1, v2}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void
.end method

.method public registerSegment(ILjava/lang/String;)V
    .locals 0

    .line 490
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/runtime/ReactInstance;->registerSegmentNative(ILjava/lang/String;)V

    return-void
.end method

.method startSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V
    .locals 7

    .line 379
    sget-object v0, Lcom/facebook/react/runtime/ReactInstance;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "startSurface() is called with surface: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceID()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ReactInstance.startSurface"

    const-wide/16 v2, 0x0

    .line 380
    invoke-static {v2, v3, v1}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 382
    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getView()Landroid/view/ViewGroup;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 392
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 393
    new-instance v4, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    const-string v6, "surfaceView\'s is NOT equal to View.NO_ID before calling startSurface."

    invoke-direct {v4, v6}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v4}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 397
    invoke-virtual {v1, v5}, Landroid/view/View;->setId(I)V

    .line 399
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 401
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceHandler()Lcom/facebook/react/interfaces/fabric/SurfaceHandler;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Lcom/facebook/react/fabric/FabricUIManager;->attachRootView(Lcom/facebook/react/interfaces/fabric/SurfaceHandler;Landroid/view/View;)V

    goto :goto_0

    .line 403
    :cond_1
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceHandler()Lcom/facebook/react/interfaces/fabric/SurfaceHandler;

    move-result-object v4

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, v4, p1, v1}, Lcom/facebook/react/fabric/FabricUIManager;->startSurface(Lcom/facebook/react/interfaces/fabric/SurfaceHandler;Landroid/content/Context;Landroid/view/View;)V

    .line 405
    :goto_0
    invoke-static {v2, v3}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void

    .line 384
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Starting surface without a view is not supported, use prerenderSurface instead."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method stopSurface(Lcom/facebook/react/runtime/ReactSurfaceImpl;)V
    .locals 3

    .line 410
    sget-object v0, Lcom/facebook/react/runtime/ReactInstance;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "stopSurface() is called with surface: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceID()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 411
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance;->mFabricUIManager:Lcom/facebook/react/fabric/FabricUIManager;

    invoke-virtual {p1}, Lcom/facebook/react/runtime/ReactSurfaceImpl;->getSurfaceHandler()Lcom/facebook/react/interfaces/fabric/SurfaceHandler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/facebook/react/fabric/FabricUIManager;->stopSurface(Lcom/facebook/react/interfaces/fabric/SurfaceHandler;)V

    return-void
.end method
