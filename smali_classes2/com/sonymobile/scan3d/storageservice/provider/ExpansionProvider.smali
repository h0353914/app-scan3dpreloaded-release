.class public Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;
.super Lcom/android/vending/expansion/zipfile/APEZProvider;
.source "ExpansionProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;
    }
.end annotation


# static fields
.field private static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "content://com.sonymobile.scan3d.expansionprovider"

    .line 75
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/android/vending/expansion/zipfile/APEZProvider;-><init>()V

    return-void
.end method

.method public static getExpressionUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;
    .locals 2

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->access$100(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static getModelUri(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Landroid/net/Uri;
    .locals 2

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;->access$000(Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider$Model;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getAuthority()Ljava/lang/String;
    .locals 2

    .line 99
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/ExpansionProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100106

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
