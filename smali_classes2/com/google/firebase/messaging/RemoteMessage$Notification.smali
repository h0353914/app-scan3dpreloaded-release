.class public Lcom/google/firebase/messaging/RemoteMessage$Notification;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/messaging/RemoteMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Notification"
.end annotation


# instance fields
.field private final tag:Ljava/lang/String;

.field private final zzeh:Ljava/lang/String;

.field private final zzei:Ljava/lang/String;

.field private final zzej:[Ljava/lang/String;

.field private final zzek:Ljava/lang/String;

.field private final zzel:Ljava/lang/String;

.field private final zzem:[Ljava/lang/String;

.field private final zzen:Ljava/lang/String;

.field private final zzeo:Ljava/lang/String;

.field private final zzep:Ljava/lang/String;

.field private final zzeq:Ljava/lang/String;

.field private final zzer:Ljava/lang/String;

.field private final zzes:Ljava/lang/String;

.field private final zzet:Landroid/net/Uri;


# direct methods
.method private constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "gcm.n.title"

    .line 2
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzeh:Ljava/lang/String;

    const-string v0, "gcm.n.title"

    .line 4
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zzd(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzei:Ljava/lang/String;

    const-string v0, "gcm.n.title"

    .line 5
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzf(Landroid/os/Bundle;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzej:[Ljava/lang/String;

    const-string v0, "gcm.n.body"

    .line 6
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzek:Ljava/lang/String;

    const-string v0, "gcm.n.body"

    .line 8
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zzd(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzel:Ljava/lang/String;

    const-string v0, "gcm.n.body"

    .line 9
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzf(Landroid/os/Bundle;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzem:[Ljava/lang/String;

    const-string v0, "gcm.n.icon"

    .line 10
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzen:Ljava/lang/String;

    .line 11
    invoke-static {p1}, Lcom/google/firebase/messaging/zzb;->zzi(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzep:Ljava/lang/String;

    const-string v0, "gcm.n.tag"

    .line 12
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->tag:Ljava/lang/String;

    const-string v0, "gcm.n.color"

    .line 13
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzeq:Ljava/lang/String;

    const-string v0, "gcm.n.click_action"

    .line 15
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzer:Ljava/lang/String;

    const-string v0, "gcm.n.android_channel_id"

    .line 16
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzes:Ljava/lang/String;

    .line 17
    invoke-static {p1}, Lcom/google/firebase/messaging/zzb;->zzj(Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzet:Landroid/net/Uri;

    const-string v0, "gcm.n.image"

    .line 18
    invoke-static {p1, v0}, Lcom/google/firebase/messaging/zzb;->zza(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzeo:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Bundle;Lcom/google/firebase/messaging/zzf;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lcom/google/firebase/messaging/RemoteMessage$Notification;-><init>(Landroid/os/Bundle;)V

    return-void
.end method

.method private static zzf(Landroid/os/Bundle;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2

    .line 20
    invoke-static {p0, p1}, Lcom/google/firebase/messaging/zzb;->zzb(Landroid/os/Bundle;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 23
    :cond_0
    array-length p1, p0

    new-array p1, p1, [Ljava/lang/String;

    const/4 v0, 0x0

    .line 24
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 25
    aget-object v1, p0, v0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object p1
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzek:Ljava/lang/String;

    return-object v0
.end method

.method public getBodyLocalizationArgs()[Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzem:[Ljava/lang/String;

    return-object v0
.end method

.method public getBodyLocalizationKey()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzel:Ljava/lang/String;

    return-object v0
.end method

.method public getChannelId()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzes:Ljava/lang/String;

    return-object v0
.end method

.method public getClickAction()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzer:Ljava/lang/String;

    return-object v0
.end method

.method public getColor()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzeq:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 34
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzen:Ljava/lang/String;

    return-object v0
.end method

.method public getImageUrl()Landroid/net/Uri;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzeo:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLink()Landroid/net/Uri;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzet:Landroid/net/Uri;

    return-object v0
.end method

.method public getSound()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 36
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzep:Ljava/lang/String;

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzeh:Ljava/lang/String;

    return-object v0
.end method

.method public getTitleLocalizationArgs()[Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzej:[Ljava/lang/String;

    return-object v0
.end method

.method public getTitleLocalizationKey()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 29
    iget-object v0, p0, Lcom/google/firebase/messaging/RemoteMessage$Notification;->zzei:Ljava/lang/String;

    return-object v0
.end method
