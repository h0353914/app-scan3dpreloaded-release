package com.sonymobile.scan3d.storageservice.ui.component;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class TransferPreference extends Preference {
    private UploadIndicator mIndicator;
    private boolean mIsTransferring;
    private float mRotation;
    private boolean mShowTransferIcon;

    public TransferPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setWidgetLayoutResource(R.layout.transfer_monitor_widget_layout);
        setSelectable(false);
    }

    @Override // androidx.preference.Preference
    protected void notifyChanged() {
        UploadIndicator uploadIndicator = this.mIndicator;
        if (uploadIndicator != null) {
            if (this.mShowTransferIcon) {
                this.mRotation = uploadIndicator.getRotation();
            } else {
                this.mRotation = 0.0f;
            }
            this.mIndicator.cancelAnimation();
        }
        super.notifyChanged();
    }

    public void setTransferStatus(boolean z, int i, int i2) {
        boolean z2 = i2 != i;
        if (z2) {
            Resources resources = getContext().getResources();
            setIcon(R.drawable.ic_cloud_off_24dp);
            setTitle(resources.getString(R.string.backup_sync_partially_finished, Integer.valueOf(i), Integer.valueOf(i2)));
        } else {
            setIcon(R.drawable.ic_cloud_24dp);
            setTitle(R.string.backup_sync_monitor_done);
        }
        if (z == this.mIsTransferring && z2 == this.mShowTransferIcon) {
            return;
        }
        this.mIsTransferring = z;
        this.mShowTransferIcon = z2;
        notifyChanged();
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        this.mIndicator = (UploadIndicator) preferenceViewHolder.findViewById(R.id.indicator);
        this.mIndicator.setRefreshing(this.mShowTransferIcon, this.mIsTransferring, this.mRotation);
    }
}
