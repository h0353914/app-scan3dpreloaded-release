package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item;

import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
public interface VideoTipFragmentOwner {
    Executor getVideoExecutor();

    void onVideoFinished();
}
