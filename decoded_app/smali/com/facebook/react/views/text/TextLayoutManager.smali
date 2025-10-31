.class public Lcom/facebook/react/views/text/TextLayoutManager;
.super Ljava/lang/Object;
.source "TextLayoutManager.java"


# static fields
.field private static final DEFAULT_INCLUDE_FONT_PADDING:Z = true

.field private static final ENABLE_MEASURE_LOGGING:Z = false

.field private static final HYPHENATION_FREQUENCY_KEY:Ljava/lang/String; = "android_hyphenationFrequency"

.field private static final INCLUDE_FONT_PADDING_KEY:Ljava/lang/String; = "includeFontPadding"

.field private static final INLINE_VIEW_PLACEHOLDER:Ljava/lang/String; = "0"

.field private static final MAXIMUM_NUMBER_OF_LINES_KEY:Ljava/lang/String; = "maximumNumberOfLines"

.field private static final TAG:Ljava/lang/String; = "TextLayoutManager"

.field private static final TEXT_BREAK_STRATEGY_KEY:Ljava/lang/String; = "textBreakStrategy"

.field private static final sSpannableCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Lcom/facebook/react/bridge/ReadableNativeMap;",
            "Landroid/text/Spannable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSpannableCacheLock:Ljava/lang/Object;

.field private static final sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Landroid/text/Spannable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sTextPaintInstance:Landroid/text/TextPaint;

