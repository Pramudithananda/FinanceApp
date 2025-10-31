.class public Lcom/facebook/react/views/modal/ReactModalHostView;
.super Landroid/view/ViewGroup;
.source "ReactModalHostView.java"

# interfaces
.implements Lcom/facebook/react/bridge/LifecycleEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;,
        Lcom/facebook/react/views/modal/ReactModalHostView$OnRequestCloseListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ReactModalHost"


# instance fields
.field private mAnimationType:Ljava/lang/String;

.field private mDialog:Landroid/app/Dialog;

.field private mHardwareAccelerated:Z

.field private mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

.field private mOnRequestCloseListener:Lcom/facebook/react/views/modal/ReactModalHostView$OnRequestCloseListener;

.field private mOnShowListener:Landroid/content/DialogInterface$OnShowListener;

.field private mPropertyRequiresNewDialog:Z

.field private mStatusBarTranslucent:Z

.field private mTransparent:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetmOnRequestCloseListener(Lcom/facebook/react/views/modal/ReactModalHostView;)Lcom/facebook/react/views/modal/ReactModalHostView$OnRequestCloseListener;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mOnRequestCloseListener:Lcom/facebook/react/views/modal/ReactModalHostView$OnRequestCloseListener;

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/uimanager/ThemedReactContext;)V
    .locals 1

    .line 91
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 92
    invoke-virtual {p1, p0}, Lcom/facebook/react/uimanager/ThemedReactContext;->addLifecycleEventListener(Lcom/facebook/react/bridge/LifecycleEventListener;)V

    .line 94
    new-instance v0, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-direct {v0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    return-void
.end method

.method private dismiss()V
    .locals 2

    .line 167
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 169
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    .line 170
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 171
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    .line 172
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/facebook/react/views/common/ContextUtils;->findContextOfType(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 173
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_1
    const/4 v0, 0x0

    .line 177
    iput-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    .line 181
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    .line 182
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    :cond_2
    return-void
.end method

.method private getContentView()Landroid/view/View;
    .locals 2

    .line 355
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 356
    iget-object v1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 357
    iget-boolean v1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mStatusBarTranslucent:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x400

    .line 358
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setSystemUiVisibility(I)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 360
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setFitsSystemWindows(Z)V

    :goto_0
    return-object v0
.end method

.method private getCurrentActivity()Landroid/app/Activity;
    .locals 1

    .line 240
    invoke-virtual {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/ThemedReactContext;

    invoke-virtual {v0}, Lcom/facebook/react/uimanager/ThemedReactContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method private updateProperties()V
    .locals 3

    .line 371
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    const-string v1, "mDialog must exist when we call updateProperties"

    invoke-static {v0, v1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 373
    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 375
    iget-object v1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v0, :cond_3

    .line 376
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v1}, Landroid/view/Window;->isActive()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 381
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/16 v2, 0x400

    and-int/2addr v0, v2

    if-eqz v0, :cond_1

    .line 383
    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    .line 385
    :cond_1
    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 388
    :goto_0
    iget-boolean v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mTransparent:Z

    const/4 v2, 0x2

    if-eqz v0, :cond_2

    .line 389
    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_1

    :cond_2
    const/high16 v0, 0x3f000000    # 0.5f

    .line 391
    invoke-virtual {v1, v0}, Landroid/view/Window;->setDimAmount(F)V

    .line 392
    invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setFlags(II)V

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public addChildrenForAccessibility(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .locals 1

    .line 116
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 118
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public dispatchProvideStructure(Landroid/view/ViewStructure;)V
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->dispatchProvideStructure(Landroid/view/ViewStructure;)V

    return-void
.end method

.method public getChildAt(I)Landroid/view/View;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getChildCount()I
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->getChildCount()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getDialog()Landroid/app/Dialog;
    .locals 1
    .annotation runtime Lcom/facebook/react/common/annotations/VisibleForTesting;
    .end annotation

    .line 236
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method public getStateWrapper()Lcom/facebook/react/uimanager/StateWrapper;
    .locals 1

    .line 399
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->getStateWrapper()Lcom/facebook/react/uimanager/StateWrapper;

    move-result-object v0

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 110
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 111
    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->dismiss()V

    return-void
.end method

.method public onDropInstance()V
    .locals 1

    .line 162
    invoke-virtual {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/uimanager/ThemedReactContext;

    invoke-virtual {v0, p0}, Lcom/facebook/react/uimanager/ThemedReactContext;->removeLifecycleEventListener(Lcom/facebook/react/bridge/LifecycleEventListener;)V

    .line 163
    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->dismiss()V

    return-void
.end method

.method public onHostDestroy()V
    .locals 0

    .line 231
    invoke-virtual {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->onDropInstance()V

    return-void
.end method

.method public onHostPause()V
    .locals 0

    return-void
.end method

.method public onHostResume()V
    .locals 0

    .line 220
    invoke-virtual {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->showOrUpdate()V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 1

    .line 135
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 137
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public removeViewAt(I)V
    .locals 1

    .line 142
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 144
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 145
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method protected setAnimationType(Ljava/lang/String;)V
    .locals 0

    .line 204
    iput-object p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mAnimationType:Ljava/lang/String;

    const/4 p1, 0x1

    .line 205
    iput-boolean p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mPropertyRequiresNewDialog:Z

    return-void
.end method

.method setEventDispatcher(Lcom/facebook/react/uimanager/events/EventDispatcher;)V
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-static {v0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->-$$Nest$msetEventDispatcher(Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    return-void
.end method

.method protected setHardwareAccelerated(Z)V
    .locals 0

    .line 209
    iput-boolean p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHardwareAccelerated:Z

    const/4 p1, 0x1

    .line 210
    iput-boolean p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mPropertyRequiresNewDialog:Z

    return-void
.end method

.method protected setOnRequestCloseListener(Lcom/facebook/react/views/modal/ReactModalHostView$OnRequestCloseListener;)V
    .locals 0

    .line 187
    iput-object p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mOnRequestCloseListener:Lcom/facebook/react/views/modal/ReactModalHostView$OnRequestCloseListener;

    return-void
.end method

.method protected setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mOnShowListener:Landroid/content/DialogInterface$OnShowListener;

    return-void
.end method

.method public setStateWrapper(Lcom/facebook/react/uimanager/StateWrapper;)V
    .locals 1

    .line 403
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->setStateWrapper(Lcom/facebook/react/uimanager/StateWrapper;)V

    return-void
.end method

.method protected setStatusBarTranslucent(Z)V
    .locals 0

    .line 199
    iput-boolean p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mStatusBarTranslucent:Z

    const/4 p1, 0x1

    .line 200
    iput-boolean p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mPropertyRequiresNewDialog:Z

    return-void
.end method

.method protected setTransparent(Z)V
    .locals 0

    .line 195
    iput-boolean p1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mTransparent:Z

    return-void
.end method

.method protected showOrUpdate()V
    .locals 7

    .line 250
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    .line 254
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    const-string v1, "@"

    const-string v2, "ReactModalHost"

    if-eqz v0, :cond_1

    .line 255
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v3, Landroid/app/Activity;

    invoke-static {v0, v3}, Lcom/facebook/react/views/common/ContextUtils;->findContextOfType(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 257
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Updating existing dialog with context: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 257
    invoke-static {v2, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    iget-boolean v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mPropertyRequiresNewDialog:Z

    if-eqz v0, :cond_0

    .line 265
    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->dismiss()V

    goto :goto_0

    .line 267
    :cond_0
    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->updateProperties()V

    return-void

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 273
    iput-boolean v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mPropertyRequiresNewDialog:Z

    .line 274
    sget v0, Lcom/facebook/react/R$style;->Theme_FullScreenDialog:I

    .line 275
    iget-object v3, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mAnimationType:Ljava/lang/String;

    const-string v4, "fade"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 276
    sget v0, Lcom/facebook/react/R$style;->Theme_FullScreenDialogAnimatedFade:I

    goto :goto_1

    .line 277
    :cond_2
    iget-object v3, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mAnimationType:Ljava/lang/String;

    const-string v4, "slide"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 278
    sget v0, Lcom/facebook/react/R$style;->Theme_FullScreenDialogAnimatedSlide:I

    .line 280
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v3, :cond_4

    .line 281
    invoke-virtual {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->getContext()Landroid/content/Context;

    move-result-object v4

    goto :goto_2

    :cond_4
    move-object v4, v3

    .line 282
    :goto_2
    new-instance v5, Landroid/app/Dialog;

    invoke-direct {v5, v4, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v5, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    .line 284
    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v5, 0x8

    .line 285
    invoke-virtual {v0, v5, v5}, Landroid/view/Window;->setFlags(II)V

    .line 290
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "Creating new dialog from context: "

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->getContentView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 293
    invoke-direct {p0}, Lcom/facebook/react/views/modal/ReactModalHostView;->updateProperties()V

    .line 295
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    iget-object v1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mOnShowListener:Landroid/content/DialogInterface$OnShowListener;

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 296
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    new-instance v1, Lcom/facebook/react/views/modal/ReactModalHostView$1;

    invoke-direct {v1, p0}, Lcom/facebook/react/views/modal/ReactModalHostView$1;-><init>(Lcom/facebook/react/views/modal/ReactModalHostView;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 325
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 326
    iget-boolean v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHardwareAccelerated:Z

    if-eqz v0, :cond_5

    .line 327
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x1000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    :cond_5
    if-eqz v3, :cond_8

    .line 329
    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_8

    .line 330
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 331
    instance-of v0, v4, Landroid/app/Activity;

    if-eqz v0, :cond_7

    .line 332
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-le v0, v1, :cond_6

    .line 333
    check-cast v4, Landroid/app/Activity;

    .line 334
    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsetsController;)I

    move-result v0

    .line 335
    iget-object v1, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object v1

    invoke-static {v1, v0, v0}, Lcom/facebook/hermes/intl/Intl$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsetsController;II)V

    goto :goto_3

    .line 337
    :cond_6
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    .line 338
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 339
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v4, Landroid/app/Activity;

    .line 341
    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v1

    .line 340
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 344
    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/Window;->clearFlags(I)V

    :cond_8
    return-void
.end method

.method public updateState(II)V
    .locals 1

    .line 407
    iget-object v0, p0, Lcom/facebook/react/views/modal/ReactModalHostView;->mHostView:Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/views/modal/ReactModalHostView$DialogRootViewGroup;->updateState(II)V

    return-void
.end method
