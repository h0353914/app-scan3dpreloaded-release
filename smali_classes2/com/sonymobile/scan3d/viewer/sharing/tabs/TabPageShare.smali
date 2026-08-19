.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.super Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;
.source "TabPageShare.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WallpaperPlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ShareAsVideoPlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$PropsPlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FaceBlendPlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$RadioButtonDialogFragment;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPrivacyDialog;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePrivacyDialog;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerSharePlugin;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WebViewerPrivacyDialog;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;
    }
.end annotation


# static fields
.field private static final ANIMATE_MODEL_DIALOG_ID:I = 0xa

.field private static final KEY_COMPONENT_NAME:Ljava/lang/String; = "component_name"

.field private static final KEY_SELECTED_PLUGIN_NAME:Ljava/lang/String; = "plugin_name"

.field private static final KEY_SHAREABLE:Ljava/lang/String; = "shareable"

.field private static final KEY_TEXTURE_SIZE:Ljava/lang/String; = "texture_size"

.field private static final KEY_VIEW_MATRIX:Ljava/lang/String; = "view_matrix"

.field private static final TAG:Ljava/lang/String; = "TabPageShare"


# instance fields
.field private mComponentName:Landroid/content/ComponentName;

.field private mHasFacePlugins:Z

.field private mSelectedPluginName:Ljava/lang/String;

