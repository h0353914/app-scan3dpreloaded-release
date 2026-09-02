package com.sonymobile.scan3d.storageservice.ui.component;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;

/* JADX INFO: loaded from: classes.dex */
public class ImprovementIndicator extends ImageView {
    public ImprovementIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void onBound(IFileSet iFileSet, Improvement improvement) {
        setBackgroundResource(0);
        setImageDrawable(null);
        setEnabled(false);
        setVisibility(8);
    }
}
