package com.sonymobile.scan3d.viewer.fragments;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ScrollView;
import android.widget.Toolbar;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.activity.GalleryActivity;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class FaceBlendIntroFragment extends Fragment {
    private static final String KEY_FILESET = "fileset";
    private static final int REQUEST_CODE_FACEBLEND = 1;

    public static FaceBlendIntroFragment newInstance(@Nullable IFileSet iFileSet) {
        if (iFileSet == null) {
            throw new IllegalArgumentException("Fileset was not provided");
        }
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_FILESET, iFileSet);
        FaceBlendIntroFragment faceBlendIntroFragment = new FaceBlendIntroFragment();
        faceBlendIntroFragment.setArguments(bundle);
        return faceBlendIntroFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(R.layout.fragment_faceblend_intro, viewGroup, false);
        IFileSet iFileSet = getArguments() != null ? (IFileSet) getArguments().getParcelable(KEY_FILESET) : null;
        if (iFileSet == null) {
            throw new IllegalArgumentException("Missing fileset.");
        }
        final Uri uri = iFileSet.getUri();
        Toolbar toolbar = (Toolbar) viewInflate.findViewById(R.id.toolbar);
        toolbar.setTitle(iFileSet.getName());
        toolbar.setNavigationOnClickListener((UserInputReducer.InputReducer) view -> getFragmentManager().popBackStack());
        ((Button) viewInflate.findViewById(R.id.btn_action)).setOnClickListener((UserInputReducer.InputReducer) view -> {
            Intent intent = new Intent("android.intent.action.PICK", Contract.FileRecord.CONTENT_URI);
            intent.setPackage(getContext().getPackageName());
            intent.setType(SharingConstants.SCAN_3D_MIME_TYPE);
            intent.putExtra(SharingConstants.EXTRA_SCAN_TYPE, FsUtils.scanTypeToString(256) + "," + FsUtils.scanTypeToString(257));
            intent.putExtra(SharingConstants.EXTRA_EXPLANATORY_TEXT, getString(R.string.explanatory_text_face_blend_picker));
            ArrayList<Uri> arrayList = new ArrayList<>();
            arrayList.add(uri);
            intent.putParcelableArrayListExtra(SharingConstants.EXTRA_EXCLUDE_URIS, arrayList);
            intent.putExtra(GalleryActivity.PICK_INTENT_EXTRA_INTERNAL, true);
            startActivityForResult(intent, 1);
        });
        final ScrollView scrollView = (ScrollView) viewInflate.findViewById(R.id.scroller);
        scrollView.post(() -> scrollView.fullScroll(130));
        return viewInflate;
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i != 1 || intent == null) {
            return;
        }
        FaceBlendFragment faceBlendFragmentNewInstance = FaceBlendFragment.newInstance(intent.getData());
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, faceBlendFragmentNewInstance);
        fragmentTransactionBeginTransaction.addToBackStack(faceBlendFragmentNewInstance.getClass().getName());
        fragmentTransactionBeginTransaction.commit();
    }
}
