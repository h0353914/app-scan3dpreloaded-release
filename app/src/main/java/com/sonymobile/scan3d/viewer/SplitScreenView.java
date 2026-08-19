package com.sonymobile.scan3d.viewer;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Point;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.TextView;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class SplitScreenView extends TextView {
    private static final String KEY_RATIO = "ratio";
    private static final String KEY_SUPER_STATE = "superState";
    private int mCompoundDrawable;
    private String mCurrentText;
    private int mLeftTextWidth;
    private OnSplitScreenViewListener mListener;
    private float mMinWidth;
    private int mOffset;
    private int mPaddingEnd;
    private int mPaddingStart;
    private int mRightTextWidth;
    private float mScreenSplitRatio;
    private int mScreenWidth;
    private String mTextLeft;
    private String mTextRight;
    private float mTouchEventPrevX;

    public interface OnSplitScreenViewListener {
        void onSplitScreenRatioChanged(float f);
    }

    public SplitScreenView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        init(attributeSet);
    }

    public SplitScreenView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(attributeSet);
    }

    public void setOnSplitScreenViewListener(OnSplitScreenViewListener onSplitScreenViewListener) {
        this.mListener = onSplitScreenViewListener;
    }

    @Override // android.widget.TextView, android.view.View
    public Parcelable onSaveInstanceState() {
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_SUPER_STATE, super.onSaveInstanceState());
        bundle.putFloat(KEY_RATIO, getSplitScreenRatio());
        return bundle;
    }

    @Override // android.widget.TextView, android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof Bundle) {
            Bundle bundle = (Bundle) parcelable;
            setSplitScreenRatio(bundle.getFloat(KEY_RATIO));
            parcelable = bundle.getParcelable(KEY_SUPER_STATE);
        }
        super.onRestoreInstanceState(parcelable);
    }

    private void init(AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, R.styleable.SplitScreenView);
        this.mOffset = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, 0);
        this.mTextLeft = typedArrayObtainStyledAttributes.getString(4);
        this.mTextRight = typedArrayObtainStyledAttributes.getString(5);
        this.mCompoundDrawable = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        this.mPaddingStart = typedArrayObtainStyledAttributes.getDimensionPixelSize(3, 0);
        this.mPaddingEnd = typedArrayObtainStyledAttributes.getDimensionPixelSize(2, 0);
        typedArrayObtainStyledAttributes.recycle();
        WindowManager windowManager = (WindowManager) getContext().getSystemService("window");
        Point point = new Point();
        windowManager.getDefaultDisplay().getSize(point);
        this.mScreenWidth = point.x;
        float intrinsicWidth = getResources().getDrawable(this.mCompoundDrawable, null).getIntrinsicWidth() + getCompoundDrawablePadding() + this.mPaddingStart + this.mPaddingEnd;
        this.mLeftTextWidth = (int) (getPaint().measureText(this.mTextLeft) + intrinsicWidth);
        this.mRightTextWidth = (int) (intrinsicWidth + getPaint().measureText(this.mTextRight));
        ViewTreeObserver viewTreeObserver = getViewTreeObserver();
        if (viewTreeObserver.isAlive()) {
            viewTreeObserver.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.sonymobile.scan3d.viewer.SplitScreenView.1
                @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
                public void onGlobalLayout() {
                    SplitScreenView splitScreenView = SplitScreenView.this;
                    splitScreenView.mMinWidth = splitScreenView.getHeight();
                    if (SplitScreenView.this.mMinWidth == 0.0f) {
                        return;
                    }
                    SplitScreenView.this.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                    GradientDrawable gradientDrawable = new GradientDrawable();
                    gradientDrawable.setShape(0);
                    float height = SplitScreenView.this.getHeight() / 2.0f;
                    gradientDrawable.setCornerRadii(new float[]{height, height, height, height, height, height, height, height});
                    gradientDrawable.setColor(Color.argb(64, 0, 0, 0));
                    gradientDrawable.setStroke(3, -1);
                    SplitScreenView.this.setBackground(gradientDrawable);
                    SplitScreenView splitScreenView2 = SplitScreenView.this;
                    splitScreenView2.setSplitScreenRatio(splitScreenView2.getSplitScreenRatio());
                }
            });
        }
    }

    @Override // android.widget.TextView, android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (!isEnabled()) {
            return true;
        }
        int action = motionEvent.getAction() & 255;
        if (action == 0) {
            this.mTouchEventPrevX = motionEvent.getRawX();
        } else if (action == 2) {
            setSplitScreenRatio(getSplitScreenRatio() + ((motionEvent.getRawX() - this.mTouchEventPrevX) / this.mScreenWidth));
            this.mTouchEventPrevX = motionEvent.getRawX();
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float getSplitScreenRatio() {
        return this.mScreenSplitRatio;
    }

    public float minSplitScreenRatio() {
        return (this.mOffset + (this.mMinWidth / 2.0f)) / this.mScreenWidth;
    }

    public float maxSplitScreenRatio() {
        return 1.0f - minSplitScreenRatio();
    }

    public void setSplitScreenRatio(float f) {
        float fMaxSplitScreenRatio;
        float fMax = Math.max(Math.min(f, maxSplitScreenRatio()), minSplitScreenRatio());
        this.mScreenSplitRatio = fMax;
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (fMax < 0.5f) {
            setLeftTextIfNeeded();
            fMaxSplitScreenRatio = 1.0f - ((fMax - minSplitScreenRatio()) / (0.5f - minSplitScreenRatio()));
            float f2 = this.mMinWidth;
            int i = this.mLeftTextWidth;
            layoutParams.width = (int) Math.min(f2 + ((i - f2) * fMaxSplitScreenRatio * 1.2f), i);
            setX((this.mScreenWidth * fMax) - (this.mMinWidth / 2.0f));
        } else {
            setRightTextIfNeeded();
            fMaxSplitScreenRatio = (fMax - 0.5f) / (maxSplitScreenRatio() - 0.5f);
            float f3 = this.mMinWidth;
            int i2 = this.mRightTextWidth;
            layoutParams.width = (int) Math.min(f3 + ((i2 - f3) * fMaxSplitScreenRatio * 1.2f), i2);
            setX(((this.mScreenWidth * fMax) - layoutParams.width) + (this.mMinWidth / 2.0f));
        }
        setTextColor(Color.argb((int) (fMaxSplitScreenRatio * 255.0f), 255, 255, 255));
        setLayoutParams(layoutParams);
        OnSplitScreenViewListener onSplitScreenViewListener = this.mListener;
        if (onSplitScreenViewListener != null) {
            onSplitScreenViewListener.onSplitScreenRatioChanged(fMax);
        }
    }

    private void setRightTextIfNeeded() {
        String str = this.mCurrentText;
        String str2 = this.mTextRight;
        if (str != str2) {
            this.mCurrentText = str2;
            setText(str2);
            setCompoundDrawablesWithIntrinsicBounds(0, 0, this.mCompoundDrawable, 0);
            setPadding(this.mPaddingEnd, getPaddingTop(), this.mPaddingStart, getPaddingBottom());
        }
    }

    private void setLeftTextIfNeeded() {
        String str = this.mCurrentText;
        String str2 = this.mTextLeft;
        if (str != str2) {
            this.mCurrentText = str2;
            setText(str2);
            setCompoundDrawablesWithIntrinsicBounds(this.mCompoundDrawable, 0, 0, 0);
            setPadding(this.mPaddingStart, getPaddingTop(), this.mPaddingEnd, getPaddingBottom());
        }
    }
}
