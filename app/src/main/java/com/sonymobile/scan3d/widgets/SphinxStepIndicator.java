package com.sonymobile.scan3d.widgets;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.LinearLayout;

import java.util.ArrayList;
import java.util.List;

public class SphinxStepIndicator extends LinearLayout {
    List<SphinxStepIndicatorBullet> mBulletList;
    private int mCurrentStep;

    public SphinxStepIndicator(Context context, AttributeSet attrs) {
        super(context, attrs);
        mBulletList = new ArrayList<>();
        mCurrentStep = -1;
        setVisibility(View.INVISIBLE);
    }

    public void reset() {
        setVisibility(View.GONE);
        mBulletList.clear();
        mCurrentStep = -1;
        removeAllViews();
    }

    public void selectStep(int step, int progress) {
        if (step != mCurrentStep) {
            if (mCurrentStep > -1) {
                mBulletList.get(mCurrentStep).contractBullet();
            }
            mBulletList.get(step).expandBullet(progress);
            mCurrentStep = step;
        }
    }

    public void setNbrOfSteps(int nbrOfSteps) {
        if (mBulletList.size() != nbrOfSteps) {
            reset();
            for (int i = 0; i < nbrOfSteps; i++) {
                SphinxStepIndicatorBullet bullet = new SphinxStepIndicatorBullet(getContext(), this, i == 0);
                mBulletList.add(bullet);
            }
            setVisibility(View.VISIBLE);
            Animation animation = AnimationUtils.loadAnimation(getContext(), android.R.anim.fade_in);
            startAnimation(animation);
        }
    }
}
