.class public final Lcom/facebook/react/uimanager/ViewManagerRegistry;
.super Ljava/lang/Object;
.source "ViewManagerRegistry.java"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# instance fields
.field private final mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

.field private final mViewManagers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/react/uimanager/ViewManagerResolver;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Lcom/facebook/react/common/MapBuilder;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    .line 30
    iput-object p1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-static {}, Lcom/facebook/react/common/MapBuilder;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    .line 35
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/uimanager/ViewManager;

    .line 36
    invoke-virtual {v1}, Lcom/facebook/react/uimanager/ViewManager;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 39
    :cond_0
    iput-object v0, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 45
    :cond_0
    invoke-static {}, Lcom/facebook/react/common/MapBuilder;->newHashMap()Ljava/util/HashMap;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    const/4 p1, 0x0

    .line 46
    iput-object p1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

    return-void
.end method

.method private getViewManagerFromResolver(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 2

    .line 74
    iget-object v0, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

    invoke-interface {v0, p1}, Lcom/facebook/react/uimanager/ViewManagerResolver;->getViewManager(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method static synthetic lambda$invalidate$1(Ljava/util/List;)V
    .locals 1

    .line 126
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/ViewManager;

    .line 127
    invoke-virtual {v0}, Lcom/facebook/react/uimanager/ViewManager;->invalidate()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic lambda$onSurfaceStopped$0(Ljava/util/List;I)V
    .locals 1

    .line 107
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/ViewManager;

    .line 108
    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/ViewManager;->onSurfaceStopped(I)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized get(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 3

    const-string v0, "ViewManagerResolver returned null for "

    const-string v1, "No ViewManager found for class "

    monitor-enter p0

    .line 56
    :try_start_0
    iget-object v2, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/uimanager/ViewManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 58
    monitor-exit p0

    return-object v2

    .line 60
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

    if-eqz v2, :cond_2

    .line 61
    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->getViewManagerFromResolver(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    .line 62
    monitor-exit p0

    return-object v1

    .line 63
    :cond_1
    :try_start_2
    new-instance v1, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", existing names are: "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

    .line 67
    invoke-interface {p1}, Lcom/facebook/react/uimanager/ViewManagerResolver;->getViewManagerNames()Ljava/util/Collection;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 69
    :cond_2
    new-instance v0, Lcom/facebook/react/uimanager/IllegalViewOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/facebook/react/uimanager/IllegalViewOperationException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized getViewManagerIfExists(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 1

    monitor-enter p0

    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/ViewManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 91
    monitor-exit p0

    return-object v0

    .line 93
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagerResolver:Lcom/facebook/react/uimanager/ViewManagerResolver;

    if-eqz v0, :cond_1

    .line 94
    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->getViewManagerFromResolver(Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    .line 96
    :cond_1
    monitor-exit p0

    const/4 p1, 0x0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public invalidate()V
    .locals 2

    .line 121
    monitor-enter p0

    .line 122
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 123
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    new-instance v1, Lcom/facebook/react/uimanager/ViewManagerRegistry$$ExternalSyntheticLambda1;

    invoke-direct {v1, v0}, Lcom/facebook/react/uimanager/ViewManagerRegistry$$ExternalSyntheticLambda1;-><init>(Ljava/util/List;)V

    .line 130
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->isOnUiThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 133
    :cond_0
    invoke-static {v1}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    .line 123
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    return-void
.end method

.method public onLowMemory()V
    .locals 1

    const/4 v0, 0x0

    .line 167
    invoke-virtual {p0, v0}, Lcom/facebook/react/uimanager/ViewManagerRegistry;->onTrimMemory(I)V

    return-void
.end method

.method public onSurfaceStopped(I)V
    .locals 2

    .line 102
    monitor-enter p0

    .line 103
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 104
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    new-instance v1, Lcom/facebook/react/uimanager/ViewManagerRegistry$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0, p1}, Lcom/facebook/react/uimanager/ViewManagerRegistry$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;I)V

    .line 111
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->isOnUiThread()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 112
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 114
    :cond_0
    invoke-static {v1}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    .line 104
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 141
    monitor-enter p0

    .line 142
    :try_start_0
    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/facebook/react/uimanager/ViewManagerRegistry;->mViewManagers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 143
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    new-instance v0, Lcom/facebook/react/uimanager/ViewManagerRegistry$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/react/uimanager/ViewManagerRegistry$1;-><init>(Lcom/facebook/react/uimanager/ViewManagerRegistry;Ljava/util/List;)V

    .line 153
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->isOnUiThread()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 154
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 156
    :cond_0
    invoke-static {v0}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    .line 143
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
