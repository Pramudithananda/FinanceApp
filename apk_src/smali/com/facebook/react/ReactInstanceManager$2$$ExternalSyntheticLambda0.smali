.class public final synthetic Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/ReactInstanceManager$2;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/ReactInstanceManager$2;ZLcom/facebook/react/modules/debug/interfaces/DeveloperSettings;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/ReactInstanceManager$2;

    iput-boolean p2, p0, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;->f$1:Z

    iput-object p3, p0, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;->f$2:Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/ReactInstanceManager$2;

    iget-boolean v1, p0, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;->f$1:Z

    iget-object v2, p0, Lcom/facebook/react/ReactInstanceManager$2$$ExternalSyntheticLambda0;->f$2:Lcom/facebook/react/modules/debug/interfaces/DeveloperSettings;

    invoke-static {v0, v1, v2}, Lcom/facebook/react/ReactInstanceManager$2;->$r8$lambda$Yl5G5_wfh3pbDADAFQC3u5p3uCk(Lcom/facebook/react/ReactInstanceManager$2;ZLcom/facebook/react/modules/debug/interfaces/DeveloperSettings;)V

    return-void
.end method
