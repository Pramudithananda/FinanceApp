.class public final synthetic Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$ModuleProvider;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/TurboReactPackage;

.field public final synthetic f$1:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/TurboReactPackage;Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/TurboReactPackage;

    iput-object p2, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda0;->f$1:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method


# virtual methods
.method public final getModule(Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/TurboReactPackage;

    iget-object v1, p0, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$$ExternalSyntheticLambda0;->f$1:Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-static {v0, v1, p1}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;->lambda$new$0(Lcom/facebook/react/TurboReactPackage;Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    return-object p1
.end method
