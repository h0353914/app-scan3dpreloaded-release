package com.sonymobile.scan3d.storageservice.ui.component;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import androidx.viewpager.widget.PagerAdapter;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.OnCloseListener;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.PagerIndicator;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class OnBoardingIndicatorControl extends PagerIndicator implements UserInputReducer.InputReducer {
    private OnCloseListener mCloseListener;
    private TextView mNext;
    private TextView mPrevious;
    private boolean mRTLDirection;

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.PagerIndicator
    public int getPagerIndicator() {
        return R.drawable.onboarding_pager_icon;
    }

    public OnBoardingIndicatorControl(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mRTLDirection = context.getResources().getConfiguration().getLayoutDirection() == 1;
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        this.mNext = (Button) layoutInflaterFrom.inflate(R.layout.pager_button_layout, (ViewGroup) this, false);
        this.mNext.setText(R.string.wizard_pager_indicator_next);
        this.mNext.setGravity(8388629);
        this.mNext.setOnClickListener(this);
        this.mPrevious = (Button) layoutInflaterFrom.inflate(R.layout.pager_button_layout, (ViewGroup) this, false);
        this.mPrevious.setText(R.string.wizard_pager_indicator_skip);
        this.mPrevious.setGravity(8388627);
        this.mPrevious.setOnClickListener(this);
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
        Context context = getContext();
        PagerAdapter adapter = this.mViewPager.getAdapter();
        boolean z = this.mRTLDirection;
        int i2 = R.string.wizard_pager_indicator_done;
        if (z) {
            this.mPrevious.setText(i == 0 ? context.getString(R.string.wizard_pager_indicator_done) : context.getString(R.string.wizard_pager_indicator_next));
            this.mNext.setText(i == adapter.getCount() + (-1) ? context.getString(R.string.wizard_pager_indicator_skip) : null);
            return;
        }
        this.mPrevious.setText(i == 0 ? context.getString(R.string.wizard_pager_indicator_skip) : null);
        TextView textView = this.mNext;
        if (i != adapter.getCount() - 1) {
            i2 = R.string.wizard_pager_indicator_next;
        }
        textView.setText(i2);
    }
}
