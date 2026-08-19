package com.sonymobile.scan3d.widgets;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Transformation;
import android.widget.TextView;

import com.sonymobile.scan3d.R;

public class SphinxStepIndicatorBullet {
    private static final int ANIMATION_TIME = 300;

    private int mBaseWidth;
    private View mBulletView;
    private Context mContext;
    private boolean mExpanded;
    private TextView mIndicatorTextView;

    public SphinxStepIndicatorBullet(Context context, ViewGroup parent, boolean selected) {
        mBulletView = LayoutInflater.from(context).inflate(R.layout.step_indicator_bullet_view, parent, false);
        mContext = context;
        mBulletView.setSelected(selected);
        mBulletView.setEnabled(selected);
        parent.addView(mBulletView);
        mBulletView.measure(0, 0);
        mBaseWidth = mBulletView.getMeasuredWidth();
        mIndicatorTextView = (TextView) mBulletView.findViewById(R.id.step_indicator_text);
    }

    public void contractBullet() {
        mExpanded = false;
        Animation animation = AnimationUtils.loadAnimation(mContext, android.R.anim.fade_out);
        animation.setDuration(ANIMATION_TIME);
        animation.setAnimationListener(new Animation.AnimationListener() {
            @Override
            public void onAnimationStart(Animation animation) {
            }

            @Override
            public void onAnimationEnd(Animation animation) {
                mIndicatorTextView.setVisibility(View.GONE);
                ResizeWidthAnimation resizeAnimation = new ResizeWidthAnimation(mBulletView, mBaseWidth);
                mBulletView.startAnimation(resizeAnimation);
            }

            @Override
            public void onAnimationRepeat(Animation animation) {
            }
        });
        mIndicatorTextView.startAnimation(animation);
    }

    public void expandBullet(int progress) {
        mExpanded = true;
        mBulletView.setSelected(true);
        mIndicatorTextView.setText(progress);
        mBulletView.measure(
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int measuredWidth = mBulletView.getMeasuredWidth();
        mBulletView.getLayoutParams().width = mBaseWidth;
        ResizeWidthAnimation resizeAnimation = new ResizeWidthAnimation(mBulletView, measuredWidth);
        resizeAnimation.setAnimationListener(new Animation.AnimationListener() {
            @Override
            public void onAnimationStart(Animation animation) {
            }

            @Override
            public void onAnimationEnd(Animation animation) {
                if (mExpanded) {
                    Animation fadeIn = AnimationUtils.loadAnimation(mContext, android.R.anim.fade_in);
                    fadeIn.setDuration(ANIMATION_TIME);
                    mIndicatorTextView.setVisibility(View.VISIBLE);
                    mIndicatorTextView.startAnimation(fadeIn);
                }
            }

            @Override
            public void onAnimationRepeat(Animation animation) {
            }
        });
        mBulletView.startAnimation(resizeAnimation);
    }

    private static class ResizeWidthAnimation extends Animation {
        private int mEndWidth;
        private int mStartWidth;
        private View mView;

        public ResizeWidthAnimation(View view, int endWidth) {
            mView = view;
            mStartWidth = view.getWidth();
            mEndWidth = endWidth;
            setDuration(ANIMATION_TIME);
        }

        @Override
        protected void applyTransformation(float interpolatedTime, Transformation t) {
            int width = mStartWidth + (int) ((mEndWidth - mStartWidth) * interpolatedTime);
            mView.getLayoutParams().width = width;
            mView.requestLayout();
        }

        @Override
        public boolean willChangeBounds() {
            return true;
        }
    }
}
