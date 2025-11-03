.class public Lcom/facebook/react/views/text/ReactTextShadowNode;
.super Lcom/facebook/react/views/text/ReactBaseTextShadowNode;
.source "ReactTextShadowNode.java"


# static fields
.field private static final sTextPaintInstance:Landroid/text/TextPaint;


# instance fields
.field private mPreparedSpannableText:Landroid/text/Spannable;

.field private mShouldNotifyOnTextLayout:Z

.field private final mTextBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;

.field private final mTextMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;


# direct methods
.method static bridge synthetic -$$Nest$fgetmPreparedSpannableText(Lcom/facebook/react/views/text/ReactTextShadowNode;)Landroid/text/Spannable;
    .locals 0

    iget-object p0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mPreparedSpannableText:Landroid/text/Spannable;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmShouldNotifyOnTextLayout(Lcom/facebook/react/views/text/ReactTextShadowNode;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mShouldNotifyOnTextLayout:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$mmeasureSpannedText(Lcom/facebook/react/views/text/ReactTextShadowNode;Landroid/text/Spannable;FLcom/facebook/yoga/YogaMeasureMode;)Landroid/text/Layout;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/views/text/ReactTextShadowNode;->measureSpannedText(Landroid/text/Spannable;FLcom/facebook/yoga/YogaMeasureMode;)Landroid/text/Layout;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfgetsTextPaintInstance()Landroid/text/TextPaint;
    .locals 1

    sget-object v0, Lcom/facebook/react/views/text/ReactTextShadowNode;->sTextPaintInstance:Landroid/text/TextPaint;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 56
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    sput-object v0, Lcom/facebook/react/views/text/ReactTextShadowNode;->sTextPaintInstance:Landroid/text/TextPaint;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 181
    invoke-direct {p0, v0}, Lcom/facebook/react/views/text/ReactTextShadowNode;-><init>(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)V
    .locals 0

    .line 185
    invoke-direct {p0, p1}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;-><init>(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)V

    .line 62
    new-instance p1, Lcom/facebook/react/views/text/ReactTextShadowNode$1;

    invoke-direct {p1, p0}, Lcom/facebook/react/views/text/ReactTextShadowNode$1;-><init>(Lcom/facebook/react/views/text/ReactTextShadowNode;)V

    iput-object p1, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;

    .line 166
    new-instance p1, Lcom/facebook/react/views/text/ReactTextShadowNode$2;

    invoke-direct {p1, p0}, Lcom/facebook/react/views/text/ReactTextShadowNode$2;-><init>(Lcom/facebook/react/views/text/ReactTextShadowNode;)V

    iput-object p1, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;

    .line 186
    invoke-direct {p0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->initMeasureFunction()V

    return-void
.end method

.method private getTextAlign()I
    .locals 3

    .line 295
    iget v0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextAlign:I

    .line 296
    invoke-virtual {p0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getLayoutDirection()Lcom/facebook/yoga/YogaDirection;

    move-result-object v1

    sget-object v2, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    if-ne v1, v2, :cond_1

    const/4 v1, 0x3

    const/4 v2, 0x5

    if-ne v0, v2, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :cond_0
    if-ne v0, v1, :cond_1

    const/4 v0, 0x5

    :cond_1
    :goto_0
    return v0
.end method

.method private initMeasureFunction()V
    .locals 1

    .line 190
    invoke-virtual {p0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->isVirtual()Z

    move-result v0

    if-nez v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;

    invoke-virtual {p0, v0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->setMeasureFunction(Lcom/facebook/yoga/YogaMeasureFunction;)V

    .line 192
    iget-object v0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;

    invoke-virtual {p0, v0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->setBaselineFunction(Lcom/facebook/yoga/YogaBaselineFunction;)V

    :cond_0
    return-void
.end method

.method private measureSpannedText(Landroid/text/Spannable;FLcom/facebook/yoga/YogaMeasureMode;)Landroid/text/Layout;
    .locals 11

    .line 198
    sget-object v2, Lcom/facebook/react/views/text/ReactTextShadowNode;->sTextPaintInstance:Landroid/text/TextPaint;

    .line 199
    iget-object v0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextAttributes:Lcom/facebook/react/views/text/TextAttributes;

    invoke-virtual {v0}, Lcom/facebook/react/views/text/TextAttributes;->getEffectiveFontSize()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v2, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 201
    invoke-static {p1, v2}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    move-result-object v6

    if-nez v6, :cond_0

    .line 202
    invoke-static {p1, v2}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 205
    :goto_0
    sget-object v1, Lcom/facebook/yoga/YogaMeasureMode;->UNDEFINED:Lcom/facebook/yoga/YogaMeasureMode;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq p3, v1, :cond_2

    cmpg-float p3, p2, v3

    if-gez p3, :cond_1

    goto :goto_1

    :cond_1
    const/4 p3, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p3, 0x1

    .line 207
    :goto_2
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 208
    invoke-direct {p0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getTextAlign()I

    move-result v7

    if-eq v7, v5, :cond_5

    const/4 v8, 0x3

    if-eq v7, v8, :cond_4

    const/4 v8, 0x5

    if-eq v7, v8, :cond_3

    :goto_3
    move-object v7, v1

    goto :goto_4

    .line 213
    :cond_3
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    goto :goto_3

    .line 210
    :cond_4
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    goto :goto_3

    .line 216
    :cond_5
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    goto :goto_3

    :goto_4
    const/16 v1, 0x1c

    const/high16 v8, 0x3f800000    # 1.0f

    const/16 v9, 0x17

    if-nez v6, :cond_a

    if-nez p3, :cond_6

    .line 222
    invoke-static {v0}, Lcom/facebook/yoga/YogaConstants;->isUndefined(F)Z

    move-result v10

    if-nez v10, :cond_a

    cmpg-float v10, v0, p2

    if-gtz v10, :cond_a

    :cond_6
    float-to-double p2, v0

    .line 226
    invoke-static {p2, p3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p2

    double-to-int p2, p2

    .line 227
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge p3, v9, :cond_7

    .line 228
    new-instance p3, Landroid/text/StaticLayout;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    iget-boolean v8, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mIncludeFontPadding:Z

    move-object v0, p3

    move-object v1, p1

    move v3, p2

    move-object v4, v7

    move v7, v8

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    goto/16 :goto_5

    .line 232
    :cond_7
    invoke-interface {p1}, Landroid/text/Spannable;->length()I

    move-result p3

    invoke-static {p1, v4, p3, v2, p2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    .line 233
    invoke-static {p1, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    .line 234
    invoke-static {p1, v3, v8}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;FF)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget-boolean p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mIncludeFontPadding:Z

    .line 235
    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextBreakStrategy:I

    .line 236
    invoke-static {p1, p2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mHyphenationFrequency:I

    .line 237
    invoke-static {p1, p2}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    .line 239
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x1a

    if-lt p2, p3, :cond_8

    .line 240
    iget p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mJustificationMode:I

    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    .line 242
    :cond_8
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p2, v1, :cond_9

    .line 243
    invoke-static {p1, v5}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    .line 245
    :cond_9
    invoke-static {p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;

    move-result-object p3

    goto/16 :goto_5

    :cond_a
    if-eqz v6, :cond_c

    if-nez p3, :cond_b

    .line 248
    iget p3, v6, Landroid/text/BoringLayout$Metrics;->width:I

    int-to-float p3, p3

    cmpg-float p3, p3, p2

    if-gtz p3, :cond_c

    .line 251
    :cond_b
    iget p2, v6, Landroid/text/BoringLayout$Metrics;->width:I

    .line 255
    invoke-static {p2, v4}, Ljava/lang/Math;->max(II)I

    move-result p2

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    iget-boolean p3, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mIncludeFontPadding:Z

    move-object v0, p1

    move-object v1, v2

    move v2, p2

    move-object v3, v7

    move v7, p3

    .line 252
    invoke-static/range {v0 .. v7}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;Z)Landroid/text/BoringLayout;

    move-result-object p3

    goto :goto_5

    .line 264
    :cond_c
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge p3, v9, :cond_d

    .line 265
    new-instance p3, Landroid/text/StaticLayout;

    float-to-int v3, p2

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    iget-boolean p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mIncludeFontPadding:Z

    move-object v0, p3

    move-object v1, p1

    move-object v4, v7

    move v7, p2

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    goto :goto_5

    .line 272
    :cond_d
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1d

    if-le p3, v0, :cond_e

    float-to-double p2, p2

    .line 273
    invoke-static {p2, p3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p2

    double-to-float p2, p2

    .line 277
    :cond_e
    invoke-interface {p1}, Landroid/text/Spannable;->length()I

    move-result p3

    float-to-int p2, p2

    invoke-static {p1, v4, p3, v2, p2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    .line 278
    invoke-static {p1, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    .line 279
    invoke-static {p1, v3, v8}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;FF)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget-boolean p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mIncludeFontPadding:Z

    .line 280
    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextBreakStrategy:I

    .line 281
    invoke-static {p1, p2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget p2, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mHyphenationFrequency:I

    .line 282
    invoke-static {p1, p2}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    .line 284
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p2, v1, :cond_f

    .line 285
    invoke-static {p1, v5}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    .line 287
    :cond_f
    invoke-static {p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;

    move-result-object p3

    :goto_5
    return-object p3
.end method


# virtual methods
.method public calculateLayoutOnChildren()Ljava/lang/Iterable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/facebook/react/uimanager/ReactShadowNode;",
            ">;"
        }
    .end annotation

    .line 367
    iget-object v0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mInlineViews:Ljava/util/Map;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mInlineViews:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 371
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mPreparedSpannableText:Landroid/text/Spannable;

    const-string v1, "Spannable element has not been prepared in onBeforeLayout"

    .line 372
    invoke-static {v0, v1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/Spanned;

    .line 376
    invoke-interface {v0}, Landroid/text/Spanned;->length()I

    move-result v1

    const-class v2, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    .line 377
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 379
    array-length v2, v0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 380
    iget-object v5, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mInlineViews:Ljava/util/Map;

    invoke-virtual {v4}, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;->getReactTag()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/react/uimanager/ReactShadowNode;

    .line 381
    invoke-interface {v4}, Lcom/facebook/react/uimanager/ReactShadowNode;->calculateLayout()V

    .line 382
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v1

    :cond_2
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public hoistNativeChildren()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isVirtualAnchor()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public markUpdated()V
    .locals 0

    .line 332
    invoke-super {p0}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;->markUpdated()V

    .line 334
    invoke-super {p0}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;->dirty()V

    return-void
.end method

.method public onBeforeLayout(Lcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 309
    invoke-virtual {p0, p0, v0, v1, p1}, Lcom/facebook/react/views/text/ReactTextShadowNode;->spannedFromShadowNode(Lcom/facebook/react/views/text/ReactBaseTextShadowNode;Ljava/lang/String;ZLcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;)Landroid/text/Spannable;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mPreparedSpannableText:Landroid/text/Spannable;

    .line 314
    invoke-virtual {p0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->markUpdated()V

    return-void
.end method

.method public onCollectExtraUpdates(Lcom/facebook/react/uimanager/UIViewOperationQueue;)V
    .locals 12

    .line 339
    invoke-super {p0, p1}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;->onCollectExtraUpdates(Lcom/facebook/react/uimanager/UIViewOperationQueue;)V

    .line 341
    iget-object v1, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mPreparedSpannableText:Landroid/text/Spannable;

    if-eqz v1, :cond_0

    .line 342
    new-instance v11, Lcom/facebook/react/views/text/ReactTextUpdate;

    const/4 v2, -0x1

    iget-boolean v3, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mContainsImages:Z

    const/4 v0, 0x4

    .line 347
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getPadding(I)F

    move-result v4

    const/4 v0, 0x1

    .line 348
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getPadding(I)F

    move-result v5

    const/4 v0, 0x5

    .line 349
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getPadding(I)F

    move-result v6

    const/4 v0, 0x3

    .line 350
    invoke-virtual {p0, v0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getPadding(I)F

    move-result v7

    .line 351
    invoke-direct {p0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getTextAlign()I

    move-result v8

    iget v9, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mTextBreakStrategy:I

    iget v10, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mJustificationMode:I

    move-object v0, v11

    invoke-direct/range {v0 .. v10}, Lcom/facebook/react/views/text/ReactTextUpdate;-><init>(Landroid/text/Spannable;IZFFFFIII)V

    .line 354
    invoke-virtual {p0}, Lcom/facebook/react/views/text/ReactTextShadowNode;->getReactTag()I

    move-result v0

    invoke-virtual {p1, v0, v11}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueUpdateExtraData(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public setShouldNotifyOnTextLayout(Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "onTextLayout"
    .end annotation

    .line 360
    iput-boolean p1, p0, Lcom/facebook/react/views/text/ReactTextShadowNode;->mShouldNotifyOnTextLayout:Z

    return-void
.end method
