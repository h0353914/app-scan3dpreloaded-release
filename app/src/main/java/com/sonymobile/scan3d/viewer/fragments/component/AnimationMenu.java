package com.sonymobile.scan3d.viewer.fragments.component;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ViewSwitcher;
import androidx.annotation.ColorRes;
import androidx.annotation.IntRange;
import androidx.annotation.Nullable;
import androidx.interpolator.view.animation.FastOutLinearInInterpolator;
import androidx.interpolator.view.animation.LinearOutSlowInInterpolator;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.fragments.utils.ViewerUtils;
import java.util.ArrayList;

public class AnimationMenu extends LinearLayout implements UserInputReducer.InputReducer {
    public static final int FIRST = 0;
    private static final int MAX_NUM_MENU_ITEMS = 2;
    public static final int PICKER_ANIMATIONS = 0;
    public static final int PICKER_BACKGROUNDS = 1;
    public static final int SECOND = 1;
    private final int mAnimationDuration;
    private final ViewGroup mButtonParent;
    private AnimationMenuListener mListener;
    private int mSelectedMenuIndex;
    private final ViewSwitcher mSwitcher;
    private final ViewGroup mTopMenuParent;

    public interface AnimationMenuListener {
        default void onAnimateChanged(boolean z) {
        }

        default void onItemPicked(Pickable pickable) {
        }

        default void onPickModel() {
        }

        default void onRotateChanged(boolean z) {
        }
    }

    public AnimationMenu(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mSelectedMenuIndex = 0;
        setOrientation(1);
        inflate(context, R.layout.animation_settings_layout, this);
        this.mButtonParent = (ViewGroup) findViewById(R.id.button_parent);
        this.mSwitcher = (ViewSwitcher) findViewById(R.id.content);
        this.mSwitcher.setDescendantFocusability(393216);
        this.mTopMenuParent = (ViewGroup) findViewById(R.id.menu_content);
        this.mAnimationDuration = getResources().getInteger(R.integer.short_anim_time);
        LayoutTransition layoutTransition = new LayoutTransition();
        layoutTransition.enableTransitionType(4);
        setLayoutTransition(layoutTransition);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (z) {
            for (int i5 = 0; i5 < this.mSwitcher.getChildCount(); i5++) {
                View childAt = this.mSwitcher.getChildAt(i5);
                ViewGroup viewGroup = (ViewGroup) childAt.findViewById(R.id.list);
                if (viewGroup != null && ((Integer) childAt.getTag()).intValue() == 1) {
                    int childCount = viewGroup.getChildCount();
                    for (int i6 = 0; i6 < childCount; i6++) {
                        View childAt2 = viewGroup.getChildAt(i6);
                        if (childAt2.isSelected()) {
                            onSelectionChanged(childAt2, false);
                        }
                    }
                }
            }
        }
    }

    public void addPickerMenu(int i, ArrayList<Pickable> arrayList, int i2) {
        String string;
        Resources resources = getResources();
        switch (i) {
            case 0:
                string = resources.getString(R.string.animation_selection_animations);
                break;
            case 1:
                string = resources.getString(R.string.animation_selection_background);
                break;
            default:
                throw new IllegalArgumentException("No such picker id " + i);
        }
        addPickerMenu(i, string, arrayList, i2);
    }

    public void addSettingsMenu(boolean z, boolean z2, boolean z3) {
        if (this.mSwitcher.getChildCount() >= 2) {
            throw new IllegalArgumentException("Only 2 menu items allowed");
        }
        LayoutInflater layoutInflater = getLayoutInflater();
        View viewInflate = layoutInflater.inflate(R.layout.animation_settings_category_layout, this.mSwitcher);
        View viewFindViewById = viewInflate.findViewById(R.id.animation_switch_view);
        final Switch r3 = (Switch) viewInflate.findViewById(R.id.animation_enable);
        View viewFindViewById2 = viewInflate.findViewById(R.id.revolving_switch_view);
        final Switch r1 = (Switch) viewInflate.findViewById(R.id.revolving_enable);
        r1.setChecked(z3);
        viewFindViewById.setOnClickListener((UserInputReducer.InputReducer) view -> {
            r3.toggle();
            AnimationMenuListener animationMenuListener = this.mListener;
            if (animationMenuListener != null) {
                animationMenuListener.onAnimateChanged(r3.isChecked());
            }
        });
        viewFindViewById2.setOnClickListener((UserInputReducer.InputReducer) view -> {
            r1.toggle();
            AnimationMenuListener animationMenuListener = this.mListener;
            if (animationMenuListener != null) {
                animationMenuListener.onRotateChanged(r1.isChecked());
            }
        });
        setFaceAnimationsSwitchState(z, z2);
        addButton(layoutInflater, getResources().getString(R.string.animation_selection_settings));
    }

