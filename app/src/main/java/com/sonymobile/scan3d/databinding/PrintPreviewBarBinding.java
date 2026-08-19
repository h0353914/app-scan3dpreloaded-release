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

public abstract class PrintPreviewBarBinding extends ViewDataBinding {

    @NonNull
    public final ComponentSharingBarItemBinding actionEdit;

    @NonNull
    public final ComponentSharingBarItemBinding actionPrintEdit;

    @NonNull
    public final ComponentSharingBarItemBinding actionToggleBase;

    @Bindable
    protected Drawable mSocleDrawable;

    public abstract void setSocleDrawable(@Nullable Drawable drawable);

    protected PrintPreviewBarBinding(DataBindingComponent dataBindingComponent, View view, int i, ComponentSharingBarItemBinding componentSharingBarItemBinding, ComponentSharingBarItemBinding componentSharingBarItemBinding2, ComponentSharingBarItemBinding componentSharingBarItemBinding3) {
        super(dataBindingComponent, view, i);
        this.actionEdit = componentSharingBarItemBinding;
        setContainedBinding(this.actionEdit);
        this.actionPrintEdit = componentSharingBarItemBinding2;
        setContainedBinding(this.actionPrintEdit);
        this.actionToggleBase = componentSharingBarItemBinding3;
        setContainedBinding(this.actionToggleBase);
    }

    @Nullable
    public Drawable getSocleDrawable() {
        return this.mSocleDrawable;
    }

    @NonNull
    public static PrintPreviewBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z) {
        return inflate(layoutInflater, viewGroup, z, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static PrintPreviewBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, boolean z, @Nullable DataBindingComponent dataBindingComponent) {
        return (PrintPreviewBarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.print_preview_bar, viewGroup, z, dataBindingComponent);
    }

    @NonNull
    public static PrintPreviewBarBinding inflate(@NonNull LayoutInflater layoutInflater) {
        return inflate(layoutInflater, DataBindingUtil.getDefaultComponent());
    }

    @NonNull
    public static PrintPreviewBarBinding inflate(@NonNull LayoutInflater layoutInflater, @Nullable DataBindingComponent dataBindingComponent) {
        return (PrintPreviewBarBinding) DataBindingUtil.inflate(layoutInflater, R.layout.print_preview_bar, null, false, dataBindingComponent);
    }

    public static PrintPreviewBarBinding bind(@NonNull View view) {
        return bind(view, DataBindingUtil.getDefaultComponent());
    }

    public static PrintPreviewBarBinding bind(@NonNull View view, @Nullable DataBindingComponent dataBindingComponent) {
        return (PrintPreviewBarBinding) bind(dataBindingComponent, view, R.layout.print_preview_bar);
    }
}
