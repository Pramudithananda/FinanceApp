.class Lcom/christopherdro/RNPrint/RNPrintModule$2;
.super Landroid/print/PrintDocumentAdapter;
.source "RNPrintModule.java"


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

.field final synthetic val$filePath:Ljava/lang/String;

.field final synthetic val$jobName:Ljava/lang/String;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method constructor <init>(Lcom/christopherdro/RNPrint/RNPrintModule;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V
    .locals 0

    .line 139
    iput-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iput-object p2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$filePath:Ljava/lang/String;

    iput-object p3, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$promise:Lcom/facebook/react/bridge/Promise;

    iput-object p4, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$jobName:Ljava/lang/String;

    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$promise:Lcom/facebook/react/bridge/Promise;

    iget-object v1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$jobName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V
    .locals 0

    .line 188
    invoke-virtual {p3}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 189
    invoke-virtual {p4}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutCancelled()V

    return-void

    .line 193
    :cond_0
    new-instance p1, Landroid/print/PrintDocumentInfo$Builder;

    iget-object p2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$jobName:Ljava/lang/String;

    invoke-direct {p1, p2}, Landroid/print/PrintDocumentInfo$Builder;-><init>(Ljava/lang/String;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/print/PrintDocumentInfo$Builder;->setContentType(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/print/PrintDocumentInfo$Builder;->build()Landroid/print/PrintDocumentInfo;

    move-result-object p1

    const/4 p2, 0x1

    .line 195
    invoke-virtual {p4, p1, p2}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFinished(Landroid/print/PrintDocumentInfo;Z)V

    return-void
.end method

.method public onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    .locals 0

    .line 144
    :try_start_0
    iget-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$filePath:Ljava/lang/String;

    invoke-static {p1}, Landroid/webkit/URLUtil;->isValidUrl(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 147
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;

    invoke-direct {p3, p0, p2, p4}, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;-><init>(Lcom/christopherdro/RNPrint/RNPrintModule$2;Landroid/os/ParcelFileDescriptor;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V

    invoke-direct {p1, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 171
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 173
    :cond_0
    new-instance p1, Ljava/io/FileInputStream;

    iget-object p3, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$filePath:Ljava/lang/String;

    invoke-direct {p1, p3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 174
    iget-object p3, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    invoke-static {p3, p2, p4, p1}, Lcom/christopherdro/RNPrint/RNPrintModule;->-$$Nest$mloadAndClose(Lcom/christopherdro/RNPrint/RNPrintModule;Landroid/os/ParcelFileDescriptor;Landroid/print/PrintDocumentAdapter$WriteResultCallback;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 181
    iget-object p2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$promise:Lcom/facebook/react/bridge/Promise;

    iget-object p3, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    invoke-virtual {p3}, Lcom/christopherdro/RNPrint/RNPrintModule;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p3, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 178
    :catch_1
    iget-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$promise:Lcom/facebook/react/bridge/Promise;

    iget-object p2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    invoke-virtual {p2}, Lcom/christopherdro/RNPrint/RNPrintModule;->getName()Ljava/lang/String;

    move-result-object p2

    const-string p3, "File not found"

    invoke-interface {p1, p2, p3}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
