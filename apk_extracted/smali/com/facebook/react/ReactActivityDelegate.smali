.class public Lcom/facebook/react/ReactActivityDelegate;
.super Ljava/lang/Object;
.source "ReactActivityDelegate.java"


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field private final mMainComponentName:Ljava/lang/String;

.field private mPermissionListener:Lcom/facebook/react/modules/core/PermissionListener;

.field private mPermissionsCallback:Lcom/facebook/react/bridge/Callback;

.field private mReactDelegate:Lcom/facebook/react/ReactDelegate;


# direct methods
.method static bridge synthetic -$$Nest$fgetmPermissionListener(Lcom/facebook/react/ReactActivityDelegate;)Lcom/facebook/react/modules/core/PermissionListener;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/ReactActivityDelegate;->mPermissionListener:Lcom/facebook/react/modules/core/PermissionListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmPermissionListener(Lcom/facebook/react/ReactActivityDelegate;Lcom/facebook/react/modules/core/PermissionListener;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/ReactActivityDelegate;->mPermissionListener:Lcom/facebook/react/modules/core/PermissionListener;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/facebook/react/ReactActivityDelegate;->mActivity:Landroid/app/Activity;

    .line 41
    iput-object p2, p0, Lcom/facebook/react/ReactActivityDelegate;->mMainComponentName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/facebook/react/ReactActivityDelegate;->mActivity:Landroid/app/Activity;

    .line 46
    iput-object p2, p0, Lcom/facebook/react/ReactActivityDelegate;->mMainComponentName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected composeLaunchOptions()Landroid/os/Bundle;
    .locals 3

    .line 60
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getLaunchOptions()Landroid/os/Bundle;

    move-result-object v0

    .line 61
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->isFabricEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_0

    .line 63
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    :cond_0
    const-string v1, "concurrentRoot"

    const/4 v2, 0x1

    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_1
    return-object v0
.end method

.method protected createRootView()Lcom/facebook/react/ReactRootView;
    .locals 2

    .line 71
    new-instance v0, Lcom/facebook/react/ReactRootView;

    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/ReactRootView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected createRootView(Landroid/os/Bundle;)Lcom/facebook/react/ReactRootView;
    .locals 1

    .line 75
    new-instance p1, Lcom/facebook/react/ReactRootView;

    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/facebook/react/ReactRootView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method protected getContext()Landroid/content/Context;
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method

.method protected getLaunchOptions()Landroid/os/Bundle;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMainComponentName()Ljava/lang/String;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mMainComponentName:Ljava/lang/String;

    return-object v0
.end method

.method protected getPlainActivity()Landroid/app/Activity;
    .locals 1

    .line 233
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method

.method public getReactHost()Lcom/facebook/react/ReactHost;
    .locals 1

    .line 90
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getPlainActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/ReactApplication;

    invoke-interface {v0}, Lcom/facebook/react/ReactApplication;->getReactHost()Lcom/facebook/react/ReactHost;

    move-result-object v0

    return-object v0
.end method

.method public getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0}, Lcom/facebook/react/ReactDelegate;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v0

    return-object v0
.end method

.method protected getReactNativeHost()Lcom/facebook/react/ReactNativeHost;
    .locals 1

    .line 86
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getPlainActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/ReactApplication;

    invoke-interface {v0}, Lcom/facebook/react/ReactApplication;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    return-object v0
.end method

