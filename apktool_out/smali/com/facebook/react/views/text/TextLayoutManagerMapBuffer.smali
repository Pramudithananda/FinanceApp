.class public Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;
.super Ljava/lang/Object;
.source "TextLayoutManagerMapBuffer.java"


# static fields
.field public static final AS_KEY_CACHE_ID:S = 0x3s

.field public static final AS_KEY_FRAGMENTS:S = 0x2s

.field public static final AS_KEY_HASH:S = 0x0s

.field public static final AS_KEY_STRING:S = 0x1s

.field private static final DEFAULT_INCLUDE_FONT_PADDING:Z = true

.field private static final ENABLE_MEASURE_LOGGING:Z = false

.field public static final FR_KEY_HEIGHT:S = 0x4s

.field public static final FR_KEY_IS_ATTACHMENT:S = 0x2s

.field public static final FR_KEY_REACT_TAG:S = 0x1s

.field public static final FR_KEY_STRING:S = 0x0s

.field public static final FR_KEY_TEXT_ATTRIBUTES:S = 0x5s

.field public static final FR_KEY_WIDTH:S = 0x3s

.field private static final INLINE_VIEW_PLACEHOLDER:Ljava/lang/String; = "0"

.field public static final PA_KEY_ADJUST_FONT_SIZE_TO_FIT:S = 0x3s

.field public static final PA_KEY_ELLIPSIZE_MODE:S = 0x1s

.field public static final PA_KEY_HYPHENATION_FREQUENCY:S = 0x5s

.field public static final PA_KEY_INCLUDE_FONT_PADDING:S = 0x4s

.field public static final PA_KEY_MAX_NUMBER_OF_LINES:S = 0x0s

.field public static final PA_KEY_TEXT_BREAK_STRATEGY:S = 0x2s

.field private static final TAG:Ljava/lang/String; = "TextLayoutManagerMapBuffer"

.field private static final sCacheLock:Ljava/lang/Object;

.field private static final sSpannableCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;",
            "Landroid/text/Spannable;",
            ">;"
        }
    .end annotation
.end field

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

