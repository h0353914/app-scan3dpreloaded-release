.class Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;
.super Ljava/lang/Object;
.source "AccountUtils.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InternalListener"
.end annotation


# instance fields
.field private final mAccountListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->mAccountListeners:Ljava/util/Set;

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$1;)V
    .locals 0

    .line 133
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;-><init>()V

    return-void
.end method


# virtual methods
.method addListener(Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->mAccountListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method isEmpty()Z
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->mAccountListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2

    const-string v0, "ACCOUNT_NAME"

    .line 169
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ACCOUNT_NAME"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 170
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->mAccountListeners:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;

    .line 171
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;->onSignedOut()V

    goto :goto_0

    :cond_0
    const-string v0, "deleting_account"

    .line 173
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 174
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 175
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->mAccountListeners:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;

    .line 176
    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;->onDeleteAccountChanged(Z)V

    goto :goto_1

    :cond_1
    const-string v0, "extract_ongoing"

    .line 178
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 179
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 180
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->mAccountListeners:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;

    .line 181
    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;->onExtractAccountChanged(Z)V

    goto :goto_2

    :cond_2
    return-void
.end method

.method removeListener(Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->mAccountListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
