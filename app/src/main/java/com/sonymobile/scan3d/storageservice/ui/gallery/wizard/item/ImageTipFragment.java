package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;

/* JADX INFO: loaded from: classes.dex */
public class ImageTipFragment extends TipFragment {
    public static ImageTipFragment newInstance(Tip tip) {
        ImageTipFragment imageTipFragment = new ImageTipFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("tip", tip);
        imageTipFragment.setArguments(bundle);
        return imageTipFragment;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment
    public void onViewCreated(View view, Bundle bundle, Tip tip) {
        ((ImageView) view.findViewById(R.id.image)).setImageResource(tip.getImage());
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment, androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.tip_wizard_image_layout, viewGroup, false);
    }
}
