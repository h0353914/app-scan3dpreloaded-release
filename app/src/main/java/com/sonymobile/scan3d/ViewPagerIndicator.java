package com.sonymobile.scan3d;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.PagerIndicator;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class ViewPagerIndicator extends PagerIndicator implements UserInputReducer.InputReducer {
    public ViewPagerIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        Button button = (Button) LayoutInflater.from(context).inflate(R.layout.pager_button_layout, (ViewGroup) this, false);
        button.setGravity(8388629);
        button.setText(R.string.next);
        button.setTextColor(context.getResources().getColor(R.color.primary_color_light, context.getTheme()));
        button.setOnClickListener(this);
        addView(button);
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        this.mViewPager.setCurrentItem(this.mViewPager.getCurrentItem() + (getContext().getResources().getConfiguration().getLayoutDirection() == 1 ? -1 : 1));
    }
}
