.class final Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;
.super Ljava/lang/Object;
.source "DefaultJSIModulePackage.kt"

# interfaces
.implements Lcom/facebook/react/bridge/JSIModuleSpec;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/defaults/DefaultJSIModulePackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "JSIModuleForFabric"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/react/bridge/JSIModuleSpec<",
        "Lcom/facebook/react/bridge/UIManager;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0015\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\u0007J\u000e\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00020\tH\u0016J\u0008\u0010\n\u001a\u00020\u000bH\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;",
        "Lcom/facebook/react/bridge/JSIModuleSpec;",
        "Lcom/facebook/react/bridge/UIManager;",
        "reactApplicationContext",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "reactNativeHost",
        "Lcom/facebook/react/ReactNativeHost;",
        "(Lcom/facebook/react/defaults/DefaultJSIModulePackage;Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/ReactNativeHost;)V",
        "getJSIModuleProvider",
        "Lcom/facebook/react/bridge/JSIModuleProvider;",
        "getJSIModuleType",
        "Lcom/facebook/react/bridge/JSIModuleType;",
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
.field private final reactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

.field private final reactNativeHost:Lcom/facebook/react/ReactNativeHost;

.field final synthetic this$0:Lcom/facebook/react/defaults/DefaultJSIModulePackage;


# direct methods
.method public constructor <init>(Lcom/facebook/react/defaults/DefaultJSIModulePackage;Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/ReactNativeHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Lcom/facebook/react/ReactNativeHost;",
            ")V"
        }
    .end annotation

    const-string v0, "reactApplicationContext"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "reactNativeHost"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    iput-object p1, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;->this$0:Lcom/facebook/react/defaults/DefaultJSIModulePackage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p2, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;->reactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 40
    iput-object p3, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;->reactNativeHost:Lcom/facebook/react/ReactNativeHost;

    return-void
.end method


# virtual methods
.method public getJSIModuleProvider()Lcom/facebook/react/bridge/JSIModuleProvider;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/react/bridge/JSIModuleProvider<",
            "Lcom/facebook/react/bridge/UIManager;",
            ">;"
        }
    .end annotation

    .line 45
    new-instance v0, Lcom/facebook/react/fabric/ComponentFactory;

    invoke-direct {v0}, Lcom/facebook/react/fabric/ComponentFactory;-><init>()V

    .line 47
    sget-object v1, Lcom/facebook/react/defaults/DefaultComponentsRegistry;->Companion:Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;

    invoke-virtual {v1, v0}, Lcom/facebook/react/defaults/DefaultComponentsRegistry$Companion;->register(Lcom/facebook/react/fabric/ComponentFactory;)Lcom/facebook/react/defaults/DefaultComponentsRegistry;

    .line 50
    iget-object v1, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;->reactNativeHost:Lcom/facebook/react/ReactNativeHost;

    invoke-virtual {v1}, Lcom/facebook/react/ReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;->reactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-virtual {v1, v2}, Lcom/facebook/react/ReactInstanceManager;->getOrCreateViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;

    move-result-object v1

    .line 51
    new-instance v2, Lcom/facebook/react/uimanager/ViewManagerRegistry;

    invoke-direct {v2, v1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;-><init>(Ljava/util/List;)V

    .line 52
    new-instance v1, Lcom/facebook/react/fabric/FabricJSIModuleProvider;

    .line 53
    iget-object v3, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;->reactApplicationContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    .line 55
    sget-object v4, Lcom/facebook/react/fabric/ReactNativeConfig;->DEFAULT_CONFIG:Lcom/facebook/react/fabric/ReactNativeConfig;

    .line 52
    invoke-direct {v1, v3, v0, v4, v2}, Lcom/facebook/react/fabric/FabricJSIModuleProvider;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/fabric/ReactNativeConfig;Lcom/facebook/react/uimanager/ViewManagerRegistry;)V

    check-cast v1, Lcom/facebook/react/bridge/JSIModuleProvider;

    return-object v1
.end method

.method public getJSIModuleType()Lcom/facebook/react/bridge/JSIModuleType;
    .locals 1

    .line 42
    sget-object v0, Lcom/facebook/react/bridge/JSIModuleType;->UIManager:Lcom/facebook/react/bridge/JSIModuleType;

    return-object v0
.end method
