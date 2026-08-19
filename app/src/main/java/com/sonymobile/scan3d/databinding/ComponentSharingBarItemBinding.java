package com.sonymobile.scan3d.databinding;

import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import com.sonymobile.scan3d.R;

public abstract class ComponentSharingBarItemBinding extends ViewDataBinding {

    @Bindable
    protected Drawable mDrawable;

    @Bindable
    protected String mText;

    public abstract void setDrawable(@Nullable Drawable drawable);

    public abstract void setText(@Nullable String str);

    protected ComponentSharingBarItemBinding(DataBindingComponent dataBindingComponent, View view, int i) {
        super(dataBindingComponent, view, i);
    }

    @Nullable
    public String getText() {
        return this.mText;
    }

    @Nullable
    public Drawable getDrawable() {
        return this.mDrawable;
    }

    @NonNull
    public static ComponentSharingBarItemBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z) {
        return inflate(layoutInflater, viewGroup, z, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentSharingBarItemBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentSharingBarItemBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_sharing_bar_item, viewGroup, z, dataBindingComponent);
    }

    @NonNull
    public static ComponentSharingBarItemBinding inflate(@NonNull LayoutInflater layoutInflater) {
        return inflate(layoutInflater, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static ComponentSharingBarItemBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentSharingBarItemBinding) DataBindingUtil.inflate(layoutInflater, R.layout.component_sharing_bar_item, null, false, dataBindingComponent);
    }

    public static ComponentSharingBarItemBinding bind(@NonNull View view) {
        return bind(view, DataBindingUtil.getDefaultComponent());
    }

    public static ComponentSharingBarItemBinding bind(@NonNull View view, @Nullable DataBindingComponent dataBindingComponent) {
        return (ComponentSharingBarItemBinding) bind(dataBindingComponent, view, R.layout.component_sharing_bar_item);
    }
}
