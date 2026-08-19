package com.sonymobile.scan3d.widgets;

import android.content.Context;
import android.graphics.Point;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.FrameLayout;

import androidx.viewpager.widget.ViewPager;

import com.sonymobile.scan3d.R;

public class ViewPagerContainer extends FrameLayout {
    private Point mFirstTouch;
    private ViewPager mViewPager;

    public ViewPagerContainer(Context context) {
        super(context);
        mFirstTouch = new Point();
    }

    public ViewPagerContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
        mFirstTouch = new Point();
    }

    public ViewPagerContainer(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        mFirstTouch = new Point();
    }

    public ViewPagerContainer(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        mFirstTouch = new Point();
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        mViewPager = (ViewPager) findViewById(R.id.view_pager);
        if (mViewPager == null) {
            throw new RuntimeException("Couldn't find ViewPager!");
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == 0) {
            mFirstTouch.x = (int) event.getX();
            mFirstTouch.y = (int) event.getY();
        }
        float dx = getWidth() / 2 - mFirstTouch.x;
        float dy = getHeight() / 2 - mFirstTouch.y;
        event.offsetLocation(dx, dy);
        return mViewPager.dispatchTouchEvent(event);
    }
}