    public void setFaceAnimationsSwitchState(boolean z, boolean z2) {
        View viewFindViewById = findViewById(R.id.animation_switch_view);
        Switch r1 = (Switch) findViewById(R.id.animation_enable);
        ((TextView) findViewById(R.id.animation_title)).setTextColor(getResources().getColor(z ? R.color.text_disabled_white : android.R.color.white, null));
        boolean z3 = false;
        ((TextView) findViewById(R.id.animation_disabled_help_text)).setVisibility(z ? 0 : 8);
        r1.setEnabled(!z);
        if (!z && z2) {
            z3 = true;
        }
        r1.setChecked(z3);
        viewFindViewById.setClickable(!z);
    }

    public void setup(@IntRange(from = 0, to = 1) int i, @ColorRes int i2) {
        if (i < 0 || i > 1) {
            i = 0;
        }
        if (i2 != R.color.background_60_percent_opaque) {
            i2 = R.color.background_20_percent_opaque;
        }
        setBackgroundColor(getContext().getResources().getColor(i2, getContext().getTheme()));
        if (this.mSwitcher.getChildCount() == 1) {
            this.mTopMenuParent.setVisibility(8);
            return;
        }
        this.mTopMenuParent.setVisibility(0);
        this.mSelectedMenuIndex = i;
        selectOne(this.mButtonParent, this.mSelectedMenuIndex);
        if (this.mSelectedMenuIndex != this.mSwitcher.indexOfChild(this.mSwitcher.getCurrentView())) {
            this.mSwitcher.showNext();
        }
    }

    public void setup(@ColorRes int i) {
        setup(0, i);
    }

    public void addAnimationMenuListener(AnimationMenuListener animationMenuListener) {
        this.mListener = animationMenuListener;
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        int id = view.getId();
        if (id == R.id.animation_menu_button) {
            int iIntValue = ((Integer) view.getTag()).intValue();
            if (this.mSelectedMenuIndex != iIntValue) {
                onMenuSelectionChanged(iIntValue, (Button) view);
                int i = this.mSelectedMenuIndex + 1;
                this.mSelectedMenuIndex = i;
                this.mSelectedMenuIndex = i % this.mSwitcher.getChildCount();
                return;
            }
            return;
        }
        if (id != R.id.picker_item) {
            return;
        }
        Pickable pickable = (Pickable) view.getTag();
        switch (pickable.getWhichPicker()) {
            case 0:
                selectOne((ViewGroup) view.getParent(), view);
                break;
            case 1:
                onSelectionChanged(view, true);
                break;
        }
        AnimationMenuListener animationMenuListener = this.mListener;
        if (animationMenuListener != null) {
            animationMenuListener.onItemPicked(pickable);
        }
    }

    public int getSelectedMenuIndex() {
        return this.mSelectedMenuIndex;
    }

