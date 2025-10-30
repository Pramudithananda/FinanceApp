.class public Lcom/budgettrackerapp/MainActivity;
.super Lcom/facebook/react/ReactActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/facebook/react/ReactActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected createReactActivityDelegate()Lcom/facebook/react/ReactActivityDelegate;
    .locals 3

    .line 26
    new-instance v0, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;

    .line 28
    invoke-virtual {p0}, Lcom/budgettrackerapp/MainActivity;->getMainComponentName()Ljava/lang/String;

    move-result-object v1

    .line 30
    invoke-static {}, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->getFabricEnabled()Z

    move-result v2

    invoke-direct {v0, p0, v1, v2}, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;-><init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;Z)V

    return-object v0
.end method

.method protected getMainComponentName()Ljava/lang/String;
    .locals 1

    const-string v0, "BudgetTrackerApp"

    return-object v0
.end method
