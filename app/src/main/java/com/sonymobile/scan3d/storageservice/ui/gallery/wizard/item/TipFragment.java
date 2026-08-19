package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.TipVideoPlayerActivity;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.Video;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class TipFragment extends Fragment {
    static final String KEY_TIP = "tip";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment";
    protected ZipResourceFile mZipResourceFile;

    public void onViewCreated(View view, Bundle bundle, Tip tip) {
    }

    public static TipFragment newInstance(Tip tip, ZipResourceFile zipResourceFile) {
        TipFragment tipFragment = new TipFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_TIP, tip);
        tipFragment.setArguments(bundle);
        tipFragment.mZipResourceFile = zipResourceFile;
        return tipFragment;
    }

    public static TipFragment newInstance(Tip tip) {
        return newInstance(tip, null);
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.tip_wizard_text_layout, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public final void onViewCreated(@NonNull View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        Tip tip = (Tip) getArguments().getParcelable(KEY_TIP);
        if (tip != null) {
            int title = tip.getTitle();
            if (title > 0) {
                TextView textView = (TextView) view.findViewById(R.id.title_text);
                textView.setVisibility(0);
                textView.setText(title);
            }
            int description = tip.getDescription();
            if (description > 0) {
                TextView textView2 = (TextView) view.findViewById(R.id.description_text);
                textView2.setVisibility(0);
                textView2.setText(description);
            }
            Video additionalVideo = tip.getAdditionalVideo();
            if (additionalVideo != null) {
                TextView textView3 = (TextView) view.findViewById(R.id.additional_video);
                textView3.setVisibility(0);
                textView3.setText(additionalVideo.getText());
                textView3.setOnClickListener((UserInputReducer.InputReducer) view2 -> {
                    Intent intent;
                    if (additionalVideo.getUriResourceId() != 0) {
                        intent = new Intent("android.intent.action.VIEW");
                        intent.setData(Uri.parse(getString(additionalVideo.getUriResourceId())));
                    } else {
                        intent = new Intent(getContext(), (Class<?>) TipVideoPlayerActivity.class);
                        intent.putExtra(TipVideoPlayerActivity.EXTRA_VIDEO, additionalVideo.getVideoResourceId());
                    }
                    try {
                        startActivity(intent);
                    } catch (ActivityNotFoundException unused) {
                        DebugLog.d(TAG, "Couldn't find Youtube app or Browser.");
                    }
                });
            }
            onViewCreated(view, bundle, tip);
        }
    }
}
