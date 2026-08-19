package com.sonymobile.scan3d.storageservice.ui.gallery.wizard;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class PagerIndicatorControl extends PagerIndicator implements UserInputReducer.InputReducer {
    private OnCloseListener mCloseListener;
    private TextView mNext;
    private TextView mPrevious;
    private boolean mRTLDirection;

    public PagerIndicatorControl(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        this.mRTLDirection = context.getResources().getConfiguration().getLayoutDirection() == 1;
        this.mNext = (Button) layoutInflaterFrom.inflate(R.layout.pager_button_layout, (ViewGroup) this, false);
        this.mPrevious = (Button) layoutInflaterFrom.inflate(R.layout.pager_button_layout, (ViewGroup) this, false);
        this.mNext.setOnClickListener(this);
        this.mPrevious.setOnClickListener(this);
        this.mNext.setGravity(8388629);
        this.mPrevious.setGravity(8388627);
        if (this.mRTLDirection) {
            addView(this.mNext, 0);
            addView(this.mPrevious);
        } else {
            addView(this.mPrevious, 0);
            addView(this.mNext);
        }
    }

    public void setOnCloseListener(OnCloseListener onCloseListener) {
        this.mCloseListener = onCloseListener;
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        int count = this.mViewPager.getAdapter().getCount();
        int currentItem = this.mViewPager.getCurrentItem();
        int i = currentItem + 1;
        boolean z = i == count;
        boolean z2 = currentItem == 0;
        if (view == this.mNext) {
            if (z) {
                OnCloseListener onCloseListener = this.mCloseListener;
                if (onCloseListener != null) {
                    onCloseListener.onClose();
                    return;
                }
                return;
            }
            this.mViewPager.setCurrentItem(i, true);
            return;
        }
        if (view == this.mPrevious) {
            if (z2) {
                OnCloseListener onCloseListener2 = this.mCloseListener;
                if (onCloseListener2 != null) {
                    onCloseListener2.onClose();
                    return;
                }
                return;
            }
            this.mViewPager.setCurrentItem(currentItem - 1, true);
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.PagerIndicator, androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageSelected(int i) {
        super.onPageSelected(i);
        boolean z = i + 1 == this.mViewPager.getAdapter().getCount();
        boolean z2 = i == 0;
        if (z) {
            this.mPrevious.setText((CharSequence) null);
            this.mPrevious.setCompoundDrawablesRelativeWithIntrinsicBounds(R.drawable.wizard_navigation_back_icon, 0, 0, 0);
            if (this.mRTLDirection) {
                this.mNext.setText(R.string.wizard_pager_indicator_close);
            } else {
                this.mNext.setText(R.string.wizard_pager_indicator_done);
            }
            this.mNext.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, 0, 0);
            return;
        }
        if (z2) {
            if (this.mRTLDirection) {
                this.mPrevious.setText(R.string.wizard_pager_indicator_done);
            } else {
                this.mPrevious.setText(R.string.wizard_pager_indicator_close);
            }
            this.mPrevious.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, 0, 0);
            this.mNext.setText((CharSequence) null);
            this.mNext.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, R.drawable.wizard_navigation_forward_icon, 0);
            return;
        }
        this.mPrevious.setText((CharSequence) null);
        this.mPrevious.setCompoundDrawablesRelativeWithIntrinsicBounds(R.drawable.wizard_navigation_back_icon, 0, 0, 0);
        this.mNext.setText((CharSequence) null);
        this.mNext.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, R.drawable.wizard_navigation_forward_icon, 0);
    }
}
