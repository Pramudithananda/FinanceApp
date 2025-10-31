.class Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;
.super Landroid/print/PrintDocumentAdapter;
.source "RNPrintModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final mWrappedInstance:Landroid/print/PrintDocumentAdapter;

.field final synthetic this$2:Lcom/christopherdro/RNPrint/RNPrintModule$1$1;


# direct methods
.method constructor <init>(Lcom/christopherdro/RNPrint/RNPrintModule$1$1;)V
    .locals 1

    .line 94
    iput-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->this$2:Lcom/christopherdro/RNPrint/RNPrintModule$1$1;

    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter;-><init>()V

    .line 95
    iget-object v0, p1, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    iget-object v0, v0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iget-object v0, v0, Lcom/christopherdro/RNPrint/RNPrintModule;->mWebView:Landroid/webkit/WebView;

    iget-object p1, p1, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    iget-object p1, p1, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$jobName:Ljava/lang/String;

    .line 96
    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->createPrintDocumentAdapter(Ljava/lang/String;)Landroid/print/PrintDocumentAdapter;

    move-result-object p1

    iput-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->mWrappedInstance:Landroid/print/PrintDocumentAdapter;

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .line 115
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->mWrappedInstance:Landroid/print/PrintDocumentAdapter;

    invoke-virtual {v0}, Landroid/print/PrintDocumentAdapter;->onFinish()V

    .line 116
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->this$2:Lcom/christopherdro/RNPrint/RNPrintModule$1$1;

    iget-object v0, v0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    iget-object v0, v0, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    iget-object v1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->this$2:Lcom/christopherdro/RNPrint/RNPrintModule$1$1;

    iget-object v1, v1, Lcom/christopherdro/RNPrint/RNPrintModule$1$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$1;

    iget-object v1, v1, Lcom/christopherdro/RNPrint/RNPrintModule$1;->val$jobName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V
    .locals 6

    .line 105
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->mWrappedInstance:Landroid/print/PrintDocumentAdapter;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/print/PrintDocumentAdapter;->onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->mWrappedInstance:Landroid/print/PrintDocumentAdapter;

    invoke-virtual {v0}, Landroid/print/PrintDocumentAdapter;->onStart()V

    return-void
.end method

.method public onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$1$1$1;->mWrappedInstance:Landroid/print/PrintDocumentAdapter;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/print/PrintDocumentAdapter;->onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V

    return-void
.end method
