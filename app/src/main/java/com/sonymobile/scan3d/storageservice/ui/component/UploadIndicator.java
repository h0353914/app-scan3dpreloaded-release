package com.sonymobile.scan3d.storageservice.ui.component;

import android.animation.Animator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewPropertyAnimator;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;

/* JADX INFO: loaded from: classes.dex */
public class UploadIndicator extends ImageView implements Animator.AnimatorListener {
    private static final float ROTATION_ANGLE = 360.0f;
    private static final int ROTATION_LAP_DURATION = 1400;

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
    }

    public UploadIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void onBound(IFileSet iFileSet, boolean z) {
        if (z) {
            int syncState = iFileSet.getSyncState();
            if (syncState == 0) {
                setVisibility(0);
                setImageResource(R.drawable.ic_cloud_off_24dp);
                cancelAnimation();
                return;
            } else if (syncState == 3) {
                setVisibility(0);
                setImageResource(R.drawable.ic_sync_24dp);
                startAnimation();
                return;
            } else {
                setVisibility(8);
                cancelAnimation();
                return;
            }
        }
        setVisibility(8);
    }

    void setRefreshing(boolean z, boolean z2, float f) {
        setVisibility(z ? 0 : 8);
        setRotation(f);
        if (z && z2) {
            startAnimation();
        } else {
            animate().setListener(null).cancel();
        }
    }

    void startAnimation() {
        ViewPropertyAnimator viewPropertyAnimatorAnimate = animate();
        viewPropertyAnimatorAnimate.rotationBy(ROTATION_ANGLE);
        viewPropertyAnimatorAnimate.setDuration(1400L);
        viewPropertyAnimatorAnimate.setInterpolator(new LinearInterpolator());
        viewPropertyAnimatorAnimate.setListener(this);
    }

    void cancelAnimation() {
        setRotation(0.0f);
        animate().setListener(null).cancel();
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        startAnimation();
    }
}
