package com.sonymobile.scan3d.storageservice.ui.component;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewAnimationUtils;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.interpolator.view.animation.FastOutSlowInInterpolator;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;

/* JADX INFO: loaded from: classes.dex */
public class FabButton extends FrameLayout implements Animator.AnimatorListener, View.OnClickListener {
    private static final int DEFAULT_PULSE_REPEATS = 3;
    private static final String PROP_ALPHA = "alpha";
    private static final String PROP_SCALE_X = "scaleX";
    private static final String PROP_SCALE_Y = "scaleY";
    private static final long REVEAL_FEATURE_DESCRIPTION_DURATION = 700;
    private static final float SCALE_TO_INIT = 1.3f;
    private static final float SCALE_TO_PULSE = 1.4f;
    private static final float SCALE_TO_SHADOW_PULSE = 1.9599999f;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.ui.component.FabButton";
    private AnimatorSet mCurrentAnimation;
    private final ViewGroup mFabParent;
    private ImageButton mNormalButton;
    private final View mPulseView;
    private final ViewGroup mRevealView;
    private ImageButton mTipButton;

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationRepeat(Animator animator) {
    }

    public FabButton(@NonNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        inflate(context, R.layout.fab_button_layout, this);
        this.mFabParent = (ViewGroup) findViewById(R.id.fab_parent);
        this.mNormalButton = (ImageButton) findViewById(R.id.fab_normal);
        this.mTipButton = (ImageButton) findViewById(R.id.fab_inverted);
        this.mRevealView = (ViewGroup) findViewById(R.id.reveal_view);
        this.mPulseView = findViewById(R.id.pulse_view);
        setClipChildren(false);
        this.mRevealView.setOnClickListener(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        cancelAnimation();
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        int buttonLayoutCenterX = getButtonLayoutCenterX();
        int buttonLayoutCenterY = getButtonLayoutCenterY();
        int revealRadius = getRevealRadius();
        this.mRevealView.setX(buttonLayoutCenterX - revealRadius);
        this.mRevealView.setY(buttonLayoutCenterY - revealRadius);
    }

    @Override // android.view.View
    public final void setOnClickListener(@Nullable View.OnClickListener onClickListener) {
        this.mNormalButton.setOnClickListener(onClickListener);
    }

    public void onPause() {
        DebugLog.d(TAG, "onPause(): ");
        cancelAnimation();
    }

    public void hide() {
        cancelAnimation();
        this.mNormalButton.animate().scaleX(0.0f).scaleY(0.0f).rotation(360.0f).setDuration(300L).setInterpolator(new LinearInterpolator()).start();
    }

    public void show() {
        this.mNormalButton.animate().scaleX(1.0f).scaleY(1.0f).rotation(0.0f).setStartDelay(300L).setInterpolator(new AccelerateDecelerateInterpolator()).start();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        cancelAnimation();
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        this.mRevealView.setVisibility(0);
        this.mTipButton.setVisibility(0);
        this.mPulseView.setVisibility(0);
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        this.mRevealView.setVisibility(4);
        this.mTipButton.setVisibility(4);
        this.mPulseView.setVisibility(4);
        this.mCurrentAnimation = null;
    }

    public void showTip() {
        if (isAttachedToWindow() && this.mCurrentAnimation == null) {
            this.mCurrentAnimation = new AnimatorSet();
            Animator[] animatorArr = new Animator[5];
            animatorArr[0] = newRevealAnimation();
            for (int i = 1; i <= 3; i++) {
                animatorArr[i] = newPulseAnimator();
            }
            animatorArr[4] = newUnRevealAnimation();
            this.mCurrentAnimation.playSequentially(animatorArr);
            this.mCurrentAnimation.setInterpolator(new FastOutSlowInInterpolator());
            this.mCurrentAnimation.addListener(this);
            this.mCurrentAnimation.start();
        }
    }

    private void cancelAnimation() {
        AnimatorSet animatorSet = this.mCurrentAnimation;
        if (animatorSet == null || !animatorSet.isStarted()) {
            return;
        }
        this.mCurrentAnimation.cancel();
        this.mCurrentAnimation = null;
    }

    private Animator newPulseAnimator() {
        AnimatorSet animatorSet = new AnimatorSet();
        ObjectAnimator objectAnimatorOfPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(this.mTipButton, PropertyValuesHolder.ofFloat(PROP_SCALE_X, SCALE_TO_INIT, SCALE_TO_PULSE), PropertyValuesHolder.ofFloat(PROP_SCALE_Y, SCALE_TO_INIT, SCALE_TO_PULSE));
        objectAnimatorOfPropertyValuesHolder.setDuration(REVEAL_FEATURE_DESCRIPTION_DURATION);
        objectAnimatorOfPropertyValuesHolder.setRepeatCount(1);
        objectAnimatorOfPropertyValuesHolder.setRepeatMode(2);
        ObjectAnimator objectAnimatorOfPropertyValuesHolder2 = ObjectAnimator.ofPropertyValuesHolder(this.mPulseView, PropertyValuesHolder.ofFloat(PROP_SCALE_X, SCALE_TO_INIT, SCALE_TO_SHADOW_PULSE), PropertyValuesHolder.ofFloat(PROP_SCALE_Y, SCALE_TO_INIT, SCALE_TO_SHADOW_PULSE));
        objectAnimatorOfPropertyValuesHolder2.setDuration(1400L);
        objectAnimatorOfPropertyValuesHolder2.setRepeatCount(1);
        objectAnimatorOfPropertyValuesHolder2.setRepeatMode(2);
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.mPulseView, PROP_ALPHA, 1.0f, 0.0f);
        objectAnimatorOfFloat.setDuration(1400L);
        animatorSet.playTogether(objectAnimatorOfPropertyValuesHolder, objectAnimatorOfPropertyValuesHolder2, objectAnimatorOfFloat);
        return animatorSet;
    }

