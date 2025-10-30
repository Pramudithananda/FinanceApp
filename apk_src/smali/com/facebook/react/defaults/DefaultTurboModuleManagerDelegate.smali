.class public final Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate;
.super Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;
.source "DefaultTurboModuleManagerDelegate.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001:\u0001\nB\u001d\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0002\u0010\u0007J\u000b\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0095 \u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate;",
        "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;",
        "context",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "packages",
        "",
        "Lcom/facebook/react/ReactPackage;",
        "(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V",
        "initHybrid",
        "Lcom/facebook/jni/HybridData;",
        "Builder",
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


# direct methods
.method private constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "+",
            "Lcom/facebook/react/ReactPackage;",
            ">;)V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method protected native initHybrid()Lcom/facebook/jni/HybridData;
.end method
