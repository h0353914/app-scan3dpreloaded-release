package com.sonymobile.scan3d;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import androidx.viewpager.widget.ViewPager;

/* JADX INFO: loaded from: classes.dex */
public class ViewPagerNavigation extends FrameLayout implements ViewPager.OnPageChangeListener {
    private View mEndButtons;
    private View mIndicator;
    private boolean mRTLDirection;
    private ViewPager mViewPager;

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int i) {
    }

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageScrolled(int i, float f, int i2) {
    }

    public ViewPagerNavigation(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mRTLDirection = getContext().getResources().getConfiguration().getLayoutDirection() == 1;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mEndButtons = findViewById(R.id.end_button_container);
        this.mIndicator = findViewById(R.id.indicator);
        this.mViewPager = (ViewPager) getRootView().findViewById(R.id.view_pager);
        this.mViewPager.addOnPageChangeListener(this);
        onPageSelected(this.mRTLDirection ? this.mViewPager.getAdapter().getCount() - 1 : 0);
    }

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageSelected(int i) {
        int count = this.mViewPager.getAdapter().getCount();
        boolean z = true;
        if (!this.mRTLDirection ? i != count - 1 : i != 0) {
            z = false;
        }
        if (z) {
            this.mIndicator.setVisibility(8);
            this.mEndButtons.setVisibility(0);
        } else {
            this.mIndicator.setVisibility(0);
            this.mEndButtons.setVisibility(8);
        }
    }
}
