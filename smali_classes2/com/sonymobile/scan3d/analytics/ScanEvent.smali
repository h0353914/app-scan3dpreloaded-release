.class public final enum Lcom/sonymobile/scan3d/analytics/ScanEvent;
.super Ljava/lang/Enum;
.source "ScanEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/analytics/ScanEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CALIBRATION_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CALIBRATION_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CAMERA_BUTTON_PRESSED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CRITICAL_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CRITICAL_ERROR_DISPLAYED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CRITICAL_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CRITICAL_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CRITICAL_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum CRITICAL_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum LOST_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum REGAINED_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum REGAINED_TRACK_DURING_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum RESTART:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum RESTART_CLICKED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SCAN_CANCELED_BY_USER:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SCAN_DISCARDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SCAN_RESTARTED_AFTER_WARNING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SCAN_SAVED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SCAN_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SCULPTING_LOST_TRACK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SETTING_FOCUS_TYPE_AUTO:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SETTING_FOCUS_TYPE_FIXED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SETTING_FOCUS_TYPE_MANUAL:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SETTING_FOCUS_TYPE_TOF:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SOUND_HEARD:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SPRAY_PAINTING_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum SPRAY_PAINTING_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum START_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum STOP_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum VOLUME_DOWN:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_LOW_BATTERY:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_LOW_STORAGE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_TOO_CLOSE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_TOO_FAST:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_TOO_HOT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

.field public static final enum WARNING_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;


# instance fields
.field private final mAction:Ljava/lang/String;

