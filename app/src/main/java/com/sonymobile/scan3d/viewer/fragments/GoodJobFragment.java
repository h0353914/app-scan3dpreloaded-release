package com.sonymobile.scan3d.viewer.fragments;

import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.MeshType;
import com.sonymobile.scan3d.MeshVariant;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.ModelContainer;

/* JADX INFO: loaded from: classes2.dex */
public class GoodJobFragment extends ActionGLFragment implements View.OnApplyWindowInsetsListener {
    private static final String KEY_MODE = "mode";
    private static final String KEY_TOO_LONG = "too_long";
    public static final int MODE_FACE_SCAN = 0;
    public static final int MODE_FOOD_SCAN = 2;
    public static final int MODE_HEAD_SCAN = 1;
    public static final int MODE_SELFIE_SCAN = 3;
    private static final String OPEN_NEXT_TUTORIAL = "open_next_tutorial";
    private static final int TWO_FINGERS = 2;
    private View mTextContainer;

    private boolean isFreeFormScanModeUnlocked() {
        return false;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    boolean allowProgressDialogCancellation() {
        return false;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_viewer_good_job_layout;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean requiresFullScreen() {
        return true;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean showToolbar() {
        return false;
    }

    public static Fragment newInstance(int i, boolean z, boolean z2) {
        GoodJobFragment goodJobFragment = new GoodJobFragment();
        Bundle bundle = new Bundle();
        bundle.putInt(KEY_MODE, i);
        bundle.putBoolean(KEY_TOO_LONG, z);
        bundle.putBoolean(OPEN_NEXT_TUTORIAL, z2);
        goodJobFragment.setArguments(bundle);
        return goodJobFragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        FragmentActivity activity = getActivity();
        activity.setRequestedOrientation(0);
        activity.getWindow().setFlags(512, 512);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        this.mTextContainer = viewOnCreateView.findViewById(R.id.content_container);
        this.mTextContainer.setOnApplyWindowInsetsListener(this);
        TextView textView = (TextView) viewOnCreateView.findViewById(R.id.description_text);
        ((TextView) viewOnCreateView.findViewById(R.id.tip_text)).setVisibility(getArguments().getBoolean(KEY_TOO_LONG) ? 0 : 8);
        ImageView imageView = (ImageView) viewOnCreateView.findViewById(R.id.award_image_view);
        viewOnCreateView.findViewById(R.id.done).setOnClickListener((UserInputReducer.InputReducer) view -> getActivity().finish());
        int i = getArguments().getInt(KEY_MODE);
        StringBuilder sb = new StringBuilder();
        if (i == 0) {
            imageView.setImageResource(R.drawable.good_job_face_scan);
            sb.append(getContext().getResources().getText(R.string.first_time_face_good_job_description));
            textView.setText(sb.toString());
        } else {
            switch (i) {
                case 2:
                    imageView.setImageResource(R.drawable.good_job_food_scan);
                    textView.setText(R.string.first_time_food_good_job_description);
                    break;
                case 3:
                    imageView.setImageResource(R.drawable.good_job_face_scan);
                    sb.append(getContext().getResources().getText(R.string.first_time_selfie_good_job_description));
                    textView.setText(sb.toString());
                    break;
                default:
                    imageView.setImageResource(R.drawable.good_job_head_scan);
                    textView.setText(R.string.first_time_head_good_job_description);
                    break;
            }
        }
        showFullscreen();
        return viewOnCreateView;
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        super.onDetach();
        getActivity().getWindow().clearFlags(512);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        super.onMeshLoaded(uri, modelContainer);
        if (isAdded()) {
            showMesh();
            dismissProgressDialog();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public void onSingleTouch() {
        if (isFullScreen()) {
            exitFullscreen();
        } else {
            showFullscreen();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.NativeGLTextureView.TouchListener
    public boolean allowMotion(MotionEvent motionEvent) {
        return motionEvent.getPointerCount() != 2;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        if (windowInsets.hasSystemWindowInsets()) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.mTextContainer.getLayoutParams();
            marginLayoutParams.setMarginEnd(windowInsets.getSystemWindowInsetRight());
            this.mTextContainer.setLayoutParams(marginLayoutParams);
        }
        return windowInsets.consumeSystemWindowInsets();
    }

    private void showMesh() {
        getRenderer().addMesh(this.mModelContainer, MeshVariant.MESH_VARIANT_ORIGINAL, MeshType.TYPE_ORIGINAL);
        requestRenderGLTextureView();
    }
}