.method protected isFabricEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected loadApp(Ljava/lang/String;)V
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactDelegate;->loadApp(Ljava/lang/String;)V

    .line 124
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getPlainActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0}, Lcom/facebook/react/ReactDelegate;->getReactRootView()Lcom/facebook/react/ReactRootView;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/facebook/react/ReactDelegate;->onActivityResult(IILandroid/content/Intent;Z)V

    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0}, Lcom/facebook/react/ReactDelegate;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 199
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-nez v0, :cond_0

    .line 200
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->hasInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/facebook/react/ReactInstanceManager;->onConfigurationChanged(Landroid/content/Context;Landroid/content/res/Configuration;)V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 102
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getMainComponentName()Ljava/lang/String;

    move-result-object p1

    .line 103
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->composeLaunchOptions()Landroid/os/Bundle;

    move-result-object v6

    .line 104
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-eqz v0, :cond_0

    .line 105
    new-instance v0, Lcom/facebook/react/ReactDelegate;

    .line 106
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getPlainActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactHost()Lcom/facebook/react/ReactHost;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1, v6}, Lcom/facebook/react/ReactDelegate;-><init>(Landroid/app/Activity;Lcom/facebook/react/ReactHost;Ljava/lang/String;Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    goto :goto_0

    .line 108
    :cond_0
    new-instance v7, Lcom/facebook/react/ReactActivityDelegate$1;

    .line 110
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getPlainActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v3

    move-object v0, v7

    move-object v1, p0

    move-object v4, p1

    move-object v5, v6

    invoke-direct/range {v0 .. v6}, Lcom/facebook/react/ReactActivityDelegate$1;-><init>(Lcom/facebook/react/ReactActivityDelegate;Landroid/app/Activity;Lcom/facebook/react/ReactNativeHost;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V

    iput-object v7, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    :goto_0
    if-eqz p1, :cond_1

    .line 118
    invoke-virtual {p0, p1}, Lcom/facebook/react/ReactActivityDelegate;->loadApp(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0}, Lcom/facebook/react/ReactDelegate;->onHostDestroy()V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 149
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-nez v0, :cond_0

    .line 150
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->hasInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->getUseDeveloperSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x5a

    if-ne p1, v0, :cond_0

    .line 153
    invoke-virtual {p2}, Landroid/view/KeyEvent;->startTracking()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 165
    sget-boolean p2, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-nez p2, :cond_0

    .line 166
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object p2

    invoke-virtual {p2}, Lcom/facebook/react/ReactNativeHost;->hasInstance()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 167
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object p2

    invoke-virtual {p2}, Lcom/facebook/react/ReactNativeHost;->getUseDeveloperSupport()Z

    move-result p2

    if-eqz p2, :cond_0

    const/16 p2, 0x5a

    if-ne p1, p2, :cond_0

    .line 169
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/react/ReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/react/ReactInstanceManager;->showDevOptionsDialog()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/ReactDelegate;->shouldShowDevMenuOrReload(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onNewIntent(Landroid/content/Intent;)Z
    .locals 1

    .line 181
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-nez v0, :cond_0

    .line 182
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->hasInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactInstanceManager;->onNewIntent(Landroid/content/Intent;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected onPause()V
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0}, Lcom/facebook/react/ReactDelegate;->onHostPause()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 215
    new-instance v0, Lcom/facebook/react/ReactActivityDelegate$2;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/facebook/react/ReactActivityDelegate$2;-><init>(Lcom/facebook/react/ReactActivityDelegate;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mPermissionsCallback:Lcom/facebook/react/bridge/Callback;

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mReactDelegate:Lcom/facebook/react/ReactDelegate;

    invoke-virtual {v0}, Lcom/facebook/react/ReactDelegate;->onHostResume()V

    .line 134
    iget-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mPermissionsCallback:Lcom/facebook/react/bridge/Callback;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    .line 135
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 136
    iput-object v0, p0, Lcom/facebook/react/ReactActivityDelegate;->mPermissionsCallback:Lcom/facebook/react/bridge/Callback;

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .line 191
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-nez v0, :cond_0

    .line 192
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->hasInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactInstanceManager;->onWindowFocusChange(Z)V

    :cond_0
    return-void
.end method

.method public requestPermissions([Ljava/lang/String;ILcom/facebook/react/modules/core/PermissionListener;)V
    .locals 0

    .line 209
    iput-object p3, p0, Lcom/facebook/react/ReactActivityDelegate;->mPermissionListener:Lcom/facebook/react/modules/core/PermissionListener;

    .line 210
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivityDelegate;->getPlainActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-static {p3, p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void
.end method
