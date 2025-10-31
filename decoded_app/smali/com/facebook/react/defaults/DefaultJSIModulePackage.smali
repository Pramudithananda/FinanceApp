.class public final Lcom/facebook/react/defaults/DefaultJSIModulePackage;
.super Ljava/lang/Object;
.source "DefaultJSIModulePackage.kt"

# interfaces
.implements Lcom/facebook/react/bridge/JSIModulePackage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001:\u0001\rB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J$\u0010\u0005\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00070\u00062\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/facebook/react/defaults/DefaultJSIModulePackage;",
        "Lcom/facebook/react/bridge/JSIModulePackage;",
        "reactNativeHost",
        "Lcom/facebook/react/ReactNativeHost;",
        "(Lcom/facebook/react/ReactNativeHost;)V",
        "getJSIModules",
        "",
        "Lcom/facebook/react/bridge/JSIModuleSpec;",
        "Lcom/facebook/react/bridge/UIManager;",
        "reactApplicationContext",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "jsContext",
        "Lcom/facebook/react/bridge/JavaScriptContextHolder;",
        "JSIModuleForFabric",
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
.field private final reactNativeHost:Lcom/facebook/react/ReactNativeHost;


# direct methods
.method public constructor <init>(Lcom/facebook/react/ReactNativeHost;)V
    .locals 1

    const-string v0, "reactNativeHost"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage;->reactNativeHost:Lcom/facebook/react/ReactNativeHost;

    return-void
.end method


# virtual methods
.method public getJSIModules(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/bridge/JavaScriptContextHolder;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Lcom/facebook/react/bridge/JavaScriptContextHolder;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/bridge/JSIModuleSpec<",
            "Lcom/facebook/react/bridge/UIManager;",
            ">;>;"
        }
    .end annotation

    const-string v0, "reactApplicationContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsContext"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    new-instance p2, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;

    iget-object v0, p0, Lcom/facebook/react/defaults/DefaultJSIModulePackage;->reactNativeHost:Lcom/facebook/react/ReactNativeHost;

    invoke-direct {p2, p0, p1, v0}, Lcom/facebook/react/defaults/DefaultJSIModulePackage$JSIModuleForFabric;-><init>(Lcom/facebook/react/defaults/DefaultJSIModulePackage;Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/ReactNativeHost;)V

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
