package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.AsyncViewSetter;
import com.sonymobile.scan3d.storageservice.network.RestApi;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class YoutubeTipFragment extends TipFragment {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.YoutubeTipFragment";
    private static final String YOUTUBE_IMAGE = "hqdefault.jpg";
    private static final String YOUTUBE_IMAGE_URL = "https://img.youtube.com/vi";
    private static final String YOUTUBE_VIDEO_PARAM = "v";

    private static class AsyncImageSetter extends AsyncViewSetter<ImageView, Bitmap> {
        private WeakReference<View> mContainerView;

        AsyncImageSetter(ImageView imageView, View view) {
            super(imageView);
            this.mContainerView = new WeakReference<>(view);
        }

        @Override // com.sonymobile.scan3d.storageservice.network.AsyncViewSetter
        public void onSetResource(ImageView imageView, Bitmap bitmap) {
            imageView.setImageBitmap(bitmap);
            View view = this.mContainerView.get();
            if (view != null) {
                view.setVisibility(0);
            }
        }
    }

    public static YoutubeTipFragment newInstance(Tip tip) {
        YoutubeTipFragment youtubeTipFragment = new YoutubeTipFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("tip", tip);
        youtubeTipFragment.setArguments(bundle);
        return youtubeTipFragment;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment, androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.tip_wizard_youtube_layout, viewGroup, false);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment
    public void onViewCreated(View view, Bundle bundle, Tip tip) {
        Uri uri = Uri.parse(tip.getYoutubeUrl());
        ImageView imageView = (ImageView) view.findViewById(R.id.youtube_image);
        View viewFindViewById = view.findViewById(R.id.youtube_container);
        viewFindViewById.setOnClickListener((UserInputReducer.InputReducer) view2 -> {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(uri);
            try {
                startActivity(intent);
            } catch (ActivityNotFoundException unused) {
                DebugLog.d(TAG, "Couldn't find Youtube app or Browser.");
            }
        });
        RestApi.getBitmapAsync(getActivity(), getYoutubeImagePreview(tip.getYoutubeUrl()), null, new AsyncImageSetter(imageView, viewFindViewById));
    }

    private static String getYoutubeImagePreview(String str) {
        String queryParameter = Uri.parse(str).getQueryParameter(YOUTUBE_VIDEO_PARAM);
        Uri.Builder builderBuildUpon = Uri.parse(YOUTUBE_IMAGE_URL).buildUpon();
        builderBuildUpon.appendPath(queryParameter);
        builderBuildUpon.appendPath(YOUTUBE_IMAGE);
        return builderBuildUpon.build().toString();
    }
}
