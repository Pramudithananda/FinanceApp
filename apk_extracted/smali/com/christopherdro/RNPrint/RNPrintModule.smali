.class public Lcom/christopherdro/RNPrint/RNPrintModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "RNPrintModule.java"


# instance fields
.field final defaultJobName:Ljava/lang/String;

.field mWebView:Landroid/webkit/WebView;

.field reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method static bridge synthetic -$$Nest$mloadAndClose(Lcom/christopherdro/RNPrint/RNPrintModule;Landroid/os/ParcelFileDescriptor;Landroid/print/PrintDocumentAdapter$WriteResultCallback;Ljava/io/InputStream;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/christopherdro/RNPrint/RNPrintModule;->loadAndClose(Landroid/os/ParcelFileDescriptor;Landroid/print/PrintDocumentAdapter$WriteResultCallback;Ljava/io/InputStream;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 1

    .line 51
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    const-string v0, "Document"

    .line 47
    iput-object v0, p0, Lcom/christopherdro/RNPrint/RNPrintModule;->defaultJobName:Ljava/lang/String;

    .line 52
    iput-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method

.method static synthetic access$000(Lcom/christopherdro/RNPrint/RNPrintModule;)Landroid/app/Activity;
    .locals 0

    .line 44
    invoke-virtual {p0}, Lcom/christopherdro/RNPrint/RNPrintModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method private loadAndClose(Landroid/os/ParcelFileDescriptor;Landroid/print/PrintDocumentAdapter$WriteResultCallback;Ljava/io/InputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    const/16 p1, 0x400

    new-array p1, p1, [B

    .line 223
    :goto_0
    invoke-virtual {p3, p1}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    .line 224
    invoke-virtual {v0, p1, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    new-array p1, p1, [Landroid/print/PageRange;

    .line 227
    sget-object v1, Landroid/print/PageRange;->ALL_PAGES:Landroid/print/PageRange;

    aput-object v1, p1, v2

    invoke-virtual {p2, p1}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;->onWriteFinished([Landroid/print/PageRange;)V

    .line 230
    :try_start_0
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V

    .line 231
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 233
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RNPrint"

    return-object v0
.end method

.method public print(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 9
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const-string v0, "html"

    .line 65
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v8, v0

    goto :goto_0

    :cond_0
    move-object v8, v2

    :goto_0
    const-string v0, "filePath"

    .line 66
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_1
    move-object v0, v2

    :goto_1
    const-string v1, "isLandscape"

    .line 67
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    const-string v3, "jobName"

    .line 68
    invoke-interface {p1, v3}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {p1, v3}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    :cond_3
    const-string v3, "Document"

    :goto_3
    move-object v5, v3

    const-string v3, "baseUrl"

    .line 69
    invoke-interface {p1, v3}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {p1, v3}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_4
    move-object v7, v2

    if-nez v8, :cond_5

    if-eqz v0, :cond_6

    :cond_5
    if-eqz v8, :cond_7

    if-eqz v0, :cond_7

    .line 72
    :cond_6
    invoke-virtual {p0}, Lcom/christopherdro/RNPrint/RNPrintModule;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Must provide either `html` or `filePath`.  Both are either missing or passed together"

    invoke-interface {p2, p1, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_7
    if-eqz v8, :cond_8

    .line 78
    :try_start_0
    new-instance p1, Lcom/christopherdro/RNPrint/RNPrintModule$1;

    move-object v3, p1

    move-object v4, p0

    move-object v6, p2

    invoke-direct/range {v3 .. v8}, Lcom/christopherdro/RNPrint/RNPrintModule$1;-><init>(Lcom/christopherdro/RNPrint/RNPrintModule;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception p1

    const-string v0, "print_error"

    .line 133
    invoke-interface {p2, v0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 138
    :cond_8
    :try_start_1
    invoke-virtual {p0}, Lcom/christopherdro/RNPrint/RNPrintModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v2, "print"

    invoke-virtual {p1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/print/PrintManager;

    .line 139
    new-instance v2, Lcom/christopherdro/RNPrint/RNPrintModule$2;

    invoke-direct {v2, p0, v0, p2, v5}, Lcom/christopherdro/RNPrint/RNPrintModule$2;-><init>(Lcom/christopherdro/RNPrint/RNPrintModule;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V

    .line 204
    new-instance v0, Landroid/print/PrintAttributes$Builder;

    invoke-direct {v0}, Landroid/print/PrintAttributes$Builder;-><init>()V

    if-eqz v1, :cond_9

    .line 205
    sget-object v1, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_LANDSCAPE:Landroid/print/PrintAttributes$MediaSize;

    goto :goto_4

    :cond_9
    sget-object v1, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_PORTRAIT:Landroid/print/PrintAttributes$MediaSize;

    :goto_4
    invoke-virtual {v0, v1}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    move-result-object v0

    .line 206
    invoke-virtual {v0}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object v0

    .line 207
    invoke-virtual {p1, v5, v2, v0}, Landroid/print/PrintManager;->print(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;Landroid/print/PrintAttributes;)Landroid/print/PrintJob;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_5

    :catch_1
    move-exception p1

    .line 210
    invoke-virtual {p0}, Lcom/christopherdro/RNPrint/RNPrintModule;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_5
    return-void
.end method
