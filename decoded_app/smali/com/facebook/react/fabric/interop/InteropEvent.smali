.class Lcom/facebook/react/fabric/interop/InteropEvent;
.super Lcom/facebook/react/uimanager/events/Event;
.source "InteropEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/events/Event<",
        "Lcom/facebook/react/fabric/interop/InteropEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final mEventData:Lcom/facebook/react/bridge/WritableMap;

.field private final mName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;II)V
    .locals 0

    .line 26
    invoke-direct {p0, p3, p4}, Lcom/facebook/react/uimanager/events/Event;-><init>(II)V

    .line 27
    iput-object p1, p0, Lcom/facebook/react/fabric/interop/InteropEvent;->mName:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/facebook/react/fabric/interop/InteropEvent;->mEventData:Lcom/facebook/react/bridge/WritableMap;

    return-void
.end method


# virtual methods
.method public getEventData()Lcom/facebook/react/bridge/WritableMap;
    .locals 1
    .annotation runtime Lcom/facebook/react/common/annotations/VisibleForTesting;
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/facebook/react/fabric/interop/InteropEvent;->mEventData:Lcom/facebook/react/bridge/WritableMap;

    return-object v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/facebook/react/fabric/interop/InteropEvent;->mName:Ljava/lang/String;

    return-object v0
.end method
