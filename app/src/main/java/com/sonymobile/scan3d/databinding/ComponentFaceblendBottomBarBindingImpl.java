package com.sonymobile.scan3d.databinding;

import android.util.SparseIntArray;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import androidx.lifecycle.LifecycleOwner;
import com.sonymobile.scan3d.R;

public class ComponentFaceblendBottomBarBindingImpl extends ComponentFaceblendBottomBarBinding {

    @Nullable
    private static final ViewDataBinding.IncludedLayouts sIncludes = new ViewDataBinding.IncludedLayouts(6);

    @Nullable
    private static final SparseIntArray sViewsWithIds;
    private long mDirtyFlags;

    @Override // androidx.databinding.ViewDataBinding
    public boolean setVariable(int i, @Nullable Object obj) {
        return true;
    }

    static {
        sIncludes.setIncludes(0, new String[]{"component_faceblend_seekbar", "component_faceblend_seekbar"}, new int[]{1, 2}, new int[]{R.layout.component_faceblend_seekbar, R.layout.component_faceblend_seekbar});
        sViewsWithIds = new SparseIntArray();
        sViewsWithIds.put(R.id.select_video_bar, 3);
        sViewsWithIds.put(R.id.button_1to1, 4);
        sViewsWithIds.put(R.id.button_4to3, 5);
    }

    public ComponentFaceblendBottomBarBindingImpl(@Nullable DataBindingComponent dataBindingComponent, @NonNull View view) {
        this(dataBindingComponent, view, mapBindings(dataBindingComponent, view, 6, sIncludes, sViewsWithIds));
    }

    private ComponentFaceblendBottomBarBindingImpl(DataBindingComponent dataBindingComponent, View view, Object[] objArr) {
        super(dataBindingComponent, view, 2, (Button) objArr[4], (Button) objArr[5], (ComponentFaceblendSeekbarBinding) objArr[2], (LinearLayout) objArr[0], (ConstraintLayout) objArr[3], (ComponentFaceblendSeekbarBinding) objArr[1]);
        this.mDirtyFlags = -1L;
        this.seekbarContainer.setTag(null);
        setRootTag(view);
        invalidateAll();
    }

    @Override // androidx.databinding.ViewDataBinding
    public void invalidateAll() {
        synchronized (this) {
            this.mDirtyFlags = 4L;
        }
        this.textureContainer.invalidateAll();
        this.meshContainer.invalidateAll();
        requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean hasPendingBindings() {
        synchronized (this) {
            if (this.mDirtyFlags != 0) {
                return true;
            }
            return this.textureContainer.hasPendingBindings() || this.meshContainer.hasPendingBindings();
        }
    }

    @Override // androidx.databinding.ViewDataBinding
    public void setLifecycleOwner(@Nullable LifecycleOwner lifecycleOwner) {
        super.setLifecycleOwner(lifecycleOwner);
        this.textureContainer.setLifecycleOwner(lifecycleOwner);
        this.meshContainer.setLifecycleOwner(lifecycleOwner);
    }

    @Override // androidx.databinding.ViewDataBinding
    protected boolean onFieldChange(int i, Object obj, int i2) {
        switch (i) {
            case 0:
                return onChangeMeshContainer((ComponentFaceblendSeekbarBinding) obj, i2);
            case 1:
                return onChangeTextureContainer((ComponentFaceblendSeekbarBinding) obj, i2);
            default:
                return false;
        }
    }

    private boolean onChangeMeshContainer(ComponentFaceblendSeekbarBinding componentFaceblendSeekbarBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 1;
        }
        return true;
    }

    private boolean onChangeTextureContainer(ComponentFaceblendSeekbarBinding componentFaceblendSeekbarBinding, int i) {
        if (i != 0) {
            return false;
        }
        synchronized (this) {
            this.mDirtyFlags |= 2;
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
        if ((j & 4) != 0) {
            this.meshContainer.setDrawable(getDrawableFromResource(getRoot(), R.drawable.faceblend_mesh));
            this.textureContainer.setDrawable(getDrawableFromResource(getRoot(), R.drawable.faceblend_texture));
        }
        executeBindingsOn(this.textureContainer);
        executeBindingsOn(this.meshContainer);
    }
}
