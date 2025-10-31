.class public Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;
.super Landroid/view/View;
.source "TraceUpdateOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;
    }
.end annotation


# instance fields
.field private final mOverlayPaint:Landroid/graphics/Paint;

.field private mOverlays:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 47
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 21
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->mOverlayPaint:Landroid/graphics/Paint;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->mOverlays:Ljava/util/List;

    .line 48
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v0, 0x40c00000    # 6.0f

    .line 49
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 60
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 62
    iget-object v0, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->mOverlays:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->mOverlays:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;

    .line 65
    iget-object v2, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->mOverlayPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->getColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    invoke-virtual {v1}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->getPixelRect()Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->mOverlayPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setOverlays(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;",
            ">;)V"
        }
    .end annotation

    .line 54
    iput-object p1, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->mOverlays:Ljava/util/List;

    .line 55
    invoke-virtual {p0}, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;->invalidate()V

    return-void
.end method
