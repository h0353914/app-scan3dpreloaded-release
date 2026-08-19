package com.sonymobile.scan3d.viewer;

import android.animation.LayoutTransition;
import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public final class HintView extends FrameLayout {
    private int mCurrentHintResource;
    private View mHint;

    public HintView(@NonNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        setBackgroundColor(context.getColor(R.color.hint_bg));
        setLayoutTransition(new LayoutTransition());
        setVisibility(8);
    }

    public <T extends View> T addHintLayout(int i) {
        if (this.mCurrentHintResource != i || this.mHint == null) {
            this.mCurrentHintResource = i;
            this.mHint = LayoutInflater.from(getContext()).inflate(i, (ViewGroup) this, false);
            this.mHint.setVisibility(0);
        }
        return (T) this.mHint;
    }

    public void hideHint() {
        removeAllViews();
        this.mHint = null;
        if (getVisibility() == 0) {
            setAnimation(AnimationUtils.loadAnimation(getContext(), android.R.anim.fade_out));
            setVisibility(8);
        }
    }

    public void showHint() {
        View childAt = getChildAt(0);
        View view = this.mHint;
        if (view == null || view.equals(childAt)) {
            return;
        }
        if (getVisibility() == 8) {
            setAnimation(AnimationUtils.loadAnimation(getContext(), android.R.anim.fade_in));
            setVisibility(0);
        }
        removeAllViews();
        addView(this.mHint);
    }
}
