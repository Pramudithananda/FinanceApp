.class Lcom/facebook/react/fabric/LongStreamingStats$1;
.super Ljava/lang/Object;
.source "DevToolsReactPerfLogger.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/fabric/LongStreamingStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/fabric/LongStreamingStats;


# direct methods
.method constructor <init>(Lcom/facebook/react/fabric/LongStreamingStats;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/facebook/react/fabric/LongStreamingStats$1;->this$0:Lcom/facebook/react/fabric/LongStreamingStats;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Long;Ljava/lang/Long;)I
    .locals 2

    .line 32
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Long;->compare(JJ)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 28
    check-cast p1, Ljava/lang/Long;

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/fabric/LongStreamingStats$1;->compare(Ljava/lang/Long;Ljava/lang/Long;)I

    move-result p1

    return p1
.end method
