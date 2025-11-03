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


.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/facebook/react/ReactActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/budgettrackerapp/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const v1, -0x1f0d02

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

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
