.class public Lcom/facebook/react/devsupport/JSException;
.super Ljava/lang/Exception;
.source "JSException.java"


# instance fields
.field private final mStack:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 28
    iput-object p2, p0, Lcom/facebook/react/devsupport/JSException;->mStack:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    iput-object p2, p0, Lcom/facebook/react/devsupport/JSException;->mStack:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getStack()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/facebook/react/devsupport/JSException;->mStack:Ljava/lang/String;

    return-object v0
.end method
