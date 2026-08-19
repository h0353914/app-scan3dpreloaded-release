package com.sonymobile.scan3d.storageservice.ui.gallery;

import android.text.TextUtils;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.drawee.view.SimpleDraweeView;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;

/* JADX INFO: loaded from: classes.dex */
public class LazyLoader {
    public static void load(SimpleDraweeView simpleDraweeView, IFileSet iFileSet) {
        String riggedPreviewUrl = iFileSet.getRiggedPreviewUrl();
        if (riggedPreviewUrl == null || TextUtils.isEmpty(riggedPreviewUrl)) {
            riggedPreviewUrl = iFileSet.getPreviewUrl();
        }
        if (!riggedPreviewUrl.startsWith("file://")) {
            riggedPreviewUrl = "file://" + riggedPreviewUrl;
        }
        if (simpleDraweeView.getTag() == null || !simpleDraweeView.getTag().equals(riggedPreviewUrl)) {
            simpleDraweeView.setTag(riggedPreviewUrl);
            simpleDraweeView.setController(Fresco.newDraweeControllerBuilder().setUri(riggedPreviewUrl).setAutoPlayAnimations(true).build());
        }
    }
}