.field private static final spannableCacheSize:S = 0x2710s


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 77
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

    .line 86
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sCacheLock:Ljava/lang/Object;

    .line 88
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    .line 91
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x2710

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sSpannableCache:Landroid/util/LruCache;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildSpannableFromFragment(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/facebook/react/common/mapbuffer/MapBuffer;",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/util/List<",
            "Lcom/facebook/react/views/text/SetSpanOperation;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p3

    .line 129
    invoke-interface/range {p1 .. p1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_10

    move-object/from16 v4, p1

    .line 130
    invoke-interface {v4, v3}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object v5

    .line 131
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    const/4 v7, 0x5

    .line 134
    invoke-interface {v5, v7}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object v7

    invoke-static {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->fromMapBuffer(Lcom/facebook/react/common/mapbuffer/MapBuffer;)Lcom/facebook/react/views/text/TextAttributeProps;

    move-result-object v7

    .line 137
    invoke-interface {v5, v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getString(I)Ljava/lang/String;

    move-result-object v8

    iget-object v9, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    invoke-static {v8, v9}, Lcom/facebook/react/views/text/TextTransform;->apply(Ljava/lang/String;Lcom/facebook/react/views/text/TextTransform;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v9, p2

    .line 136
    invoke-virtual {v9, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 139
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    const/4 v10, 0x1

    .line 141
    invoke-interface {v5, v10}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->contains(I)Z

    move-result v11

    const/4 v12, -0x1

    if-eqz v11, :cond_0

    invoke-interface {v5, v10}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getInt(I)I

    move-result v11

    goto :goto_1

    :cond_0
    const/4 v11, -0x1

    :goto_1
    const/4 v13, 0x2

    .line 142
    invoke-interface {v5, v13}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->contains(I)Z

    move-result v14

    if-eqz v14, :cond_1

    invoke-interface {v5, v13}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getBoolean(I)Z

    move-result v13

    if-eqz v13, :cond_1

    const/4 v6, 0x3

    .line 143
    invoke-interface {v5, v6}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getDouble(I)D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromSP(D)F

    move-result v6

    const/4 v7, 0x4

    .line 144
    invoke-interface {v5, v7}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getDouble(I)D

    move-result-wide v7

    invoke-static {v7, v8}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromSP(D)F

    move-result v5

    .line 145
    new-instance v7, Lcom/facebook/react/views/text/SetSpanOperation;

    .line 147
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    sub-int/2addr v8, v10

    .line 148
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    new-instance v12, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    float-to-int v6, v6

    float-to-int v5, v5

    invoke-direct {v12, v11, v6, v5}, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;-><init>(III)V

    invoke-direct {v7, v8, v10, v12}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 145
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    :cond_1
    if-lt v8, v6, :cond_f

    .line 152
    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    if-eqz v5, :cond_2

    .line 153
    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    sget-object v13, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;->LINK:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    if-ne v5, v13, :cond_3

    goto :goto_2

    .line 154
    :cond_2
    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mAccessibilityRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    sget-object v13, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;->LINK:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    if-ne v5, v13, :cond_3

    goto :goto_2

    :cond_3
    const/4 v10, 0x0

    :goto_2
    if-eqz v10, :cond_4

    .line 156
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/ReactClickableSpan;

    invoke-direct {v10, v11}, Lcom/facebook/react/views/text/ReactClickableSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    :cond_4
    iget-boolean v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsColorSet:Z

    if-eqz v5, :cond_5

    .line 159
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/ReactForegroundColorSpan;

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mColor:I

    invoke-direct {v10, v13}, Lcom/facebook/react/views/text/ReactForegroundColorSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    :cond_5
    iget-boolean v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsBackgroundColorSet:Z

    if-eqz v5, :cond_6

    .line 164
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/ReactBackgroundColorSpan;

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mBackgroundColor:I

    invoke-direct {v10, v13}, Lcom/facebook/react/views/text/ReactBackgroundColorSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    :cond_6
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getLetterSpacing()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_7

    .line 169
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/CustomLetterSpacingSpan;

    .line 171
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getLetterSpacing()F

    move-result v13

    invoke-direct {v10, v13}, Lcom/facebook/react/views/text/CustomLetterSpacingSpan;-><init>(F)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 169
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    :cond_7
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/ReactAbsoluteSizeSpan;

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSize:I

    invoke-direct {v10, v13}, Lcom/facebook/react/views/text/ReactAbsoluteSizeSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontStyle:I

    if-ne v5, v12, :cond_8

    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontWeight:I

    if-ne v5, v12, :cond_8

    iget-object v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFamily:Ljava/lang/String;

    if-eqz v5, :cond_9

    .line 178
    :cond_8
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/CustomStyleSpan;

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontStyle:I

    iget v14, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontWeight:I

    iget-object v15, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFeatureSettings:Ljava/lang/String;

    iget-object v12, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFamily:Ljava/lang/String;

    .line 187
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v17

    move-object/from16 v16, v12

    move-object v12, v10

    invoke-direct/range {v12 .. v17}, Lcom/facebook/react/views/text/CustomStyleSpan;-><init>(IILjava/lang/String;Ljava/lang/String;Landroid/content/res/AssetManager;)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 178
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    :cond_9
    iget-boolean v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsUnderlineTextDecorationSet:Z

    if-eqz v5, :cond_a

    .line 190
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/ReactUnderlineSpan;

    invoke-direct {v10}, Lcom/facebook/react/views/text/ReactUnderlineSpan;-><init>()V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    :cond_a
    iget-boolean v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mIsLineThroughTextDecorationSet:Z

    if-eqz v5, :cond_b

    .line 193
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/ReactStrikethroughSpan;

    invoke-direct {v10}, Lcom/facebook/react/views/text/ReactStrikethroughSpan;-><init>()V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_b
    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    const/4 v10, 0x0

    cmpl-float v5, v5, v10

    if-nez v5, :cond_c

    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    cmpl-float v5, v5, v10

    if-nez v5, :cond_c

    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    cmpl-float v5, v5, v10

    if-eqz v5, :cond_d

    :cond_c
    iget v5, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    .line 198
    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    if-eqz v5, :cond_d

    .line 199
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/ShadowStyleSpan;

    iget v12, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    iget v13, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    iget v14, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    iget v15, v7, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    invoke-direct {v10, v12, v13, v14, v15}, Lcom/facebook/react/views/text/ShadowStyleSpan;-><init>(FFFI)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    :cond_d
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getEffectiveLineHeight()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_e

    .line 210
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v10, Lcom/facebook/react/views/text/CustomLineHeightSpan;

    .line 212
    invoke-virtual {v7}, Lcom/facebook/react/views/text/TextAttributeProps;->getEffectiveLineHeight()F

    move-result v7

    invoke-direct {v10, v7}, Lcom/facebook/react/views/text/CustomLineHeightSpan;-><init>(F)V

    invoke-direct {v5, v6, v8, v10}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    .line 210
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    :cond_e
    new-instance v5, Lcom/facebook/react/views/text/SetSpanOperation;

    new-instance v7, Lcom/facebook/react/views/text/ReactTagSpan;

    invoke-direct {v7, v11}, Lcom/facebook/react/views/text/ReactTagSpan;-><init>(I)V

    invoke-direct {v5, v6, v8, v7}, Lcom/facebook/react/views/text/SetSpanOperation;-><init>(IILcom/facebook/react/views/text/ReactSpan;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

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

    .line 290
    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v4

    .line 291
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

    .line 293
    sget-object v11, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

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

    .line 297
    invoke-static {v11}, Lcom/facebook/yoga/YogaConstants;->isUndefined(F)Z

    move-result v14

    if-nez v14, :cond_5

    cmpg-float v14, v11, v0

    if-gtz v14, :cond_5

    :cond_3
    float-to-double v5, v11

    .line 301
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v5, v5

    .line 302
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v13, :cond_4

    .line 303
    new-instance v8, Landroid/text/StaticLayout;

    sget-object v2, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

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

    .line 313
    :cond_4
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

    .line 314
    invoke-static {p0, v10, v4, v0, v5}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 315
    invoke-static {v0, v1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 316
    invoke-static {v0, v9, v12}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;FF)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 317
    invoke-static {v0, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 318
    invoke-static {v0, v2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 319
    invoke-static {v0, v3}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 320
    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;

    move-result-object v8

    goto/16 :goto_4

    :cond_5
    if-eqz v6, :cond_8

    if-nez v5, :cond_6

    .line 323
    iget v5, v6, Landroid/text/BoringLayout$Metrics;->width:I

    int-to-float v5, v5

    cmpg-float v5, v5, v0

    if-gtz v5, :cond_8

    .line 324
    :cond_6
    iget v0, v6, Landroid/text/BoringLayout$Metrics;->width:I

    .line 325
    iget v2, v6, Landroid/text/BoringLayout$Metrics;->width:I

    if-gez v2, :cond_7

    .line 326
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->TAG:Ljava/lang/String;

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

    .line 332
    :goto_3
    sget-object v3, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

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

    .line 333
    invoke-static/range {v0 .. v7}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;Z)Landroid/text/BoringLayout;

    move-result-object v8

    goto :goto_4

    .line 345
    :cond_8
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v5, v13, :cond_9

    .line 346
    new-instance v8, Landroid/text/StaticLayout;

    sget-object v2, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

    float-to-int v3, v0

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    move-object v0, v8

    move-object v1, p0

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    goto :goto_4

    .line 356
    :cond_9
    sget-object v5, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

    float-to-int v0, v0

    .line 357
    invoke-static {p0, v10, v4, v5, v0}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 358
    invoke-static {v0, v1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 359
    invoke-static {v0, v9, v12}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;FF)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 360
    invoke-static {v0, v7}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 361
    invoke-static {v0, v2}, Landroidx/core/graphics/ColorKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 362
    invoke-static {v0, v3}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 364
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_a

    .line 365
    invoke-static {v0, v8}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/text/StaticLayout$Builder;Z)Landroid/text/StaticLayout$Builder;

    .line 368
    :cond_a
    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/text/StaticLayout$Builder;)Landroid/text/StaticLayout;

    move-result-object v8

    :goto_4
    return-object v8
.end method

.method private static createSpannableFromAttributedString(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;
    .locals 3

    .line 256
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 261
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x2

    .line 263
    invoke-interface {p1, v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object p1

    invoke-static {p0, p1, v0, v1}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->buildSpannableFromFragment(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Landroid/text/SpannableStringBuilder;Ljava/util/List;)V

    const/4 p0, 0x0

    .line 267
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    if-ge p0, p1, :cond_0

    .line 268
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, p0

    add-int/lit8 p1, p1, -0x1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/views/text/SetSpanOperation;

    .line 272
    invoke-virtual {p1, v0, p0}, Lcom/facebook/react/views/text/SetSpanOperation;->execute(Landroid/text/SpannableStringBuilder;I)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 276
    invoke-interface {p2, v0}, Lcom/facebook/react/views/text/ReactTextViewManagerCallback;->onPostProcessSpannable(Landroid/text/Spannable;)V

    :cond_1
    return-object v0
.end method

.method public static deleteCachedSpannableForTag(I)V
    .locals 1

    .line 105
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;
    .locals 4

    const/4 v0, 0x3

    .line 226
    invoke-interface {p1, v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->contains(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 227
    invoke-interface {p1, v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getInt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    .line 228
    sget-object p1, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/text/Spannable;

    goto :goto_1

    .line 230
    :cond_0
    sget-boolean v0, Lcom/facebook/react/config/ReactFeatureFlags;->enableTextSpannableCache:Z

    if-eqz v0, :cond_2

    instance-of v0, p1, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    if-eqz v0, :cond_2

    .line 231
    move-object v0, p1

    check-cast v0, Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    .line 232
    sget-object v1, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sCacheLock:Ljava/lang/Object;

    monitor-enter v1

    .line 233
    :try_start_0
    sget-object v2, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sSpannableCache:Landroid/util/LruCache;

    invoke-virtual {v2, v0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/text/Spannable;

    if-nez v3, :cond_1

    .line 236
    invoke-static {p0, p1, p2}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->createSpannableFromAttributedString(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object p0

    .line 238
    invoke-virtual {v2, v0, p0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    move-object p0, v3

    .line 240
    :goto_0
    monitor-exit v1

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 243
    :cond_2
    invoke-static {p0, p1, p2}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->createSpannableFromAttributedString(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object p0

    :goto_1
    return-object p0
.end method

.method public static isRTL(Lcom/facebook/react/common/mapbuffer/MapBuffer;)Z
    .locals 3

    const/4 v0, 0x2

    .line 109
    invoke-interface {p0, v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object p0

    .line 110
    invoke-interface {p0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 114
    :cond_0
    invoke-interface {p0, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object p0

    const/4 v0, 0x5

    .line 115
    invoke-interface {p0, v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object p0

    const/16 v0, 0x17

    .line 117
    invoke-interface {p0, v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->contains(I)Z

    move-result v2

    if-nez v2, :cond_1

    return v1

    .line 122
    :cond_1
    invoke-interface {p0, v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 121
    invoke-static {p0}, Lcom/facebook/react/views/text/TextAttributeProps;->getLayoutDirection(Ljava/lang/String;)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public static measureLines(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/common/mapbuffer/MapBuffer;F)Lcom/facebook/react/bridge/WritableArray;
    .locals 8

    const/4 v0, 0x0

    .line 572
    invoke-static {p0, p1, v0}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object p1

    .line 573
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

    invoke-static {p1, v0}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    move-result-object v2

    const/4 v1, 0x2

    .line 577
    invoke-interface {p2, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 576
    invoke-static {v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v6

    const/4 v1, 0x4

    .line 579
    invoke-interface {p2, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->contains(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 580
    invoke-interface {p2, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getBoolean(I)Z

    move-result v1

    move v5, v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    const/4 v5, 0x1

    :goto_0
    const/4 v1, 0x5

    .line 584
    invoke-interface {p2, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 583
    invoke-static {p2}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v7

    .line 586
    sget-object v4, Lcom/facebook/yoga/YogaMeasureMode;->EXACTLY:Lcom/facebook/yoga/YogaMeasureMode;

    move-object v1, p1

    move v3, p3

    .line 587
    invoke-static/range {v1 .. v7}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->createLayout(Landroid/text/Spannable;Landroid/text/BoringLayout$Metrics;FLcom/facebook/yoga/YogaMeasureMode;ZII)Landroid/text/Layout;

    move-result-object p2

    .line 595
    invoke-static {p1, p2, v0, p0}, Lcom/facebook/react/views/text/FontMetricsUtil;->getFontMetrics(Ljava/lang/CharSequence;Landroid/text/Layout;Landroid/text/TextPaint;Landroid/content/Context;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p0

    return-object p0
.end method

.method public static measureText(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/common/mapbuffer/MapBuffer;FLcom/facebook/yoga/YogaMeasureMode;FLcom/facebook/yoga/YogaMeasureMode;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;[F)J
    .locals 18

    move-object/from16 v0, p2

    move-object/from16 v8, p4

    move-object/from16 v9, p6

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p7

    .line 387
    invoke-static {v1, v2, v3}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object v10

    if-nez v10, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    const/4 v1, 0x2

    .line 395
    invoke-interface {v0, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 394
    invoke-static {v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v6

    const/4 v1, 0x4

    .line 397
    invoke-interface {v0, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->contains(I)Z

    move-result v2

    const/4 v11, 0x1

    if-eqz v2, :cond_1

    .line 398
    invoke-interface {v0, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getBoolean(I)Z

    move-result v1

    move v5, v1

    goto :goto_0

    :cond_1
    const/4 v5, 0x1

    :goto_0
    const/4 v1, 0x5

    .line 402
    invoke-interface {v0, v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 401
    invoke-static {v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getHyphenationFrequency(Ljava/lang/String;)I

    move-result v7

    .line 404
    sget-object v1, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTextPaintInstance:Landroid/text/TextPaint;

    invoke-static {v10, v1}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    move-result-object v2

    move-object v1, v10

    move/from16 v3, p3

    move-object/from16 v4, p4

    .line 406
    invoke-static/range {v1 .. v7}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->createLayout(Landroid/text/Spannable;Landroid/text/BoringLayout$Metrics;FLcom/facebook/yoga/YogaMeasureMode;ZII)Landroid/text/Layout;

    move-result-object v1

    const/4 v2, 0x0

    .line 416
    invoke-interface {v0, v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->contains(I)Z

    move-result v3

    const/4 v4, -0x1

    if-eqz v3, :cond_2

    .line 417
    invoke-interface {v0, v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getInt(I)I

    move-result v0

    goto :goto_1

    :cond_2
    const/4 v0, -0x1

    :goto_1
    if-eq v0, v4, :cond_4

    if-nez v0, :cond_3

    goto :goto_2

    .line 423
    :cond_3
    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_3

    .line 422
    :cond_4
    :goto_2
    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v0

    .line 428
    :goto_3
    sget-object v3, Lcom/facebook/yoga/YogaMeasureMode;->EXACTLY:Lcom/facebook/yoga/YogaMeasureMode;

    const/16 v5, 0xa

    if-ne v8, v3, :cond_5

    goto :goto_7

    :cond_5
    const/4 v3, 0x0

    const/4 v6, 0x0

    :goto_4
    if-ge v6, v0, :cond_9

    .line 433
    invoke-interface {v10}, Landroid/text/Spannable;->length()I

    move-result v7

    if-lez v7, :cond_6

    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v7

    sub-int/2addr v7, v11

    invoke-interface {v10, v7}, Landroid/text/Spannable;->charAt(I)C

    move-result v7

    if-ne v7, v5, :cond_6

    const/4 v7, 0x1

    goto :goto_5

    :cond_6
    const/4 v7, 0x0

    :goto_5
    if-eqz v7, :cond_7

    .line 435
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineMax(I)F

    move-result v7

    goto :goto_6

    :cond_7
    invoke-virtual {v1, v6}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v7

    :goto_6
    cmpl-float v12, v7, v3

    if-lez v12, :cond_8

    move v3, v7

    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 440
    :cond_9
    sget-object v6, Lcom/facebook/yoga/YogaMeasureMode;->AT_MOST:Lcom/facebook/yoga/YogaMeasureMode;

    if-ne v8, v6, :cond_a

    cmpl-float v6, v3, p3

    if-lez v6, :cond_a

    :goto_7
    move/from16 v3, p3

    .line 448
    :cond_a
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1d

    if-le v6, v7, :cond_b

    float-to-double v6, v3

    .line 449
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-float v3, v6

    .line 453
    :cond_b
    sget-object v6, Lcom/facebook/yoga/YogaMeasureMode;->EXACTLY:Lcom/facebook/yoga/YogaMeasureMode;

    if-eq v9, v6, :cond_c

    sub-int/2addr v0, v11

    .line 454
    invoke-virtual {v1, v0}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v0

    int-to-float v0, v0

    .line 455
    sget-object v6, Lcom/facebook/yoga/YogaMeasureMode;->AT_MOST:Lcom/facebook/yoga/YogaMeasureMode;

    if-ne v9, v6, :cond_d

    cmpl-float v6, v0, p5

    if-lez v6, :cond_d

    :cond_c
    move/from16 v0, p5

    :cond_d
    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 465
    :goto_8
    invoke-interface {v10}, Landroid/text/Spannable;->length()I

    move-result v8

    if-ge v6, v8, :cond_1c

    .line 467
    invoke-interface {v10}, Landroid/text/Spannable;->length()I

    move-result v8

    const-class v9, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    invoke-interface {v10, v6, v8, v9}, Landroid/text/Spannable;->nextSpanTransition(IILjava/lang/Class;)I

    move-result v8

    .line 468
    const-class v9, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    .line 469
    invoke-interface {v10, v6, v8, v9}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;

    .line 470
    array-length v9, v6

    const/4 v12, 0x0

    :goto_9
    if-ge v12, v9, :cond_1b

    aget-object v13, v6, v12

    .line 471
    invoke-interface {v10, v13}, Landroid/text/Spannable;->getSpanStart(Ljava/lang/Object;)I

    move-result v14

    .line 472
    invoke-virtual {v1, v14}, Landroid/text/Layout;->getLineForOffset(I)I

    move-result v15

    .line 473
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getEllipsisCount(I)I

    move-result v16

    if-lez v16, :cond_e

    const/16 v16, 0x1

    goto :goto_a

    :cond_e
    const/16 v16, 0x0

    :goto_a
    if-eqz v16, :cond_10

    .line 478
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineStart(I)I

    move-result v16

    invoke-virtual {v1, v15}, Landroid/text/Layout;->getEllipsisStart(I)I

    move-result v17

    add-int v2, v16, v17

    if-lt v14, v2, :cond_10

    .line 479
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v2

    if-lt v14, v2, :cond_f

    goto :goto_b

    :cond_f
    const/16 v4, 0xa

    const/4 v5, 0x1

    goto/16 :goto_14

    .line 480
    :cond_10
    :goto_b
    invoke-virtual {v13}, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;->getWidth()I

    move-result v2

    int-to-float v2, v2

    .line 481
    invoke-virtual {v13}, Lcom/facebook/react/views/text/TextInlineViewPlaceholderSpan;->getHeight()I

    move-result v13

    int-to-float v13, v13

    .line 483
    invoke-virtual {v1, v14}, Landroid/text/Layout;->isRtlCharAt(I)Z

    move-result v5

    .line 484
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getParagraphDirection(I)I

    move-result v11

    if-ne v11, v4, :cond_11

    const/4 v11, 0x1

    goto :goto_c

    :cond_11
    const/4 v11, 0x0

    .line 489
    :goto_c
    invoke-interface {v10}, Landroid/text/Spannable;->length()I

    move-result v16

    const/16 v17, 0x1

    add-int/lit8 v4, v16, -0x1

    if-ne v14, v4, :cond_16

    .line 491
    invoke-interface {v10}, Landroid/text/Spannable;->length()I

    move-result v4

    if-lez v4, :cond_12

    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v10, v4}, Landroid/text/Spannable;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_13

    const/16 v17, 0x1

    goto :goto_d

    :cond_12
    const/16 v5, 0xa

    :cond_13
    const/16 v17, 0x0

    :goto_d
    if-eqz v17, :cond_14

    .line 492
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineMax(I)F

    move-result v4

    goto :goto_e

    :cond_14
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v4

    :goto_e
    if-eqz v11, :cond_15

    sub-float v2, v3, v4

    goto :goto_f

    .line 499
    :cond_15
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineRight(I)F

    move-result v4

    sub-float v2, v4, v2

    :goto_f
    const/16 v4, 0xa

    goto :goto_13

    :cond_16
    const/16 v4, 0xa

    if-ne v11, v5, :cond_17

    const/16 v17, 0x1

    goto :goto_10

    :cond_17
    const/16 v17, 0x0

    :goto_10
    if-eqz v17, :cond_18

    .line 511
    invoke-virtual {v1, v14}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v14

    goto :goto_11

    .line 512
    :cond_18
    invoke-virtual {v1, v14}, Landroid/text/Layout;->getSecondaryHorizontal(I)F

    move-result v14

    :goto_11
    if-eqz v11, :cond_19

    .line 524
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineRight(I)F

    move-result v11

    sub-float/2addr v11, v14

    sub-float v11, v3, v11

    goto :goto_12

    :cond_19
    move v11, v14

    :goto_12
    if-eqz v5, :cond_1a

    sub-float v2, v11, v2

    goto :goto_13

    :cond_1a
    move v2, v11

    .line 531
    :goto_13
    invoke-virtual {v1, v15}, Landroid/text/Layout;->getLineBaseline(I)I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v13

    mul-int/lit8 v11, v7, 0x2

    .line 536
    invoke-static {v5}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v5

    aput v5, p8, v11

    const/4 v5, 0x1

    add-int/2addr v11, v5

    .line 538
    invoke-static {v2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v2

    aput v2, p8, v11

    add-int/lit8 v7, v7, 0x1

    :goto_14
    add-int/lit8 v12, v12, 0x1

    const/4 v2, 0x0

    const/4 v4, -0x1

    const/16 v5, 0xa

    const/4 v11, 0x1

    goto/16 :goto_9

    :cond_1b
    move v6, v8

    goto/16 :goto_8

    .line 544
    :cond_1c
    invoke-static {v3}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    .line 545
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    .line 563
    invoke-static {v1, v0}, Lcom/facebook/yoga/YogaMeasureOutput;->make(FF)J

    move-result-wide v0

    return-wide v0
.end method

.method public static setCachedSpannabledForTag(ILandroid/text/Spannable;)V
    .locals 1

    .line 98
    sget-object v0, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->sTagToSpannableCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
