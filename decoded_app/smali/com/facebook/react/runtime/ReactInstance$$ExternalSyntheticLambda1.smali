.class public final synthetic Lcom/facebook/react/runtime/ReactInstance$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/uimanager/UIConstantsProvider;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/runtime/ReactInstance;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/runtime/ReactInstance;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactInstance$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/runtime/ReactInstance;

    return-void
.end method


# virtual methods
.method public final getConstants()Lcom/facebook/react/bridge/NativeMap;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactInstance$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/runtime/ReactInstance;

    invoke-static {v0}, Lcom/facebook/react/runtime/ReactInstance;->$r8$lambda$p1qbHeQQ7LB39Lz_tJvunspPJW0(Lcom/facebook/react/runtime/ReactInstance;)Lcom/facebook/react/bridge/NativeMap;

    move-result-object v0

    return-object v0
.end method
