.class public Lcom/facebook/react/fabric/SurfaceHandlerBinding;
.super Ljava/lang/Object;
.source "SurfaceHandlerBinding.java"

# interfaces
.implements Lcom/facebook/react/interfaces/fabric/SurfaceHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/fabric/SurfaceHandlerBinding$DisplayModeTypeDef;
    }
.end annotation


# static fields
.field public static final DISPLAY_MODE_HIDDEN:I = 0x2

.field public static final DISPLAY_MODE_SUSPENDED:I = 0x1

.field public static final DISPLAY_MODE_VISIBLE:I

.field private static final NO_SURFACE_ID:I


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 23
    invoke-static {}, Lcom/facebook/react/fabric/FabricSoLoader;->staticInit()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 42
    invoke-static {v0, p1}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->initHybrid(ILjava/lang/String;)Lcom/facebook/jni/HybridData;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private native getModuleNameNative()Ljava/lang/String;
.end method

.method private native getSurfaceIdNative()I
.end method

.method private static native initHybrid(ILjava/lang/String;)Lcom/facebook/jni/HybridData;
.end method

.method private native isRunningNative()Z
.end method

.method private native setDisplayModeNative(I)V
.end method

.method private native setLayoutConstraintsNative(FFFFFFZZF)V
.end method

.method private native setPropsNative(Lcom/facebook/react/bridge/NativeMap;)V
.end method

.method private native setSurfaceIdNative(I)V
.end method

.method private native startNative()V
.end method

.method private native stopNative()V
.end method


# virtual methods
.method public getModuleName()Ljava/lang/String;
    .locals 1

    .line 61
    invoke-direct {p0}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->getModuleNameNative()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSurfaceId()I
    .locals 1

    .line 47
    invoke-direct {p0}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->getSurfaceIdNative()I

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 82
    invoke-direct {p0}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->isRunningNative()Z

    move-result v0

    return v0
.end method

.method public setLayoutConstraints(IIIIZZF)V
    .locals 10

    .line 97
    invoke-static {p1}, Lcom/facebook/react/fabric/mounting/LayoutMetricsConversions$-CC;->getMinSize(I)F

    move-result v0

    div-float v1, v0, p7

    .line 98
    invoke-static {p1}, Lcom/facebook/react/fabric/mounting/LayoutMetricsConversions$-CC;->getMaxSize(I)F

    move-result v0

    div-float v2, v0, p7

    .line 99
    invoke-static {p2}, Lcom/facebook/react/fabric/mounting/LayoutMetricsConversions$-CC;->getMinSize(I)F

    move-result v0

    div-float v3, v0, p7

    .line 100
    invoke-static {p2}, Lcom/facebook/react/fabric/mounting/LayoutMetricsConversions$-CC;->getMaxSize(I)F

    move-result v0

    div-float v4, v0, p7

    move v0, p3

    int-to-float v0, v0

    div-float v5, v0, p7

    move v0, p4

    int-to-float v0, v0

    div-float v6, v0, p7

    move-object v0, p0

    move v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    .line 96
    invoke-direct/range {v0 .. v9}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->setLayoutConstraintsNative(FFFFFFZZF)V

    return-void
.end method

.method public setMountable(Z)V
    .locals 0

    xor-int/lit8 p1, p1, 0x1

    .line 128
    invoke-direct {p0, p1}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->setDisplayModeNative(I)V

    return-void
.end method

.method public setProps(Lcom/facebook/react/bridge/NativeMap;)V
    .locals 0

    .line 121
    invoke-direct {p0, p1}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->setPropsNative(Lcom/facebook/react/bridge/NativeMap;)V

    return-void
.end method

.method public setSurfaceId(I)V
    .locals 0

    .line 54
    invoke-direct {p0, p1}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->setSurfaceIdNative(I)V

    return-void
.end method

.method public start()V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->startNative()V

    return-void
.end method

.method public stop()V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/facebook/react/fabric/SurfaceHandlerBinding;->stopNative()V

    return-void
.end method
