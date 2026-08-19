package com.sonymobile.scan3d.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import com.sonymobile.scan3d.R;

public abstract class ComponentFaceblendBottomBarBinding extends ViewDataBinding {

    @Nullable
    public final Button button1to1;

    @Nullable
    public final Button button4to3;

    @NonNull
    public final ComponentFaceblendSeekbarBinding meshContainer;

    @NonNull
    public final LinearLayout seekbarContainer;

    @Nullable
    public final ConstraintLayout selectVideoBar;

    @NonNull
    public final ComponentFaceblendSeekbarBinding textureContainer;

    protected ComponentFaceblendBottomBarBinding(DataBindingComponent dataBindingComponent, View view, int i, Button button, Button button2, ComponentFaceblendSeekbarBinding componentFaceblendSeekbarBinding, LinearLayout linearLayout, ConstraintLayout constraintLayout, ComponentFaceblendSeekbarBinding componentFaceblendSeekbarBinding2) {
        super(dataBindingComponent, view, i);
        this.button1to1 = button;
        this.button4to3 = button2;
        this.meshContainer = componentFaceblendSeekbarBinding;
        setContainedBinding(this.meshContainer);
        this.seekbarContainer = linearLayout;
        this.selectVideoBar = constraintLayout;
        this.textureContainer = componentFaceblendSeekbarBinding2;
        setContainedBinding(this.textureContainer);
    }

    @NonNull
    public static ComponentFaceblendBottomBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z) {
        return inflate(layoutInflater, viewGroup, z, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentFaceblendBottomBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentFaceblendBottomBarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_faceblend_bottom_bar, viewGroup, z, dataBindingComponent);
    }

    @NonNull
    public static ComponentFaceblendBottomBarBinding inflate(@NonNull LayoutInflater layoutInflater) {
        return inflate(layoutInflater, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentFaceblendBottomBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentFaceblendBottomBarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_faceblend_bottom_bar, null, false, dataBindingComponent);
    }

    public static ComponentFaceblendBottomBarBinding bind(@NonNull View view) {
        return bind(view, DataBindingUtil.getDefaultComponent());
    }

    public static ComponentFaceblendBottomBarBinding bind(@NonNull View view, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentFaceblendBottomBarBinding) bind(dataBindingComponent, view, R.layout.component_faceblend_bottom_bar);
    }
}
