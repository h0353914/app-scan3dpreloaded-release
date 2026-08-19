package com.sonymobile.scan3d.databinding;

import android.graphics.drawable.Drawable;
import android.util.SparseIntArray;
import android.view.View;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import androidx.databinding.adapters.TextViewBindingAdapter;

public class ComponentSharingBarItemBindingImpl extends ComponentSharingBarItemBinding {

    @Nullable
    private static final ViewDataBinding.IncludedLayouts sIncludes = null;

    @Nullable
    private static final SparseIntArray sViewsWithIds = null;
    private long mDirtyFlags;

    @NonNull
    private final TextView mboundView0;

    @Override // androidx.databinding.ViewDataBinding
    protected boolean onFieldChange(int i, Object obj, int i2) {
        return false;
    }

    public ComponentSharingBarItemBindingImpl(@Nullable DataBindingComponent dataBindingComponent, @NonNull View view) {
        this(dataBindingComponent, view, mapBindings(dataBindingComponent, view, 1, sIncludes, sViewsWithIds));
    }

    private ComponentSharingBarItemBindingImpl(DataBindingComponent dataBindingComponent, View view, Object[] objArr) {
        super(dataBindingComponent, view, 0);
        this.mDirtyFlags = -1L;
        this.mboundView0 = (TextView) objArr[0];
        this.mboundView0.setTag(null);
        setRootTag(view);
        invalidateAll();
    }

    @Override // androidx.databinding.ViewDataBinding
    public void invalidateAll() {
        synchronized (this) {
            this.mDirtyFlags = 4L;
        }
        requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean hasPendingBindings() {
        synchronized (this) {
            return this.mDirtyFlags != 0;
        }
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean setVariable(int i, @Nullable Object obj) {
        if (2 == i) {
            setDrawable((Drawable) obj);
        } else {
            if (5 != i) {
                return false;
            }
            setText((String) obj);
        }
        return true;
    }

    @Override // com.sonymobile.scan3d.databinding.ComponentSharingBarItemBinding
    public void setDrawable(@Nullable Drawable drawable) {
        this.mDrawable = drawable;
        synchronized (this) {
            this.mDirtyFlags |= 1;
        }
        notifyPropertyChanged(2);
        super.requestRebind();
    }

    @Override // com.sonymobile.scan3d.databinding.ComponentSharingBarItemBinding
    public void setText(@Nullable String str) {
        this.mText = str;
        synchronized (this) {
            this.mDirtyFlags |= 2;
        }
        notifyPropertyChanged(5);
        super.requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    protected void executeBindings() {
        long j;
        synchronized (this) {
            j = this.mDirtyFlags;
            this.mDirtyFlags = 0L;
        }
        Drawable drawable = this.mDrawable;
        String str = this.mText;
        long j2 = 5 & j;
        long j3 = j & 6;
        if (j2 != 0) {
            TextViewBindingAdapter.setDrawableTop(this.mboundView0, drawable);
        }
        if (j3 != 0) {
            TextViewBindingAdapter.setText(this.mboundView0, str);
        }
    }
}