    private void addPickerMenu(int i, String str, ArrayList<Pickable> arrayList, int i2) {
        View viewInflate;
        if (this.mSwitcher.getChildCount() >= 2) {
            throw new IllegalArgumentException("Only 2 menu items allowed");
        }
        for (int i3 = 0; i3 < this.mButtonParent.getChildCount(); i3++) {
            if (str.contentEquals(((Button) this.mButtonParent.getChildAt(i3)).getText())) {
                return;
            }
        }
        LayoutInflater layoutInflater = getLayoutInflater();
        View viewInflate2 = layoutInflater.inflate(R.layout.animation_picker_layout, this.mSwitcher, false);
        ViewGroup viewGroup = (ViewGroup) viewInflate2.findViewById(R.id.list);
        int adjustedPickerItemMargin = ViewerUtils.getAdjustedPickerItemMargin(getContext(), getResources().getDimension(R.dimen.picker_item_width), arrayList.size());
        int i4 = 0;
        while (i4 < arrayList.size()) {
            Pickable pickable = arrayList.get(i4);
            pickable.setWhichPicker(i);
            if (i == 0) {
                viewInflate = layoutInflater.inflate(R.layout.picker_item_layout, viewGroup, false);
                ((ImageView) viewInflate.findViewById(R.id.picker_item_image)).setImageResource(pickable.getImageResource());
                ((TextView) viewInflate.findViewById(R.id.picker_item_text)).setText(pickable.getName());
            } else {
                viewInflate = layoutInflater.inflate(R.layout.background_picker_item_layout, viewGroup, false);
                int descriptionResourceId = pickable.getDescriptionResourceId();
                if (descriptionResourceId != 0) {
                    viewInflate.setContentDescription(getContext().getString(descriptionResourceId));
                }
                ((ImageView) viewInflate.findViewById(R.id.picker_item_image)).setImageResource(pickable.getImageResource());
            }
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) viewInflate.getLayoutParams();
            marginLayoutParams.setMargins(adjustedPickerItemMargin, 0, adjustedPickerItemMargin, 0);
            viewInflate.setLayoutParams(marginLayoutParams);
            viewInflate.setSelected(i2 == i4);
            viewInflate.setTag(pickable);
            viewInflate.setOnClickListener(this);
            viewGroup.addView(viewInflate);
            i4++;
        }
        viewInflate2.setTag(Integer.valueOf(i));
        this.mSwitcher.addView(viewInflate2);
        addButton(layoutInflater, str);
    }

    private void addButton(LayoutInflater layoutInflater, String str) {
        Button button = (Button) layoutInflater.inflate(R.layout.animation_settings_title_layout, this.mButtonParent, false);
        button.setTextColor(getResources().getColorStateList(R.color.animation_menu_selector, null));
        button.setText(str);
        int i = this.mSelectedMenuIndex;
        this.mSelectedMenuIndex = i + 1;
        button.setTag(Integer.valueOf(i));
        button.setOnClickListener(this);
        this.mButtonParent.addView(button);
    }

    private void onSelectionChanged(View view, boolean z) {
        ViewGroup viewGroup = (ViewGroup) view.getParent();
        ViewGroup viewGroup2 = (ViewGroup) viewGroup.getParent();
        View viewFindViewById = viewGroup2.findViewById(R.id.selector);
        viewFindViewById.setVisibility(0);
        float x = view.getX() - ((viewGroup2.getX() + ((viewFindViewById.getWidth() - view.getWidth()) / 2.0f)) + viewGroup.getX());
        if (z) {
            ViewPropertyAnimator viewPropertyAnimatorAnimate = viewFindViewById.animate();
            viewPropertyAnimatorAnimate.setDuration(this.mAnimationDuration);
            viewPropertyAnimatorAnimate.setInterpolator(new LinearOutSlowInInterpolator());
            viewPropertyAnimatorAnimate.translationX(x);
            viewPropertyAnimatorAnimate.start();
        } else {
            viewFindViewById.setTranslationX(x);
        }
        selectOne(viewGroup, view);
    }

    private void onMenuSelectionChanged(int i, Button button) {
        Context context = getContext();
        ViewGroup viewGroup = (ViewGroup) button.getParent();
        View viewFindViewById = findViewById(R.id.indicator);
        float x = button.getX() - viewGroup.getX();
        selectOne(this.mButtonParent, button);
        if (i > this.mSelectedMenuIndex) {
            this.mSwitcher.setInAnimation(context, R.anim.slide_in_right);
            this.mSwitcher.setOutAnimation(context, R.anim.slide_out_left);
        } else {
            this.mSwitcher.setInAnimation(context, R.anim.slide_in_left);
            this.mSwitcher.setOutAnimation(context, R.anim.slide_out_right);
        }
        ViewPropertyAnimator viewPropertyAnimatorAnimate = viewFindViewById.animate();
        viewPropertyAnimatorAnimate.setDuration(this.mAnimationDuration);
        viewPropertyAnimatorAnimate.setInterpolator(new FastOutLinearInInterpolator());
        viewPropertyAnimatorAnimate.translationX(x);
        viewPropertyAnimatorAnimate.start();
        this.mSwitcher.showNext();
    }

    private static void selectOne(ViewGroup viewGroup, View view) {
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = viewGroup.getChildAt(i);
            childAt.setSelected(view == childAt);
        }
    }

    private static void selectOne(ViewGroup viewGroup, int i) {
        selectOne(viewGroup, viewGroup.getChildAt(i));
    }

    private LayoutInflater getLayoutInflater() {
        return LayoutInflater.from(getContext());
    }
}
