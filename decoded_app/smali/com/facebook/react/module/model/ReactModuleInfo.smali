.class public Lcom/facebook/react/module/model/ReactModuleInfo;
.super Ljava/lang/Object;
.source "ReactModuleInfo.java"


# instance fields
.field private final mCanOverrideExistingModule:Z

.field private final mClassName:Ljava/lang/String;

.field private final mIsCxxModule:Z

.field private final mIsTurboModule:Z

.field private final mName:Ljava/lang/String;

.field private final mNeedsEagerInit:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZZZZ)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mName:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mClassName:Ljava/lang/String;

    .line 32
    iput-boolean p3, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mCanOverrideExistingModule:Z

    .line 33
    iput-boolean p4, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mNeedsEagerInit:Z

    .line 34
    iput-boolean p5, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mIsCxxModule:Z

    .line 35
    iput-boolean p6, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mIsTurboModule:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZZZZZ)V
    .locals 7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p6

    move v6, p7

    .line 51
    invoke-direct/range {v0 .. v6}, Lcom/facebook/react/module/model/ReactModuleInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZZZZ)V

    return-void
.end method


# virtual methods
.method public canOverrideExistingModule()Z
    .locals 1

    .line 63
    iget-boolean v0, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mCanOverrideExistingModule:Z

    return v0
.end method

.method public className()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mClassName:Ljava/lang/String;

    return-object v0
.end method

.method public hasConstants()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    return v0
.end method

.method public isCxxModule()Z
    .locals 1

    .line 77
    iget-boolean v0, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mIsCxxModule:Z

    return v0
.end method

.method public isTurboModule()Z
    .locals 1

    .line 81
    iget-boolean v0, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mIsTurboModule:Z

    return v0
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public needsEagerInit()Z
    .locals 1

    .line 67
    iget-boolean v0, p0, Lcom/facebook/react/module/model/ReactModuleInfo;->mNeedsEagerInit:Z

    return v0
.end method
