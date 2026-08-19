package com.sonymobile.scan3d.widgets;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.ProgressBar;

import com.sonymobile.scan3d.R;

public class SphinxProgressBar extends FrameLayout {
    private static final String PROPERTY_X = "X";
    private static final int THRESHOLD = 5;

    private ObjectAnimator mAnimator;
    private final SphinxProgressIndicator mIndicator;
    private final Interpolator mInterpolator;
    private final ProgressBar mProgressBar;

    public SphinxProgressBar(Context context, AttributeSet attrs) {
        super(context, attrs);
        LayoutInflater.from(context).inflate(R.layout.progress_layout, this, true);
        mProgressBar = (ProgressBar) findViewById(R.id.sphinx_progress);
        mIndicator = (SphinxProgressIndicator) findViewById(R.id.sphinx_indicator);
        mInterpolator = new AccelerateDecelerateInterpolator();
    }

    private void onProgressChanged(int oldProgress, int newProgress) {
        updateIndicator(oldProgress, newProgress);
    }

    private void updateIndicator(int oldProgress, int newProgress) {
        mIndicator.setProgressText(newProgress);
        int layoutDirection = getLayoutDirection();
        int max = mProgressBar.getMax();
        float y = mProgressBar.getY() + (mIndicator.getTop() - mIndicator.getBottom()) * 0.5f - mProgressBar.getPaddingTop();
        mIndicator.setY(y);
        if (mAnimator != null) {
            mAnimator.cancel();
        }
        int offset;
        if (layoutDirection == View.LAYOUT_DIRECTION_RTL) {
            offset = (max - newProgress) * (mProgressBar.getRight() - mProgressBar.getLeft()) / max;
        } else {
            offset = (mProgressBar.getRight() - mProgressBar.getLeft()) * newProgress / max;
        }
        float x = mProgressBar.getX() + offset - (mIndicator.getRight() - mIndicator.getLeft()) * 0.5f;
        if (newProgress - oldProgress > THRESHOLD) {
            mAnimator = ObjectAnimator.ofFloat(mIndicator, PROPERTY_X, mIndicator.getX(), x);
            mAnimator.setDuration(200);
            mAnimator.setInterpolator(mInterpolator);
            mAnimator.start();
        } else {
            mIndicator.setX(x);
        }
    }

    public void hide() {
        if (getVisibility() == View.VISIBLE) {
            setVisibility(View.GONE);
            Animation animation = AnimationUtils.loadAnimation(getContext(), R.anim.scale_out);
            startAnimation(animation);
        }
    }

    public void setProgress(int progress) {
        int oldProgress = mProgressBar.getProgress();
        if (oldProgress != progress) {
            mProgressBar.setProgress(progress);
            onProgressChanged(oldProgress, progress);
        }
    }

    public void show() {
        if (getVisibility() == View.GONE) {
            setVisibility(View.VISIBLE);
            Animation animation = AnimationUtils.loadAnimation(getContext(), R.anim.scale_in);
            startAnimation(animation);
            int progress = mProgressBar.getProgress();
            updateIndicator(progress, progress);
        }
    }
}
