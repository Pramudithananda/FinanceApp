.class public final synthetic Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda18;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/runtime/BridgelessAtomicRef$Provider;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/runtime/ReactHostImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/runtime/ReactHostImpl;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda18;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda18;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    invoke-static {v0}, Lcom/facebook/react/runtime/ReactHostImpl;->$r8$lambda$HRcc6AP_9P-Hai7xoUiHAIIE-TI(Lcom/facebook/react/runtime/ReactHostImpl;)Lcom/facebook/react/runtime/internal/bolts/Task;

    move-result-object v0

    return-object v0
.end method
