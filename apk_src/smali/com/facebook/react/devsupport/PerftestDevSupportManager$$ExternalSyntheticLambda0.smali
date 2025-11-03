.class public final synthetic Lcom/facebook/react/devsupport/PerftestDevSupportManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatusProvider;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/devsupport/PerftestDevSupportManager;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/devsupport/PerftestDevSupportManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/devsupport/PerftestDevSupportManager$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/devsupport/PerftestDevSupportManager;

    return-void
.end method


# virtual methods
.method public final getBundleStatus()Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatus;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/devsupport/PerftestDevSupportManager$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/devsupport/PerftestDevSupportManager;

    invoke-static {v0}, Lcom/facebook/react/devsupport/PerftestDevSupportManager;->$r8$lambda$62whTEKn7lPMwpWvzpvY3Nkv0N0(Lcom/facebook/react/devsupport/PerftestDevSupportManager;)Lcom/facebook/react/devsupport/InspectorPackagerConnection$BundleStatus;

    move-result-object v0

    return-object v0
.end method
