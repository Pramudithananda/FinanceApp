.class public Lcom/facebook/react/views/text/FontMetricsUtil;
.super Ljava/lang/Object;
.source "FontMetricsUtil.java"


# static fields
.field private static final AMPLIFICATION_FACTOR:F = 100.0f

.field private static final CAP_HEIGHT_MEASUREMENT_TEXT:Ljava/lang/String; = "T"

.field private static final X_HEIGHT_MEASUREMENT_TEXT:Ljava/lang/String; = "x"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFontMetrics(Ljava/lang/CharSequence;Landroid/text/Layout;Landroid/text/TextPaint;Landroid/content/Context;)Lcom/facebook/react/bridge/WritableArray;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 27
    invoke-virtual/range {p3 .. p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 28
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v3

    .line 34
    new-instance v4, Landroid/text/TextPaint;

    move-object/from16 v5, p2

    invoke-direct {v4, v5}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 35
    invoke-virtual {v4}, Landroid/text/TextPaint;->getTextSize()F

    move-result v5

    const/high16 v6, 0x42c80000    # 100.0f

    mul-float v5, v5, v6

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 36
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    const-string v7, "T"

    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 37
    invoke-virtual {v4, v7, v8, v9, v5}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 39
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v6

    iget v7, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v5, v7

    float-to-double v10, v5

    .line 40
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    const-string v7, "x"

    .line 41
    invoke-virtual {v4, v7, v8, v9, v5}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 43
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v6

    iget v5, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v4, v5

    float-to-double v4, v4

    const/4 v6, 0x0

    .line 44
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/text/Layout;->getLineCount()I

    move-result v12

    if-ge v6, v12, :cond_2

    .line 45
    invoke-interface/range {p0 .. p0}, Ljava/lang/CharSequence;->length()I

    move-result v12

    if-lez v12, :cond_0

    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v12

    sub-int/2addr v12, v9

    invoke-interface {v0, v12}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v12

    const/16 v13, 0xa

    if-ne v12, v13, :cond_0

    const/4 v12, 0x1

    goto :goto_1

    :cond_0
    const/4 v12, 0x0

    :goto_1
    if-eqz v12, :cond_1

    .line 46
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineMax(I)F

    move-result v12

    goto :goto_2

    :cond_1
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v12

    .line 47
    :goto_2
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 48
    invoke-virtual {v1, v6, v13}, Landroid/text/Layout;->getLineBounds(ILandroid/graphics/Rect;)I

    .line 49
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v14

    .line 50
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v15

    iget v8, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v15, v8

    move-wide/from16 v16, v10

    float-to-double v9, v15

    invoke-interface {v14, v7, v9, v10}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 51
    iget v8, v13, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    iget v9, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v8, v9

    float-to-double v8, v8

    const-string v10, "y"

    invoke-interface {v14, v10, v8, v9}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 52
    iget v8, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v12, v8

    float-to-double v8, v12

    const-string v10, "width"

    invoke-interface {v14, v10, v8, v9}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 53
    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v8

    int-to-float v8, v8

    iget v9, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v8, v9

    float-to-double v8, v8

    const-string v10, "height"

    invoke-interface {v14, v10, v8, v9}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 54
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineDescent(I)I

    move-result v8

    int-to-float v8, v8

    iget v9, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v8, v9

    float-to-double v8, v8

    const-string v10, "descender"

    invoke-interface {v14, v10, v8, v9}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 55
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineAscent(I)I

    move-result v8

    neg-int v8, v8

    int-to-float v8, v8

    iget v9, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v8, v9

    float-to-double v8, v8

    const-string v10, "ascender"

    invoke-interface {v14, v10, v8, v9}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 56
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineBaseline(I)I

    move-result v8

    int-to-float v8, v8

    iget v9, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v8, v9

    float-to-double v8, v8

    const-string v10, "baseline"

    invoke-interface {v14, v10, v8, v9}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v8, "capHeight"

    move-wide/from16 v9, v16

    .line 57
    invoke-interface {v14, v8, v9, v10}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v8, "xHeight"

    .line 58
    invoke-interface {v14, v8, v4, v5}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 60
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineStart(I)I

    move-result v8

    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v11

    invoke-interface {v0, v8, v11}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v11, "text"

    .line 59
    invoke-interface {v14, v11, v8}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-interface {v3, v14}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    add-int/lit8 v6, v6, 0x1

    move-wide v10, v9

    const/4 v8, 0x0

    const/4 v9, 0x1

    goto/16 :goto_0

    :cond_2
    return-object v3
.end method
