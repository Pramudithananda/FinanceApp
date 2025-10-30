.class public Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;
.super Ljava/lang/Object;
.source "NativeMethodCallInvokerHolderImpl.java"

# interfaces
.implements Lcom/facebook/react/turbomodule/core/interfaces/NativeMethodCallInvokerHolder;


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 25
    invoke-static {}, Lcom/facebook/react/turbomodule/core/NativeModuleSoLoader;->maybeLoadSoLibrary()V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method