.field private mTextureSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 72
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;-><init>()V

    const/4 v0, 0x0

    .line 313
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mHasFacePlugins:Z

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/ComponentName;ILcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 0

    .line 72
    invoke-static/range {p0 .. p7}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->handleSharing(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/ComponentName;ILcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 0

    .line 72
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$202(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mSelectedPluginName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 0

    .line 72
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showShareAsVideoFragment()V

    return-void
.end method

.method private addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            "Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;",
            "I)V"
        }
    .end annotation

    .line 368
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p2, p3, v0, p4}, Lcom/sonymobile/scan3d/sharing/Plugin;->isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 369
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method private addPlugins(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "I)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 643
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugins(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;II)V

    return-void
.end method

.method private addPlugins(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;II)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "II)V"
        }
    .end annotation

    .line 655
    invoke-static {}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getInstance()Lcom/sonymobile/scan3d/sharing/SharingManager;

    move-result-object p4

    .line 656
    invoke-virtual {p4, p2, p3}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getPlugins(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;

    move-result-object v0

    .line 657
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mHasFacePlugins:Z

    const/16 v2, 0x100

    invoke-virtual {p4, p2, v2}, Lcom/sonymobile/scan3d/sharing/SharingManager;->hasPluginsExact(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Z

    move-result v2

    or-int/2addr v1, v2

    iput-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mHasFacePlugins:Z

    .line 658
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mHasFacePlugins:Z

    const/16 v2, 0x101

    invoke-virtual {p4, p2, v2}, Lcom/sonymobile/scan3d/sharing/SharingManager;->hasPluginsExact(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Z

    move-result p2

    or-int/2addr p2, v1

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mHasFacePlugins:Z

    .line 659
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p2

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object p2

    if-eqz v0, :cond_2

    .line 661
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/sharing/Plugin;

    .line 662
    instance-of v1, v0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    if-eqz v1, :cond_1

    .line 663
    check-cast v0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    .line 664
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->isPrivileged()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 665
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    goto :goto_0

    .line 667
    :cond_0
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;

    invoke-direct {v1, p0, p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;)V

    invoke-direct {p0, p1, v1, p2, p3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    goto :goto_0

    .line 670
    :cond_1
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method private getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 3

    .line 768
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "shareable"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public static getSharingConclusion(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/util/ArrayList;Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;
    .locals 7
    .param p0    # Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/viewer/sharing/Shareable;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;"
        }
    .end annotation

    .line 468
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    const-string v1, "application/vnd.sony.scan3d"

    .line 471
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "application/vnd.sony.scan3d"

    .line 473
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v2, v4

    :goto_1
    const-string v5, "model/gltf-binary"

    .line 475
    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v6, "model/gltf-binary"

    .line 477
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    if-eqz v5, :cond_3

    :cond_2
    move v3, v4

    :cond_3
    const-string p1, "no_mime_type_preferred"

    .line 478
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    .line 479
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRiggable()Z

    move-result p2

    .line 480
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result v0

    .line 482
    sget-object v4, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object p0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result p0

    aget p0, v4, p0

    packed-switch p0, :pswitch_data_0

    if-nez v2, :cond_5

    if-nez p2, :cond_5

    .line 499
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    .line 494
    :pswitch_0
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :pswitch_1
    if-eqz v3, :cond_4

    .line 485
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    .line 488
    :cond_4
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :cond_5
    if-eqz v2, :cond_6

    if-eqz v1, :cond_6

    .line 502
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :cond_6
    if-eqz v3, :cond_a

    if-eqz v5, :cond_a

    if-nez p2, :cond_7

    .line 506
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :cond_7
    if-eqz v0, :cond_8

    .line 508
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :cond_8
    if-nez v2, :cond_9

    .line 513
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ANIMATE_WITHOUT_ASKING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    .line 515
    :cond_9
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ASK_TO_ANIMATE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :cond_a
    if-nez v2, :cond_c

    if-eqz v3, :cond_c

    if-eqz v0, :cond_b

    .line 521
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    .line 524
    :cond_b
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ANIMATE_WITHOUT_ASKING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :cond_c
    if-eqz v2, :cond_e

    if-eqz v3, :cond_e

    if-eqz p1, :cond_e

    if-eqz v0, :cond_d

    .line 529
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_GLTF:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    .line 531
    :cond_d
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    :cond_e
    if-eqz v2, :cond_f

    .line 534
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->SEND_OBJ_ZIP:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    .line 537
    :cond_f
    sget-object p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->UNSUPPORTED_ERROR:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static handleSharing(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/ComponentName;ILcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Landroid/content/ComponentName;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/sonymobile/scan3d/viewer/sharing/Shareable;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/content/ComponentName;",
            "I",
            "Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;",
            ")V"
        }
    .end annotation

    .line 548
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    .line 549
    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$tabs$TabPageShare$SharingConclusion:[I

    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getSharingConclusion(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/util/ArrayList;Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$SharingConclusion;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v1, :pswitch_data_0

    .line 569
    sget-object p4, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->TAG:Ljava/lang/String;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "An odd sharing state occurred. Supported: "

    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ", Preferred: "

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ", Rigged: "

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p2

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRigged()Z

    move-result p2

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p2, ", Riggable: "

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 572
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p2

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRiggable()Z

    move-result p2

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 569
    invoke-static {p4, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 574
    invoke-virtual {p1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    goto :goto_0

    .line 562
    :pswitch_0
    invoke-virtual {p1, p5}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipient(Landroid/content/ComponentName;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p2

    invoke-virtual {p2, p6}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setTextureSize(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 563
    invoke-virtual {p1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 564
    invoke-static {p1, v3}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object p2

    invoke-virtual {p7, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    .line 559
    :pswitch_1
    invoke-direct {p7, p4, p5, p6}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showAnimationDialog(Ljava/lang/String;Landroid/content/ComponentName;I)V

    goto :goto_0

    .line 555
    :pswitch_2
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 556
    invoke-virtual {p1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    goto :goto_0

    .line 551
    :pswitch_3
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 552
    invoke-virtual {p1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 579
    :goto_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getUrl()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 580
    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I[FLcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
    .locals 1

    .line 317
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;-><init>()V

    .line 318
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getBaseArguments(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Landroid/os/Bundle;

    move-result-object p0

    const-string p1, "view_matrix"

    .line 319
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    const-string p1, "shareable"

    .line 320
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 321
    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private rearrangePluginList(Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;I)V"
        }
    .end annotation

    .line 614
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 615
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/sharing/Plugin;

    .line 616
    instance-of v3, v2, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    if-eqz v3, :cond_0

    .line 617
    move-object v3, v2

    check-cast v3, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    .line 618
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getComponentName()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.sonymobile.androidapp.cameraaddon.areffect"

    .line 619
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 620
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 628
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/sharing/Plugin;

    .line 629
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 630
    invoke-interface {p1, p2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    :cond_3
    return-void
.end method

.method private shareToPlugin(Ljava/lang/String;)V
    .locals 2

    .line 745
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x3abb4556

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "ShareAsVideo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, -0x1

    :goto_1
    if-eqz p1, :cond_2

    goto :goto_2

    .line 747
    :cond_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showShareAsVideoFragment()V

    :goto_2
    return-void
.end method

.method private showAnimationDialog(Ljava/lang/String;Landroid/content/ComponentName;I)V
    .locals 7

    .line 592
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mComponentName:Landroid/content/ComponentName;

    .line 593
    iput p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mTextureSize:I

    .line 595
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 596
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v0, 0xa

    const v1, 0x7f100047

    const v2, 0x7f100046

    const v4, 0x7f1000ba

    const v5, 0x7f1000b9

    const/4 v6, 0x0

    .line 598
    invoke-static/range {v0 .. v6}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIILjava/util/ArrayList;IILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p1

    const/4 p2, 0x0

    .line 602
    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 603
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    const-string p3, "dialog_tag"

    invoke-virtual {p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showShareAsVideoFragment()V
    .locals 4

    .line 758
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/ShareAsVideoFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    .line 759
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->SHARE_AS_VIDEO:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    return-void
.end method


# virtual methods
.method protected getPlugins()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;"
        }
    .end annotation

    .line 331
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 332
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 333
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v2

    .line 334
    new-instance v3, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "shareable"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 335
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/Config;->isGooglePlayEnabled(Landroid/content/Context;)Z

    move-result v0

    .line 336
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v4

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v4

    .line 340
    new-instance v5, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;

    invoke-direct {v5, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileSharePlugin;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    invoke-direct {p0, v1, v5, v4, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    .line 341
    new-instance v5, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$PropsPlugin;

    invoke-direct {v5, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$PropsPlugin;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    invoke-direct {p0, v1, v5, v4, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    .line 343
    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v5}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isImprovement()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 344
    new-instance v5, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;

    invoke-direct {v5, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FileShareAdvPlugin;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    invoke-direct {p0, v1, v5, v4, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    .line 347
    :cond_0
    sget-object v5, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->SHARE:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getScanFormat()I

    move-result v3

    invoke-direct {p0, v1, v5, v2, v3}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugins(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;II)V

    .line 349
    sget-object v3, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->GAMING:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-direct {p0, v1, v3, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugins(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)V

    .line 350
    new-instance v3, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WallpaperPlugin;

    invoke-direct {v3, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$WallpaperPlugin;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    invoke-direct {p0, v1, v3, v4, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    .line 352
    sget-object v3, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->MISC:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-direct {p0, v1, v3, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugins(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)V

    if-eqz v0, :cond_1

    .line 354
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$FindMorePlugin;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    invoke-direct {p0, v1, v0, v4, v2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->addPlugin(Ljava/util/List;Lcom/sonymobile/scan3d/sharing/Plugin;Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;I)V

    :cond_1
    const/4 v0, 0x0

    .line 356
    invoke-direct {p0, v1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->rearrangePluginList(Ljava/util/List;I)V

    return-object v1
.end method

.method protected hasFacePlugins()Z
    .locals 1

    .line 326
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mHasFacePlugins:Z

    return v0
.end method

.method protected onClickPlugin(Lcom/sonymobile/scan3d/sharing/Plugin;I)V
    .locals 8

    .line 393
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->sendClickEvent(Lcom/sonymobile/scan3d/sharing/Plugin;)V

    .line 395
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    .line 397
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setFileSet(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 398
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    .line 399
    instance-of v2, p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    if-eqz v2, :cond_0

    .line 400
    check-cast p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    .line 404
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getComponentName()Landroid/content/ComponentName;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipient(Landroid/content/ComponentName;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p2

    .line 405
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getTextureSize()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setTextureSize(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 407
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 409
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getSupportedMimeTypes()Ljava/util/ArrayList;

    move-result-object v2

    .line 410
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getPreferredMimeType()Ljava/lang/String;

    move-result-object v3

    .line 411
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getAppName()Ljava/lang/String;

    move-result-object v4

    .line 412
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getComponentName()Landroid/content/ComponentName;

    move-result-object v5

    .line 413
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getTextureSize()I

    move-result v6

    move-object v7, p0

    .line 407
    invoke-static/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->handleSharing(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/ComponentName;ILcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)V

    goto :goto_0

    .line 417
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p1, v1, v0, p2}, Lcom/sonymobile/scan3d/sharing/Plugin;->shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 375
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v0, "component_name"

    .line 377
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mComponentName:Landroid/content/ComponentName;

    const-string v0, "texture_size"

    const/4 v1, 0x0

    .line 378
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mTextureSize:I

    const-string v0, "plugin_name"

    .line 379
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mSelectedPluginName:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 1

    const/16 p2, 0xa

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 726
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p1

    .line 727
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mComponentName:Landroid/content/ComponentName;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipient(Landroid/content/ComponentName;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 728
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const/4 p2, 0x0

    .line 729
    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 730
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 2

    const/16 p2, 0xa

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 708
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p1

    .line 709
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mComponentName:Landroid/content/ComponentName;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setRecipient(Landroid/content/ComponentName;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p2

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mTextureSize:I

    .line 710
    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setTextureSize(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const/4 p2, 0x1

    .line 711
    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 712
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "dialog_tag"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    .line 713
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->dismiss()V

    .line 714
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->showFragment(Landroidx/fragment/app/Fragment;)V

    :goto_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 p1, 0x0

    move v0, p1

    .line 680
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 681
    aget v1, p3, v0

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    .line 687
    :goto_1
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mPermissionsHandler:Landroid/os/Handler;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    if-eqz p1, :cond_3

    .line 690
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mPermissionsContainer:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 691
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p2}, Lcom/sonymobile/scan3d/PermissionUtil;->removePermissionsContainer(Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 694
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mSelectedPluginName:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->shareToPlugin(Ljava/lang/String;)V

    goto :goto_2

    .line 696
    :cond_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mPermissionsHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mPermissionsContainer:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/PermissionUtil;->showPermissionsSnackbar(Landroid/os/Handler;Landroid/view/View;)V

    :goto_2
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 385
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageBase;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "component_name"

    .line 386
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mComponentName:Landroid/content/ComponentName;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "texture_size"

    .line 387
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mTextureSize:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "plugin_name"

    .line 388
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->mSelectedPluginName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
