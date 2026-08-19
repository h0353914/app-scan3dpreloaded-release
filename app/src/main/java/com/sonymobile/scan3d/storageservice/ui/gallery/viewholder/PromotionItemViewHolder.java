package com.sonymobile.scan3d.storageservice.ui.gallery.viewholder;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.ColorInt;
import androidx.annotation.DrawableRes;
import androidx.annotation.StringRes;
import androidx.recyclerview.widget.RecyclerView;
import com.facebook.common.util.UriUtil;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.drawee.view.SimpleDraweeView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.ui.IScanListener;
import com.sonymobile.scan3d.storageservice.ui.activity.GalleryActivity;
import com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.QuickTipCategoriesActivity;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class PromotionItemViewHolder extends RecyclerView.ViewHolder implements GalleryViewHolder, UserInputReducer.InputReducer {
    private ImageView mClose;
    private final Context mContext;
    private TextView mDescription;
    private int mDescriptionId;
    private SimpleDraweeView mImage;
    private View mLayout;
    private TextView mLink;
    private PromotionItemListener mPromotionItemListener;
    private IScanListener mScanListener;
    private TextView mTitle;

    public interface PromotionItemListener {
        void onClose(PromotionItemViewHolder promotionItemViewHolder);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.GalleryViewHolder
    public void bind(Context context, GalleryItem galleryItem, boolean z) {
    }

    public static RecyclerView.ViewHolder newInstance(Context context, ViewGroup viewGroup, IScanListener iScanListener) {
        return new PromotionItemViewHolder(context, LayoutInflater.from(context).inflate(R.layout.promotion_card_layout, viewGroup, false), iScanListener);
    }

    private PromotionItemViewHolder(Context context, View view, IScanListener iScanListener) {
        super(view);
        this.mContext = context;
        this.mLayout = view;
        this.mTitle = (TextView) view.findViewById(R.id.promotion_title);
        this.mDescription = (TextView) view.findViewById(R.id.promotion_description);
        this.mLink = (TextView) view.findViewById(R.id.promotion_link);
        this.mImage = (SimpleDraweeView) view.findViewById(R.id.promotion_image);
        this.mClose = (ImageView) view.findViewById(R.id.promotion_close);
        this.mClose.setOnClickListener(this);
        this.mScanListener = iScanListener;
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        if (view.getId() == R.id.promotion_close) {
            PromotionItemListener promotionItemListener = this.mPromotionItemListener;
            if (promotionItemListener != null) {
                promotionItemListener.onClose(this);
                return;
            }
            return;
        }
        startAction(((Integer) this.mLayout.getTag()).intValue());
    }

    protected void setRemovable(boolean z) {
        this.mClose.setVisibility(z ? 0 : 4);
    }

    protected void setTitle(@StringRes int i) {
        this.mTitle.setText(i);
    }

    protected void setDescription(@StringRes int i) {
        this.mDescriptionId = i;
        this.mDescription.setText(i);
    }

    @StringRes
    public int getDescriptionId() {
        return this.mDescriptionId;
    }

    protected void setImage(@DrawableRes int i) {
        Resources resources = this.mContext.getResources();
        this.mImage.setController(Fresco.newDraweeControllerBuilder().setUri(new Uri.Builder().scheme(UriUtil.QUALIFIED_RESOURCE_SCHEME).authority(resources.getResourcePackageName(i)).appendPath(resources.getResourceTypeName(i)).appendPath(resources.getResourceEntryName(i)).build()).setAutoPlayAnimations(true).build());
    }

    protected void setBackgroundColor(@ColorInt int i) {
        this.mLayout.setBackgroundColor(i);
    }

    protected void setLink(@StringRes int i, @StringRes int i2) {
        if (i != 0) {
            this.mLink.setVisibility(0);
            this.mLink.setText(i);
            this.mLayout.setOnClickListener(this);
            this.mLayout.setTag(Integer.valueOf(i2));
            return;
        }
        this.mLink.setVisibility(8);
        this.mLayout.setOnClickListener(null);
    }

    protected void setListener(PromotionItemListener promotionItemListener) {
        this.mPromotionItemListener = promotionItemListener;
    }

    protected void updateViewWidth(int i) {
        RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) this.mLayout.getLayoutParams();
        switch (i) {
            case 1:
                layoutParams.width = -1;
                break;
            case 2:
                if (this.mContext.getResources().getConfiguration().orientation == 2) {
                    layoutParams.width = (this.mContext.getResources().getDisplayMetrics().widthPixels / 2) - ((int) this.mContext.getResources().getDimension(R.dimen.promotion_card_spacing));
                } else {
                    layoutParams.width = (int) this.mContext.getResources().getDimension(R.dimen.promotion_card_width);
                }
                break;
            default:
                layoutParams.width = (int) this.mContext.getResources().getDimension(R.dimen.promotion_card_width);
                break;
        }
    }

    private void startAction(@StringRes int i) {
        switch (i) {
            case R.string.action_whats_new_face_blend /* 2131755073 */:
                startGallery(GalleryActivity.EXTRA_WHATS_NEW_FACE_BLEND, this.mContext.getString(R.string.explanatory_text_face_blend_picker_whats_new));
                break;
            case R.string.action_whats_new_face_mimic /* 2131755074 */:
                this.mScanListener.onFaceMimicPromotionClicked();
                break;
            case R.string.action_whats_new_learn_how_to_scan /* 2131755075 */:
                Context context = this.mContext;
                context.startActivity(new Intent(context, (Class<?>) QuickTipCategoriesActivity.class));
                break;
        }
    }

    private void startGallery(String str, String str2) {
        Intent intent = new Intent("android.intent.action.PICK", Contract.FileRecord.CONTENT_URI);
        intent.setPackage(this.mContext.getPackageName());
        intent.setType(SharingConstants.SCAN_3D_MIME_TYPE);
        String str3 = FsUtils.scanTypeToString(256) + "," + FsUtils.scanTypeToString(257);
        intent.putExtra(GalleryActivity.EXTRA_WHATS_NEW_FLOW_TYPE, str);
        intent.putExtra(SharingConstants.EXTRA_SCAN_TYPE, str3);
        intent.putExtra(SharingConstants.EXTRA_EXPLANATORY_TEXT, str2);
        intent.putExtra(GalleryActivity.PICK_INTENT_EXTRA_INTERNAL, true);
        this.mContext.startActivity(intent);
    }
}
