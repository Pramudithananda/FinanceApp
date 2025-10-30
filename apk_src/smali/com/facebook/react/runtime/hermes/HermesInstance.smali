.class public final Lcom/facebook/react/runtime/hermes/HermesInstance;
.super Lcom/facebook/react/runtime/JSEngineInstance;
.source "HermesInstance.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/facebook/react/runtime/hermes/HermesInstance;",
        "Lcom/facebook/react/runtime/JSEngineInstance;",
        "()V",
        "Companion",
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
.field public static final Companion:Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/react/runtime/hermes/HermesInstance;->Companion:Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;

    const-string v0, "hermesinstancejni"

    .line 21
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-static {}, Lcom/facebook/react/runtime/hermes/HermesInstance;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/JSEngineInstance;-><init>(Lcom/facebook/jni/HybridData;)V

    return-void
.end method

.method protected static final native initHybrid()Lcom/facebook/jni/HybridData;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method