    private Animator newRevealAnimation() {
        int buttonRadius = getButtonRadius();
        int revealRadius = getRevealRadius();
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(ViewAnimationUtils.createCircularReveal(this.mRevealView, revealRadius, revealRadius, buttonRadius, revealRadius), ObjectAnimator.ofPropertyValuesHolder(this.mTipButton, PropertyValuesHolder.ofFloat(PROP_SCALE_X, 0.0f, SCALE_TO_INIT), PropertyValuesHolder.ofFloat(PROP_SCALE_Y, 0.0f, SCALE_TO_INIT)), ObjectAnimator.ofFloat(this.mRevealView, PROP_ALPHA, 0.0f, 1.0f));
        animatorSet.setDuration(REVEAL_FEATURE_DESCRIPTION_DURATION);
        return animatorSet;
    }

    private Animator newUnRevealAnimation() {
        int buttonRadius = getButtonRadius();
        int revealRadius = getRevealRadius();
        int buttonCenterX = getButtonCenterX();
        int buttonCenterY = getButtonCenterY();
        AnimatorSet animatorSet = new AnimatorSet();
        float f = buttonRadius;
        animatorSet.playTogether(ViewAnimationUtils.createCircularReveal(this.mTipButton, buttonCenterX, buttonCenterY, f, 0.0f), ViewAnimationUtils.createCircularReveal(this.mRevealView, revealRadius, revealRadius, revealRadius, f), ObjectAnimator.ofFloat(this.mRevealView, PROP_ALPHA, 1.0f, 0.0f));
        animatorSet.setDuration(REVEAL_FEATURE_DESCRIPTION_DURATION);
        return animatorSet;
    }

    private int getRevealRadius() {
        return this.mRevealView.getWidth() / 2;
    }

    private int getButtonLayoutCenterX() {
        return (int) (this.mFabParent.getX() + (this.mFabParent.getWidth() / 2.0f));
    }

    private int getButtonLayoutCenterY() {
        return (int) (this.mFabParent.getY() + (this.mFabParent.getHeight() / 2.0f));
    }

    private int getButtonCenterX() {
        return (int) (this.mNormalButton.getX() + (this.mNormalButton.getWidth() / 2.0f));
    }

    private int getButtonCenterY() {
        return (int) (this.mNormalButton.getY() + (this.mNormalButton.getHeight() / 2.0f));
    }

    private int getButtonRadius() {
        return this.mNormalButton.getWidth() / 2;
    }
}
