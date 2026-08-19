package com.sonymobile.scan3d.widgets;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.sonymobile.scan3d.R;

public class SphinxProgressIndicator extends FrameLayout {
    private TextView mTextView;

    public SphinxProgressIndicator(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        mTextView = (TextView) findViewById(R.id.sphinx_progress_text);
    }

    public void setProgressText(int progress) {
        if (mTextView != null) {
            Resources resources = getResources();
            String text = resources.getString(R.string.percent_progress, Integer.valueOf(progress));
            mTextView.setText(text);
        }
    }
}
