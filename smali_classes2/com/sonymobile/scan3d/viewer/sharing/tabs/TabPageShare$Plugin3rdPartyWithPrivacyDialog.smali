.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;
.super Ljava/lang/Object;
.source "TabPageShare.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sharing/Plugin;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Plugin3rdPartyWithPrivacyDialog"
.end annotation


# instance fields
.field private final mFragment:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

.field private final mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;)V
    .locals 0

    .line 843
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 844
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mFragment:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 845
    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 1

    .line 866
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getBackgroundColor()I

    move-result v0

    return v0
.end method

.method public getImage()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 850
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedMimeTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 871
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getSupportedMimeTypes()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 855
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 1

    .line 876
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    invoke-virtual {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z

    move-result p1

    return p1
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 1

    .line 860
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mFragment:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->mPlugin:Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->access$100(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;

    move-result-object p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$Plugin3rdPartyWithPrivacyDialog;->this$0:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;

    .line 861
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ThirdPartyPrivacyDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
