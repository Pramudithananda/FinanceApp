.class public Lcom/facebook/react/views/textinput/ReactTextInputManager;
.super Lcom/facebook/react/uimanager/BaseViewManager;
.source "ReactTextInputManager.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "AndroidTextInput"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactSelectionWatcher;,
        Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactContentSizeWatcher;,
        Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactScrollWatcher;,
        Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactTextInputTextWatcher;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/BaseViewManager<",
        "Lcom/facebook/react/views/textinput/ReactEditText;",
        "Lcom/facebook/react/uimanager/LayoutShadowNode;",
        ">;"
    }
.end annotation


# static fields
.field private static final AUTOCAPITALIZE_FLAGS:I = 0x7000

.field private static final BLUR_TEXT_INPUT:I = 0x2

.field private static final DRAWABLE_FIELDS:[Ljava/lang/String;

.field private static final DRAWABLE_RESOURCES:[Ljava/lang/String;

.field private static final EMPTY_FILTERS:[Landroid/text/InputFilter;

.field private static final FOCUS_TEXT_INPUT:I = 0x1

.field private static final IME_ACTION_ID:I = 0x670

.field private static final INPUT_TYPE_KEYBOARD_DECIMAL_PAD:I = 0x2002

.field private static final INPUT_TYPE_KEYBOARD_NUMBERED:I = 0x3002

.field private static final INPUT_TYPE_KEYBOARD_NUMBER_PAD:I = 0x2

.field private static final KEYBOARD_TYPE_DECIMAL_PAD:Ljava/lang/String; = "decimal-pad"

.field private static final KEYBOARD_TYPE_EMAIL_ADDRESS:Ljava/lang/String; = "email-address"

.field private static final KEYBOARD_TYPE_NUMBER_PAD:Ljava/lang/String; = "number-pad"

.field private static final KEYBOARD_TYPE_NUMERIC:Ljava/lang/String; = "numeric"

.field private static final KEYBOARD_TYPE_PHONE_PAD:Ljava/lang/String; = "phone-pad"

.field private static final KEYBOARD_TYPE_URI:Ljava/lang/String; = "url"

.field private static final KEYBOARD_TYPE_VISIBLE_PASSWORD:Ljava/lang/String; = "visible-password"

.field private static final PASSWORD_VISIBILITY_FLAG:I = 0x10

.field public static final REACT_CLASS:Ljava/lang/String; = "AndroidTextInput"

.field private static final REACT_PROPS_AUTOFILL_HINTS_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final SET_MOST_RECENT_EVENT_COUNT:I = 0x3

.field private static final SET_TEXT_AND_SELECTION:I = 0x4

.field private static final SPACING_TYPES:[I

.field public static final TAG:Ljava/lang/String; = "ReactTextInputManager"

.field private static final TX_STATE_KEY_ATTRIBUTED_STRING:S = 0x0s

.field private static final TX_STATE_KEY_HASH:S = 0x2s

.field private static final TX_STATE_KEY_MOST_RECENT_EVENT_COUNT:S = 0x3s

.field private static final TX_STATE_KEY_PARAGRAPH_ATTRIBUTES:S = 0x1s

.field private static final UNSET:I = -0x1


# instance fields
.field protected mReactTextViewManagerCallback:Lcom/facebook/react/views/text/ReactTextViewManagerCallback;


# direct methods
.method static bridge synthetic -$$Nest$smgetEventDispatcher(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)Lcom/facebook/react/uimanager/events/EventDispatcher;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->getEventDispatcher(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x3

    const/16 v2, 0x8

    const/4 v3, 0x0

    const/4 v4, 0x2

    .line 96
    filled-new-array {v2, v3, v4, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->SPACING_TYPES:[I

    .line 99
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputManager$1;

    invoke-direct {v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager$1;-><init>()V

    sput-object v0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->REACT_PROPS_AUTOFILL_HINTS_MAP:Ljava/util/Map;

    new-array v0, v3, [Landroid/text/InputFilter;

    .line 169
    sput-object v0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->EMPTY_FILTERS:[Landroid/text/InputFilter;

    const-string v0, "mSelectHandleRight"

    const-string v1, "mSelectHandleCenter"

    const-string v2, "mCursorDrawable"

    const-string v3, "mSelectHandleLeft"

    .line 171
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->DRAWABLE_FIELDS:[Ljava/lang/String;

    const-string v0, "mTextSelectHandleRightRes"

    const-string v1, "mTextSelectHandleRes"

    const-string v2, "mCursorDrawableRes"

    const-string v3, "mTextSelectHandleLeftRes"

    .line 174
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->DRAWABLE_RESOURCES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Lcom/facebook/react/uimanager/BaseViewManager;-><init>()V

    return-void
.end method

.method private static checkPasswordType(Lcom/facebook/react/views/textinput/ReactEditText;)V
    .locals 2

    .line 997
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactEditText;->getStagedInputType()I

    move-result v0

    and-int/lit16 v0, v0, 0x3002

    if-eqz v0, :cond_0

    .line 998
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactEditText;->getStagedInputType()I

    move-result v0

    const/16 v1, 0x80

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/16 v0, 0x10

    .line 1000
    invoke-static {p0, v1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateStagedInputTypeFlag(Lcom/facebook/react/views/textinput/ReactEditText;II)V

    :cond_0
    return-void
.end method

.method private static getEventDispatcher(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)Lcom/facebook/react/uimanager/events/EventDispatcher;
    .locals 0

    .line 1012
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getId()I

    move-result p1

    invoke-static {p0, p1}, Lcom/facebook/react/uimanager/UIManagerHelper;->getEventDispatcherForReactTag(Lcom/facebook/react/bridge/ReactContext;I)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object p0

    return-object p0
.end method

.method private getReactTextUpdate(Ljava/lang/String;I)Lcom/facebook/react/views/text/ReactTextUpdate;
    .locals 11

    .line 338
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 339
    sget-object v0, Lcom/facebook/react/views/text/TextTransform;->UNSET:Lcom/facebook/react/views/text/TextTransform;

    invoke-static {p1, v0}, Lcom/facebook/react/views/text/TextTransform;->apply(Ljava/lang/String;Lcom/facebook/react/views/text/TextTransform;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 341
    new-instance p1, Lcom/facebook/react/views/text/ReactTextUpdate;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p1

    move v2, p2

    invoke-direct/range {v0 .. v10}, Lcom/facebook/react/views/text/ReactTextUpdate;-><init>(Landroid/text/Spannable;IZFFFFIII)V

    return-object p1
.end method

.method private varargs setAutofillHints(Lcom/facebook/react/views/textinput/ReactEditText;[Ljava/lang/String;)V
    .locals 2

    .line 449
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    return-void

    .line 452
    :cond_0
    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Lcom/facebook/react/views/textinput/ReactEditText;[Ljava/lang/String;)V

    return-void
.end method

.method private setImportantForAutofill(Lcom/facebook/react/views/textinput/ReactEditText;I)V
    .locals 2

    .line 441
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    return-void

    .line 444
    :cond_0
    invoke-static {p1, p2}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$2(Lcom/facebook/react/views/textinput/ReactEditText;I)V

    return-void
.end method

.method private static shouldHideCursorForEmailTextInput()Z
    .locals 3

    .line 592
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 593
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-ne v1, v2, :cond_0

    const-string v1, "xiaomi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static updateStagedInputTypeFlag(Lcom/facebook/react/views/textinput/ReactEditText;II)V
    .locals 1

    .line 1007
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactEditText;->getStagedInputType()I

    move-result v0

    not-int p1, p1

    and-int/2addr p1, v0

    or-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lcom/facebook/react/views/textinput/ReactEditText;->setStagedInputType(I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Landroid/view/View;)V
    .locals 0

    .line 85
    check-cast p2, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)V

    return-void
.end method

.method protected addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)V
    .locals 1

    .line 1085
    invoke-static {p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->getEventDispatcher(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setEventDispatcher(Lcom/facebook/react/uimanager/events/EventDispatcher;)V

    .line 1086
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactTextInputTextWatcher;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactTextInputTextWatcher;-><init>(Lcom/facebook/react/views/textinput/ReactTextInputManager;Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)V

    invoke-virtual {p2, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1087
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputManager$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager$3;-><init>(Lcom/facebook/react/views/textinput/ReactTextInputManager;Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)V

    invoke-virtual {p2, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 1106
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;

    invoke-direct {v0, p0, p2, p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;-><init>(Lcom/facebook/react/views/textinput/ReactTextInputManager;Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/uimanager/ThemedReactContext;)V

    invoke-virtual {p2, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    return-void
.end method

.method public bridge synthetic createShadowNodeInstance()Lcom/facebook/react/uimanager/ReactShadowNode;
    .locals 1

    .line 85
    invoke-virtual {p0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->createShadowNodeInstance()Lcom/facebook/react/views/text/ReactBaseTextShadowNode;

    move-result-object v0

    return-object v0
.end method

.method public createShadowNodeInstance()Lcom/facebook/react/views/text/ReactBaseTextShadowNode;
    .locals 1

    .line 206
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;

    invoke-direct {v0}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;-><init>()V

    return-object v0
.end method

.method public createShadowNodeInstance(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Lcom/facebook/react/views/text/ReactBaseTextShadowNode;
    .locals 1

    .line 211
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;

    invoke-direct {v0, p1}, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;-><init>(Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)V

    return-object v0
.end method

.method public bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/textinput/ReactEditText;

    move-result-object p1

    return-object p1
.end method

.method public createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/react/views/textinput/ReactEditText;
    .locals 2

    .line 190
    new-instance v0, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-direct {v0, p1}, Lcom/facebook/react/views/textinput/ReactEditText;-><init>(Landroid/content/Context;)V

    .line 191
    invoke-virtual {v0}, Lcom/facebook/react/views/textinput/ReactEditText;->getInputType()I

    move-result p1

    const v1, -0x20001

    and-int/2addr p1, v1

    .line 192
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/textinput/ReactEditText;->setInputType(I)V

    const-string p1, "done"

    .line 193
    invoke-virtual {v0, p1}, Lcom/facebook/react/views/textinput/ReactEditText;->setReturnKeyType(Ljava/lang/String;)V

    .line 198
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p1, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Lcom/facebook/react/views/textinput/ReactEditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getCommandsMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 282
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "focusTextInput"

    const-string v3, "blurTextInput"

    invoke-static {v2, v0, v3, v1}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getExportedCustomBubblingEventTypeConstants()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 224
    invoke-super {p0}, Lcom/facebook/react/uimanager/BaseViewManager;->getExportedCustomBubblingEventTypeConstants()Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_0

    .line 226
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 228
    :cond_0
    invoke-static {}, Lcom/facebook/react/common/MapBuilder;->builder()Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    const-string v2, "onSubmitEditing"

    const-string v3, "onSubmitEditingCapture"

    const-string v4, "bubbled"

    const-string v5, "captured"

    .line 233
    invoke-static {v4, v2, v5, v3}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v3, "phasedRegistrationNames"

    .line 231
    invoke-static {v3, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v6, "topSubmitEditing"

    .line 229
    invoke-virtual {v1, v6, v2}, Lcom/facebook/react/common/MapBuilder$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    const-string v2, "onEndEditing"

    const-string v6, "onEndEditingCapture"

    .line 239
    invoke-static {v4, v2, v5, v6}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 237
    invoke-static {v3, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v6, "topEndEditing"

    .line 235
    invoke-virtual {v1, v6, v2}, Lcom/facebook/react/common/MapBuilder$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    const-string v2, "onTextInput"

    const-string v6, "onTextInputCapture"

    .line 244
    invoke-static {v4, v2, v5, v6}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 242
    invoke-static {v3, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v6, "topTextInput"

    .line 240
    invoke-virtual {v1, v6, v2}, Lcom/facebook/react/common/MapBuilder$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    const-string v2, "onFocus"

    const-string v6, "onFocusCapture"

    .line 249
    invoke-static {v4, v2, v5, v6}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 247
    invoke-static {v3, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v6, "topFocus"

    .line 245
    invoke-virtual {v1, v6, v2}, Lcom/facebook/react/common/MapBuilder$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    const-string v2, "onBlur"

    const-string v6, "onBlurCapture"

    .line 254
    invoke-static {v4, v2, v5, v6}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 252
    invoke-static {v3, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v6, "topBlur"

    .line 250
    invoke-virtual {v1, v6, v2}, Lcom/facebook/react/common/MapBuilder$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    const-string v2, "onKeyPress"

    const-string v6, "onKeyPressCapture"

    .line 259
    invoke-static {v4, v2, v5, v6}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 257
    invoke-static {v3, v2}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    const-string v3, "topKeyPress"

    .line 255
    invoke-virtual {v1, v3, v2}, Lcom/facebook/react/common/MapBuilder$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    .line 260
    invoke-virtual {v1}, Lcom/facebook/react/common/MapBuilder$Builder;->build()Ljava/util/Map;

    move-result-object v1

    .line 227
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object v0
.end method

.method public getExportedCustomDirectEventTypeConstants()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 268
    invoke-super {p0}, Lcom/facebook/react/uimanager/BaseViewManager;->getExportedCustomDirectEventTypeConstants()Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_0

    .line 270
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 272
    :cond_0
    invoke-static {}, Lcom/facebook/react/common/MapBuilder;->builder()Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    sget-object v2, Lcom/facebook/react/views/scroll/ScrollEventType;->SCROLL:Lcom/facebook/react/views/scroll/ScrollEventType;

    .line 274
    invoke-static {v2}, Lcom/facebook/react/views/scroll/ScrollEventType;->getJSEventName(Lcom/facebook/react/views/scroll/ScrollEventType;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "registrationName"

    const-string v4, "onScroll"

    .line 275
    invoke-static {v3, v4}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    .line 273
    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/common/MapBuilder$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/facebook/react/common/MapBuilder$Builder;

    move-result-object v1

    .line 276
    invoke-virtual {v1}, Lcom/facebook/react/common/MapBuilder$Builder;->build()Ljava/util/Map;

    move-result-object v1

    .line 271
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object v0
.end method

.method public getExportedViewConstants()Ljava/util/Map;
    .locals 8

    const-string v0, "none"

    const/4 v1, 0x0

    .line 1288
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "characters"

    const/16 v3, 0x1000

    .line 1290
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "words"

    const/16 v5, 0x2000

    .line 1292
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const-string v6, "sentences"

    const/16 v7, 0x4000

    .line 1294
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 1286
    invoke-static/range {v0 .. v7}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "AutoCapitalizationType"

    .line 1284
    invoke-static {v1, v0}, Lcom/facebook/react/common/MapBuilder;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "AndroidTextInput"

    return-object v0
.end method

.method public getReactTextUpdate(Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/uimanager/ReactStylesDiffMap;Lcom/facebook/react/common/mapbuffer/MapBuffer;)Ljava/lang/Object;
    .locals 6

    .line 1358
    invoke-interface {p3}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const/4 v0, 0x0

    .line 1362
    invoke-interface {p3, v0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object v1

    const/4 v2, 0x1

    .line 1363
    invoke-interface {p3, v2}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getMapBuffer(I)Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object v2

    if-eqz v1, :cond_2

    if-eqz v2, :cond_2

    .line 1371
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->mReactTextViewManagerCallback:Lcom/facebook/react/views/text/ReactTextViewManagerCallback;

    .line 1370
    invoke-static {v3, v1, v4}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/common/mapbuffer/MapBuffer;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object v3

    const/4 v4, 0x2

    .line 1375
    invoke-interface {v2, v4}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1374
    invoke-static {v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v2

    .line 1377
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-ge v4, v5, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Lcom/facebook/react/views/textinput/ReactEditText;)I

    move-result v0

    :goto_0
    const/4 v4, 0x3

    .line 1381
    invoke-interface {p3, v4}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getInt(I)I

    move-result p3

    .line 1383
    invoke-static {v1}, Lcom/facebook/react/views/text/TextLayoutManagerMapBuffer;->isRTL(Lcom/facebook/react/common/mapbuffer/MapBuffer;)Z

    move-result v1

    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getGravityHorizontal()I

    move-result p1

    .line 1382
    invoke-static {p2, v1, p1}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextAlignment(Lcom/facebook/react/uimanager/ReactStylesDiffMap;ZI)I

    move-result p1

    .line 1385
    invoke-static {p2, v0}, Lcom/facebook/react/views/text/TextAttributeProps;->getJustificationMode(Lcom/facebook/react/uimanager/ReactStylesDiffMap;I)I

    move-result p2

    .line 1379
    invoke-static {v3, p3, p1, v2, p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->buildReactTextUpdateFromState(Landroid/text/Spannable;IIII)Lcom/facebook/react/views/text/ReactTextUpdate;

    move-result-object p1

    return-object p1

    .line 1365
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Invalid TextInput State (MapBuffer) was received as a parameters"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getShadowNodeClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/facebook/react/uimanager/LayoutShadowNode;",
            ">;"
        }
    .end annotation

    .line 216
    const-class v0, Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;

    return-object v0
.end method

.method protected bridge synthetic onAfterUpdateTransaction(Landroid/view/View;)V
    .locals 0

    .line 85
    check-cast p1, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {p0, p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->onAfterUpdateTransaction(Lcom/facebook/react/views/textinput/ReactEditText;)V

    return-void
.end method

.method protected onAfterUpdateTransaction(Lcom/facebook/react/views/textinput/ReactEditText;)V
    .locals 0

    .line 990
    invoke-super {p0, p1}, Lcom/facebook/react/uimanager/BaseViewManager;->onAfterUpdateTransaction(Landroid/view/View;)V

    .line 991
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->maybeUpdateTypeface()V

    .line 992
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->commitStagedInputType()V

    return-void
.end method

.method public bridge synthetic receiveCommand(Landroid/view/View;ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 85
    check-cast p1, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->receiveCommand(Lcom/facebook/react/views/textinput/ReactEditText;ILcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public bridge synthetic receiveCommand(Landroid/view/View;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 85
    check-cast p1, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->receiveCommand(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public receiveCommand(Lcom/facebook/react/views/textinput/ReactEditText;ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 1

    const/4 v0, 0x1

    if-eq p2, v0, :cond_2

    const/4 v0, 0x2

    if-eq p2, v0, :cond_1

    const/4 v0, 0x4

    if-eq p2, v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p2, "setTextAndSelection"

    .line 299
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->receiveCommand(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_0

    :cond_1
    const-string p2, "blur"

    .line 293
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->receiveCommand(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_0

    :cond_2
    const-string p2, "focus"

    .line 290
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->receiveCommand(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    :goto_0
    return-void
.end method

.method public receiveCommand(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 6

    .line 307
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, -0x1

    sparse-switch v0, :sswitch_data_0

    :goto_0
    const/4 p2, -0x1

    goto :goto_1

    :sswitch_0
    const-string v0, "focusTextInput"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x4

    goto :goto_1

    :sswitch_1
    const-string v0, "setTextAndSelection"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 p2, 0x3

    goto :goto_1

    :sswitch_2
    const-string v0, "focus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    goto :goto_0

    :cond_2
    const/4 p2, 0x2

    goto :goto_1

    :sswitch_3
    const-string v0, "blur"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3

    goto :goto_0

    :cond_3
    const/4 p2, 0x1

    goto :goto_1

    :sswitch_4
    const-string v0, "blurTextInput"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    goto :goto_0

    :cond_4
    const/4 p2, 0x0

    :goto_1
    packed-switch p2, :pswitch_data_0

    goto :goto_2

    .line 317
    :pswitch_0
    invoke-interface {p3, v3}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result p2

    if-ne p2, v5, :cond_5

    return-void

    .line 322
    :cond_5
    invoke-interface {p3, v2}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v0

    .line 323
    invoke-interface {p3, v1}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v1

    if-ne v1, v5, :cond_6

    move v1, v0

    .line 328
    :cond_6
    invoke-interface {p3, v4}, Lcom/facebook/react/bridge/ReadableArray;->isNull(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 329
    invoke-interface {p3, v4}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 330
    invoke-direct {p0, p3, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->getReactTextUpdate(Ljava/lang/String;I)Lcom/facebook/react/views/text/ReactTextUpdate;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/facebook/react/views/textinput/ReactEditText;->maybeSetTextFromJS(Lcom/facebook/react/views/text/ReactTextUpdate;)V

    .line 332
    :cond_7
    invoke-virtual {p1, p2, v0, v1}, Lcom/facebook/react/views/textinput/ReactEditText;->maybeSetSelection(III)V

    goto :goto_2

    .line 310
    :pswitch_1
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->requestFocusFromJS()V

    goto :goto_2

    .line 314
    :pswitch_2
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->clearFocusFromJS()V

    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x654a360a -> :sswitch_4
        0x2e3067 -> :sswitch_3
        0x5d154d8 -> :sswitch_2
        0x550e73c4 -> :sswitch_1
        0x64c614a5 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setAllowFontScaling(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = true
        name = "allowFontScaling"
    .end annotation

    .line 502
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setAllowFontScaling(Z)V

    return-void
.end method

.method public setAutoCapitalize(Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/bridge/Dynamic;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "autoCapitalize"
    .end annotation

    .line 836
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->getType()Lcom/facebook/react/bridge/ReadableType;

    move-result-object v0

    sget-object v1, Lcom/facebook/react/bridge/ReadableType;->Number:Lcom/facebook/react/bridge/ReadableType;

    if-ne v0, v1, :cond_0

    .line 837
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->asInt()I

    move-result p2

    goto :goto_0

    .line 838
    :cond_0
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->getType()Lcom/facebook/react/bridge/ReadableType;

    move-result-object v0

    sget-object v1, Lcom/facebook/react/bridge/ReadableType;->String:Lcom/facebook/react/bridge/ReadableType;

    const/16 v2, 0x4000

    if-ne v0, v1, :cond_4

    .line 839
    invoke-interface {p2}, Lcom/facebook/react/bridge/Dynamic;->asString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "none"

    .line 841
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p2, 0x0

    goto :goto_0

    :cond_1
    const-string v0, "characters"

    .line 843
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 p2, 0x1000

    goto :goto_0

    :cond_2
    const-string v0, "words"

    .line 845
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/16 p2, 0x2000

    goto :goto_0

    :cond_3
    const-string v0, "sentences"

    .line 847
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    :cond_4
    const/16 p2, 0x4000

    :goto_0
    const/16 v0, 0x7000

    .line 852
    invoke-static {p1, v0, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateStagedInputTypeFlag(Lcom/facebook/react/views/textinput/ReactEditText;II)V

    return-void
.end method

.method public setAutoCorrect(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Boolean;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "autoCorrect"
    .end annotation

    if-eqz p2, :cond_1

    .line 804
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    const p2, 0x8000

    goto :goto_0

    :cond_0
    const/high16 p2, 0x80000

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    const v0, 0x88000

    .line 800
    invoke-static {p1, v0, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateStagedInputTypeFlag(Lcom/facebook/react/views/textinput/ReactEditText;II)V

    return-void
.end method

.method public setAutoFocus(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "autoFocus"
    .end annotation

    .line 939
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setAutoFocus(Z)V

    return-void
.end method

.method public setBorderColor(Lcom/facebook/react/views/textinput/ReactEditText;ILjava/lang/Integer;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactPropGroup;
        customType = "Color"
        names = {
            "borderColor",
            "borderLeftColor",
            "borderRightColor",
            "borderTopColor",
            "borderBottomColor"
        }
    .end annotation

    const/high16 v0, 0x7fc00000    # Float.NaN

    if-nez p3, :cond_0

    const/high16 v1, 0x7fc00000    # Float.NaN

    goto :goto_0

    .line 983
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0xffffff

    and-int/2addr v1, v2

    int-to-float v1, v1

    :goto_0
    if-nez p3, :cond_1

    goto :goto_1

    .line 984
    :cond_1
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    ushr-int/lit8 p3, p3, 0x18

    int-to-float v0, p3

    .line 985
    :goto_1
    sget-object p3, Lcom/facebook/react/views/textinput/ReactTextInputManager;->SPACING_TYPES:[I

    aget p2, p3, p2

    invoke-virtual {p1, p2, v1, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setBorderColor(IFF)V

    return-void
.end method

.method public setBorderRadius(Lcom/facebook/react/views/textinput/ReactEditText;IF)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactPropGroup;
        defaultFloat = NaNf
        names = {
            "borderRadius",
            "borderTopLeftRadius",
            "borderTopRightRadius",
            "borderBottomRightRadius",
            "borderBottomLeftRadius"
        }
    .end annotation

    .line 916
    invoke-static {p3}, Lcom/facebook/yoga/YogaConstants;->isUndefined(F)Z

    move-result v0

    if-nez v0, :cond_0

    .line 917
    invoke-static {p3}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p3

    :cond_0
    if-nez p2, :cond_1

    .line 921
    invoke-virtual {p1, p3}, Lcom/facebook/react/views/textinput/ReactEditText;->setBorderRadius(F)V

    goto :goto_0

    :cond_1
    add-int/lit8 p2, p2, -0x1

    .line 923
    invoke-virtual {p1, p3, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setBorderRadius(FI)V

    :goto_0
    return-void
.end method

.method public setBorderStyle(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "borderStyle"
    .end annotation

    .line 929
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setBorderStyle(Ljava/lang/String;)V

    return-void
.end method

.method public setBorderWidth(Lcom/facebook/react/views/textinput/ReactEditText;IF)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactPropGroup;
        defaultFloat = NaNf
        names = {
            "borderWidth",
            "borderLeftWidth",
            "borderRightWidth",
            "borderTopWidth",
            "borderBottomWidth"
        }
    .end annotation

    .line 966
    invoke-static {p3}, Lcom/facebook/yoga/YogaConstants;->isUndefined(F)Z

    move-result v0

    if-nez v0, :cond_0

    .line 967
    invoke-static {p3}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p3

    .line 969
    :cond_0
    sget-object v0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->SPACING_TYPES:[I

    aget p2, v0, p2

    invoke-virtual {p1, p2, p3}, Lcom/facebook/react/views/textinput/ReactEditText;->setBorderWidth(IF)V

    return-void
.end method

.method public setCaretHidden(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 2
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "caretHidden"
    .end annotation

    .line 598
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getStagedInputType()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    .line 599
    invoke-static {}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->shouldHideCursorForEmailTextInput()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    xor-int/lit8 p2, p2, 0x1

    .line 602
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setCursorVisible(Z)V

    return-void
.end method

.method public setColor(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Integer;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "color"
    .end annotation

    if-nez p2, :cond_2

    .line 625
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/facebook/react/views/text/DefaultStyleValuesUtil;->getDefaultTextColor(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 628
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_1

    .line 630
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 631
    sget-object p2, Lcom/facebook/react/views/textinput/ReactTextInputManager;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not get default text color from View Context: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_1

    .line 635
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, "null"

    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 631
    invoke-static {p2, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 638
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setTextColor(I)V

    :goto_1
    return-void
.end method

.method public setContextMenuHidden(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "contextMenuHidden"
    .end annotation

    .line 608
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputManager$2;

    invoke-direct {v0, p0, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager$2;-><init>(Lcom/facebook/react/views/textinput/ReactTextInputManager;Z)V

    invoke-virtual {p1, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setCursorColor(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Integer;)V
    .locals 8
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "cursorColor"
    .end annotation

    if-nez p2, :cond_0

    return-void

    .line 537
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_2

    .line 538
    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Lcom/facebook/react/views/textinput/ReactEditText;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 540
    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()V

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m()Landroid/graphics/BlendMode;

    move-result-object v1

    invoke-static {p2, v1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(ILandroid/graphics/BlendMode;)Landroid/graphics/BlendModeColorFilter;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 541
    invoke-static {p1, v0}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Lcom/facebook/react/views/textinput/ReactEditText;Landroid/graphics/drawable/Drawable;)V

    :cond_1
    return-void

    .line 546
    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ne v0, v1, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 555
    :goto_0
    sget-object v2, Lcom/facebook/react/views/textinput/ReactTextInputManager;->DRAWABLE_RESOURCES:[Ljava/lang/String;

    array-length v3, v2

    if-ge v1, v3, :cond_6

    .line 557
    :try_start_0
    const-class v3, Landroid/widget/TextView;

    aget-object v4, v2, v1

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x1

    .line 558
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 559
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    if-nez v3, :cond_4

    return-void

    .line 566
    :cond_4
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v3}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 568
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 569
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v3, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 571
    const-class v5, Landroid/widget/TextView;

    const-string v6, "mEditor"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 572
    invoke-virtual {v5, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 573
    invoke-virtual {v5, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 575
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    sget-object v7, Lcom/facebook/react/views/textinput/ReactTextInputManager;->DRAWABLE_FIELDS:[Ljava/lang/String;

    aget-object v7, v7, v1

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 576
    invoke-virtual {v6, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 577
    aget-object v2, v2, v1

    const-string v7, "mCursorDrawableRes"

    if-ne v2, v7, :cond_5

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v3, v2, v0

    aput-object v3, v2, v4

    .line 579
    invoke-virtual {v6, v5, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 581
    :cond_5
    invoke-virtual {v6, v5, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method public setDisableFullscreenUI(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "disableFullscreenUI"
    .end annotation

    .line 896
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setDisableFullscreenUI(Z)V

    return-void
.end method

.method public setEditable(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = true
        name = "editable"
    .end annotation

    .line 734
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setEnabled(Z)V

    return-void
.end method

.method public setFontFamily(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "fontFamily"
    .end annotation

    .line 396
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setFontFamily(Ljava/lang/String;)V

    return-void
.end method

.method public setFontSize(Lcom/facebook/react/views/textinput/ReactEditText;F)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultFloat = 14.0f
        name = "fontSize"
    .end annotation

    .line 391
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setFontSize(F)V

    return-void
.end method

.method public setFontStyle(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "fontStyle"
    .end annotation

    .line 411
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setFontStyle(Ljava/lang/String;)V

    return-void
.end method

.method public setFontVariant(Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "fontVariant"
    .end annotation

    .line 416
    invoke-static {p2}, Lcom/facebook/react/views/text/ReactTypefaceUtils;->parseFontVariant(Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setFontFeatureSettings(Ljava/lang/String;)V

    return-void
.end method

.method public setFontWeight(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "fontWeight"
    .end annotation

    .line 406
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setFontWeight(Ljava/lang/String;)V

    return-void
.end method

.method public setImportantForAutofill(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "importantForAutofill"
    .end annotation

    const-string v0, "no"

    .line 427
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p2, 0x2

    goto :goto_0

    :cond_0
    const-string v0, "noExcludeDescendants"

    .line 429
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p2, 0x8

    goto :goto_0

    :cond_1
    const-string v0, "yes"

    .line 431
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p2, 0x1

    goto :goto_0

    :cond_2
    const-string v0, "yesExcludeDescendants"

    .line 433
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    const/4 p2, 0x4

    goto :goto_0

    :cond_3
    const/4 p2, 0x0

    .line 436
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setImportantForAutofill(Lcom/facebook/react/views/textinput/ReactEditText;I)V

    return-void
.end method

.method public setIncludeFontPadding(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = true
        name = "includeFontPadding"
    .end annotation

    .line 421
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setIncludeFontPadding(Z)V

    return-void
.end method

.method public setInlineImageLeft(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "inlineImageLeft"
    .end annotation

    .line 723
    invoke-static {}, Lcom/facebook/react/views/imagehelper/ResourceDrawableIdHelper;->getInstance()Lcom/facebook/react/views/imagehelper/ResourceDrawableIdHelper;

    move-result-object v0

    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/facebook/react/views/imagehelper/ResourceDrawableIdHelper;->getResourceDrawableId(Landroid/content/Context;Ljava/lang/String;)I

    move-result p2

    const/4 v0, 0x0

    .line 724
    invoke-virtual {p1, p2, v0, v0, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    return-void
.end method

.method public setInlineImagePadding(Lcom/facebook/react/views/textinput/ReactEditText;I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "inlineImagePadding"
    .end annotation

    .line 729
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setCompoundDrawablePadding(I)V

    return-void
.end method

.method public setKeyboardType(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "keyboardType"
    .end annotation

    const-string v0, "numeric"

    .line 858
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p2, 0x3002

    goto :goto_0

    :cond_0
    const-string v0, "number-pad"

    .line 860
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p2, 0x2

    goto :goto_0

    :cond_1
    const-string v0, "decimal-pad"

    .line 862
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 p2, 0x2002

    goto :goto_0

    :cond_2
    const-string v0, "email-address"

    .line 864
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 872
    invoke-static {}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->shouldHideCursorForEmailTextInput()Z

    move-result p2

    if-eqz p2, :cond_3

    const/4 p2, 0x0

    .line 873
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setCursorVisible(Z)V

    :cond_3
    const/16 p2, 0x21

    goto :goto_0

    :cond_4
    const-string v0, "phone-pad"

    .line 875
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 p2, 0x3

    goto :goto_0

    :cond_5
    const-string v0, "visible-password"

    .line 877
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/16 p2, 0x90

    goto :goto_0

    :cond_6
    const-string v0, "url"

    .line 881
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_7

    const/16 p2, 0x10

    goto :goto_0

    :cond_7
    const/4 p2, 0x1

    :goto_0
    const/16 v0, 0xf

    .line 885
    invoke-static {p1, v0, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateStagedInputTypeFlag(Lcom/facebook/react/views/textinput/ReactEditText;II)V

    .line 886
    invoke-static {p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->checkPasswordType(Lcom/facebook/react/views/textinput/ReactEditText;)V

    return-void
.end method

.method public setLetterSpacing(Lcom/facebook/react/views/textinput/ReactEditText;F)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultFloat = 0.0f
        name = "letterSpacing"
    .end annotation

    .line 497
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setLetterSpacingPt(F)V

    return-void
.end method

.method public setMaxFontSizeMultiplier(Lcom/facebook/react/views/textinput/ReactEditText;F)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultFloat = NaNf
        name = "maxFontSizeMultiplier"
    .end annotation

    .line 401
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setMaxFontSizeMultiplier(F)V

    return-void
.end method

.method public setMaxLength(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Integer;)V
    .locals 6
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "maxLength"
    .end annotation

    .line 744
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getFilters()[Landroid/text/InputFilter;

    move-result-object v0

    .line 745
    sget-object v1, Lcom/facebook/react/views/textinput/ReactTextInputManager;->EMPTY_FILTERS:[Landroid/text/InputFilter;

    const/4 v2, 0x0

    if-nez p2, :cond_2

    .line 748
    array-length p2, v0

    if-lez p2, :cond_7

    .line 749
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 750
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 751
    aget-object v3, v0, v2

    instance-of v4, v3, Landroid/text/InputFilter$LengthFilter;

    if-nez v4, :cond_0

    .line 752
    invoke-virtual {p2, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 755
    :cond_1
    invoke-virtual {p2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    .line 756
    invoke-virtual {p2}, Ljava/util/LinkedList;->size()I

    move-result v0

    new-array v0, v0, [Landroid/text/InputFilter;

    invoke-virtual {p2, v0}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Landroid/text/InputFilter;

    move-object v1, p2

    goto :goto_2

    .line 760
    :cond_2
    array-length v1, v0

    const/4 v3, 0x1

    if-lez v1, :cond_6

    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 763
    :goto_1
    array-length v5, v0

    if-ge v1, v5, :cond_4

    .line 764
    aget-object v5, v0, v1

    instance-of v5, v5, Landroid/text/InputFilter$LengthFilter;

    if-eqz v5, :cond_3

    .line 765
    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-direct {v4, v5}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v4, v0, v1

    const/4 v4, 0x1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    if-nez v4, :cond_5

    .line 770
    array-length v1, v0

    add-int/2addr v1, v3

    new-array v1, v1, [Landroid/text/InputFilter;

    .line 771
    array-length v3, v0

    invoke-static {v0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 772
    array-length v2, v0

    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-direct {v3, p2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v3, v0, v2

    move-object v0, v1

    :cond_5
    move-object v1, v0

    goto :goto_2

    :cond_6
    new-array v1, v3, [Landroid/text/InputFilter;

    .line 776
    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-direct {v0, p2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v0, v1, v2

    .line 780
    :cond_7
    :goto_2
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/textinput/ReactEditText;->setFilters([Landroid/text/InputFilter;)V

    return-void
.end method

.method public setMultiline(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 3
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "multiline"
    .end annotation

    const/4 v0, 0x0

    const/high16 v1, 0x20000

    if-eqz p2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/high16 v2, 0x20000

    :goto_0
    if-eqz p2, :cond_1

    const/high16 v0, 0x20000

    .line 812
    :cond_1
    invoke-static {p1, v2, v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateStagedInputTypeFlag(Lcom/facebook/react/views/textinput/ReactEditText;II)V

    return-void
.end method

.method public setNumLines(Lcom/facebook/react/views/textinput/ReactEditText;I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultInt = 0x1
        name = "numberOfLines"
    .end annotation

    .line 739
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setLines(I)V

    return-void
.end method

.method public setOnContentSizeChange(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "onContentSizeChange"
    .end annotation

    if-eqz p2, :cond_0

    .line 472
    new-instance p2, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactContentSizeWatcher;

    invoke-direct {p2, p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactContentSizeWatcher;-><init>(Lcom/facebook/react/views/textinput/ReactEditText;)V

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setContentSizeWatcher(Lcom/facebook/react/views/textinput/ContentSizeWatcher;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 474
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setContentSizeWatcher(Lcom/facebook/react/views/textinput/ContentSizeWatcher;)V

    :goto_0
    return-void
.end method

.method public setOnKeyPress(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "onKeyPress"
    .end annotation

    .line 489
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setOnKeyPress(Z)V

    return-void
.end method

.method public setOnScroll(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "onScroll"
    .end annotation

    if-eqz p2, :cond_0

    .line 481
    new-instance p2, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactScrollWatcher;

    invoke-direct {p2, p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactScrollWatcher;-><init>(Lcom/facebook/react/views/textinput/ReactEditText;)V

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setScrollWatcher(Lcom/facebook/react/views/textinput/ScrollWatcher;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 483
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setScrollWatcher(Lcom/facebook/react/views/textinput/ScrollWatcher;)V

    :goto_0
    return-void
.end method

.method public setOnSelectionChange(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "onSelectionChange"
    .end annotation

    if-eqz p2, :cond_0

    .line 458
    new-instance p2, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactSelectionWatcher;

    invoke-direct {p2, p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager$ReactSelectionWatcher;-><init>(Lcom/facebook/react/views/textinput/ReactEditText;)V

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setSelectionWatcher(Lcom/facebook/react/views/textinput/SelectionWatcher;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 460
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setSelectionWatcher(Lcom/facebook/react/views/textinput/SelectionWatcher;)V

    :goto_0
    return-void
.end method

.method public bridge synthetic setPadding(Landroid/view/View;IIII)V
    .locals 0

    .line 85
    check-cast p1, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual/range {p0 .. p5}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setPadding(Lcom/facebook/react/views/textinput/ReactEditText;IIII)V

    return-void
.end method

.method public setPadding(Lcom/facebook/react/views/textinput/ReactEditText;IIII)V
    .locals 0

    .line 1299
    invoke-virtual {p1, p2, p3, p4, p5}, Lcom/facebook/react/views/textinput/ReactEditText;->setPadding(IIII)V

    return-void
.end method

.method public setPlaceholder(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "placeholder"
    .end annotation

    .line 507
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setPlaceholder(Ljava/lang/String;)V

    return-void
.end method

.method public setPlaceholderTextColor(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "placeholderTextColor"
    .end annotation

    if-nez p2, :cond_0

    .line 513
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/facebook/react/views/text/DefaultStyleValuesUtil;->getDefaultTextColorHint(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_0

    .line 515
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setHintTextColor(I)V

    :goto_0
    return-void
.end method

.method public setReturnKeyLabel(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "returnKeyLabel"
    .end annotation

    const/16 v0, 0x670

    .line 903
    invoke-virtual {p1, p2, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    return-void
.end method

.method public setReturnKeyType(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "returnKeyType"
    .end annotation

    .line 891
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setReturnKeyType(Ljava/lang/String;)V

    return-void
.end method

.method public setSecureTextEntry(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "secureTextEntry"
    .end annotation

    if-eqz p2, :cond_0

    const/16 p2, 0x80

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    const/16 v0, 0x90

    .line 820
    invoke-static {p1, v0, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateStagedInputTypeFlag(Lcom/facebook/react/views/textinput/ReactEditText;II)V

    .line 826
    invoke-static {p1}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->checkPasswordType(Lcom/facebook/react/views/textinput/ReactEditText;)V

    return-void
.end method

.method public setSelectTextOnFocus(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = false
        name = "selectTextOnFocus"
    .end annotation

    .line 618
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setSelectAllOnFocus(Z)V

    return-void
.end method

.method public setSelectionColor(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Integer;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "selectionColor"
    .end annotation

    if-nez p2, :cond_0

    .line 523
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/react/views/text/DefaultStyleValuesUtil;->getDefaultTextColorHighlight(Landroid/content/Context;)I

    move-result v0

    .line 522
    invoke-virtual {p1, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setHighlightColor(I)V

    goto :goto_0

    .line 525
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setHighlightColor(I)V

    .line 528
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setCursorColor(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Integer;)V

    return-void
.end method

.method public setSubmitBehavior(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "submitBehavior"
    .end annotation

    .line 466
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setSubmitBehavior(Ljava/lang/String;)V

    return-void
.end method

.method public setTextAlign(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 5
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "textAlign"
    .end annotation

    const-string v0, "justify"

    .line 679
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x3

    const/16 v3, 0x1a

    if-eqz v0, :cond_1

    .line 680
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p2, v3, :cond_0

    .line 681
    invoke-static {p1, v1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Lcom/facebook/react/views/textinput/ReactEditText;I)V

    .line 683
    :cond_0
    invoke-virtual {p1, v2}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityHorizontal(I)V

    goto :goto_1

    .line 685
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v4, 0x0

    if-lt v0, v3, :cond_2

    .line 686
    invoke-static {p1, v4}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Lcom/facebook/react/views/textinput/ReactEditText;I)V

    :cond_2
    if-eqz p2, :cond_7

    const-string v0, "auto"

    .line 689
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    :cond_3
    const-string v0, "left"

    .line 691
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 692
    invoke-virtual {p1, v2}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityHorizontal(I)V

    goto :goto_1

    :cond_4
    const-string v0, "right"

    .line 693
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 p2, 0x5

    .line 694
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityHorizontal(I)V

    goto :goto_1

    :cond_5
    const-string v0, "center"

    .line 695
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 696
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityHorizontal(I)V

    goto :goto_1

    .line 698
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid textAlign: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "ReactNative"

    invoke-static {v0, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    invoke-virtual {p1, v4}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityHorizontal(I)V

    goto :goto_1

    .line 690
    :cond_7
    :goto_0
    invoke-virtual {p1, v4}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityHorizontal(I)V

    :goto_1
    return-void
.end method

.method public setTextAlignVertical(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "textAlignVertical"
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_4

    const-string v1, "auto"

    .line 706
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "top"

    .line 708
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 p2, 0x30

    .line 709
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityVertical(I)V

    goto :goto_1

    :cond_1
    const-string v1, "bottom"

    .line 710
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 p2, 0x50

    .line 711
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityVertical(I)V

    goto :goto_1

    :cond_2
    const-string v1, "center"

    .line 712
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 p2, 0x10

    .line 713
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityVertical(I)V

    goto :goto_1

    .line 715
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid textAlignVertical: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "ReactNative"

    invoke-static {v1, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 716
    invoke-virtual {p1, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityVertical(I)V

    goto :goto_1

    .line 707
    :cond_4
    :goto_0
    invoke-virtual {p1, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setGravityVertical(I)V

    :goto_1
    return-void
.end method

.method public setTextContentType(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "autoComplete"
    .end annotation

    const/4 v0, 0x2

    if-nez p2, :cond_0

    .line 786
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setImportantForAutofill(Lcom/facebook/react/views/textinput/ReactEditText;I)V

    goto :goto_0

    :cond_0
    const-string v1, "off"

    .line 787
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 788
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setImportantForAutofill(Lcom/facebook/react/views/textinput/ReactEditText;I)V

    goto :goto_0

    .line 789
    :cond_1
    sget-object v1, Lcom/facebook/react/views/textinput/ReactTextInputManager;->REACT_PROPS_AUTOFILL_HINTS_MAP:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 790
    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setAutofillHints(Lcom/facebook/react/views/textinput/ReactEditText;[Ljava/lang/String;)V

    goto :goto_0

    .line 792
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid autoComplete: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "ReactNative"

    invoke-static {v1, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 793
    invoke-direct {p0, p1, v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setImportantForAutofill(Lcom/facebook/react/views/textinput/ReactEditText;I)V

    :goto_0
    return-void
.end method

.method public setTextDecorationLine(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/String;)V
    .locals 4
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "textDecorationLine"
    .end annotation

    .line 945
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getPaintFlags()I

    move-result v0

    and-int/lit8 v0, v0, -0x19

    .line 944
    invoke-virtual {p1, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->setPaintFlags(I)V

    const-string v0, " "

    .line 947
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p2, v1

    const-string v3, "underline"

    .line 948
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 949
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getPaintFlags()I

    move-result v2

    or-int/lit8 v2, v2, 0x8

    invoke-virtual {p1, v2}, Lcom/facebook/react/views/textinput/ReactEditText;->setPaintFlags(I)V

    goto :goto_1

    :cond_0
    const-string v3, "line-through"

    .line 950
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 951
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getPaintFlags()I

    move-result v2

    or-int/lit8 v2, v2, 0x10

    invoke-virtual {p1, v2}, Lcom/facebook/react/views/textinput/ReactEditText;->setPaintFlags(I)V

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setUnderlineColor(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Integer;)V
    .locals 4
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        customType = "Color"
        name = "underlineColorAndroid"
    .end annotation

    .line 646
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 653
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 655
    :try_start_0
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 657
    sget-object v2, Lcom/facebook/react/views/textinput/ReactTextInputManager;->TAG:Ljava/lang/String;

    const-string v3, "NullPointerException when setting underlineColorAndroid for TextInput"

    invoke-static {v2, v3, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    if-nez p2, :cond_2

    .line 662
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    goto :goto_1

    .line 666
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ne v1, v2, :cond_3

    const/4 v1, 0x3

    .line 667
    invoke-virtual {p1, v1}, Lcom/facebook/react/views/textinput/ReactEditText;->getBorderColor(I)I

    move-result v1

    const/4 v2, 0x4

    .line 668
    invoke-virtual {p0, p1, v2, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setBorderColor(Lcom/facebook/react/views/textinput/ReactEditText;ILjava/lang/Integer;)V

    .line 669
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 670
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, v2, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->setBorderColor(Lcom/facebook/react/views/textinput/ReactEditText;ILjava/lang/Integer;)V

    goto :goto_1

    .line 672
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :goto_1
    return-void
.end method

.method public showKeyboardOnFocus(Lcom/facebook/react/views/textinput/ReactEditText;Z)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultBoolean = true
        name = "showSoftInputOnFocus"
    .end annotation

    .line 934
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->setShowSoftInputOnFocus(Z)V

    return-void
.end method

.method public bridge synthetic updateExtraData(Landroid/view/View;Ljava/lang/Object;)V
    .locals 0

    .line 85
    check-cast p1, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateExtraData(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Object;)V

    return-void
.end method

.method public updateExtraData(Lcom/facebook/react/views/textinput/ReactEditText;Ljava/lang/Object;)V
    .locals 5

    .line 347
    instance-of v0, p2, Lcom/facebook/react/views/text/ReactTextUpdate;

    if-eqz v0, :cond_a

    .line 348
    check-cast p2, Lcom/facebook/react/views/text/ReactTextUpdate;

    .line 351
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->getPaddingLeft()F

    move-result v0

    float-to-int v0, v0

    .line 352
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->getPaddingTop()F

    move-result v1

    float-to-int v1, v1

    .line 353
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->getPaddingRight()F

    move-result v2

    float-to-int v2, v2

    .line 354
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->getPaddingBottom()F

    move-result v3

    float-to-int v3, v3

    const/4 v4, -0x1

    if-ne v0, v4, :cond_0

    if-ne v1, v4, :cond_0

    if-ne v2, v4, :cond_0

    if-eq v3, v4, :cond_5

    :cond_0
    if-eq v0, v4, :cond_1

    goto :goto_0

    .line 360
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getPaddingLeft()I

    move-result v0

    :goto_0
    if-eq v1, v4, :cond_2

    goto :goto_1

    .line 361
    :cond_2
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getPaddingTop()I

    move-result v1

    :goto_1
    if-eq v2, v4, :cond_3

    goto :goto_2

    .line 362
    :cond_3
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getPaddingRight()I

    move-result v2

    :goto_2
    if-eq v3, v4, :cond_4

    goto :goto_3

    .line 363
    :cond_4
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getPaddingBottom()I

    move-result v3

    .line 359
    :goto_3
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/facebook/react/views/textinput/ReactEditText;->setPadding(IIII)V

    .line 366
    :cond_5
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->containsImages()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 367
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->getText()Landroid/text/Spannable;

    move-result-object v0

    .line 368
    invoke-static {v0, p1}, Lcom/facebook/react/views/text/TextInlineImageSpan;->possiblyUpdateInlineImageSpans(Landroid/text/Spannable;Landroid/widget/TextView;)V

    .line 372
    :cond_6
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getSelectionStart()I

    move-result v0

    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getSelectionEnd()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    goto :goto_4

    :cond_7
    const/4 v0, 0x0

    :goto_4
    if-eqz v0, :cond_9

    .line 378
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-nez v0, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v2

    .line 379
    :goto_5
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getSelectionStart()I

    move-result v0

    sub-int/2addr v2, v0

    .line 380
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->getText()Landroid/text/Spannable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v0

    sub-int v4, v0, v2

    move v0, v4

    goto :goto_6

    :cond_9
    const/4 v0, -0x1

    .line 384
    :goto_6
    invoke-virtual {p1, p2}, Lcom/facebook/react/views/textinput/ReactEditText;->maybeSetTextFromState(Lcom/facebook/react/views/text/ReactTextUpdate;)V

    .line 385
    invoke-virtual {p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->getJsEventCounter()I

    move-result p2

    invoke-virtual {p1, p2, v4, v0}, Lcom/facebook/react/views/textinput/ReactEditText;->maybeSetSelection(III)V

    :cond_a
    return-void
.end method

.method public bridge synthetic updateState(Landroid/view/View;Lcom/facebook/react/uimanager/ReactStylesDiffMap;Lcom/facebook/react/uimanager/StateWrapper;)Ljava/lang/Object;
    .locals 0

    .line 85
    check-cast p1, Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->updateState(Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/uimanager/ReactStylesDiffMap;Lcom/facebook/react/uimanager/StateWrapper;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public updateState(Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/uimanager/ReactStylesDiffMap;Lcom/facebook/react/uimanager/StateWrapper;)Ljava/lang/Object;
    .locals 6

    .line 1309
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getStateWrapper()Lcom/facebook/react/uimanager/StateWrapper;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1315
    invoke-virtual {p1, v1, v1, v1, v1}, Lcom/facebook/react/views/textinput/ReactEditText;->setPadding(IIII)V

    .line 1318
    :cond_0
    invoke-virtual {p1, p3}, Lcom/facebook/react/views/textinput/ReactEditText;->setStateWrapper(Lcom/facebook/react/uimanager/StateWrapper;)V

    .line 1320
    invoke-interface {p3}, Lcom/facebook/react/uimanager/StateWrapper;->getStateDataMapBuffer()Lcom/facebook/react/common/mapbuffer/ReadableMapBuffer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1322
    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->getReactTextUpdate(Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/uimanager/ReactStylesDiffMap;Lcom/facebook/react/common/mapbuffer/MapBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1325
    :cond_1
    invoke-interface {p3}, Lcom/facebook/react/uimanager/StateWrapper;->getStateData()Lcom/facebook/react/bridge/ReadableNativeMap;

    move-result-object p3

    if-eqz p3, :cond_5

    const-string v0, "attributedString"

    .line 1326
    invoke-virtual {p3, v0}, Lcom/facebook/react/bridge/ReadableNativeMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_1

    .line 1330
    :cond_2
    invoke-virtual {p3, v0}, Lcom/facebook/react/bridge/ReadableNativeMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableNativeMap;

    move-result-object v0

    const-string v2, "paragraphAttributes"

    .line 1331
    invoke-virtual {p3, v2}, Lcom/facebook/react/bridge/ReadableNativeMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableNativeMap;

    move-result-object v2

    if-eqz v0, :cond_4

    if-eqz v2, :cond_4

    .line 1338
    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager;->mReactTextViewManagerCallback:Lcom/facebook/react/views/text/ReactTextViewManagerCallback;

    .line 1337
    invoke-static {v3, v0, v4}, Lcom/facebook/react/views/text/TextLayoutManager;->getOrCreateSpannableForText(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/views/text/ReactTextViewManagerCallback;)Landroid/text/Spannable;

    move-result-object v3

    const-string v4, "textBreakStrategy"

    .line 1342
    invoke-interface {v2, v4}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1341
    invoke-static {v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextBreakStrategy(Ljava/lang/String;)I

    move-result v2

    .line 1344
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-ge v4, v5, :cond_3

    goto :goto_0

    :cond_3
    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m$1(Lcom/facebook/react/views/textinput/ReactEditText;)I

    move-result v1

    :goto_0
    const-string v4, "mostRecentEventCount"

    .line 1348
    invoke-virtual {p3, v4}, Lcom/facebook/react/bridge/ReadableNativeMap;->getInt(Ljava/lang/String;)I

    move-result p3

    .line 1350
    invoke-static {v0}, Lcom/facebook/react/views/text/TextLayoutManager;->isRTL(Lcom/facebook/react/bridge/ReadableMap;)Z

    move-result v0

    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->getGravityHorizontal()I

    move-result p1

    .line 1349
    invoke-static {p2, v0, p1}, Lcom/facebook/react/views/text/TextAttributeProps;->getTextAlignment(Lcom/facebook/react/uimanager/ReactStylesDiffMap;ZI)I

    move-result p1

    .line 1352
    invoke-static {p2, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getJustificationMode(Lcom/facebook/react/uimanager/ReactStylesDiffMap;I)I

    move-result p2

    .line 1346
    invoke-static {v3, p3, p1, v2, p2}, Lcom/facebook/react/views/text/ReactTextUpdate;->buildReactTextUpdateFromState(Landroid/text/Spannable;IIII)Lcom/facebook/react/views/text/ReactTextUpdate;

    move-result-object p1

    return-object p1

    .line 1333
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Invalid TextInput State was received as a parameters"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method
