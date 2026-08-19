.class public final Lcom/sonymobile/scan3d/PrintExecution;
.super Ljava/lang/Object;
.source "PrintExecution.java"


# static fields
.field private static final DEFAULT_THICKNESS:F = 2.0f

.field private static final POST_LOG_FILE:Ljava/lang/String; = "/post_log.txt"

.field private static final PRE_LOG_FILE:Ljava/lang/String; = "/pre_log.txt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/io/File;Lcom/sonymobile/scan3d/PrintSelection;IZZ)Z
    .locals 13

    const-string v0, "/post_log.txt"

    move-object v1, p0

    .line 64
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/PrintExecution;->getLogPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 65
    new-instance v0, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    .line 67
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x1

    move-object v1, p1

    move-object v2, v0

    move-object/from16 v5, p3

    .line 66
    invoke-static/range {v1 .. v9}, Lcom/sonymobile/scan3d/PrintExecution;->prepare(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-result-object v1

    .line 68
    sget-object v2, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->SUCCESS:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    if-ne v2, v1, :cond_0

    .line 69
    invoke-virtual/range {p3 .. p3}, Lcom/sonymobile/scan3d/PrintSelection;->getAdjustColors()Z

    move-result v7

    .line 70
    invoke-virtual/range {p3 .. p3}, Lcom/sonymobile/scan3d/PrintSelection;->getRemoveShadows()F

    move-result v8

    .line 72
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v3

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 73
    invoke-virtual/range {p3 .. p3}, Lcom/sonymobile/scan3d/PrintSelection;->getMaterial()Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/utils/PrintMaterial;->getType()Lcom/sonymobile/scan3d/PrintMaterialType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/PrintMaterialType;->ordinal()I

    move-result v6

    const/4 v12, 0x0

    move/from16 v9, p5

    move/from16 v10, p6

    move/from16 v11, p4

    .line 72
    invoke-static/range {v3 .. v12}, Lcom/sonymobile/scan3d/PrintExecution;->exportPrintToZip(JLjava/lang/String;IZFZZII)Z

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 76
    :goto_0
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    return v1
.end method

.method public static native exportPrintToSTL(JLjava/lang/String;I)Z
.end method

.method public static native exportPrintToZip(JLjava/lang/String;IZFZZII)Z
.end method

.method private static getLogPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method private static getResult(I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;
    .locals 1

    .line 158
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->values()[Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static prepare(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;Ljava/lang/String;I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;
    .locals 10

    const-string v0, "/pre_log.txt"

    move-object v1, p0

    .line 97
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/PrintExecution;->getLogPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move/from16 v9, p7

    .line 98
    invoke-static/range {v1 .. v9}, Lcom/sonymobile/scan3d/PrintExecution;->prepare(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-result-object v0

    return-object v0
.end method

.method private static prepare(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;
    .locals 23

    .line 108
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    sget-object v0, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_UNKNOWN:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/PrintExecution;->getResult(I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-result-object v0

    return-object v0

    .line 112
    :cond_0
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintType;->ordinal()I

    move-result v9

    .line 113
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->getTextOverride()Ljava/lang/String;

    move-result-object v14

    .line 114
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->getInscription()Ljava/lang/String;

    move-result-object v15

    .line 115
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->getMetricSize()F

    move-result v12

    .line 116
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->getTransform()[F

    move-result-object v18

    .line 117
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->shouldRecomputeHeight()Z

    move-result v13

    .line 118
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->getMaterial()Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/PrintMaterial;->getType()Lcom/sonymobile/scan3d/PrintMaterialType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintMaterialType;->ordinal()I

    move-result v20

    .line 119
    invoke-virtual/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintSelection;->getSizeConstraintMinDim()F

    move-result v22

    const-wide/16 v0, 0x0

    if-nez p3, :cond_1

    move-wide v7, v0

    goto :goto_0

    .line 120
    :cond_1
    invoke-virtual/range {p3 .. p3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v2

    move-wide v7, v2

    :goto_0
    if-nez p2, :cond_2

    goto :goto_1

    .line 121
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v0

    :goto_1
    move-wide v5, v0

    .line 123
    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v1

    invoke-virtual/range {p1 .. p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v3

    .line 124
    invoke-static/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintExecution;->useColor(Lcom/sonymobile/scan3d/PrintSelection;)Z

    move-result v10

    .line 125
    invoke-static/range {p4 .. p4}, Lcom/sonymobile/scan3d/PrintExecution;->useTextColor(Lcom/sonymobile/scan3d/PrintSelection;)Z

    move-result v11

    move-object/from16 v16, p6

    move-object/from16 v17, p5

    move-object/from16 v19, p7

    move/from16 v21, p8

    .line 123
    invoke-static/range {v1 .. v22}, Lcom/sonymobile/scan3d/PrintExecution;->preparePrint(JJJJIZZFZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[FLjava/lang/String;IIF)I

    move-result v0

    .line 127
    invoke-static {v0}, Lcom/sonymobile/scan3d/PrintExecution;->getResult(I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-result-object v0

    return-object v0
.end method

.method private static native preparePrint(JJJJIZZFZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[FLjava/lang/String;IIF)I
.end method

.method private static useColor(Lcom/sonymobile/scan3d/PrintSelection;)Z
    .locals 2

    .line 137
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/PrintSelection;->getMaterial()Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/utils/PrintMaterial;->SANDSTONE_COLOUR:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    if-eq v0, v1, :cond_1

    .line 138
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/PrintSelection;->getMaterial()Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object p0

    sget-object v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->POLYJET_PLASTICS:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static useTextColor(Lcom/sonymobile/scan3d/PrintSelection;)Z
    .locals 1

    .line 148
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/PrintSelection;->getMaterial()Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object p0

    sget-object v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->PORCELAIN_WHITE:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
