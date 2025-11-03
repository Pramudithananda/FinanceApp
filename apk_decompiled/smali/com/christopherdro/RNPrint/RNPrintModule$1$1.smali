.class Lcom/christopherdro/RNPrint/RNPrintModule$1$1;
.super Landroid/webkit/WebViewClient;
.source "RNPrintModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/christopherdro/RNPrint/RNPrintModule$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;


# direct methods
.method constructor <init>(Lcom/christopherdro/RNPrint/RNPrintModule$1;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .line 91
    iget-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    iget-object p1, p1, Lcom/christopherdro/RNPrint/RNPrintModule$1;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    invoke-static {p1}, Lcom/christopherdro/RNPrint/RNPrintModule;->access$000(Lcom/christopherdro/RNPrint/RNPrintModule;)Landroid/app/Activity;

    move-result-object p1

    const-string p2, "print"

    invoke-virtual {p1, p2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/print/PrintManager;

    .line 94
    new-instance p2, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;

    invoke-direct {p2, p0}, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;-><init>(Lcom/christopherdro/RNPrint/RNPrintModule$1$1;)V

    .line 120
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    iget-object v0, v0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$jobName:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/print/PrintManager;->print(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;Landroid/print/PrintAttributes;)Landroid/print/PrintJob;

    .line 121
    iget-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    iget-object p1, p1, Lcom/christopherdro/RNPrint/RNPrintModule$1;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iput-object v1, p1, Lcom/christopherdro/RNPrint/RNPrintModule;->mWebView:Landroid/webkit/WebView;

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
