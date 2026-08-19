.class Lcom/sonymobile/scan3d/Event;
.super Ljava/lang/Object;
.source "Event.java"


# static fields
.field static final BLOB_SCALE:I = 0x4

.field static final CAMERA_TEMPERATURE_SHUTDOWN:I = 0xb

.field static final CAMERA_TEMPERATURE_WARNING:I = 0xa

.field static final CHANGE_FOCUS:I = 0x0

.field static final CLEAR_ENV_ERRORS:I = 0xc

.field static final NEXT_DEBUG_MODE:I = 0x6

.field static final NEXT_STATE:I = 0x3

.field static final RESTART:I = 0x9

.field static final SET_LOCALE_IS_RTL:I = 0xd

.field static final SURFACE_DESTROYED:I = 0x7

.field static final SURFACE_RECEIVED:I = 0x1


# instance fields
.field private mArg1:Ljava/lang/Object;

.field private mArg2:Ljava/lang/Object;

.field private mType:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput p1, p0, Lcom/sonymobile/scan3d/Event;->mType:I

    return-void
.end method


# virtual methods
.method getArg1()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/sonymobile/scan3d/Event;->mArg1:Ljava/lang/Object;

    return-object v0
.end method

.method getArg2()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/sonymobile/scan3d/Event;->mArg2:Ljava/lang/Object;

    return-object v0
.end method

.method getType()I
    .locals 1

    .line 137
    iget v0, p0, Lcom/sonymobile/scan3d/Event;->mType:I

    return v0
.end method

.method setArg1(Ljava/lang/Object;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/sonymobile/scan3d/Event;->mArg1:Ljava/lang/Object;

    return-void
.end method

.method setArg2(Ljava/lang/Object;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/sonymobile/scan3d/Event;->mArg2:Ljava/lang/Object;

    return-void
.end method
