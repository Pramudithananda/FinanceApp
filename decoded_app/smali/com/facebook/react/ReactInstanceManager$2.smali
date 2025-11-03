.class Lcom/facebook/react/ReactInstanceManager$2;
.super Ljava/lang/Object;
.source "ReactInstanceManager.java"

# interfaces
.implements Lcom/facebook/react/devsupport/interfaces/PackagerStatusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/ReactInstanceManager;->recreateReactContextInBackgroundInner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/ReactInstanceManager;

.field final synthetic val$devSettings:Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;


# direct methods
.method public static synthetic $r8$lambda$Yl5G5_wfh3pbDADAFQC3u5p3uCk(Lcom/facebook/react/ReactInstanceManager$2;ZLcom/facebook/react/modules/debug/interfaces/DeveloperSettings;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/ReactInstanceManager$2;->lambda$onPackagerStatusFetched$0(ZLcom/facebook/react/modules/debug/interfaces/DeveloperSettings;)V

    return-void
.end method

.method constructor <init>(Lcom/facebook/react/ReactInstanceManager;Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 443
    iput-object p1, p0, Lcom/facebook/react/ReactInstanceManager$2;->this$0:Lcom/facebook/react/ReactInstanceManager;

    iput-object p2, p0, Lcom/facebook/react/ReactInstanceManager$2;->val$devSettings:Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onPackagerStatusFetched$0(ZLcom/facebook/react/modules/debug/interfaces/DeveloperSettings;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 449
    iget-object p1, p0, Lcom/facebook/react/ReactInstanceManager$2;->this$0:Lcom/facebook/react/ReactInstanceManager;

    invoke-static {p1}, Lcom/facebook/react/ReactInstanceManager;->-$$Nest$fgetmDevSupportManager(Lcom/facebook/react/ReactInstanceManager;)Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object p1

    invoke-interface {p1}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->handleReloadJS()V

    goto :goto_0

    .line 450
    :cond_0
    iget-object p1, p0, Lcom/facebook/react/ReactInstanceManager$2;->this$0:Lcom/facebook/react/ReactInstanceManager;

    invoke-static {p1}, Lcom/facebook/react/ReactInstanceManager;->-$$Nest$fgetmDevSupportManager(Lcom/facebook/react/ReactInstanceManager;)Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object p1

    invoke-interface {p1}, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;->hasUpToDateJSBundleInCache()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 451
    invoke-interface {p2}, Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;->isRemoteJSDebugEnabled()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/facebook/react/ReactInstanceManager$2;->this$0:Lcom/facebook/react/ReactInstanceManager;

    invoke-static {p1}, Lcom/facebook/react/ReactInstanceManager;->-$$Nest$fgetmUseFallbackBundle(Lcom/facebook/react/ReactInstanceManager;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 455
    iget-object p1, p0, Lcom/facebook/react/ReactInstanceManager$2;->this$0:Lcom/facebook/react/ReactInstanceManager;

    invoke-static {p1}, Lcom/facebook/react/ReactInstanceManager;->-$$Nest$monJSBundleLoadedFromServer(Lcom/facebook/react/ReactInstanceManager;)V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 458
    invoke-interface {p2, p1}, Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;->setRemoteJSDebugEnabled(Z)V

    .line 459
    iget-object p1, p0, Lcom/facebook/react/ReactInstanceManager$2;->this$0:Lcom/facebook/react/ReactInstanceManager;

    invoke-static {p1}, Lcom/facebook/react/ReactInstanceManager;->-$$Nest$mrecreateReactContextInBackgroundFromBundleLoader(Lcom/facebook/react/ReactInstanceManager;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onPackagerStatusFetched(Z)V
    .locals 2

    .line 446
    iget-object v0, p0, Lcom/facebook/react/ReactInstanceManager$2;->val$devSettings:Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;

    new-instance v1, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, v0}, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/ReactInstanceManager$2;ZLcom/facebook/react/modules/debug/interfaces/DeveloperSettings;)V

    invoke-static {v1}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
