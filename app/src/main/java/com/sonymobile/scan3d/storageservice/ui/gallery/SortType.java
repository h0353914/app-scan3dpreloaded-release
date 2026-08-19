package com.sonymobile.scan3d.storageservice.ui.gallery;

import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public enum SortType {
    DATE { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.SortType.1
        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.SortType
        public int getLabelId() {
            return R.string.gallery_sort_by_date_text;
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.SortType
        public String getSqlExpression() {
            return "created DESC";
        }
    },
    NAME { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.SortType.2
        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.SortType
        public int getLabelId() {
            return R.string.gallery_sort_by_name_text;
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.SortType
        public String getSqlExpression() {
            return "name COLLATE NOCASE ASC, created DESC";
        }
    };

    public abstract int getLabelId();

    public abstract String getSqlExpression();
}
