.class public Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "DetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;
    }
.end annotation


# static fields
.field private static final ARG_DETAILS:Ljava/lang/String; = "details"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;
    .locals 3

    .line 82
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;-><init>()V

    .line 83
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getCreated()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->timestamp:J

    .line 84
    new-instance v1, Ljava/io/File;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->fileSize:J

    .line 85
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getFaceCount()I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->triangleCount:I

    .line 86
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getVertexCount()I

    move-result p0

    iput p0, v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->vertexCount:I

    .line 87
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isImprovement()Z

    move-result p0

    iput-boolean p0, v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->isImproved:Z

    .line 89
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;-><init>()V

    .line 90
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v1, "details"

    .line 91
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 92
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private populateDetails(Landroid/view/View;Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;)V
    .locals 8

    .line 113
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v0

    const/4 v1, 0x3

    .line 114
    invoke-static {v1}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v1

    iget-wide v2, p2, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->timestamp:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f09009b

    .line 115
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const/4 v3, 0x1

    .line 116
    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const v1, 0x7f1000a8

    invoke-virtual {p0, v1, v4}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-wide v6, p2, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->fileSize:J

    invoke-static {v1, v6, v7}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0900ca

    .line 119
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 120
    new-array v4, v3, [Ljava/lang/Object;

    aput-object v1, v4, v5

    const v1, 0x7f1000a9

    invoke-virtual {p0, v1, v4}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f090203

    .line 122
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 123
    new-array v2, v3, [Ljava/lang/Object;

    iget v4, p2, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->triangleCount:I

    int-to-long v6, v4

    .line 124
    invoke-virtual {v0, v6, v7}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v5

    const v4, 0x7f1000ab

    .line 123
    invoke-virtual {p0, v4, v2}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f090214

    .line 126
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 127
    new-array v2, v3, [Ljava/lang/Object;

    iget v3, p2, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->vertexCount:I

    int-to-long v3, v3

    .line 128
    invoke-virtual {v0, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v5

    const v0, 0x7f1000ac

    .line 127
    invoke-virtual {p0, v0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f090100

    .line 130
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iget-boolean p2, p2, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->isImproved:Z

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/16 v5, 0x8

    :goto_0
    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 100
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "details"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;

    .line 101
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0c0064

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 103
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->populateDetails(Landroid/view/View;Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;)V

    .line 104
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f1000ad

    .line 105
    invoke-virtual {p1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 106
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    const v0, 0x104000a

    .line 107
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 109
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
