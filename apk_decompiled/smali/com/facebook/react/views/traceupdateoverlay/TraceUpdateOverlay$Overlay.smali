.class public Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;
.super Ljava/lang/Object;
.source "TraceUpdateOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Overlay"
.end annotation


# instance fields
.field private final mColor:I

.field private final mRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(ILandroid/graphics/RectF;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput p1, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->mColor:I

    .line 30
    iput-object p2, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->mRect:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public getColor()I
    .locals 1

    .line 34
    iget v0, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->mColor:I

    return v0
.end method

.method public getPixelRect()Landroid/graphics/RectF;
    .locals 5

    .line 38
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->mRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    .line 39
    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result v1

    iget-object v2, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->mRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 40
    invoke-static {v2}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result v2

    iget-object v3, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->mRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    .line 41
    invoke-static {v3}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result v3

    iget-object v4, p0, Lcom/facebook/react/views/traceupdateoverlay/TraceUpdateOverlay$Overlay;->mRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    .line 42
    invoke-static {v4}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method
