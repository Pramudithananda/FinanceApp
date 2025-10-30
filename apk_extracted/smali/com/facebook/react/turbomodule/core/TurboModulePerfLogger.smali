.class Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;
.super Ljava/lang/Object;
.source "TurboModulePerfLogger.java"


# static fields
.field private static sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 20
    invoke-static {}, Lcom/facebook/react/turbomodule/core/NativeModuleSoLoader;->maybeLoadSoLibrary()V

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static enableLogging(Lcom/facebook/react/perflogger/NativeModulePerfLogger;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 87
    sput-object p0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    .line 88
    invoke-static {p0}, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->jniEnableCppLogging(Lcom/facebook/react/perflogger/NativeModulePerfLogger;)V

    :cond_0
    return-void
.end method

.method private static native jniEnableCppLogging(Lcom/facebook/react/perflogger/NativeModulePerfLogger;)V
.end method

.method public static moduleCreateCacheHit(Ljava/lang/String;I)V
    .locals 1

    .line 42
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateCacheHit(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleCreateConstructEnd(Ljava/lang/String;I)V
    .locals 1

    .line 54
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateConstructEnd(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleCreateConstructStart(Ljava/lang/String;I)V
    .locals 1

    .line 48
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 49
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateConstructStart(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleCreateEnd(Ljava/lang/String;I)V
    .locals 1

    .line 72
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateEnd(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleCreateFail(Ljava/lang/String;I)V
    .locals 1

    .line 78
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateFail(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleCreateSetUpEnd(Ljava/lang/String;I)V
    .locals 1

    .line 66
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateSetUpEnd(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleCreateSetUpStart(Ljava/lang/String;I)V
    .locals 1

    .line 60
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 61
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateSetUpStart(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleCreateStart(Ljava/lang/String;I)V
    .locals 1

    .line 36
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 37
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleCreateStart(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleDataCreateEnd(Ljava/lang/String;I)V
    .locals 1

    .line 30
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 31
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleDataCreateEnd(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public static moduleDataCreateStart(Ljava/lang/String;I)V
    .locals 1

    .line 24
    sget-object v0, Lcom/facebook/react/turbomodule/core/TurboModulePerfLogger;->sNativeModulePerfLogger:Lcom/facebook/react/perflogger/NativeModulePerfLogger;

    if-eqz v0, :cond_0

    .line 25
    invoke-virtual {v0, p0, p1}, Lcom/facebook/react/perflogger/NativeModulePerfLogger;->moduleDataCreateStart(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method
