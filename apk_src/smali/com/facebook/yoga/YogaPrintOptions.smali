.class public final enum Lcom/facebook/yoga/YogaPrintOptions;
.super Ljava/lang/Enum;
.source "YogaPrintOptions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/yoga/YogaPrintOptions;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/yoga/YogaPrintOptions;

.field public static final enum CHILDREN:Lcom/facebook/yoga/YogaPrintOptions;

.field public static final enum LAYOUT:Lcom/facebook/yoga/YogaPrintOptions;

.field public static final enum STYLE:Lcom/facebook/yoga/YogaPrintOptions;


# instance fields
.field private final mIntValue:I


# direct methods
.method private static synthetic $values()[Lcom/facebook/yoga/YogaPrintOptions;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/facebook/yoga/YogaPrintOptions;

    const/4 v1, 0x0

    .line 12
    sget-object v2, Lcom/facebook/yoga/YogaPrintOptions;->LAYOUT:Lcom/facebook/yoga/YogaPrintOptions;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/facebook/yoga/YogaPrintOptions;->STYLE:Lcom/facebook/yoga/YogaPrintOptions;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/facebook/yoga/YogaPrintOptions;->CHILDREN:Lcom/facebook/yoga/YogaPrintOptions;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 13
    new-instance v0, Lcom/facebook/yoga/YogaPrintOptions;

    const-string v1, "LAYOUT"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/yoga/YogaPrintOptions;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/YogaPrintOptions;->LAYOUT:Lcom/facebook/yoga/YogaPrintOptions;

    .line 14
    new-instance v0, Lcom/facebook/yoga/YogaPrintOptions;

    const-string v1, "STYLE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v3, v2}, Lcom/facebook/yoga/YogaPrintOptions;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/YogaPrintOptions;->STYLE:Lcom/facebook/yoga/YogaPrintOptions;

    .line 15
    new-instance v0, Lcom/facebook/yoga/YogaPrintOptions;

    const-string v1, "CHILDREN"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/yoga/YogaPrintOptions;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/YogaPrintOptions;->CHILDREN:Lcom/facebook/yoga/YogaPrintOptions;

    .line 12
    invoke-static {}, Lcom/facebook/yoga/YogaPrintOptions;->$values()[Lcom/facebook/yoga/YogaPrintOptions;

    move-result-object v0

    sput-object v0, Lcom/facebook/yoga/YogaPrintOptions;->$VALUES:[Lcom/facebook/yoga/YogaPrintOptions;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 20
    iput p3, p0, Lcom/facebook/yoga/YogaPrintOptions;->mIntValue:I

    return-void
.end method

.method public static fromInt(I)Lcom/facebook/yoga/YogaPrintOptions;
    .locals 3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    .line 31
    sget-object p0, Lcom/facebook/yoga/YogaPrintOptions;->CHILDREN:Lcom/facebook/yoga/YogaPrintOptions;

    return-object p0

    .line 32
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown enum value: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 30
    :cond_1
    sget-object p0, Lcom/facebook/yoga/YogaPrintOptions;->STYLE:Lcom/facebook/yoga/YogaPrintOptions;

    return-object p0

    .line 29
    :cond_2
    sget-object p0, Lcom/facebook/yoga/YogaPrintOptions;->LAYOUT:Lcom/facebook/yoga/YogaPrintOptions;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/yoga/YogaPrintOptions;
    .locals 1

    .line 12
    const-class v0, Lcom/facebook/yoga/YogaPrintOptions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/yoga/YogaPrintOptions;

    return-object p0
.end method

.method public static values()[Lcom/facebook/yoga/YogaPrintOptions;
    .locals 1

    .line 12
    sget-object v0, Lcom/facebook/yoga/YogaPrintOptions;->$VALUES:[Lcom/facebook/yoga/YogaPrintOptions;

    invoke-virtual {v0}, [Lcom/facebook/yoga/YogaPrintOptions;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/yoga/YogaPrintOptions;

    return-object v0
.end method


# virtual methods
.method public intValue()I
    .locals 1

    .line 24
    iget v0, p0, Lcom/facebook/yoga/YogaPrintOptions;->mIntValue:I

    return v0
.end method
