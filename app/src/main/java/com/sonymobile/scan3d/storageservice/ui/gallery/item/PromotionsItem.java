package com.sonymobile.scan3d.storageservice.ui.gallery.item;

import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class PromotionsItem implements GalleryItem {
    private final int mSpanCount;

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem
    public long getItemId() {
        return 0L;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem
    public int getViewHolderType() {
        return R.layout.promotions_layout;
    }

    public PromotionsItem(int i) {
        this.mSpanCount = i;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem
    public int getSpanCount() {
        return this.mSpanCount;
    }
}
