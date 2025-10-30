.class Lcom/christopherdro/RNPrint/RNPrintModule$2$1;
.super Ljava/lang/Object;
.source "RNPrintModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/christopherdro/RNPrint/RNPrintModule$2;->onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/christopherdro/RNPrint/RNPrintModule$2;

.field final synthetic val$callback:Landroid/print/PrintDocumentAdapter$WriteResultCallback;

.field final synthetic val$destination:Landroid/os/ParcelFileDescriptor;


# direct methods
.method constructor <init>(Lcom/christopherdro/RNPrint/RNPrintModule$2;Landroid/os/ParcelFileDescriptor;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 147
    iput-object p1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$2;

    iput-object p2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->val$destination:Landroid/os/ParcelFileDescriptor;

    iput-object p3, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->val$callback:Landroid/print/PrintDocumentAdapter$WriteResultCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v0, 0x0

    .line 152
    :try_start_0
    invoke-static {}, Lcom/facebook/react/modules/network/OkHttpClientProvider;->createClient()Lokhttp3/OkHttpClient;

    move-result-object v1

    .line 153
    new-instance v2, Lcom/facebook/react/modules/network/ForwardingCookieHandler;

    iget-object v3, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$2;

    iget-object v3, v3, Lcom/christopherdro/RNPrint/RNPrintModule$2;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iget-object v3, v3, Lcom/christopherdro/RNPrint/RNPrintModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-direct {v2, v3}, Lcom/facebook/react/modules/network/ForwardingCookieHandler;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    .line 154
    invoke-virtual {v1}, Lokhttp3/OkHttpClient;->cookieJar()Lokhttp3/CookieJar;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/modules/network/CookieJarContainer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    :try_start_1
    new-instance v0, Lokhttp3/JavaNetCookieJar;

    invoke-direct {v0, v2}, Lokhttp3/JavaNetCookieJar;-><init>(Ljava/net/CookieHandler;)V

    invoke-interface {v3, v0}, Lcom/facebook/react/modules/network/CookieJarContainer;->setCookieJar(Lokhttp3/CookieJar;)V

    .line 157
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    iget-object v2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$2;

    iget-object v2, v2, Lcom/christopherdro/RNPrint/RNPrintModule$2;->val$filePath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v0

    .line 160
    iget-object v1, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->this$1:Lcom/christopherdro/RNPrint/RNPrintModule$2;

    iget-object v1, v1, Lcom/christopherdro/RNPrint/RNPrintModule$2;->this$0:Lcom/christopherdro/RNPrint/RNPrintModule;

    iget-object v2, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->val$destination:Landroid/os/ParcelFileDescriptor;

    iget-object v4, p0, Lcom/christopherdro/RNPrint/RNPrintModule$2$1;->val$callback:Landroid/print/PrintDocumentAdapter$WriteResultCallback;

    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v1, v2, v4, v5}, Lcom/christopherdro/RNPrint/RNPrintModule;->-$$Nest$mloadAndClose(Lcom/christopherdro/RNPrint/RNPrintModule;Landroid/os/ParcelFileDescriptor;Landroid/print/PrintDocumentAdapter$WriteResultCallback;Ljava/io/InputStream;)V

    .line 162
    invoke-virtual {v0}, Lokhttp3/Response;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v3, :cond_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catchall_0
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    goto :goto_2

    :catch_1
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    .line 164
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v3, :cond_0

    .line 167
    :goto_1
    invoke-interface {v3}, Lcom/facebook/react/modules/network/CookieJarContainer;->removeCookieJar()V

    :cond_0
    return-void

    :catchall_1
    move-exception v0

    :goto_2
    if-eqz v3, :cond_1

    invoke-interface {v3}, Lcom/facebook/react/modules/network/CookieJarContainer;->removeCookieJar()V

    .line 169
    :cond_1
    throw v0
.end method
