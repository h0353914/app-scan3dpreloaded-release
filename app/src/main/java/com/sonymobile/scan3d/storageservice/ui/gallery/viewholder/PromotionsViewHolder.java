package com.sonymobile.scan3d.storageservice.ui.gallery.viewholder;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.IScanListener;
import com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.TipParser;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class PromotionsViewHolder extends RecyclerView.ViewHolder implements GalleryViewHolder, PromotionItemViewHolder.PromotionItemListener {
    public static final int VIEW_TYPE = 2131493033;
    private RecyclerView.Adapter mAdapter;
    private final Context mContext;
    private List<Tip> mPromotionTipsList;
    private IScanListener mScanListener;

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.GalleryViewHolder
    public void bind(Context context, GalleryItem galleryItem, boolean z) {
    }

    public static RecyclerView.ViewHolder newInstance(Context context, ViewGroup viewGroup, IScanListener iScanListener) {
        return new PromotionsViewHolder(context, (RecyclerView) LayoutInflater.from(context).inflate(R.layout.promotions_layout, viewGroup, false), iScanListener);
    }

    private PromotionsViewHolder(Context context, RecyclerView recyclerView, IScanListener iScanListener) {
        super(recyclerView);
        this.mContext = context;
        this.mScanListener = iScanListener;
        this.mPromotionTipsList = TipParser.getPromotionCards(context);
        recyclerView.setLayoutManager(new LinearLayoutManager(context, 0, false));
        this.mAdapter = new PromotionsAdapter(context, recyclerView);
        recyclerView.setAdapter(this.mAdapter);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.PromotionItemViewHolder.PromotionItemListener
    public void onClose(PromotionItemViewHolder promotionItemViewHolder) {
        for (Tip tip : this.mPromotionTipsList) {
            if (tip.getDescription() == promotionItemViewHolder.getDescriptionId()) {
                this.mPromotionTipsList.remove(tip);
                TipParser.saveRemovedItemToPrefs(tip.getDescription(), tip.getExpireDate(), this.mContext);
                this.mAdapter.notifyItemRemoved(promotionItemViewHolder.getAdapterPosition());
                this.mAdapter.notifyItemRangeChanged(0, this.mPromotionTipsList.size());
                return;
            }
        }
    }

    private class PromotionsAdapter extends RecyclerView.Adapter {
        private Context mContext;
        private RecyclerView mItemView;

        PromotionsAdapter(Context context, RecyclerView recyclerView) {
            this.mContext = context;
            this.mItemView = recyclerView;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return PromotionItemViewHolder.newInstance(this.mContext, this.mItemView, PromotionsViewHolder.this.mScanListener);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
            PromotionItemViewHolder promotionItemViewHolder = (PromotionItemViewHolder) viewHolder;
            Tip tip = (Tip) PromotionsViewHolder.this.mPromotionTipsList.get(i);
            promotionItemViewHolder.updateViewWidth(PromotionsViewHolder.this.mPromotionTipsList.size());
            promotionItemViewHolder.setBackgroundColor(tip.getBackgroundColor());
            promotionItemViewHolder.setTitle(tip.getTitle());
            promotionItemViewHolder.setDescription(tip.getDescription());
            promotionItemViewHolder.setImage(tip.getImage());
            promotionItemViewHolder.setListener(PromotionsViewHolder.this);
            promotionItemViewHolder.setRemovable(tip.isRemovable());
            promotionItemViewHolder.setLink(tip.getLinkText(), tip.getActionOnClick());
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return PromotionsViewHolder.this.mPromotionTipsList.size();
        }
    }
}
