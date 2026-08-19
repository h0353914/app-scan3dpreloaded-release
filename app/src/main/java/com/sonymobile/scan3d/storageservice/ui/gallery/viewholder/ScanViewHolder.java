package com.sonymobile.scan3d.storageservice.ui.gallery.viewholder;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupMenu;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.facebook.drawee.view.SimpleDraweeView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.IOnScanMenuItemClickListener;
import com.sonymobile.scan3d.storageservice.ui.IScanListener;
import com.sonymobile.scan3d.storageservice.ui.component.ImprovementIndicator;
import com.sonymobile.scan3d.storageservice.ui.component.UploadIndicator;
import com.sonymobile.scan3d.storageservice.ui.gallery.LazyLoader;
import com.sonymobile.scan3d.storageservice.ui.gallery.item.GalleryItem;
import com.sonymobile.scan3d.storageservice.ui.gallery.item.ScanItem;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.math.BigInteger;

public class ScanViewHolder extends RecyclerView.ViewHolder implements GalleryViewHolder, UserInputReducer.InputReducer {
    private static final int PREVIEW_ALPHA_VALUE_OPAQUE = 255;
    private static final int PREVIEW_ALPHA_VALUE_TRANSPARENT = 64;
    public static final int VIEW_TYPE = 2131492970;
    private IFileSet mFileSet;
    private ImprovementIndicator mImprovementIndicator;
    private final IOnScanMenuItemClickListener mOnScanMenuClicked;
    private final SimpleDraweeView mPreviewImage;
    private TextView mPreviewName;
    private IScanListener mScanListener;
    private final boolean mShowWebShare;
    private UploadIndicator mUploadedIndicator;
    private final View mWebviewButton;
    private final UserInputReducer.InputReducer mWebviewButtonListener;

    public static RecyclerView.ViewHolder newInstance(Context context, ViewGroup viewGroup, IScanListener iScanListener, IOnScanMenuItemClickListener iOnScanMenuItemClickListener, boolean z) {
        return new ScanViewHolder(LayoutInflater.from(context).inflate(R.layout.fragment_item, viewGroup, false), iScanListener, iOnScanMenuItemClickListener, z);
    }

    ScanViewHolder(View view, IScanListener iScanListener, IOnScanMenuItemClickListener iOnScanMenuItemClickListener, boolean z) {
        super(view);
        this.mWebviewButtonListener = new UserInputReducer.InputReducer() {
            @Override
            public void doClick(View view2) {
                PopupMenu popupMenu = new PopupMenu(view2.getContext(), view2);
                MenuInflater menuInflater = popupMenu.getMenuInflater();
                final IFileSet iFileSet = (IFileSet) view2.getTag(R.id.TAG_URI_ID);
                menuInflater.inflate(R.menu.menu_public, popupMenu.getMenu());
                popupMenu.setOnMenuItemClickListener(menuItem -> ScanViewHolder.this.mOnScanMenuClicked.onScanMenuClick(menuItem, iFileSet));
                Menu menu = popupMenu.getMenu();
                if (iFileSet != null) {
                    long sharedMeshes = iFileSet.getSharedMeshes();
                    menu.findItem(R.id.menu_view_static).setVisible(BigInteger.valueOf(sharedMeshes).testBit(1));
                    menu.findItem(R.id.menu_view_animated).setVisible(BigInteger.valueOf(sharedMeshes).testBit(4));
                    menu.findItem(R.id.menu_view_prop).setVisible(BigInteger.valueOf(sharedMeshes).testBit(5));
                }
                popupMenu.show();
            }
        };
        this.mPreviewImage = (SimpleDraweeView) view.findViewById(R.id.preview_image);
        this.mUploadedIndicator = (UploadIndicator) view.findViewById(R.id.uploaded_indicator);
        this.mImprovementIndicator = (ImprovementIndicator) view.findViewById(R.id.improvement_indicator);
        this.mWebviewButton = view.findViewById(R.id.webicon_parent);
        this.mPreviewName = (TextView) view.findViewById(R.id.preview_name);
        this.mScanListener = iScanListener;
        this.mOnScanMenuClicked = iOnScanMenuItemClickListener;
        this.mShowWebShare = z;
    }

    private void initiateListeners(IScanListener iScanListener, IFileSet iFileSet) {
        this.mScanListener = iScanListener;
        this.mFileSet = iFileSet;
        this.mPreviewImage.setOnClickListener(this);
    }

    private void ceaseListeners() {
        this.mScanListener = null;
        this.mFileSet = null;
        this.mPreviewImage.setOnClickListener(null);
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        this.mScanListener.onScanClicked(this.mFileSet);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.viewholder.GalleryViewHolder
    public void bind(Context context, GalleryItem galleryItem, boolean z) {
        ScanItem scanItem = (ScanItem) galleryItem;
        IFileSet fileSet = scanItem.getFileSet();
        String name = fileSet.getName();
        LazyLoader.load(this.mPreviewImage, fileSet);
        this.mPreviewName.setText(name);
        this.mUploadedIndicator.onBound(fileSet, z);
        this.mImprovementIndicator.onBound(fileSet, scanItem.getImprovement());
        this.mWebviewButton.setTag(R.id.TAG_URI_ID, fileSet);
        this.mWebviewButton.setOnClickListener(this.mWebviewButtonListener);
        this.mWebviewButton.setVisibility((fileSet.isVisible() && this.mShowWebShare) ? 0 : 8);
        this.mPreviewImage.setContentDescription(name);
        if (!fileSet.isRemote()) {
            initiateListeners(this.mScanListener, fileSet);
            this.mPreviewImage.setImageAlpha(255);
        } else {
            ceaseListeners();
            this.mPreviewImage.setImageAlpha(64);
        }
    }
}
