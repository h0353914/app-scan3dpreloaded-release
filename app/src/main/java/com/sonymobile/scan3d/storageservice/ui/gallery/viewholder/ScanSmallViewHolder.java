package com.sonymobile.scan3d.storageservice.ui.gallery.viewholder;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.IOnScanMenuItemClickListener;
import com.sonymobile.scan3d.storageservice.ui.IScanListener;

/* JADX INFO: loaded from: classes.dex */
public class ScanSmallViewHolder extends ScanViewHolder {
    public static final int VIEW_TYPE = 2131492971;

    public static RecyclerView.ViewHolder newInstance(Context context, ViewGroup viewGroup, IScanListener iScanListener, IOnScanMenuItemClickListener iOnScanMenuItemClickListener, boolean z) {
        return new ScanSmallViewHolder(LayoutInflater.from(context).inflate(R.layout.fragment_item_small, viewGroup, false), iScanListener, iOnScanMenuItemClickListener, z);
    }

    private ScanSmallViewHolder(View view, IScanListener iScanListener, IOnScanMenuItemClickListener iOnScanMenuItemClickListener, boolean z) {
        super(view, iScanListener, iOnScanMenuItemClickListener, z);
    }
}
