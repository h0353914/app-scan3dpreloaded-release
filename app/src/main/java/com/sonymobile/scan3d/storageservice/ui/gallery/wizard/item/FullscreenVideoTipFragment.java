package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.Nullable;
import androidx.annotation.RawRes;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.FirstTimeActivity;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;

/* JADX INFO: loaded from: classes.dex */
public class FullscreenVideoTipFragment extends TipFragment implements FirstTimeActivity.PageListener {
    static final String KEY_TIP = "tip";
    static final String TAG = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.FullscreenVideoTipFragment";
    private VideoTipFragmentOwner mOwner;
    private FullscreenMediaPlayerController mPlayerController = new FullscreenMediaPlayerController();

    public static FullscreenVideoTipFragment newInstance(Tip tip, ZipResourceFile zipResourceFile) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_TIP, tip);
        FullscreenVideoTipFragment fullscreenVideoTipFragment = new FullscreenVideoTipFragment();
        fullscreenVideoTipFragment.setArguments(bundle);
        fullscreenVideoTipFragment.mZipResourceFile = zipResourceFile;
        return fullscreenVideoTipFragment;
    }
    @Override // androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        if (!(context instanceof VideoTipFragmentOwner)) {
            throw new RuntimeException("Activity must implement VideoTipFragmentOwner");
        }
        this.mOwner = (VideoTipFragmentOwner) context;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment, androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.tip_fullscreen_video_player, viewGroup, false);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment
    public void onViewCreated(View view, @Nullable Bundle bundle, Tip tip) {
        this.mPlayerController.init(getContext(), (TextureView) view.findViewById(R.id.texture_view), (TextView) view.findViewById(R.id.subtitles), this.mOwner.getVideoExecutor(), true);
        AssetFileDescriptor assetFileDescriptor = this.mZipResourceFile.getAssetFileDescriptor(tip.getVideoName());
        if (assetFileDescriptor == null) {
            DebugLog.e(TAG, "FullscreenVideoFragment: Failed to find " + tip.getVideoName() + " in Expansion file");
            return;
        }
        this.mPlayerController.setVideoFileResource(assetFileDescriptor, tip.getSubtitles(), tip.getVideoName());
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        this.mPlayerController.setResumed(true);
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        this.mPlayerController.setResumed(false);
        super.onPause();
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.FirstTimeActivity.PageListener
    public void onPageSelected(boolean z) {
        this.mPlayerController.setPageSelected(z);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.mPlayerController.release();
        super.onDestroyView();
    }

    private class FullscreenMediaPlayerController extends MediaPlayerController {
        private String mVideoName;

        private FullscreenMediaPlayerController() {
        }

        public void setVideoFileResource(AssetFileDescriptor assetFileDescriptor, @RawRes int i, String str) {
            super.setVideoFileResource(assetFileDescriptor, i);
            this.mVideoName = str;
            HitEvent.VIDEO_STARTED.send(FullscreenVideoTipFragment.this.getContext(), this.mVideoName);
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.MediaPlayerController, android.media.MediaPlayer.OnCompletionListener
        public void onCompletion(MediaPlayer mediaPlayer) {
            super.onCompletion(mediaPlayer);
            HitEvent.VIDEO_FINISHED.send(FullscreenVideoTipFragment.this.getContext(), this.mVideoName);
            FullscreenVideoTipFragment.this.mOwner.onVideoFinished();
        }
    }
}
