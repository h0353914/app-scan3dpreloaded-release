package com.sonymobile.scan3d.databinding;

import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import com.sonymobile.scan3d.R;

public abstract class ComponentSharingBarBinding extends ViewDataBinding {

    @NonNull
    public final ComponentSharingBarItemBinding actionAnimate;

    @NonNull
    public final ComponentSharingBarItemBinding actionEdit;

    @NonNull
    public final ComponentSharingBarItemBinding actionFaceMimic;

    @NonNull
    public final ComponentSharingBarItemBinding actionImprove;

    @NonNull
    public final ComponentSharingBarItemBinding actionShare;

    @Bindable
    protected String mAnimText;

    @Bindable
    protected Drawable mImproveDrawable;

    @NonNull
    public final LinearLayout sharingBarActionContainer;

    public abstract void setAnimText(@Nullable String str);

    public abstract void setImproveDrawable(@Nullable Drawable drawable);

    protected ComponentSharingBarBinding(DataBindingComponent dataBindingComponent, View view, int i, ComponentSharingBarItemBinding componentSharingBarItemBinding, ComponentSharingBarItemBinding componentSharingBarItemBinding2, ComponentSharingBarItemBinding componentSharingBarItemBinding3, ComponentSharingBarItemBinding componentSharingBarItemBinding4, ComponentSharingBarItemBinding componentSharingBarItemBinding5, LinearLayout linearLayout) {
        super(dataBindingComponent, view, i);
        this.actionAnimate = componentSharingBarItemBinding;
        setContainedBinding(this.actionAnimate);
        this.actionEdit = componentSharingBarItemBinding2;
        setContainedBinding(this.actionEdit);
        this.actionFaceMimic = componentSharingBarItemBinding3;
        setContainedBinding(this.actionFaceMimic);
        this.actionImprove = componentSharingBarItemBinding4;
        setContainedBinding(this.actionImprove);
        this.actionShare = componentSharingBarItemBinding5;
        setContainedBinding(this.actionShare);
        this.sharingBarActionContainer = linearLayout;
    }

    @Nullable
    public Drawable getImproveDrawable() {
        return this.mImproveDrawable;
    }

    @Nullable
    public String getAnimText() {
        return this.mAnimText;
    }

    @NonNull
    public static ComponentSharingBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z) {
        return inflate(layoutInflater, viewGroup, z, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentSharingBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentSharingBarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_sharing_bar, viewGroup, z, dataBindingComponent);
    }

    @NonNull
    public static ComponentSharingBarBinding inflate(@NonNull LayoutInflater layoutInflater) {
        return inflate(layoutInflater, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentSharingBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentSharingBarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_sharing_bar, null, false, dataBindingComponent);
    }

    public static ComponentSharingBarBinding bind(@NonNull View view) {
        return bind(view, DataBindingUtil.getDefaultComponent());
    }

    public static ComponentSharingBarBinding bind(@NonNull View view, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentSharingBarBinding) bind(dataBindingComponent, view, R.layout.component_sharing_bar);
    }
}
