.class public Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;
.super Landroidx/core/view/AccessibilityDelegateCompat;
.source "ReactScrollViewAccessibilityDelegate.java"


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Landroidx/core/view/AccessibilityDelegateCompat;-><init>()V

    const-string v0, "ReactScrollViewAccessibilityDelegate"

    .line 23
    iput-object v0, p0, Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;->TAG:Ljava/lang/String;

    return-void
.end method

.method private onInitializeAccessibilityEventInternal(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 9

    .line 54
    sget v0, Lcom/facebook/react/R$id;->accessibility_collection:I

    .line 55
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v0, :cond_7

    const-string v1, "itemCount"

    .line 58
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/view/accessibility/AccessibilityEvent;->setItemCount(I)V

    .line 60
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_7

    .line 61
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    .line 62
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 69
    instance-of v2, v0, Landroid/view/ViewGroup;

    if-nez v2, :cond_0

    return-void

    :cond_0
    const/4 v2, 0x0

    move-object v3, v2

    const/4 v4, 0x0

    .line 73
    :goto_0
    move-object v5, v0

    check-cast v5, Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v4, v6, :cond_7

    .line 74
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 76
    instance-of v6, p1, Lcom/facebook/react/views/scroll/ReactScrollView;

    if-eqz v6, :cond_1

    .line 77
    move-object v6, p1

    check-cast v6, Lcom/facebook/react/views/scroll/ReactScrollView;

    .line 78
    invoke-virtual {v6, v5}, Lcom/facebook/react/views/scroll/ReactScrollView;->isPartiallyScrolledInView(Landroid/view/View;)Z

    move-result v6

    goto :goto_1

    .line 79
    :cond_1
    instance-of v6, p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    if-eqz v6, :cond_7

    .line 80
    move-object v6, p1

    check-cast v6, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 81
    invoke-virtual {v6, v5}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->isPartiallyScrolledInView(Landroid/view/View;)Z

    move-result v6

    .line 85
    :goto_1
    sget v7, Lcom/facebook/react/R$id;->accessibility_collection_item:I

    .line 86
    invoke-virtual {v5, v7}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/facebook/react/bridge/ReadableMap;

    .line 88
    instance-of v8, v5, Landroid/view/ViewGroup;

    if-nez v8, :cond_2

    return-void

    .line 92
    :cond_2
    check-cast v5, Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_3

    if-nez v7, :cond_3

    .line 99
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 101
    sget v8, Lcom/facebook/react/R$id;->accessibility_collection_item:I

    .line 102
    invoke-virtual {v5, v8}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v5, :cond_3

    move-object v7, v5

    :cond_3
    if-eqz v6, :cond_5

    if-eqz v7, :cond_5

    const-string v3, "itemIndex"

    if-nez v2, :cond_4

    .line 111
    invoke-interface {v7, v3}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 113
    :cond_4
    invoke-interface {v7, v3}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :cond_5
    if-eqz v2, :cond_6

    if-eqz v3, :cond_6

    .line 117
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p2, v5}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 118
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p2, v5}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_7
    return-void
.end method

.method private onInitializeAccessibilityNodeInfoInternal(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 4

    .line 127
    invoke-static {p1}, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;->fromViewTag(Landroid/view/View;)Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate;->setRole(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;Landroid/content/Context;)V

    .line 133
    :cond_0
    sget v0, Lcom/facebook/react/R$id;->accessibility_collection:I

    .line 134
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v0, :cond_1

    const-string v1, "rowCount"

    .line 137
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "columnCount"

    .line 138
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "hierarchical"

    .line 139
    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 142
    invoke-static {v1, v2, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;->obtain(IIZ)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;

    move-result-object v0

    .line 144
    invoke-virtual {p2, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionInfo(Ljava/lang/Object;)V

    .line 147
    :cond_1
    instance-of v0, p1, Lcom/facebook/react/views/scroll/ReactScrollView;

    if-eqz v0, :cond_2

    .line 148
    check-cast p1, Lcom/facebook/react/views/scroll/ReactScrollView;

    .line 149
    invoke-virtual {p1}, Lcom/facebook/react/views/scroll/ReactScrollView;->getScrollEnabled()Z

    move-result p1

    invoke-virtual {p2, p1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setScrollable(Z)V

    goto :goto_0

    .line 150
    :cond_2
    instance-of v0, p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    if-eqz v0, :cond_3

    .line 151
    check-cast p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    .line 152
    invoke-virtual {p1}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;->getScrollEnabled()Z

    move-result p1

    invoke-virtual {p2, p1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setScrollable(Z)V

    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 3

    .line 27
    invoke-super {p0, p1, p2}, Landroidx/core/view/AccessibilityDelegateCompat;->onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 28
    instance-of v0, p1, Lcom/facebook/react/views/scroll/ReactScrollView;

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 31
    :cond_0
    iget-object p2, p0, Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/facebook/react/bridge/AssertionException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ReactScrollViewAccessibilityDelegate should only be used with ReactScrollView or ReactHorizontalScrollView, not with class: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/facebook/react/bridge/AssertionException;-><init>(Ljava/lang/String;)V

    .line 31
    invoke-static {p2, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;->onInitializeAccessibilityEventInternal(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    :goto_1
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 3

    .line 41
    invoke-super {p0, p1, p2}, Landroidx/core/view/AccessibilityDelegateCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 42
    instance-of v0, p1, Lcom/facebook/react/views/scroll/ReactScrollView;

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/facebook/react/views/scroll/ReactHorizontalScrollView;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 45
    :cond_0
    iget-object p2, p0, Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/facebook/react/bridge/AssertionException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ReactScrollViewAccessibilityDelegate should only be used with ReactScrollView or ReactHorizontalScrollView, not with class: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/facebook/react/bridge/AssertionException;-><init>(Ljava/lang/String;)V

    .line 45
    invoke-static {p2, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/scroll/ReactScrollViewAccessibilityDelegate;->onInitializeAccessibilityNodeInfoInternal(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    :goto_1
    return-void
.end method
