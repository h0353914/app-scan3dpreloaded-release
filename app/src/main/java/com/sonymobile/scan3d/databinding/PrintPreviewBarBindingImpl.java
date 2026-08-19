package com.sonymobile.scan3d.databinding;

import android.graphics.drawable.Drawable;
import android.util.SparseIntArray;
import android.view.View;
import android.widget.LinearLayout;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import androidx.lifecycle.LifecycleOwner;
import com.sonymobile.scan3d.R;

public class PrintPreviewBarBindingImpl extends PrintPreviewBarBinding {

    @Nullable
    private static final ViewDataBinding.IncludedLayouts sIncludes = new ViewDataBinding.IncludedLayouts(4);

    @Nullable
    private static final SparseIntArray sViewsWithIds;
    private long mDirtyFlags;

    @NonNull
    private final LinearLayout mboundView0;

    static {
        sIncludes.setIncludes(0, new String[]{"component_sharing_bar_item", "component_sharing_bar_item", "component_sharing_bar_item"}, new int[]{1, 2, 3}, new int[]{R.layout.component_sharing_bar_item, R.layout.component_sharing_bar_item, R.layout.component_sharing_bar_item});
        sViewsWithIds = null;
    }

    public PrintPreviewBarBindingImpl(@Nullable DataBindingComponent dataBindingComponent, @NonNull View view) {
        this(dataBindingComponent, view, mapBindings(dataBindingComponent, view, 4, sIncludes, sViewsWithIds));
    }

    private PrintPreviewBarBindingImpl(DataBindingComponent dataBindingComponent, View view, Object[] objArr) {
        super(dataBindingComponent, view, 3, (ComponentSharingBarItemBinding) objArr[1], (ComponentSharingBarItemBinding) objArr[2], (ComponentSharingBarItemBinding) objArr[3]);
        this.mDirtyFlags = -1L;
        this.mboundView0 = (LinearLayout) objArr[0];
        this.mboundView0.setTag(null);
        setRootTag(view);
        invalidateAll();
    }

    @Override // androidx.databinding.ViewDataBinding
    public void invalidateAll() {
        synchronized (this) {
            this.mDirtyFlags = 16L;
        }
        this.actionEdit.invalidateAll();
        this.actionPrintEdit.invalidateAll();
        this.actionToggleBase.invalidateAll();
        requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean hasPendingBindings() {
        synchronized (this) {
            if (this.mDirtyFlags != 0) {
                return true;
            }
            return this.actionEdit.hasPendingBindings() || this.actionPrintEdit.hasPendingBindings() || this.actionToggleBase.hasPendingBindings();
        }
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean setVariable(int i, @Nullable Object obj) {
        if (3 != i) {
            return false;
        }
        setSocleDrawable((Drawable) obj);
        return true;
    }

    @Override // com.sonymobile.scan3d.databinding.PrintPreviewBarBinding
    public void setSocleDrawable(@Nullable Drawable drawable) {
        this.mSocleDrawable = drawable;
        synchronized (this) {
            this.mDirtyFlags |= 8;
        }
        notifyPropertyChanged(3);
        super.requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    public void setLifecycleOwner(@Nullable LifecycleOwner lifecycleOwner) {
        super.setLifecycleOwner(lifecycleOwner);
        this.actionEdit.setLifecycleOwner(lifecycleOwner);
        this.actionPrintEdit.setLifecycleOwner(lifecycleOwner);
        this.actionToggleBase.setLifecycleOwner(lifecycleOwner);
    }

    @Override // androidx.databinding.ViewDataBinding
    protected boolean onFieldChange(int i, Object obj, int i2) {
        switch (i) {
            case 0:
                return onChangeActionPrintEdit((ComponentSharingBarItemBinding) obj, i2);
            case 1:
                return onChangeActionToggleBase((ComponentSharingBarItemBinding) obj, i2);
            case 2:
                return onChangeActionEdit((ComponentSharingBarItemBinding) obj, i2);
            default:
                return false;
        }
    }

    private boolean onChangeActionPrintEdit(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 1;
        }
        return true;
    }

    private boolean onChangeActionToggleBase(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 2;
        }
        return true;
    }

    private boolean onChangeActionEdit(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 4;
        }
        return true;
    }

    @Override // androidx.databinding.ViewDataBinding
    protected void executeBindings() {
        long j;
        synchronized (this) {
            j = this.mDirtyFlags;
            this.mDirtyFlags = 0L;
        }
        Drawable drawable = this.mSocleDrawable;
        long j2 = 24 & j;
        if ((j & 16) != 0) {
            this.actionEdit.setDrawable(getDrawableFromResource(getRoot(), R.drawable.ic_edit_24dp));
            this.actionEdit.setText(getRoot().getResources().getString(R.string.edit_print_text));
            this.actionPrintEdit.setDrawable(getDrawableFromResource(getRoot(), R.drawable.ic_3d_rotation_24dp));
            this.actionPrintEdit.setText(getRoot().getResources().getString(R.string.edit_print_geometry));
            this.actionToggleBase.setText(getRoot().getResources().getString(R.string.toggle_base));
        }
        if (j2 != 0) {
            this.actionToggleBase.setDrawable(drawable);
        }
        executeBindingsOn(this.actionEdit);
        executeBindingsOn(this.actionPrintEdit);
        executeBindingsOn(this.actionToggleBase);
    }
}
