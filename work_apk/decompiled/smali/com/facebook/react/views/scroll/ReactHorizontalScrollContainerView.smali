.class public Lcom/facebook/react/views/scroll/ReactHorizontalScrollContainerView;
.super Lcom/facebook/react/views/view/ReactViewGroup;
.source "ReactHorizontalScrollContainerView.java"


# instance fields
.field private mLayoutDirection:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 21
    invoke-direct {p0, p1}, Lcom/facebook/react/views/view/ReactViewGroup;-><init>(Landroid/content/Context;)V

    .line 23
    invoke-static {}, Lcom/facebook/react/modules/i18nmanager/I18nUtil;->getInstance()Lcom/facebook/react/modules/i18nmanager/I18nUtil;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/react/modules/i18nmanager/I18nUtil;->isRTL(Landroid/content/Context;)Z

    move-result p1

    .line 25
    iput p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollContainerView;->mLayoutDirection:I

    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 1

    .line 45
    iget p1, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollContainerView;->mLayoutDirection:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    sub-int/2addr p4, p2

    const/4 p1, 0x0

    add-int/2addr p4, p1

    .line 51
    invoke-static {p0, p1, p3, p4, p5}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Lcom/facebook/react/views/scroll/ReactHorizontalScrollContainerView;IIII)V

    :cond_0
    return-void
.end method

.method public setRemoveClippedSubviews(Z)V
    .locals 2

    .line 35
    iget v0, p0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollContainerView;->mLayoutDirection:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    .line 36
    invoke-super {p0, p1}, Lcom/facebook/react/views/view/ReactViewGroup;->setRemoveClippedSubviews(Z)V

    return-void

    .line 40
    :cond_0
    invoke-super {p0, p1}, Lcom/facebook/react/views/view/ReactViewGroup;->setRemoveClippedSubviews(Z)V

    return-void
.end method
