package com.sonymobile.scan3d.databinding;

import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import com.sonymobile.scan3d.R;

public abstract class ComponentFaceblendSeekbarBinding extends ViewDataBinding {

    @Bindable
    protected Drawable mDrawable;

    @NonNull
    public final SeekBar seekbar;

    public abstract void setDrawable(@Nullable Drawable drawable);

    protected ComponentFaceblendSeekbarBinding(DataBindingComponent dataBindingComponent, View view, int i, SeekBar seekBar) {
        super(dataBindingComponent, view, i);
        this.seekbar = seekBar;
    }

    @Nullable
    public Drawable getDrawable() {
        return this.mDrawable;
    }

    @NonNull
    public static ComponentFaceblendSeekbarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z) {
        return inflate(layoutInflater, viewGroup, z, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentFaceblendSeekbarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentFaceblendSeekbarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_faceblend_seekbar, viewGroup, z, dataBindingComponent);
    }

    @NonNull
    public static ComponentFaceblendSeekbarBinding inflate(@NonNull LayoutInflater layoutInflater) {
        return inflate(layoutInflater, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentFaceblendSeekbarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentFaceblendSeekbarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_faceblend_seekbar, null, false, dataBindingComponent);
    }

    public static ComponentFaceblendSeekbarBinding bind(@NonNull View view) {
        return bind(view, DataBindingUtil.getDefaultComponent());
    }

    public static ComponentFaceblendSeekbarBinding bind(@NonNull View view, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentFaceblendSeekbarBinding) bind(dataBindingComponent, view, R.layout.component_faceblend_seekbar);
    }
}
