.class Lcom/christopherdro/RNPrint/RNPrintModule$1;
.super Ljava/lang/Object;
.source "RNPrintModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/christopherdro/RNPrint/RNPrintModule;->print(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

.field final synthetic val$baseUrl:Ljava/lang/String;

.field final synthetic val$html:Ljava/lang/String;

.field final synthetic val$jobName:Ljava/lang/String;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method constructor <init>(Lcom/christopherdro/RNPrint/RNPrintModule;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 78
    iput-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iput-object p2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$jobName:Ljava/lang/String;

    iput-object p3, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    iput-object p4, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$baseUrl:Ljava/lang/String;

    iput-object p5, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$html:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 82
    new-instance v6, Landroid/webkit/WebView;

    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iget-object v0, v0, Lcom/christopherdro/RNPrint/RNPrintModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-direct {v6, v0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 83
    new-instance v0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;

    invoke-direct {v0, p0}, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;-><init>(Lcom/christopherdro/RNPrint/RNPrintModule$1;)V

    invoke-virtual {v6, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 125
    iget-object v1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$baseUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$html:Ljava/lang/String;

    const-string v3, "text/HTML"

    const-string v4, "UTF-8"

    const/4 v5, 0x0

    move-object v0, v6

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iput-object v6, v0, Lcom/christopherdro/RNPrint/RNPrintModule;->mWebView:Landroid/webkit/WebView;

    return-void
.end method