.field private static final spannableCacheSize:I = 0x64


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 58
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sSpannableCacheLock:Ljava/lang/Object;

    .line 71
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sSpannableCache:Landroid/util/LruCache;

    .line 73
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildSpannableFromFragment(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableArray;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/facebook/react/bridge/ReadableArray;",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/util/List<",
            "Lcom/facebook/react/views/text/SetSpanOperation;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p3

    .line 108
    invoke-interface/range {p1 .. p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_10

    move-object/from16 v4, p1

    .line 109
    invoke-interface {v4, v3}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v5

    .line 110
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    .line 113
    new-instance v7, Lcom/facebook/react/uimanager/ReactStylesDiffMap;

    const-string v8, "textAttributes"

    .line 115
    invoke-interface {v5, v8}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;-><init>(Lcom/facebook/react/bridge/ReadableMap;)V

    .line 114
    invoke-static {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->fromReadableMap(Lcom/facebook/react/uimanager/ReactStylesDiffMap;)Lcom/facebook/react/views/text/TextAttributeProps;

    move-result-object v7

    const-string v8, "string"

    .line 117
    invoke-interface {v5, v8}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    invoke-static {v8, v9}, Lcom/facebook/react/views/text/TextTransform;->apply(Ljava/lang/String;Lcom/facebook/react/views/text/TextTransform;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v9, p2

    invoke-virtual {v9, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 119
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    const-string v10, "reactTag"

    .line 120
    invoke-interface {v5, v10}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v11

    const/4 v12, -0x1

    if-eqz v11, :cond_0

    invoke-interface {v5, v10}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v10

    goto :goto_1

    :cond_0
    const/4 v10, -0x1

    :goto_1
    const-string v11, "isAttachment"

    .line 121
    invoke-interface {v5, v11}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v13

    const/4 v14, 0x1

    if-eqz v13, :cond_1

    .line 122
    invoke-interface {v5, v11}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v6, "width"

    .line 123
    invoke-interface {v5, v6}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromSP(D)F

    move-result v6

    const-string v7, "height"

    .line 124
    invoke-interface {v5, v7}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v7

    invoke-static {v7, v8}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromSP(D)F

    move-result v5

    .line 125
    new-instance v7, Lcom/facebook/react/views/text/SetSpanOperation;

    .line 127
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    sub-int/2addr v8, v14

    .line 128
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v11

    new-instance v12, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    float-to-int v6, v6

    float-to-int v5, v5

    invoke-direct {v12, v10, v6, v5}, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;-><init>(III)V

    invoke-direct {v7, v8, v11, v12}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 125
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    :cond_1
    if-lt v8, v6, :cond_f

    .line 132
    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    if-eqz v5, :cond_2

    .line 133
    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    sget-object v11, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;->LINK:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    if-ne v5, v11, :cond_3

    goto :goto_2

    .line 134
    :cond_2
    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mAccessibilityRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    sget-object v11, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;->LINK:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    if-ne v5, v11, :cond_3

    goto :goto_2

    :cond_3
    const/4 v14, 0x0

    :goto_2
    if-eqz v14, :cond_4

    .line 136
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v11, Lcom/facebook/react/views/text/ReactClickableSpan;

    invoke-direct {v11, v10}, Lcom/facebook/react/views/text/ReactClickableSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v11}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    :cond_4
    iget-boolean v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsColorSet:Z

    if-eqz v5, :cond_5

    .line 139
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v11, Lcom/facebook/react/views/text/ReactForegroundColorSpan;

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mColor:I

    invoke-direct {v11, v13}, Lcom/facebook/react/views/text/ReactForegroundColorSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v11}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    :cond_5
    iget-boolean v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsBackgroundColorSet:Z

    if-eqz v5, :cond_6

    .line 144
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v11, Lcom/facebook/react/views/text/ReactBackgroundColorSpan;

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mBackgroundColor:I

    invoke-direct {v11, v13}, Lcom/facebook/react/views/text/ReactBackgroundColorSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v11}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    :cond_6
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getLetterSpacing()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_7

    .line 149
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v11, Lcom/facebook/react/views/text/CustomLetterSpacingSpan;

    .line 151
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getLetterSpacing()F

    move-result v13

    invoke-direct {v11, v13}, Lcom/facebook/react/views/text/CustomLetterSpacingSpan;-><init>(F)V

    invoke-direct {v5, v6, v8, v11}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 149
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_7
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v11, Lcom/facebook/react/views/text/ReactAbsoluteSizeSpan;

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSize:I

    invoke-direct {v11, v13}, Lcom/facebook/react/views/text/ReactAbsoluteSizeSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v11}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontStyle:I

    if-ne v5, v12, :cond_8

    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontWeight:I

    if-ne v5, v12, :cond_8

    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFamily:Ljava/lang/String;

    if-eqz v5, :cond_9

    .line 158
    :cond_8
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v15, Lcom/facebook/react/views/text/CustomStyleSpan;

    iget v12, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontStyle:I

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontWeight:I

    iget-object v14, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFeatureSettings:Ljava/lang/String;

    iget-object v11, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFamily:Ljava/lang/String;

    .line 167
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v16

    move-object/from16 v17, v11

    move-object v11, v15

    move-object v2, v15

    move-object/from16 v15, v17

    invoke-direct/range {v11 .. v16}, Lcom/facebook/react/views/text/CustomStyleSpan;-><init>(IILjava/lang/String;Ljava/lang/String;Landroid/content/res/AssetManager;)V

    invoke-direct {v5, v6, v8, v2}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 158
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    :cond_9
    iget-boolean v2, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsUnderlineTextDecorationSet:Z

    if-eqz v2, :cond_a

    .line 170
    new-instance v2, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v5, Lcom/facebook/react/views/text/ReactUnderlineSpan;

    invoke-direct {v5}, Lcom/facebook/react/views/text/ReactUnderlineSpan;-><init>()V

    invoke-direct {v2, v6, v8, v5}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    :cond_a
    iget-boolean v2, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsLineThroughTextDecorationSet:Z

    if-eqz v2, :cond_b

    .line 173
    new-instance v2, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v5, Lcom/facebook/react/views/text/ReactStrikethroughSpan;

    invoke-direct {v5}, Lcom/facebook/react/views/text/ReactStrikethroughSpan;-><init>()V

    invoke-direct {v2, v6, v8, v5}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    :cond_b
    iget v2, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    const/4 v5, 0x0

    cmpl-float v2, v2, v5

    if-nez v2, :cond_c

    iget v2, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    cmpl-float v2, v2, v5

    if-nez v2, :cond_c

    iget v2, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_d

    :cond_c
    iget v2, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    .line 178
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    if-eqz v2, :cond_d

    .line 179
    new-instance v2, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v5, Lcom/facebook/react/views/text/ShadowStyleSpan;

    iget v11, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    iget v12, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    iget v14, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    invoke-direct {v5, v11, v12, v13, v14}, Lcom/facebook/react/views/text/ShadowStyleSpan;-><init>(FFFI)V

    invoke-direct {v2, v6, v8, v5}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    :cond_d
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getEffectiveLineHeight()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_e

    .line 190
    new-instance v2, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v5, Lcom/facebook/react/views/text/CustomLineHeightSpan;

    .line 192
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getEffectiveLineHeight()F

    move-result v7

    invoke-direct {v5, v7}, Lcom/facebook/react/views/text/CustomLineHeightSpan;-><init>(F)V

    invoke-direct {v2, v6, v8, v5}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 190
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_e
    new-instance v2, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v5, Lcom/facebook/react/views/text/ReactTagSpan;

    invoke-direct {v5, v10}, Lcom/facebook/react/views/text/ReactTagSpan;-><init>(I)V

    invoke-direct {v2, v6, v8, v5}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_f
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_10
    return-void
.end method

.method private static createLayout(Landroid/text/Spannable;Landroid/text/BoringLayout$Metrics;FLcom/facebook/yoga/YogaMeasureMode;ZII)Landroid/text/Layout;
    .locals 15

    move-object v1, p0

    move-object/from16 v6, p1

    move/from16 v0, p2

    move/from16 v7, p4

    move/from16 v2, p5

    move/from16 v3, p6

    .line 249
    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v4

    .line 250
    sget-object v5, Lcom/facebook/yoga/YogaMeasureMode;->UNDEFINED:Lcom/facebook/yoga/YogaMeasureMode;

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v11, p3

    if-eq v11, v5, :cond_1

    cmpg-float v5, v0, v9

    if-gez v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v5, 0x1

    :goto_1
    if-nez v6, :cond_2

    .line 252
    sget-object v11, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    invoke-static {p0, v11}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v11

    goto :goto_2

    :cond_2
    const/high16 v11, 0x7fc00000    # Float.NaN

    :goto_2
    const/high16 v12, 0x3f800000    # 1.0f

    const/16 v13, 0x17

    if-nez v6, :cond_5

    if-nez v5, :cond_3

    .line 256
    invoke-static {v11}, Lcom/facebook/yoga/YogaConstants;->isUndefined(F)Z

    move-result v14

    if-nez v14, :cond_5

    cmpg-float v14, v11, v0

    if-gtz v14, :cond_5

    :cond_3
    float-to-double v5, v11

    .line 260
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v5, v5

    .line 261
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v13, :cond_4

    .line 262
    new-instance v8, Landroid/text/StaticLayout;

    sget-object v2, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    move-object v0, v8

    move-object v1, p0

    move v3, v5

    move v5, v6

    move v6, v9

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    goto/16 :goto_4

    .line 272
    :cond_4
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    .line 273
    invoke-static {p0, v10, v4, v0, v5}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 274
    invoke-static {v0, v1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 275
    invoke-static {v0, v9, v12}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;FF)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 276
    invoke-static {v0, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 277
    invoke-static {v0, v2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 278
    invoke-static {v0, v3}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 279
    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;

    move-result-object v8

    goto/16 :goto_4

    :cond_5
    if-eqz v6, :cond_8

    if-nez v5, :cond_6

    .line 281
    iget v5, v6, Landroid/text/BoringLayout$Metrics;->width:I

    int-to-float v5, v5

    cmpg-float v5, v5, v0

    if-gtz v5, :cond_8

    .line 282
    :cond_6
    iget v0, v6, Landroid/text/BoringLayout$Metrics;->width:I

    .line 283
    iget v2, v6, Landroid/text/BoringLayout$Metrics;->width:I

    if-gez v2, :cond_7

    .line 284
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->TAG:Ljava/lang/String;

    new-instance v2, Lcom/facebook/react/bridge/ReactNoCrashSoftException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Text width is invalid: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v6, Landroid/text/BoringLayout$Metrics;->width:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/react/bridge/ReactNoCrashSoftException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    goto :goto_3

    :cond_7
    move v2, v0

    .line 291
    :goto_3
    sget-object v3, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, v3

    move-object v3, v4

    move v4, v5

    move v5, v8

    move-object/from16 v6, p1

    move/from16 v7, p4

    .line 292
    invoke-static/range {v0 .. v7}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;Z)Landroid/text/BoringLayout;

    move-result-object v8

    goto :goto_4

    .line 304
    :cond_8
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v5, v13, :cond_9

    .line 305
    new-instance v8, Landroid/text/StaticLayout;

    sget-object v2, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    float-to-int v3, v0

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    move-object v0, v8

    move-object v1, p0

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    goto :goto_4

    .line 315
    :cond_9
    sget-object v5, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    float-to-int v0, v0

    .line 316
    invoke-static {p0, v10, v4, v5, v0}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 317
    invoke-static {v0, v1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 318
    invoke-static {v0, v9, v12}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;FF)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 319
    invoke-static {v0, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 320
    invoke-static {v0, v2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 321
    invoke-static {v0, v3}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 323
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_a

    .line 324
    invoke-static {v0, v8}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    .line 327
    :cond_a
    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;

    move-result-object v8

    :goto_4
    return-object v8
.end method

.method private static createSpannableFromAttributedString(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;
    .locals 3

    .line 215
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 220
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "fragments"

    .line 222
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    invoke-static {p0, p1, v0, v1}, Lcom/facebook/react/views/text/TextLayoutManager;->buildSpannableFromFragment(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableArray;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V

    const/4 p0, 0x0

    .line 226
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    if-ge p0, p1, :cond_0

    .line 227
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, p0

    add-int/lit8 p1, p1, -0x1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/views/text/SetSpanOperation;

    .line 231
    invoke-virtual {p1, v0, p0}, Lcom/facebook/react/views/text/SetSpanOperation;->execute(Landroid/text/SpannableStringBuilder;I)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 235
    invoke-interface {p2, v0}, Lcom/facebook/react/views/text/ReactTextViewManagerCallback;->onPostProcessSpannable(Landroid/text/Spannable;)V

    :cond_1
    return-object v0
.end method

.method public static deleteCachedSpannableForTag(I)V
    .locals 1

    .line 99
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;
    .locals 0

    .line 206
    invoke-static {p0, p1, p2}, Lcom/facebook/react/views/text/TextLayoutManager;->createSpannableFromAttributedString(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object p0

    return-object p0
.end method

.method public static isRTL(Lcom/facebook/react/bridge/ReadableMap;)Z
    .locals 2

    const-string v0, "fragments"

    .line 77
    invoke-interface {p0, v0}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 78
    invoke-interface {p0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 79
    invoke-interface {p0, v0}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object p0

    const-string v1, "textAttributes"

    .line 80
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v1, "layoutDirection"

    .line 82
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/facebook/react/views/text/TextAttributeProps;->getLayoutDirection(Ljava/lang/String;)I

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static measureLines(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;F)Lcom/facebook/react/bridge/WritableArray;
    .locals 8

    const/4 v0, 0x0

    .line 545
    invoke-static {p0, p1, v0}, Lcom/facebook/react/views/text/TextLayoutManager;->getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object p1

    .line 546
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    invoke-static {p1, v0}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    move-result-object v2

    const-string v1, "textBreakStrategy"

    .line 550
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 549
    invoke-static {v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v6

    const-string v1, "includeFontPadding"

    .line 552
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 553
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    move v5, v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    const/4 v5, 0x1

    :goto_0
    const-string v1, "android_hyphenationFrequency"

    .line 557
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 556
    invoke-static {p2}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v7

    .line 559
    sget-object v4, Lcom/facebook/yoga/YogaMeasureMode;->EXACTLY:Lcom/facebook/yoga/YogaMeasureMode;

    move-object v1, p1

    move v3, p3

    .line 560
    invoke-static/range {v1 .. v7}, Lcom/facebook/react/views/text/TextLayoutManager;->createLayout(Landroid/text/Spannable;Landroid/text/BoringLayout$Metrics;FLcom/facebook/yoga/YogaMeasureMode;ZII)Landroid/text/Layout;

    move-result-object p2

    .line 568
    invoke-static {p1, p2, v0, p0}, Lcom/facebook/react/views/text/FontMetricsUtil;->getFontMetrics(Ljava/lang/CharSequence;Landroid/text/Layout;Landroid/text/TextPaint;Landroid/content/Context;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p0

    return-object p0
.end method

.method public static measureText(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;FLcom/facebook/yoga/YogaMeasureMode;FLcom/facebook/yoga/YogaMeasureMode;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;[F)J
    .locals 18

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v9, p4

    move-object/from16 v10, p6

    const-string v2, "cacheId"

    .line 346
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 347
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 351
    sget-object v2, Lcom/facebook/react/views/text/TextLayoutManager;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 352
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/Spannable;

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0

    :cond_1
    move-object/from16 v2, p0

    move-object/from16 v3, p7

    .line 363
    invoke-static {v2, v0, v3}, Lcom/facebook/react/views/text/TextLayoutManager;->getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object v0

    :goto_0
    const-string v2, "textBreakStrategy"

    .line 368
    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 367
    invoke-static {v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v7

    const-string v2, "includeFontPadding"

    .line 370
    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    const/4 v11, 0x1

    if-eqz v3, :cond_2

    .line 371
    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    move v6, v2

    goto :goto_1

    :cond_2
    const/4 v6, 0x1

    :goto_1
    const-string v2, "android_hyphenationFrequency"

    .line 375
    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 374
    invoke-static {v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getHyphenationFrequency(Ljava/lang/String;)I

    move-result v8

    if-eqz v0, :cond_1e

    .line 381
    sget-object v2, Lcom/facebook/react/views/text/TextLayoutManager;->sTextPaintInstance:Landroid/text/TextPaint;

    invoke-static {v0, v2}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    move-result-object v3

    move-object v2, v0

    move/from16 v4, p3

    move-object/from16 v5, p4

    .line 384
    invoke-static/range {v2 .. v8}, Lcom/facebook/react/views/text/TextLayoutManager;->createLayout(Landroid/text/Spannable;Landroid/text/BoringLayout$Metrics;FLcom/facebook/yoga/YogaMeasureMode;ZII)Landroid/text/Layout;

    move-result-object v2

    const-string v3, "maximumNumberOfLines"

    .line 394
    invoke-interface {v1, v3}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, -0x1

    if-eqz v4, :cond_3

    .line 395
    invoke-interface {v1, v3}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    :cond_3
    const/4 v1, -0x1

    :goto_2
    if-eq v1, v5, :cond_5

    if-nez v1, :cond_4

    goto :goto_3

    .line 401
    :cond_4
    invoke-virtual {v2}, Landroid/text/Layout;->getLineCount()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_4

    .line 400
    :cond_5
    :goto_3
    invoke-virtual {v2}, Landroid/text/Layout;->getLineCount()I

    move-result v1

    .line 406
    :goto_4
    sget-object v3, Lcom/facebook/yoga/YogaMeasureMode;->EXACTLY:Lcom/facebook/yoga/YogaMeasureMode;

    const/16 v4, 0xa

    if-ne v9, v3, :cond_6

    goto :goto_8

    :cond_6
    const/4 v3, 0x0

    const/4 v7, 0x0

    :goto_5
    if-ge v7, v1, :cond_a

    .line 411
    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v8

    if-lez v8, :cond_7

    invoke-virtual {v2, v7}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v8

    sub-int/2addr v8, v11

    invoke-interface {v0, v8}, Landroid/text/Spannable;->charAt(I)C

    move-result v8

    if-ne v8, v4, :cond_7

    const/4 v8, 0x1

    goto :goto_6

    :cond_7
    const/4 v8, 0x0

    :goto_6
    if-eqz v8, :cond_8

    .line 413
    invoke-virtual {v2, v7}, Landroid/text/Layout;->getLineMax(I)F

    move-result v8

    goto :goto_7

    :cond_8
    invoke-virtual {v2, v7}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v8

    :goto_7
    cmpl-float v12, v8, v3

    if-lez v12, :cond_9

    move v3, v8

    :cond_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 418
    :cond_a
    sget-object v7, Lcom/facebook/yoga/YogaMeasureMode;->AT_MOST:Lcom/facebook/yoga/YogaMeasureMode;

    if-ne v9, v7, :cond_b

    cmpl-float v7, v3, p3

    if-lez v7, :cond_b

    :goto_8
    move/from16 v3, p3

    .line 426
    :cond_b
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1d

    if-le v7, v8, :cond_c

    float-to-double v7, v3

    .line 427
    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-float v3, v7

    .line 431
    :cond_c
    sget-object v7, Lcom/facebook/yoga/YogaMeasureMode;->EXACTLY:Lcom/facebook/yoga/YogaMeasureMode;

    if-eq v10, v7, :cond_d

    sub-int/2addr v1, v11

    .line 432
    invoke-virtual {v2, v1}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v1

    int-to-float v1, v1

    .line 433
    sget-object v7, Lcom/facebook/yoga/YogaMeasureMode;->AT_MOST:Lcom/facebook/yoga/YogaMeasureMode;

    if-ne v10, v7, :cond_e

    cmpl-float v7, v1, p5

    if-lez v7, :cond_e

    :cond_d
    move/from16 v1, p5

    :cond_e
    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 443
    :goto_9
    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v9

    if-ge v7, v9, :cond_1d

    .line 445
    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v9

    const-class v10, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    invoke-interface {v0, v7, v9, v10}, Landroid/text/Spannable;->nextSpanTransition(IILjava/lang/Class;)I

    move-result v9

    .line 446
    const-class v10, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    .line 447
    invoke-interface {v0, v7, v9, v10}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    .line 448
    array-length v10, v7

    const/4 v12, 0x0

    :goto_a
    if-ge v12, v10, :cond_1c

    aget-object v13, v7, v12

    .line 449
    invoke-interface {v0, v13}, Landroid/text/Spannable;->getSpanStart(Ljava/lang/Object;)I

    move-result v14

    .line 450
    invoke-virtual {v2, v14}, Landroid/text/Layout;->getLineForOffset(I)I

    move-result v15

    .line 451
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getEllipsisCount(I)I

    move-result v16

    if-lez v16, :cond_f

    const/16 v16, 0x1

    goto :goto_b

    :cond_f
    const/16 v16, 0x0

    :goto_b
    if-eqz v16, :cond_11

    .line 456
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineStart(I)I

    move-result v16

    invoke-virtual {v2, v15}, Landroid/text/Layout;->getEllipsisStart(I)I

    move-result v17

    add-int v6, v16, v17

    if-lt v14, v6, :cond_11

    .line 457
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v6

    if-lt v14, v6, :cond_10

    goto :goto_c

    :cond_10
    const/16 v5, 0xa

    const/4 v6, 0x1

    goto/16 :goto_14

    .line 458
    :cond_11
    :goto_c
    invoke-virtual {v13}, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;->getWidth()I

    move-result v6

    int-to-float v6, v6

    .line 459
    invoke-virtual {v13}, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;->getHeight()I

    move-result v13

    int-to-float v13, v13

    .line 461
    invoke-virtual {v2, v14}, Landroid/text/Layout;->isRtlCharAt(I)Z

    move-result v4

    .line 462
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getParagraphDirection(I)I

    move-result v11

    if-ne v11, v5, :cond_12

    const/4 v11, 0x1

    goto :goto_d

    :cond_12
    const/4 v11, 0x0

    .line 467
    :goto_d
    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v16

    const/16 v17, 0x1

    add-int/lit8 v5, v16, -0x1

    if-ne v14, v5, :cond_17

    .line 469
    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v4

    if-lez v4, :cond_13

    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v0, v4}, Landroid/text/Spannable;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_14

    const/16 v17, 0x1

    goto :goto_e

    :cond_13
    const/16 v5, 0xa

    :cond_14
    const/16 v17, 0x0

    :goto_e
    if-eqz v17, :cond_15

    .line 470
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineMax(I)F

    move-result v4

    goto :goto_f

    :cond_15
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v4

    :goto_f
    if-eqz v11, :cond_16

    sub-float v4, v3, v4

    goto :goto_13

    .line 476
    :cond_16
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineRight(I)F

    move-result v4

    sub-float/2addr v4, v6

    goto :goto_13

    :cond_17
    const/16 v5, 0xa

    if-ne v11, v4, :cond_18

    const/16 v17, 0x1

    goto :goto_10

    :cond_18
    const/16 v17, 0x0

    :goto_10
    if-eqz v17, :cond_19

    .line 486
    invoke-virtual {v2, v14}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v14

    goto :goto_11

    .line 487
    :cond_19
    invoke-virtual {v2, v14}, Landroid/text/Layout;->getSecondaryHorizontal(I)F

    move-result v14

    :goto_11
    if-eqz v11, :cond_1a

    .line 498
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineRight(I)F

    move-result v11

    sub-float/2addr v11, v14

    sub-float v11, v3, v11

    goto :goto_12

    :cond_1a
    move v11, v14

    :goto_12
    if-eqz v4, :cond_1b

    sub-float v4, v11, v6

    goto :goto_13

    :cond_1b
    move v4, v11

    .line 505
    :goto_13
    invoke-virtual {v2, v15}, Landroid/text/Layout;->getLineBaseline(I)I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v6, v13

    mul-int/lit8 v11, v8, 0x2

    .line 510
    invoke-static {v6}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v6

    aput v6, p8, v11

    const/4 v6, 0x1

    add-int/2addr v11, v6

    .line 512
    invoke-static {v4}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v4

    aput v4, p8, v11

    add-int/lit8 v8, v8, 0x1

    :goto_14
    add-int/lit8 v12, v12, 0x1

    const/16 v4, 0xa

    const/4 v5, -0x1

    const/4 v11, 0x1

    goto/16 :goto_a

    :cond_1c
    move v7, v9

    goto/16 :goto_9

    .line 518
    :cond_1d
    invoke-static {v3}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    .line 519
    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    .line 537
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaMeasureOutput;->make(FF)J

    move-result-wide v0

    return-wide v0

    .line 378
    :cond_1e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Spannable element has not been prepared in onBeforeLayout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static setCachedSpannabledForTag(ILandroid/text/Spannable;)V
    .locals 1

    .line 92
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManager;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
