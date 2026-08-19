.class public Lorg/apache/log/format/PatternFormatter$PatternRun;
.super Ljava/lang/Object;
.source "PatternFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log/format/PatternFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "PatternRun"
.end annotation


# instance fields
.field public m_data:Ljava/lang/String;

.field public m_format:Ljava/lang/String;

.field public m_maxSize:I

.field public m_minSize:I

.field public m_rightJustify:Z

.field public m_type:I


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
