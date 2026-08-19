package com.sonymobile.scan3d;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/* JADX INFO: loaded from: classes.dex */
public class SphinxToastView extends LinearLayout {
    private static final int MESSAGE_MIN_DISPLAY_TIME = 2000;
    private int mCurrentTextResource;
    private Animation mInAnimation;
    private LayoutInflater mLayoutInflater;
    private Animation mOutAnimation;
    private Animation mTextAnimation;
    private ToastAnimationSet mToastAnimationSet;

    public interface ISphinxToastListener {
        void onToastShown();
    }

    public SphinxToastView(Context context) {
        super(context);
        this.mCurrentTextResource = -1;
        init(context);
    }

    public SphinxToastView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mCurrentTextResource = -1;
        init(context);
    }

    public SphinxToastView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mCurrentTextResource = -1;
        init(context);
    }

    public void setAnimations(int i, int i2, int i3) {
        Context context = getContext();
        this.mInAnimation = AnimationUtils.loadAnimation(context, i);
        this.mOutAnimation = AnimationUtils.loadAnimation(context, i2);
        this.mTextAnimation = AnimationUtils.loadAnimation(context, i3);
    }

    private void init(Context context) {
        setOrientation(1);
        this.mLayoutInflater = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    public void show(int[] iArr, final boolean z, final ISphinxToastListener iSphinxToastListener) {
        if (this.mInAnimation == null || this.mOutAnimation == null || this.mTextAnimation == null) {
            throw new IllegalStateException("Animations must be set before showing toast view!");
        }
        ToastAnimationSet.Builder builder = new ToastAnimationSet.Builder();
        if (this.mCurrentTextResource != -1) {
            builder.addAnimation(this, this.mOutAnimation);
        }
        builder.addAnimation(this, this.mInAnimation);
        final View[] viewArr = new View[iArr.length];
        for (int i = 0; i < iArr.length; i++) {
            if (i == 0) {
                viewArr[i] = createToastMessageView(iArr[i], 0);
            } else {
                viewArr[i] = createToastMessageView(iArr[i], 4);
                builder.addAnimation(viewArr[i], this.mTextAnimation);
            }
            if (i < iArr.length - 1) {
                builder.addDelay(2000L);
            }
        }
        builder.setListener(new ToastAnimationSet.ToastAnimationListener() { // from class: com.sonymobile.scan3d.SphinxToastView.1
            @Override // com.sonymobile.scan3d.ToastAnimationSet.ToastAnimationListener
            public void onAnimationStart(View view, Animation animation) {
                if (animation == SphinxToastView.this.mInAnimation) {
                    SphinxToastView.this.updateMessage(z, viewArr);
                }
                if ((view instanceof TextView) && (view.getParent() instanceof LinearLayout) && (view.getParent().getParent() instanceof ScrollView)) {
                    TextView textView = (TextView) view;
                    LinearLayout linearLayout = (LinearLayout) textView.getParent();
                    ScrollView scrollView = (ScrollView) linearLayout.getParent();
                    Rect rect = new Rect();
                    textView.getHitRect(rect);
                    scrollView.requestChildRectangleOnScreen(linearLayout, rect, false);
                }
            }

            @Override // com.sonymobile.scan3d.ToastAnimationSet.ToastAnimationListener
            public void onAnimationEnd(View view, Animation animation) {
                animation.setAnimationListener(null);
                view.setVisibility(0);
            }

            @Override // com.sonymobile.scan3d.ToastAnimationSet.ToastAnimationListener
            public void onAllAnimationsComplete(ToastAnimationSet toastAnimationSet) {
                ISphinxToastListener iSphinxToastListener2 = iSphinxToastListener;
                if (iSphinxToastListener2 != null) {
                    iSphinxToastListener2.onToastShown();
                }
            }
        });
        setVisibility(0);
        this.mToastAnimationSet = builder.build();
        this.mToastAnimationSet.execute();
        this.mCurrentTextResource = iArr[0];
    }

    private void updateMessage(boolean z, View... viewArr) {
        setVisibility(0);
        removeAllViews();
        for (View view : viewArr) {
            addView(view);
        }
        setBackgroundTintMode(z ? PorterDuff.Mode.SRC_ATOP : null);
        if (z) {
            setBackgroundTintList(ColorStateList.valueOf(getContext().getColor(R.color.scan_hint_warning_bg)));
        }
    }

    public void hide() {
        if (this.mCurrentTextResource != -1) {
            this.mOutAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.sonymobile.scan3d.SphinxToastView.2
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    SphinxToastView.this.setVisibility(8);
                    animation.setAnimationListener(null);
                }
            });
            startAnimation(this.mOutAnimation);
            this.mToastAnimationSet.cancel();
            this.mCurrentTextResource = -1;
        }
    }

    private TextView createToastMessageView(int i, int i2) {
        TextView textView = (TextView) this.mLayoutInflater.inflate(R.layout.component_sphinx_toast_item, (ViewGroup) this, false);
        textView.setText(getResources().getString(i));
        textView.setVisibility(i2);
        return textView;
    }
}
