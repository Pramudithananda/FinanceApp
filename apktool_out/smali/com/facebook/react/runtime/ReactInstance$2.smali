.class Lcom/facebook/react/runtime/ReactInstance$2;
.super Ljava/lang/Object;
.source "ReactInstance.java"

# interfaces
.implements Lcom/facebook/react/uimanager/ViewManagerResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/runtime/ReactInstance;-><init>(Lcom/facebook/react/runtime/BridgelessReactContext;Lcom/facebook/react/runtime/ReactHostDelegate;Lcom/facebook/react/fabric/ComponentFactory;Lcom/facebook/react/devsupport/interfaces/DevSupportManager;Lcom/facebook/react/bridge/queue/QueueThreadExceptionHandler;Lcom/facebook/react/interfaces/exceptionmanager/ReactJsExceptionHandler;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/runtime/ReactInstance;


# direct methods
.method constructor <init>(Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    .line 261
    iput-object p1, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getViewManager(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 264
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    invoke-static {v0, p1}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$mcreateViewManager(Lcom/facebook/react/runtime/ReactInstance;Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object p1

    return-object p1
.end method

.method public getViewManagerNames()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 269
    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance$2;->this$0:Lcom/facebook/react/runtime/ReactInstance;

    invoke-static {v0}, Lcom/facebook/react/runtime/ReactInstance;->-$$Nest$mgetViewManagerNames(Lcom/facebook/react/runtime/ReactInstance;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
