.class public Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;
.super Lcom/facebook/react/views/text/ReactBaseTextShadowNode;
.source "ReactTextInputShadowNode.java"

# interfaces
.implements Lcom/facebook/yoga/YogaMeasureFunction;


# annotations
.annotation runtime Lcom/facebook/react/common/annotations/VisibleForTesting;
.end annotation


# static fields
.field public static final PROP_PLACEHOLDER:Ljava/lang/String; = "placeholder"
    .annotation runtime Lcom/facebook/react/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field public static final PROP_TEXT:Ljava/lang/String; = "text"
    .annotation runtime Lcom/facebook/react/common/annotations/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field private mInternalEditText:Landroid/widget/EditText;

.field private mLocalData:Lcom/facebook/react/views/textinput/ReactTextInputLocalData;

.field private mMostRecentEventCount:I

.field private mPlaceholder:Ljava/lang/String;

.field private mText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-direct {p0, v0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;-><init>(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)V
    .locals 1

    .line 55
    invoke-direct {p0, p1}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;-><init>(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)V

    const/4 p1, -0x1

    .line 42
    iput p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mMostRecentEventCount:I

    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mText:Ljava/lang/String;

    .line 51
    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mPlaceholder:Ljava/lang/String;

    .line 57
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-ge p1, v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 59
    :goto_0
    iput p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    .line 61
    invoke-direct {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->initMeasureFunction()V

    return-void
.end method

.method private initMeasureFunction()V
    .locals 0

    .line 69
    invoke-virtual {p0, p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->setMeasureFunction(Lcom/facebook/yoga/YogaMeasureFunction;)V

    return-void
.end method


# virtual methods
.method protected createInternalEditText()Landroid/widget/EditText;
    .locals 3

    .line 242
    new-instance v0, Landroidx/appcompat/view/ContextThemeWrapper;

    .line 244
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getThemedContext()Lcom/facebook/react/uimanager/ThemedReactContext;

    move-result-object v1

    sget v2, Lcom/facebook/react/R$style;->Theme_ReactNative_TextInput_DefaultBackground:I

    invoke-direct {v0, v1, v2}, Landroidx/appcompat/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 245
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    return-object v1
.end method

.method public getPlaceholder()Ljava/lang/String;
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mPlaceholder:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public isVirtualAnchor()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isYogaLeafNode()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public measure(Lcom/facebook/yoga/YogaNode;FLcom/facebook/yoga/YogaMeasureMode;FLcom/facebook/yoga/YogaMeasureMode;)J
    .locals 2

    .line 110
    iget-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mInternalEditText:Landroid/widget/EditText;

    invoke-static {p1}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 112
    iget-object v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mLocalData:Lcom/facebook/react/views/textinput/ReactTextInputLocalData;

    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/textinput/ReactTextInputLocalData;->apply(Landroid/widget/EditText;)V

    goto :goto_0

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextAttributes:Lcom/facebook/react/views/text/TextAttributes;

    invoke-virtual {v0}, Lcom/facebook/react/views/text/TextAttributes;->getEffectiveFontSize()I

    move-result v0

    int-to-float v0, v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 117
    iget v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mNumberOfLines:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 118
    iget v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mNumberOfLines:I

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setLines(I)V

    .line 121
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_2

    .line 122
    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/widget/EditText;)I

    move-result v0

    iget v1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    if-eq v0, v1, :cond_2

    .line 123
    iget v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    invoke-static {p1, v0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/widget/EditText;I)V

    .line 128
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getPlaceholder()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 130
    invoke-static {p2, p3}, Lcom/facebook/react/views/view/MeasureUtil;->getMeasureSpec(FLcom/facebook/yoga/YogaMeasureMode;)I

    move-result p2

    .line 131
    invoke-static {p4, p5}, Lcom/facebook/react/views/view/MeasureUtil;->getMeasureSpec(FLcom/facebook/yoga/YogaMeasureMode;)I

    move-result p3

    .line 129
    invoke-virtual {p1, p2, p3}, Landroid/widget/EditText;->measure(II)V

    .line 133
    invoke-virtual {p1}, Landroid/widget/EditText;->getMeasuredWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result p1

    invoke-static {p2, p1}, Lcom/facebook/yoga/YogaMeasureOutput;->make(II)J

    move-result-wide p1

    return-wide p1
.end method

.method public onCollectExtraUpdates(Lcom/facebook/react/uimanager/UIViewOperationQueue;)V
    .locals 13

    .line 203
    invoke-super {p0, p1}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;->onCollectExtraUpdates(Lcom/facebook/react/uimanager/UIViewOperationQueue;)V

    .line 205
    iget v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mMostRecentEventCount:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 206
    new-instance v0, Lcom/facebook/react/views/text/ReactTextUpdate;

    .line 210
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getText()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 208
    invoke-virtual {p0, p0, v1, v3, v2}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->spannedFromShadowNode(Lcom/facebook/react/views/text/ReactBaseTextShadowNode;Ljava/lang/String;ZLcom/facebook/react/uimanager/NativeViewHierarchyOptimizer;)Landroid/text/Spannable;

    move-result-object v1

    iget v4, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mMostRecentEventCount:I

    iget-boolean v5, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mContainsImages:Z

    .line 216
    invoke-virtual {p0, v3}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getPadding(I)F

    move-result v6

    const/4 v2, 0x1

    .line 217
    invoke-virtual {p0, v2}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getPadding(I)F

    move-result v7

    const/4 v2, 0x2

    .line 218
    invoke-virtual {p0, v2}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getPadding(I)F

    move-result v8

    const/4 v2, 0x3

    .line 219
    invoke-virtual {p0, v2}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getPadding(I)F

    move-result v9

    iget v10, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextAlign:I

    iget v11, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    iget v12, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mJustificationMode:I

    move-object v2, v0

    move-object v3, v1

    invoke-direct/range {v2 .. v12}, Lcom/facebook/react/views/text/ReactTextUpdate;-><init>(Landroid/text/Spannable;IZFFFFIII)V

    .line 223
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->getReactTag()I

    move-result v1

    invoke-virtual {p1, v1, v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->enqueueUpdateExtraData(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public setLocalData(Ljava/lang/Object;)V
    .locals 1

    .line 148
    instance-of v0, p1, Lcom/facebook/react/views/textinput/ReactTextInputLocalData;

    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertCondition(Z)V

    .line 149
    check-cast p1, Lcom/facebook/react/views/textinput/ReactTextInputLocalData;

    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mLocalData:Lcom/facebook/react/views/textinput/ReactTextInputLocalData;

    .line 152
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->dirty()V

    return-void
.end method

.method public setMostRecentEventCount(I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "mostRecentEventCount"
    .end annotation

    .line 160
    iput p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mMostRecentEventCount:I

    return-void
.end method

.method public setPadding(IF)V
    .locals 0

    .line 229
    invoke-super {p0, p1, p2}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;->setPadding(IF)V

    .line 230
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->markUpdated()V

    return-void
.end method

.method public setPlaceholder(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "placeholder"
    .end annotation

    .line 175
    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mPlaceholder:Ljava/lang/String;

    .line 176
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->markUpdated()V

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "text"
    .end annotation

    .line 165
    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mText:Ljava/lang/String;

    .line 166
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->markUpdated()V

    return-void
.end method

.method public setTextBreakStrategy(Ljava/lang/String;)V
    .locals 3

    .line 185
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_4

    const-string v1, "simple"

    .line 189
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, "highQuality"

    .line 191
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 p1, 0x1

    .line 192
    iput p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    goto :goto_1

    :cond_2
    const-string v1, "balanced"

    .line 193
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 p1, 0x2

    .line 194
    iput p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    goto :goto_1

    .line 196
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid textBreakStrategy: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "ReactNative"

    invoke-static {v1, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    iput v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    goto :goto_1

    .line 190
    :cond_4
    :goto_0
    iput v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mTextBreakStrategy:I

    :goto_1
    return-void
.end method

.method public setThemedContext(Lcom/facebook/react/uimanager/ThemedReactContext;)V
    .locals 2

    .line 74
    invoke-super {p0, p1}, Lcom/facebook/react/views/text/ReactBaseTextShadowNode;->setThemedContext(Lcom/facebook/react/uimanager/ThemedReactContext;)V

    .line 84
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->createInternalEditText()Landroid/widget/EditText;

    move-result-object p1

    .line 85
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v0

    int-to-float v0, v0

    const/4 v1, 0x4

    invoke-virtual {p0, v1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->setDefaultPadding(IF)V

    .line 86
    invoke-virtual {p1}, Landroid/widget/EditText;->getPaddingTop()I

    move-result v0

    int-to-float v0, v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->setDefaultPadding(IF)V

    .line 87
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v0

    int-to-float v0, v0

    const/4 v1, 0x5

    invoke-virtual {p0, v1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->setDefaultPadding(IF)V

    .line 88
    invoke-virtual {p1}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v0

    int-to-float v0, v0

    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->setDefaultPadding(IF)V

    .line 90
    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mInternalEditText:Landroid/widget/EditText;

    const/4 v0, 0x0

    .line 93
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 97
    iget-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;->mInternalEditText:Landroid/widget/EditText;

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
