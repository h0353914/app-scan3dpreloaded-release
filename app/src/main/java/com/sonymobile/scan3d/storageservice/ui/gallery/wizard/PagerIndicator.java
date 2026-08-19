package com.sonymobile.scan3d.storageservice.ui.gallery.wizard;

import android.animation.AnimatorInflater;
import android.animation.StateListAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class PagerIndicator extends LinearLayout implements ViewPager.OnPageChangeListener, ViewPager.OnAdapterChangeListener {
    private LinearLayout mIconLayout;
    protected ViewPager mViewPager;

    public int getPagerIndicator() {
        return R.drawable.pager_icon;
    }

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int i) {
    }

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageScrolled(int i, float f, int i2) {
    }

    public PagerIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setHorizontalScrollBarEnabled(false);
        this.mIconLayout = (LinearLayout) LayoutInflater.from(context).inflate(R.layout.icon_indicator_layout, (ViewGroup) this, false);
        addView(this.mIconLayout);
    }

    @Override // androidx.viewpager.widget.ViewPager.OnAdapterChangeListener
    public void onAdapterChanged(@NonNull ViewPager viewPager, @Nullable PagerAdapter pagerAdapter, @Nullable PagerAdapter pagerAdapter2) {
        updateAdapter(pagerAdapter2);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        View rootView = getRootView();
        if (rootView instanceof ViewGroup) {
            this.mViewPager = (ViewPager) ((ViewGroup) rootView).findViewById(R.id.view_pager);
            ViewPager viewPager = this.mViewPager;
            if (viewPager == null) {
                throw new IllegalArgumentException("Could not find view pager.");
            }
            PagerAdapter adapter = viewPager.getAdapter();
            if (adapter == null) {
                this.mViewPager.addOnAdapterChangeListener(this);
            } else {
                updateAdapter(adapter);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ViewPager viewPager = this.mViewPager;
        if (viewPager != null) {
            viewPager.removeOnPageChangeListener(this);
        }
        this.mIconLayout.removeAllViews();
    }

    public void onPageSelected(int i) {
        int i2 = 0;
        while (i2 < this.mIconLayout.getChildCount()) {
            View childAt = this.mIconLayout.getChildAt(i2);
            if (getContext().getResources().getConfiguration().getLayoutDirection() == 1) {
                childAt.setSelected(i2 == (this.mIconLayout.getChildCount() - 1) - i);
            } else {
                childAt.setSelected(i2 == i);
            }
            i2++;
        }
    }

    private StateListAnimator getStateListAnim() {
        return AnimatorInflater.loadStateListAnimator(getContext(), getPagerIndicator());
    }

    private void updateAdapter(PagerAdapter pagerAdapter) {
        int count = pagerAdapter.getCount();
        if (count > 1) {
            this.mViewPager.addOnPageChangeListener(this);
            int currentItem = this.mViewPager.getCurrentItem();
            LayoutInflater layoutInflaterFrom = LayoutInflater.from(getContext());
            for (int i = 0; i < count; i++) {
                ImageView imageView = (ImageView) layoutInflaterFrom.inflate(R.layout.component_wizard_indicator, (ViewGroup) this.mIconLayout, false);
                imageView.setImageResource(getPagerIndicator());
                imageView.setStateListAnimator(getStateListAnim());
                this.mIconLayout.addView(imageView);
            }
            onPageSelected(currentItem);
            return;
        }
        setVisibility(4);
    }
}
