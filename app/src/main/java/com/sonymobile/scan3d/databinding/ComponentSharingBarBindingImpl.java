package com.sonymobile.scan3d.databinding;

import android.graphics.drawable.Drawable;
import android.util.SparseIntArray;
import android.view.View;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import androidx.lifecycle.LifecycleOwner;
import com.sonymobile.scan3d.R;

public class ComponentSharingBarBindingImpl extends ComponentSharingBarBinding {

    @Nullable
    private static final ViewDataBinding.IncludedLayouts sIncludes = new ViewDataBinding.IncludedLayouts(7);

    @Nullable
    private static final SparseIntArray sViewsWithIds;
    private long mDirtyFlags;

    @NonNull
    private final HorizontalScrollView mboundView0;

    static {
        sIncludes.setIncludes(1, new String[]{"component_sharing_bar_item", "component_sharing_bar_item", "component_sharing_bar_item", "component_sharing_bar_item", "component_sharing_bar_item"}, new int[]{2, 3, 4, 5, 6}, new int[]{R.layout.component_sharing_bar_item, R.layout.component_sharing_bar_item, R.layout.component_sharing_bar_item, R.layout.component_sharing_bar_item, R.layout.component_sharing_bar_item});
        sViewsWithIds = null;
    }

    public ComponentSharingBarBindingImpl(@Nullable DataBindingComponent dataBindingComponent, @NonNull View view) {
        this(dataBindingComponent, view, mapBindings(dataBindingComponent, view, 7, sIncludes, sViewsWithIds));
    }

    private ComponentSharingBarBindingImpl(DataBindingComponent dataBindingComponent, View view, Object[] objArr) {
        super(dataBindingComponent, view, 5, (ComponentSharingBarItemBinding) objArr[5], (ComponentSharingBarItemBinding) objArr[3], (ComponentSharingBarItemBinding) objArr[6], (ComponentSharingBarItemBinding) objArr[2], (ComponentSharingBarItemBinding) objArr[4], (LinearLayout) objArr[1]);
        this.mDirtyFlags = -1L;
        this.mboundView0 = (HorizontalScrollView) objArr[0];
        this.mboundView0.setTag(null);
        this.sharingBarActionContainer.setTag(null);
        setRootTag(view);
        invalidateAll();
    }

    @Override // androidx.databinding.ViewDataBinding
    public void invalidateAll() {
        synchronized (this) {
            this.mDirtyFlags = 128L;
        }
        this.actionImprove.invalidateAll();
        this.actionEdit.invalidateAll();
        this.actionShare.invalidateAll();
        this.actionAnimate.invalidateAll();
        this.actionFaceMimic.invalidateAll();
        requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean hasPendingBindings() {
        synchronized (this) {
            if (this.mDirtyFlags != 0) {
                return true;
            }
            return this.actionImprove.hasPendingBindings() || this.actionEdit.hasPendingBindings() || this.actionShare.hasPendingBindings() || this.actionAnimate.hasPendingBindings() || this.actionFaceMimic.hasPendingBindings();
        }
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean setVariable(int i, @Nullable Object obj) {
        if (1 == i) {
            setImproveDrawable((Drawable) obj);
            return true;
        }
        if (4 != i) {
            return false;
        }
        setAnimText((String) obj);
        return true;
    }

    @Override // com.sonymobile.scan3d.databinding.ComponentSharingBarBinding
    public void setImproveDrawable(@Nullable Drawable drawable) {
        this.mImproveDrawable = drawable;
        synchronized (this) {
            this.mDirtyFlags |= 32;
        }
        notifyPropertyChanged(1);
        super.requestRebind();
    }

    @Override // com.sonymobile.scan3d.databinding.ComponentSharingBarBinding
    public void setAnimText(@Nullable String str) {
        this.mAnimText = str;
        synchronized (this) {
            this.mDirtyFlags |= 64;
        }
        notifyPropertyChanged(4);
        super.requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    public void setLifecycleOwner(@Nullable LifecycleOwner lifecycleOwner) {
        super.setLifecycleOwner(lifecycleOwner);
        this.actionImprove.setLifecycleOwner(lifecycleOwner);
        this.actionEdit.setLifecycleOwner(lifecycleOwner);
        this.actionShare.setLifecycleOwner(lifecycleOwner);
        this.actionAnimate.setLifecycleOwner(lifecycleOwner);
        this.actionFaceMimic.setLifecycleOwner(lifecycleOwner);
    }

    @Override // androidx.databinding.ViewDataBinding
    protected boolean onFieldChange(int i, Object obj, int i2) {
        switch (i) {
            case 0:
                return onChangeActionFaceMimic((ComponentSharingBarItemBinding) obj, i2);
            case 1:
                return onChangeActionAnimate((ComponentSharingBarItemBinding) obj, i2);
            case 2:
                return onChangeActionImprove((ComponentSharingBarItemBinding) obj, i2);
            case 3:
                return onChangeActionShare((ComponentSharingBarItemBinding) obj, i2);
            case 4:
                return onChangeActionEdit((ComponentSharingBarItemBinding) obj, i2);
            default:
                return false;
        }
    }

    private boolean onChangeActionFaceMimic(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 1;
        }
        return true;
    }

    private boolean onChangeActionAnimate(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 2;
        }
        return true;
    }

    private boolean onChangeActionImprove(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 4;
        }
        return true;
    }

    private boolean onChangeActionShare(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 8;
        }
        return true;
    }

    private boolean onChangeActionEdit(ComponentSharingBarItemBinding componentSharingBarItemBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 16;
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
        Drawable drawable = this.mImproveDrawable;
        String str = this.mAnimText;
        long j2 = 160 & j;
        long j3 = 192 & j;
        if ((j & 128) != 0) {
            this.actionAnimate.setDrawable(getDrawableFromResource(getRoot(), R.drawable.ic_animate_24dp));
            this.actionEdit.setDrawable(getDrawableFromResource(getRoot(), R.drawable.ic_tune_24dp));
            this.actionEdit.setText(getRoot().getResources().getString(R.string.viewer_action_button_edit));
            this.actionFaceMimic.setDrawable(getDrawableFromResource(getRoot(), R.drawable.ic_face_mimic_24dp));
            this.actionFaceMimic.setText(getRoot().getResources().getString(R.string.viewer_action_button_face_mimic));
            this.actionImprove.setText(getRoot().getResources().getString(R.string.viewer_action_button_improve));
            this.actionShare.setDrawable(getDrawableFromResource(getRoot(), R.drawable.ic_share_24dp));
            this.actionShare.setText(getRoot().getResources().getString(R.string.viewer_action_button_share));
        }
        if (j3 != 0) {
            this.actionAnimate.setText(str);
        }
        if (j2 != 0) {
            this.actionImprove.setDrawable(drawable);
        }
        executeBindingsOn(this.actionImprove);
        executeBindingsOn(this.actionEdit);
        executeBindingsOn(this.actionShare);
        executeBindingsOn(this.actionAnimate);
        executeBindingsOn(this.actionFaceMimic);
    }
}
