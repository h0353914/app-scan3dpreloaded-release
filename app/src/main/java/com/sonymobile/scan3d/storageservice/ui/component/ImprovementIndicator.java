package com.sonymobile.scan3d.storageservice.ui.component;

import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.sonymobile.scan3d.R;
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
        if (iFileSet.isImprovement()) {
            setVisibility(0);
            setImageResource(R.drawable.improvement_wand_04);
            return;
        }
        if (improvement != null) {
            setVisibility(0);
            if (improvement.isImproved() || improvement.isFailed()) {
                setImageResource(R.drawable.improvement_wand_04);
                setEnabled(true);
                return;
            } else {
                setBackgroundResource(R.drawable.improvement_ongoing_animation);
                ((AnimationDrawable) getBackground()).start();
                return;
            }
        }
        setVisibility(8);
    }
}
