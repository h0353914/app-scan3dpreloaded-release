package com.sonymobile.scan3d.storageservice.ui.gallery;

import android.content.Context;
import android.net.Uri;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.storageservice.ui.IOnScanMenuItemClickListener;
import com.sonymobile.scan3d.storageservice.ui.IScanListener;
import com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem;
import com.sonymobile.scan3d.storageservice.ui.gallery.item.PromotionsItem;
import com.sonymobile.scan3d.storageservice.ui.gallery.item.ScanItem;
import com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.GalleryViewHolder;
import com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.PromotionsViewHolder;
import com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.ScanSmallViewHolder;
import com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.ScanViewHolder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

/* JADX INFO: loaded from: classes.dex */
class GalleryAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private Context mContext;
    private ArrayList<Uri> mExcludedUris;
    private boolean mIsSignedIn;
    private final IOnScanMenuItemClickListener mOnScanMenuClicked;
    private final IScanListener mScanListener;
    private final int[] mScanTypesToInclude;
    private boolean mShowPromotions;
    private final boolean mShowWebShare;
    private int mSpanCount = 2;
    private List<GalleryItem> mList = new ArrayList();
    private Map<Uri, Improvement> mImprovements = new HashMap();
    private List<IFileSet> mFileSets;

    GalleryAdapter(Context context, IScanListener iScanListener, IOnScanMenuItemClickListener iOnScanMenuItemClickListener, boolean z, boolean z2, int[] iArr, ArrayList<Uri> arrayList) {
        this.mContext = context;
        this.mScanListener = iScanListener;
        this.mOnScanMenuClicked = iOnScanMenuItemClickListener;
        this.mFileSets = new ArrayList();
        this.mShowPromotions = z;
        this.mShowWebShare = !z2;
        this.mIsSignedIn = AccountUtils.isSignedIn(context);
        this.mScanTypesToInclude = iArr;
        this.mExcludedUris = arrayList;
        setHasStableIds(true);
        createContentList();
    }

    private void createContentList() {
        this.mList.clear();
        if (this.mShowPromotions) {
            this.mList.add(new PromotionsItem(this.mSpanCount));
        }
        for (IFileSet iFileSet : this.mFileSets) {
            if (shouldIncludeScan(iFileSet)) {
                this.mList.add(new ScanItem(iFileSet, this.mImprovements.get(iFileSet.getUri()), this.mSpanCount != 1));
            }
        }
    }

    private boolean shouldIncludeScan(IFileSet iFileSet) {
        boolean zAnyMatch = IntStream.of(this.mScanTypesToInclude).anyMatch(i -> i == iFileSet.getScanType() || i == Integer.MAX_VALUE);
        ArrayList<Uri> arrayList = this.mExcludedUris;
        return zAnyMatch && !(arrayList != null && arrayList.contains(iFileSet.getUri()));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    @NonNull
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        if (i == R.layout.promotions_layout) {
            return PromotionsViewHolder.newInstance(this.mContext, viewGroup, this.mScanListener);
        }
        switch (i) {
            case R.layout.fragment_item /* 2131492970 */:
                return ScanViewHolder.newInstance(this.mContext, viewGroup, this.mScanListener, this.mOnScanMenuClicked, this.mShowWebShare);
            case R.layout.fragment_item_small /* 2131492971 */:
                return ScanSmallViewHolder.newInstance(this.mContext, viewGroup, this.mScanListener, this.mOnScanMenuClicked, this.mShowWebShare);
            default:
                throw new RuntimeException("Unknown ViewType: " + i);
        }
    }
    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder viewHolder, int i) {
        ((GalleryViewHolder) viewHolder).bind(this.mContext, this.mList.get(i), this.mIsSignedIn);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemViewType(int i) {
        return this.mList.get(i).getViewHolderType();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.mList.size();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public long getItemId(int i) {
        return this.mList.get(i).getItemId();
    }

    public void setIsSignedIn(boolean z) {
        if (this.mIsSignedIn != z) {
            this.mIsSignedIn = z;
            notifyDataSetChanged();
        }
    }

    void setFileSets(List<IFileSet> list) {
        this.mFileSets = list;
        createContentList();
        notifyDataSetChanged();
    }

    void setImprovements(List<Improvement> list) {
        if (list == null) {
            return;
        }
        this.mImprovements.clear();
        for (Improvement improvement : list) {
            this.mImprovements.put(improvement.getParentUri(), improvement);
        }
        if (this.mFileSets.isEmpty()) {
            return;
        }
        createContentList();
        notifyDataSetChanged();
    }

    void setShowPromotions(boolean z) {
        if (this.mShowPromotions != z) {
            this.mShowPromotions = z;
            createContentList();
            notifyDataSetChanged();
        }
    }

    void setSpanCount(int i) {
        this.mSpanCount = i;
        createContentList();
        notifyDataSetChanged();
    }

    int getSpanCount(int i) {
        return this.mList.get(i).getSpanCount();
    }
}
