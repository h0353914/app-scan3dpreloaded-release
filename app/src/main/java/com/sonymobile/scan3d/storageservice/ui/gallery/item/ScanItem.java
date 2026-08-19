package com.sonymobile.scan3d.storageservice.ui.gallery.item;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;

/* JADX INFO: loaded from: classes.dex */
public class ScanItem implements GalleryItem {
    private IFileSet mFileSet;
    private Improvement mImprovement;
    private boolean mSmall;

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem
    public int getSpanCount() {
        return 1;
    }

    public ScanItem(IFileSet iFileSet, Improvement improvement, boolean z) {
        this.mFileSet = iFileSet;
        this.mImprovement = improvement;
        this.mSmall = z;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem
    public int getViewHolderType() {
        return this.mSmall ? R.layout.fragment_item_small : R.layout.fragment_item;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem
    public long getItemId() {
        return this.mFileSet.getId();
    }

    public IFileSet getFileSet() {
        return this.mFileSet;
    }

    public Improvement getImprovement() {
        return this.mImprovement;
    }
}
