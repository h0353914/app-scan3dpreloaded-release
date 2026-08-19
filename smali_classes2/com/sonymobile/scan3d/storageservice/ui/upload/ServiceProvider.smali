.class public abstract enum Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;
.super Ljava/lang/Enum;
.source "ServiceProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

.field public static final COORD_SYSTEM_DEFAULT:I = 0x652

.field public static final JPEG_FORMAT_SUPPORTED:I = 0x64

.field public static final NO_FORMAT_SUPPORTED:I = -0x1

.field private static final NO_RES_ID:I = 0x0

.field public static final OBJ_FORMAT_SUPPORTED:I = 0x0

.field public static final PNG_FORMAT_SUPPORTED:I = 0x65

.field private static final PREFERENCE_SHOW_INFO_SUFFIX:Ljava/lang/String; = "_show_info_pref"

.field public static final VRML_FORMAT_SUPPORTED:I = 0x1

.field public static final enum WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;


# instance fields
.field private final mDescriptionResourceId:I

.field private final mLogoResId:I

.field private final mPrivacyLinkResId:I

.field private final mServiceProviderResId:I

.field private final mSupportedActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 52
    new-instance v8, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider$1;

    const-string v1, "WEBVIEWER"

    const/4 v0, 0x3

    new-array v7, v0, [Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->SHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const/4 v9, 0x0

    aput-object v0, v7, v9

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const/4 v10, 0x1

    aput-object v0, v7, v10

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->VIEW:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    const/4 v2, 0x2

    aput-object v0, v7, v2

    const/4 v2, 0x0

    const v3, 0x7f10023f

    const v4, 0x7f100379

    const/high16 v5, 0x7f0e0000

    const/4 v6, 0x0

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider$1;-><init>(Ljava/lang/String;IIIII[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)V

    sput-object v8, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 47
    new-array v0, v10, [Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    aput-object v1, v0, v9

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    return-void
.end method

.method private varargs constructor <init>(Ljava/lang/String;IIIII[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII[",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;",
            ")V"
        }
    .end annotation

    .line 193
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 194
    iput p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mServiceProviderResId:I

    .line 195
    iput p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mDescriptionResourceId:I

    .line 196
    iput p5, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mLogoResId:I

    .line 197
    invoke-static {p7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mSupportedActions:Ljava/util/List;

    .line 198
    iput p6, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mPrivacyLinkResId:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IIIII[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider$1;)V
    .locals 0

    .line 47
    invoke-direct/range {p0 .. p7}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;-><init>(Ljava/lang/String;IIIII[Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)V

    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 47
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getUrlShareIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static applyCustomization(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;",
            ">;"
        }
    .end annotation

    .line 775
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 777
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 778
    invoke-virtual {v1, p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isEnabled(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 779
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private canLearnMore(Landroid/content/Context;)Z
    .locals 0

    .line 697
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getLearnMoreIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static getCustomPrintServiceProviders(Landroid/content/Context;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;",
            ">;"
        }
    .end annotation

    .line 594
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 595
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->values()[Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 596
    sget-object v5, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT_CUSTOM:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {v4, v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 597
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 600
    :cond_1
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->applyCustomization(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private getDescription()I
    .locals 1

    .line 706
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mDescriptionResourceId:I

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->throwOnNoResource(I)I

    move-result v0

    return v0
.end method

.method private getPreferenceName()Ljava/lang/String;
    .locals 2

    .line 763
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "_show_info_pref"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPrintableServiceProviders(Landroid/content/Context;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;",
            ">;"
        }
    .end annotation

    .line 578
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 579
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->values()[Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 580
    sget-object v5, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {v4, v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 581
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 584
    :cond_1
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->applyCustomization(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static getSupportedMaterials(Landroid/content/Context;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/utils/PrintMaterial;",
            ">;"
        }
    .end annotation

    .line 611
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 612
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getPrintableServiceProviders(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 613
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getSupportedPrintMaterials()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static getSupportedSizes(Landroid/content/Context;Lcom/sonymobile/scan3d/utils/PrintMaterial;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/sonymobile/scan3d/utils/PrintMaterial;",
            ")",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/utils/PrintSize;",
            ">;"
        }
    .end annotation

    .line 627
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    if-eqz p1, :cond_1

    .line 629
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getPrintableServiceProviders(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 630
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getSupportedPrintMaterials()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_0

    .line 631
    invoke-interface {v0, v1}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 632
    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private static getUrlShareIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    .line 745
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 746
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->PLAIN_TEXT:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.SUBJECT"

    const v2, 0x7f10027d

    .line 749
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    .line 750
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const p1, 0x7f100343

    .line 752
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p0

    const/high16 p1, 0x10000000

    .line 753
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object p0
.end method

.method public static hasPrintProviders(Landroid/content/Context;)Z
    .locals 0

    .line 646
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getPrintableServiceProviders(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 647
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isPrintSupported(Lcom/sonymobile/scan3d/PrintSelection;)Z
    .locals 3

    .line 716
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    .line 717
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getSupportedPrintMaterials()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PrintSelection;->getMaterial()Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_0

    .line 718
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PrintSelection;->getSize()Lcom/sonymobile/scan3d/utils/PrintSize;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method private throwOnNoResource(I)I
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/AnyRes;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    return p1

    .line 734
    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid resource id for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;
    .locals 1

    .line 47
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;
    .locals 1

    .line 47
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    return-object v0
.end method


# virtual methods
.method create(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;
    .locals 0

    .line 214
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Unsupported for "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method final getAction(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;
    .locals 0

    .line 436
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->getAction(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    move-result-object p1

    return-object p1
.end method

.method public getAdjustColors()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method getAuthenticationFragment(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getCoordSystem()I
    .locals 1

    const/16 v0, 0x652

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 2

    .line 549
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getInfoFragment(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;
    .locals 6

    .line 470
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName()I

    move-result v1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getLogo()I

    move-result v2

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getDescription()I

    move-result v3

    .line 472
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->canLearnMore(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, 0x7f100347

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    move v5, p1

    const v4, 0x7f100346

    move v0, p2

    .line 470
    invoke-static/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;->newInstance(IIIIII)Lcom/sonymobile/scan3d/storageservice/ui/upload/InfoFragment;

    move-result-object p1

    return-object p1
.end method

.method getIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method getLearnMoreIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getLogo()I
    .locals 1

    .line 519
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mLogoResId:I

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->throwOnNoResource(I)I

    move-result v0

    return v0
.end method

.method getMonitorFragment(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;
    .locals 1

    .line 483
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 484
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getMonitorImageId()I

    move-result v0

    invoke-static {p1, p0, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/network/Credentials;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/PrintMonitorFragment;

    move-result-object p1

    goto :goto_0

    .line 485
    :cond_0
    invoke-static {p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getMonitorImageId()I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public getPrivacyLink(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 293
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mPrivacyLinkResId:I

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->throwOnNoResource(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getServiceProviderName()I
    .locals 1

    .line 540
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mServiceProviderResId:I

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->throwOnNoResource(I)I

    move-result v0

    return v0
.end method

.method public getServiceProviderName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 530
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getServiceProviderName()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method final getSupportedActions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;",
            ">;"
        }
    .end annotation

    .line 687
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mSupportedActions:Ljava/util/List;

    return-object v0
.end method

.method public getSupportedModelFormat()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method getSupportedPrintMaterials()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/sonymobile/scan3d/utils/PrintMaterial;",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/utils/PrintSize;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportedTextureFormat()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method final hideInfo(Landroid/content/Context;)V
    .locals 2

    .line 677
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 678
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getPreferenceName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mSupportedActions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public isEnabled(Landroid/content/Context;)Z
    .locals 1

    .line 389
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/Config;->isProviderEnabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method isPasswordProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method isValid(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Upload;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public minimumDimensionConstraint()F
    .locals 1

    const/high16 v0, -0x40800000    # -1.0f

    return v0
.end method

.method needsAuthentication(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;)Z
    .locals 1

    .line 447
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->isValid()Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getAuthenticationFragment(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/upload/ListenableFragment;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public print(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/os/Bundle;)V
    .locals 1

    .line 359
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-static {p1, p2, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Landroid/content/Intent;

    move-result-object p2

    .line 361
    invoke-virtual {p2, p3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 362
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public printCustom(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/os/Bundle;)V
    .locals 1

    .line 374
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT_CUSTOM:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 375
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->PRINT_CUSTOM:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-static {p1, p2, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Landroid/content/Intent;

    move-result-object p2

    .line 377
    invoke-virtual {p2, p3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 378
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method abstract sendActionScreenEvent(Landroid/content/Context;)V
.end method

.method abstract sendCartScreenEvent(Landroid/content/Context;)V
.end method

.method public share(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V
    .locals 1

    .line 332
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->SHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 333
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->SHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-static {p1, p2, p0, v0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Landroid/content/Intent;

    move-result-object p2

    .line 335
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method final showInfo(Landroid/content/Context;)Z
    .locals 2

    .line 666
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->mDescriptionResourceId:I

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 667
    :cond_0
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 668
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getPreferenceName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method startActivity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Z
    .locals 6

    .line 420
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getAction(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->getIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p2

    if-eqz p2, :cond_0

    const/high16 p3, 0x10000000

    .line 422
    invoke-virtual {p2, p3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 423
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public unshare(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 1

    .line 345
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 346
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-static {p1, p2, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Landroid/content/Intent;

    move-result-object p2

    .line 347
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)V
    .locals 2

    .line 304
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>()V

    .line 305
    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setFileSet(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    .line 306
    invoke-virtual {v1, p3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 307
    invoke-virtual {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V

    return-void
.end method

.method public view(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V
    .locals 1

    .line 317
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->VIEW:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->isActionSupported(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->VIEW:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-static {p1, p2, p0, v0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionActivity;->getStartIntent(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Landroid/content/Intent;

    move-result-object p2

    .line 320
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method
