.class public final Lcom/facebook/react/common/StandardCharsets;
.super Ljava/lang/Object;
.source "StandardCharsets.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
    forRemoval = true
    since = "Deprecated class since v0.73.0, please use java.nio.charset.StandardCharsets instead."
.end annotation


# static fields
.field public static final UTF_16:Ljava/nio/charset/Charset;

.field public static final UTF_16BE:Ljava/nio/charset/Charset;

.field public static final UTF_16LE:Ljava/nio/charset/Charset;

.field public static final UTF_8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "UTF-8"

    .line 24
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/common/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const-string v0, "UTF-16"

    .line 27
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/common/StandardCharsets;->UTF_16:Ljava/nio/charset/Charset;

    const-string v0, "UTF-16BE"

    .line 30
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/common/StandardCharsets;->UTF_16BE:Ljava/nio/charset/Charset;

    const-string v0, "UTF-16LE"

    .line 32
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/common/StandardCharsets;->UTF_16LE:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