.field private final mUpdateScanId:Z


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 22
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SCAN_STARTED"

    const-string v2, "ScanStarted"

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-direct {v0, v1, v3, v2, v4}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 28
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SCAN_SAVED"

    const-string v2, "ScanSaved"

    invoke-direct {v0, v1, v4, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_SAVED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 33
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SCAN_DISCARDED"

    const-string v2, "ScanDiscarded"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_DISCARDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 38
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SCAN_CANCELED_BY_USER"

    const-string v2, "ScanCanceledByUser"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_CANCELED_BY_USER:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 43
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_TOO_CLOSE"

    const-string v2, "WarningTooClose"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_CLOSE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 48
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_TOO_HOT"

    const-string v2, "WarningTooHot"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_HOT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 53
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_LOW_BATTERY"

    const-string v2, "WarningLowBattery"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_BATTERY:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 58
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_LOW_STORAGE"

    const-string v2, "WarningLowStorage"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_STORAGE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 63
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_TOO_FAST"

    const-string v2, "WarningTooFast"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_FAST:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 68
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_TOO_DARK"

    const-string v2, "WarningTooDark"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 73
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_TOO_BRIGHT"

    const-string v2, "WarningTooBright"

    const/16 v13, 0xa

    invoke-direct {v0, v1, v13, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 78
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_UNEVEN_LIGHT"

    const-string v2, "WarningUnevenLight"

    const/16 v14, 0xb

    invoke-direct {v0, v1, v14, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 83
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_LOW_TEXTURE_AREA"

    const-string v2, "WarningLowTextureArea"

    const/16 v15, 0xc

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 88
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "WARNING_BAD_LOOP_CLOSURE"

    const-string v2, "WarningBadLoopClosure"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 93
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CRITICAL_TOO_DARK"

    const-string v2, "CriticalTooDark"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 98
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CRITICAL_TOO_BRIGHT"

    const-string v2, "CriticalTooBright"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 103
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CRITICAL_UNEVEN_LIGHT"

    const-string v2, "CriticalUnevenLight"

    const/16 v15, 0x10

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 108
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CRITICAL_LOW_TEXTURE_AREA"

    const-string v2, "CriticalLowTextureArea"

    const/16 v15, 0x11

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 113
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CRITICAL_BAD_LOOP_CLOSURE"

    const-string v2, "CriticalBadLoopClosure"

    const/16 v15, 0x12

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 118
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CRITICAL_ERROR_DISPLAYED"

    const-string v2, "CriticalErrorDisplayed"

    const/16 v15, 0x13

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_ERROR_DISPLAYED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 123
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SCAN_RESTARTED_AFTER_WARNING"

    const-string v2, "ScanRestartedAfterWarning"

    const/16 v15, 0x14

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_RESTARTED_AFTER_WARNING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 128
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SCULPTING_LOST_TRACK"

    const-string v2, "SculptingLostTrack"

    const/16 v15, 0x15

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCULPTING_LOST_TRACK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 133
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "LOST_TRACK_DURING_CALIBRATION"

    const-string v2, "LostTrackDuringCalibration"

    const/16 v15, 0x16

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->LOST_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 138
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "REGAINED_TRACK_DURING_CALIBRATION"

    const-string v2, "RegainedTrackDuringTracking"

    const/16 v15, 0x17

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->REGAINED_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 143
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "REGAINED_TRACK_DURING_SCULPTING"

    const-string v2, "SculptingRegainedTrack"

    const/16 v15, 0x18

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->REGAINED_TRACK_DURING_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 148
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CALIBRATION_STARTED"

    const-string v2, "CalibrationStarted"

    const/16 v15, 0x19

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CALIBRATION_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 153
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "START_SCULPTING"

    const-string v2, "SculptingStarted"

    const/16 v15, 0x1a

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->START_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 158
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "STOP_SCULPTING"

    const-string v2, "StopSculpting"

    const/16 v15, 0x1b

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->STOP_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 163
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CALIBRATION_ENDED"

    const-string v2, "CalibrationEnded"

    const/16 v15, 0x1c

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CALIBRATION_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 168
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SPRAY_PAINTING_STARTED"

    const-string v2, "PaintingStarted"

    const/16 v15, 0x1d

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SPRAY_PAINTING_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 173
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SPRAY_PAINTING_ENDED"

    const-string v2, "PaintingEnded"

    const/16 v15, 0x1e

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SPRAY_PAINTING_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 178
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SETTING_FOCUS_TYPE_FIXED"

    const-string v2, "SettingFocusTypeFixed"

    const/16 v15, 0x1f

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_FIXED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 183
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SETTING_FOCUS_TYPE_AUTO"

    const-string v2, "SettingFocusTypeAuto"

    const/16 v15, 0x20

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_AUTO:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 188
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SETTING_FOCUS_TYPE_MANUAL"

    const-string v2, "SettingFocusTypeManual"

    const/16 v15, 0x21

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_MANUAL:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 193
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SETTING_FOCUS_TYPE_TOF"

    const-string v2, "SettingFocusTypeTof"

    const/16 v15, 0x22

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_TOF:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 198
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "RESTART"

    const-string v2, "Restart"

    const/16 v15, 0x23

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->RESTART:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 203
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "RESTART_CLICKED"

    const-string v2, "RestartClicked"

    const/16 v15, 0x24

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->RESTART_CLICKED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 208
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "CAMERA_BUTTON_PRESSED"

    const-string v2, "CameraButtonPressed"

    const/16 v15, 0x25

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CAMERA_BUTTON_PRESSED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 213
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "VOLUME_DOWN"

    const-string v2, "VolumeDown"

    const/16 v15, 0x26

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->VOLUME_DOWN:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    .line 218
    new-instance v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const-string v1, "SOUND_HEARD"

    const-string v2, "SoundHeard"

    const/16 v15, 0x27

    invoke-direct {v0, v1, v15, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SOUND_HEARD:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v0, 0x28

    .line 17
    new-array v0, v0, [Lcom/sonymobile/scan3d/analytics/ScanEvent;

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_SAVED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_DISCARDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_CANCELED_BY_USER:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v6

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_CLOSE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v7

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_HOT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v8

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_BATTERY:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v9

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_STORAGE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v10

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_FAST:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v11

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v12

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v13

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    aput-object v1, v0, v14

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_TOO_DARK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_TOO_BRIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_UNEVEN_LIGHT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_LOW_TEXTURE_AREA:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_BAD_LOOP_CLOSURE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CRITICAL_ERROR_DISPLAYED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_RESTARTED_AFTER_WARNING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCULPTING_LOST_TRACK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->LOST_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->REGAINED_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->REGAINED_TRACK_DURING_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CALIBRATION_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->START_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->STOP_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CALIBRATION_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SPRAY_PAINTING_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SPRAY_PAINTING_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_FIXED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_AUTO:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x20

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_MANUAL:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x21

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_TOF:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x22

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->RESTART:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x23

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->RESTART_CLICKED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x24

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CAMERA_BUTTON_PRESSED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x25

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->VOLUME_DOWN:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x26

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SOUND_HEARD:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    const/16 v2, 0x27

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/ScanEvent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 248
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 237
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 238
    iput-object p3, p0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->mAction:Ljava/lang/String;

    .line 239
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->mUpdateScanId:Z

    return-void
.end method

.method public static addScanIdToPayload(Landroid/content/Context;Lorg/json/JSONObject;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 294
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "ScanId"

    const/4 v1, 0x0

    .line 295
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-eqz p2, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 298
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p2, "ScanId"

    invoke-interface {p0, p2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    const-string p0, "ScanId"

    .line 300
    invoke-virtual {p1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    return-void
.end method

.method private pushScanEvent(Landroid/content/Context;Ljava/lang/String;ZI)V
    .locals 2

    .line 269
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "action"

    .line 271
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 272
    invoke-static {p1, v0, p3}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->addScanIdToPayload(Landroid/content/Context;Lorg/json/JSONObject;Z)V

    const-string p2, "ScanMode"

    .line 273
    invoke-virtual {v0, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 274
    invoke-static {p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushScanEvent(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 276
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/analytics/ScanEvent;
    .locals 1

    .line 17
    const-class v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/analytics/ScanEvent;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/analytics/ScanEvent;
    .locals 1

    .line 17
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->$VALUES:[Lcom/sonymobile/scan3d/analytics/ScanEvent;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/analytics/ScanEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/analytics/ScanEvent;

    return-object v0
.end method


# virtual methods
.method public send(Landroid/content/Context;I)V
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->mAction:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->mUpdateScanId:Z

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->pushScanEvent(Landroid/content/Context;Ljava/lang/String;ZI)V

    return-void
.end method
