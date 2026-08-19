.class public final synthetic Lcom/sonymobile/scan3d/-$$Lambda$PermissionUtil$SZIs_8qaw_jDYbGoAnkRpMPj8jk;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/-$$Lambda$PermissionUtil$SZIs_8qaw_jDYbGoAnkRpMPj8jk;->f$0:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/-$$Lambda$PermissionUtil$SZIs_8qaw_jDYbGoAnkRpMPj8jk;->f$0:Landroid/view/View;

    invoke-static {v0}, Lcom/sonymobile/scan3d/PermissionUtil;->lambda$removePermissionsContainer$0(Landroid/view/View;)V

    return-void
.end method
