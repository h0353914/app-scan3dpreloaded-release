package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import androidx.annotation.Nullable;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.FirstTimeActivity;
import com.sonymobile.scan3d.storageservice.ui.tips.Clip;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
public class SequenceTipFragment extends TipFragment implements FirstTimeActivity.PageListener {
    protected static final String KEY_TIP_INDEX = "tip_index";
    protected static final String KEY_TIP_SIZE = "size";
    protected static final String KEY_TUTORIAL_PASSED = "tutorial_passed";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.SequenceTipFragment";
    private ClipSequencePlayersController mController = new ClipSequencePlayersController();
    private VideoTipFragmentOwner mOwner;

    public static SequenceTipFragment newInstance(Tip tip, boolean z, int i, int i2, ZipResourceFile zipResourceFile) {
        SequenceTipFragment sequenceTipFragment = new SequenceTipFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("tip", tip);
        bundle.putBoolean(KEY_TUTORIAL_PASSED, z);
        bundle.putInt(KEY_TIP_INDEX, i);
        bundle.putInt(KEY_TIP_SIZE, i2);
        sequenceTipFragment.setArguments(bundle);
        sequenceTipFragment.mZipResourceFile = zipResourceFile;
        return sequenceTipFragment;
    }
    @Override // androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        if (!(context instanceof VideoTipFragmentOwner)) {
            throw new RuntimeException("Activity must implement VideoTipFragmentOwner");
        }
        this.mOwner = (VideoTipFragmentOwner) context;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment
    public void onViewCreated(View view, Bundle bundle, Tip tip) {
        Bundle arguments = getArguments();
        if (tip.hasTextRepresentations()) {
            view.findViewById(R.id.info_container).setVisibility(0);
        } else {
            view.findViewById(R.id.bullet_container).setVisibility(0);
        }
        Button button = (Button) view.findViewById(R.id.button_start_scan);
        if (isLastPage()) {
            button.setVisibility(0);
            if (arguments.getBoolean(KEY_TUTORIAL_PASSED) && !isSingleTip()) {
                ((TextView) view.findViewById(R.id.description_text)).setText(R.string.repeated_tutorial_done_description);
            }
        }
        this.mController.init(getContext(), tip, (TextureView) view.findViewById(R.id.texture_view), (ViewGroup) view.findViewById(R.id.bulletpoints), this.mOwner.getVideoExecutor(), this.mZipResourceFile);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment, androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.first_time_tip_layout, viewGroup, false);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.FirstTimeActivity.PageListener
    public void onPageSelected(boolean z) {
        this.mController.setPageSelected(z);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        this.mController.setResumed(true);
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        this.mController.setResumed(false);
        super.onPause();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.mController.release();
        super.onDestroyView();
    }

    private boolean isLastPage() {
        int layoutDirection = getResources().getConfiguration().getLayoutDirection();
        Bundle arguments = getArguments();
        int i = arguments.getInt(KEY_TIP_INDEX, 0);
        int i2 = arguments.getInt(KEY_TIP_SIZE, 0);
        if (layoutDirection == 1) {
            if (i != 0) {
                return false;
            }
        } else if (i != i2 - 1) {
            return false;
        }
        return true;
    }

    private boolean isSingleTip() {
        return getArguments().getInt(KEY_TIP_SIZE, 0) == 1;
    }

    private static class ClipSequencePlayersController extends MediaPlayerController {
        private Map<Clip, TextView> mBulletpoint;
        private List<Clip> mOriginalClips;
        private ArrayDeque<Clip> mSequence;
        private ZipResourceFile mZipResourceFile;

        private ClipSequencePlayersController() {
            this.mBulletpoint = new HashMap();
        }

        public void init(Context context, Tip tip, TextureView textureView, ViewGroup viewGroup, Executor executor, ZipResourceFile zipResourceFile) {
            init(context, textureView, null, executor, false);
            if (tip.getTitle() == 0 && tip.getDescription() == 0) {
                viewGroup.setVisibility(0);
                for (Clip clip : tip.getClips()) {
                    int text = clip.getText();
                    if (text > 0) {
                        TextView textView = (TextView) LayoutInflater.from(context).inflate(R.layout.component_first_time_bullet, viewGroup, false);
                        textView.setText(text);
                        textView.setSelected(false);
                        viewGroup.addView(textView);
                        this.mBulletpoint.put(clip, textView);
                    }
                }
            }
            this.mZipResourceFile = zipResourceFile;
            this.mOriginalClips = tip.getClips();
            this.mSequence = new ArrayDeque<>(this.mOriginalClips);
            prepareNextClip();
        }

        private void prepareNextClip() {
            if (this.mSequence.size() == 0) {
                return;
            }
            Clip clipPop = this.mSequence.pop();
            if (clipPop.shouldLoop()) {
                this.mSequence.addLast(clipPop);
            }
            TextView textView = this.mBulletpoint.get(clipPop);
            if (textView != null) {
                textView.setSelected(true);
            }
            AssetFileDescriptor assetFileDescriptor = this.mZipResourceFile.getAssetFileDescriptor(clipPop.getSourcePath());
            if (assetFileDescriptor == null) {
                DebugLog.e(SequenceTipFragment.TAG, "Failed to find " + clipPop.getSourcePath() + " in Expansion File");
                return;
            }
            setVideoFileResource(assetFileDescriptor, 0);
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.MediaPlayerController
        public void setPageSelected(boolean z) {
            if (this.mPageSelected == z) {
                return;
            }
            super.setPageSelected(z);
            if (z) {
                return;
            }
            reset();
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.MediaPlayerController
        public void setResumed(boolean z) {
            super.setResumed(z);
            if (z) {
                return;
            }
            reset();
        }

        private void reset() {
            List<Clip> list = this.mOriginalClips;
            if (list != null) {
                this.mSequence = new ArrayDeque<>(list);
                Iterator<TextView> it = this.mBulletpoint.values().iterator();
                while (it.hasNext()) {
                    it.next().setSelected(false);
                }
                prepareNextClip();
            }
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.MediaPlayerController, android.media.MediaPlayer.OnCompletionListener
        public void onCompletion(MediaPlayer mediaPlayer) {
            prepareNextClip();
        }
    }
}
