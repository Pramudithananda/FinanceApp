.class Lcom/facebook/react/views/textinput/ReactTextInputManager$4;
.super Ljava/lang/Object;
.source "ReactTextInputManager.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/views/textinput/ReactTextInputManager;->addEventEmitters(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/views/textinput/ReactTextInputManager;

.field final synthetic val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

.field final synthetic val$reactContext:Lcom/facebook/react/uimanager/ThemedReactContext;


# direct methods
.method constructor <init>(Lcom/facebook/react/views/textinput/ReactTextInputManager;Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/uimanager/ThemedReactContext;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1107
    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->this$0:Lcom/facebook/react/views/textinput/ReactTextInputManager;

    iput-object p2, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    iput-object p3, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$reactContext:Lcom/facebook/react/uimanager/ThemedReactContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 7

    and-int/lit16 p1, p2, 0xff

    const/4 p3, 0x1

    if-nez p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    return p3

    .line 1111
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {p1}, Lcom/facebook/react/views/textinput/ReactEditText;->isMultiline()Z

    move-result p1

    .line 1113
    iget-object v0, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {v0}, Lcom/facebook/react/views/textinput/ReactEditText;->shouldSubmitOnReturn()Z

    move-result v0

    .line 1114
    iget-object v1, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {v1}, Lcom/facebook/react/views/textinput/ReactEditText;->shouldBlurOnReturn()Z

    move-result v1

    if-eqz v0, :cond_2

    .line 1124
    iget-object v2, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$reactContext:Lcom/facebook/react/uimanager/ThemedReactContext;

    iget-object v3, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-static {v2, v3}, Lcom/facebook/react/views/textinput/ReactTextInputManager;->-$$Nest$smgetEventDispatcher(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/views/textinput/ReactEditText;)Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v2

    .line 1125
    new-instance v3, Lcom/facebook/react/views/textinput/ReactTextInputSubmitEditingEvent;

    iget-object v4, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$reactContext:Lcom/facebook/react/uimanager/ThemedReactContext;

    .line 1127
    invoke-virtual {v4}, Lcom/facebook/react/uimanager/ThemedReactContext;->getSurfaceId()I

    move-result v4

    iget-object v5, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    .line 1128
    invoke-virtual {v5}, Lcom/facebook/react/views/textinput/ReactEditText;->getId()I

    move-result v5

    iget-object v6, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    .line 1129
    invoke-virtual {v6}, Lcom/facebook/react/views/textinput/ReactEditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/facebook/react/views/textinput/ReactTextInputSubmitEditingEvent;-><init>(IILjava/lang/String;)V

    .line 1125
    invoke-interface {v2, v3}, Lcom/facebook/react/uimanager/events/EventDispatcher;->dispatchEvent(Lcom/facebook/react/uimanager/events/Event;)V

    :cond_2
    if-eqz v1, :cond_3

    .line 1133
    iget-object v2, p0, Lcom/facebook/react/views/textinput/ReactTextInputManager$4;->val$editText:Lcom/facebook/react/views/textinput/ReactEditText;

    invoke-virtual {v2}, Lcom/facebook/react/views/textinput/ReactEditText;->clearFocus()V

    :cond_3
    if-nez v1, :cond_6

    if-nez v0, :cond_6

    if-nez p1, :cond_4

    goto :goto_1

    :cond_4
    const/4 p1, 0x5

    if-eq p2, p1, :cond_6

    const/4 p1, 0x7

    if-ne p2, p1, :cond_5

    goto :goto_1

    :cond_5
    const/4 p3, 0x0

    :cond_6
    :goto_1
    return p3
.end method
