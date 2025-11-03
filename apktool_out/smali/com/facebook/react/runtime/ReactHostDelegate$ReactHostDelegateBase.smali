.class public final Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;
.super Ljava/lang/Object;
.source "ReactHostDelegate.kt"

# interfaces
.implements Lcom/facebook/react/runtime/ReactHostDelegate;


# annotations
.annotation runtime Lcom/facebook/react/common/annotations/UnstableReactNativeAPI;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/runtime/ReactHostDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReactHostDelegateBase"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001Bt\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u000e\u0008\u0002\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b\u0012\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000e\u0012\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u0010\u0012\'\u0008\u0002\u0010\u0011\u001a!\u0012\u0017\u0012\u00150\u0013j\u0002`\u0014\u00a2\u0006\u000c\u0008\u0015\u0012\u0008\u0008\u0016\u0012\u0004\u0008\u0008(\u0017\u0012\u0004\u0012\u00020\u00180\u0012\u00a2\u0006\u0002\u0010\u0019J\u0010\u0010&\u001a\u00020\u00102\u0006\u0010\'\u001a\u00020(H\u0016J\u0014\u0010)\u001a\u00020\u00182\n\u0010\u0017\u001a\u00060\u0013j\u0002`\u0014H\u0016R\u0016\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u001bR-\u0010\u0011\u001a!\u0012\u0017\u0012\u00150\u0013j\u0002`\u0014\u00a2\u0006\u000c\u0008\u0015\u0012\u0008\u0008\u0016\u0012\u0004\u0008\u0008(\u0017\u0012\u0004\u0012\u00020\u00180\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001dR\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\u001fR\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010!R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000bX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010#R\u0014\u0010\u0008\u001a\u00020\tX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008$\u0010%\u00a8\u0006*"
    }
    d2 = {
        "Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;",
        "Lcom/facebook/react/runtime/ReactHostDelegate;",
        "jsMainModulePath",
        "",
        "jsBundleLoader",
        "Lcom/facebook/react/bridge/JSBundleLoader;",
        "jsEngineInstance",
        "Lcom/facebook/react/runtime/JSEngineInstance;",
        "turboModuleManagerDelegateBuilder",
        "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
        "reactPackages",
        "",
        "Lcom/facebook/react/ReactPackage;",
        "bindingsInstaller",
        "Lcom/facebook/react/runtime/BindingsInstaller;",
        "reactNativeConfig",
        "Lcom/facebook/react/fabric/ReactNativeConfig;",
        "exceptionHandler",
        "Lkotlin/Function1;",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "Lkotlin/ParameterName;",
        "name",
        "error",
        "",
        "(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/runtime/JSEngineInstance;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;Ljava/util/List;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;)V",
        "getBindingsInstaller",
        "()Lcom/facebook/react/runtime/BindingsInstaller;",
        "getJsBundleLoader",
        "()Lcom/facebook/react/bridge/JSBundleLoader;",
        "getJsEngineInstance",
        "()Lcom/facebook/react/runtime/JSEngineInstance;",
        "getJsMainModulePath",
        "()Ljava/lang/String;",
        "getReactPackages",
        "()Ljava/util/List;",
        "getTurboModuleManagerDelegateBuilder",
        "()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
        "getReactNativeConfig",
        "turboModuleManager",
        "Lcom/facebook/react/turbomodule/core/TurboModuleManager;",
        "handleInstanceException",
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


# instance fields
.field private final bindingsInstaller:Lcom/facebook/react/runtime/BindingsInstaller;

.field private final exceptionHandler:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Exception;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private final jsBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

.field private final jsEngineInstance:Lcom/facebook/react/runtime/JSEngineInstance;

.field private final jsMainModulePath:Ljava/lang/String;

.field private final reactNativeConfig:Lcom/facebook/react/fabric/ReactNativeConfig;

.field private final reactPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation
.end field

.field private final turboModuleManagerDelegateBuilder:Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/runtime/JSEngineInstance;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;Ljava/util/List;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/JSBundleLoader;",
            "Lcom/facebook/react/runtime/JSEngineInstance;",
            "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
            "Ljava/util/List<",
            "+",
            "Lcom/facebook/react/ReactPackage;",
            ">;",
            "Lcom/facebook/react/runtime/BindingsInstaller;",
            "Lcom/facebook/react/fabric/ReactNativeConfig;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Exception;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "jsMainModulePath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsBundleLoader"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsEngineInstance"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "turboModuleManagerDelegateBuilder"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactPackages"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactNativeConfig"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "exceptionHandler"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->jsMainModulePath:Ljava/lang/String;

    .line 68
    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->jsBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

    .line 69
    iput-object p3, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->jsEngineInstance:Lcom/facebook/react/runtime/JSEngineInstance;

    .line 70
    iput-object p4, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->turboModuleManagerDelegateBuilder:Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    .line 72
    iput-object p5, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->reactPackages:Ljava/util/List;

    .line 73
    iput-object p6, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->bindingsInstaller:Lcom/facebook/react/runtime/BindingsInstaller;

    .line 74
    iput-object p7, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->reactNativeConfig:Lcom/facebook/react/fabric/ReactNativeConfig;

    .line 75
    iput-object p8, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->exceptionHandler:Lkotlin/jvm/functions/Function1;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/runtime/JSEngineInstance;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;Ljava/util/List;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 11

    move/from16 v0, p9

    and-int/lit8 v1, v0, 0x10

    if-eqz v1, :cond_0

    .line 72
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    move-object v7, v1

    goto :goto_0

    :cond_0
    move-object/from16 v7, p5

    :goto_0
    and-int/lit8 v1, v0, 0x20

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    move-object v8, v1

    goto :goto_1

    :cond_1
    move-object/from16 v8, p6

    :goto_1
    and-int/lit8 v1, v0, 0x40

    if-eqz v1, :cond_2

    .line 74
    sget-object v1, Lcom/facebook/react/fabric/ReactNativeConfig;->DEFAULT_CONFIG:Lcom/facebook/react/fabric/ReactNativeConfig;

    move-object v9, v1

    goto :goto_2

    :cond_2
    move-object/from16 v9, p7

    :goto_2
    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_3

    .line 75
    sget-object v0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase$1;->INSTANCE:Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase$1;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    move-object v10, v0

    goto :goto_3

    :cond_3
    move-object/from16 v10, p8

    :goto_3
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    .line 66
    invoke-direct/range {v2 .. v10}, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/JSBundleLoader;Lcom/facebook/react/runtime/JSEngineInstance;Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;Ljava/util/List;Lcom/facebook/react/runtime/BindingsInstaller;Lcom/facebook/react/fabric/ReactNativeConfig;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method


# virtual methods
.method public getBindingsInstaller()Lcom/facebook/react/runtime/BindingsInstaller;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->bindingsInstaller:Lcom/facebook/react/runtime/BindingsInstaller;

    return-object v0
.end method

.method public getJsBundleLoader()Lcom/facebook/react/bridge/JSBundleLoader;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->jsBundleLoader:Lcom/facebook/react/bridge/JSBundleLoader;

    return-object v0
.end method

.method public getJsEngineInstance()Lcom/facebook/react/runtime/JSEngineInstance;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->jsEngineInstance:Lcom/facebook/react/runtime/JSEngineInstance;

    return-object v0
.end method

.method public getJsMainModulePath()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->jsMainModulePath:Ljava/lang/String;

    return-object v0
.end method

.method public getReactNativeConfig(Lcom/facebook/react/turbomodule/core/TurboModuleManager;)Lcom/facebook/react/fabric/ReactNativeConfig;
    .locals 1

    const-string v0, "turboModuleManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    iget-object p1, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->reactNativeConfig:Lcom/facebook/react/fabric/ReactNativeConfig;

    return-object p1
.end method

.method public getReactPackages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->reactPackages:Ljava/util/List;

    return-object v0
.end method

.method public getTurboModuleManagerDelegateBuilder()Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->turboModuleManagerDelegateBuilder:Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    return-object v0
.end method

.method public handleInstanceException(Ljava/lang/Exception;)V
    .locals 1

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostDelegate$ReactHostDelegateBase;->exceptionHandler:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
