package com.sonymobile.scan3d.viewer.fragments;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.Toast;
import android.widget.Toolbar;
import androidx.annotation.DrawableRes;
import androidx.annotation.IdRes;
import androidx.annotation.LayoutRes;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.StringRes;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.OnBackPressListener;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.widgets.SphinxProgressDialog;

/* JADX INFO: loaded from: classes2.dex */
public abstract class BaseViewerFragment extends Fragment implements OnBackPressListener, DialogInterface.OnCancelListener {
    private static final String KEY_FULLSCREEN_ENABLED = "FULLSCREEN_ENABLED";
    protected ViewerActivityInterface mActivityInterface;
    private View mControlsView;
    private boolean mIsFullscreen;
    private SphinxProgressDialog mProgressDialog;

    public enum BackgroundTaskState {
        IDLE,
        RUNNING,
        FINISHED
    }

    boolean allowProgressDialogCancellation() {
        return true;
    }

    @LayoutRes
    public abstract int getContentLayout();

    @IdRes
    int getControlsView() {
        return 0;
    }

    @StringRes
    public int getNavigationAccessibility() {
        return R.string.accessibility_back_button;
    }

    @DrawableRes
    public int getNavigationDrawable() {
        return R.drawable.ic_arrow_back_24dp;
    }

    @StringRes
    protected int getTitleId() {
        return 0;
    }

    public String getTitleText() {
        return null;
    }

    @StringRes
    protected int getToolBarActionText() {
        return 0;
    }

    protected void onActionClick() {
    }

    public boolean onBackPressed() {
        return false;
    }

    protected boolean requiresFullScreen() {
        return false;
    }

    protected boolean showToolbar() {
        return true;
    }

    @Override // androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.mActivityInterface = (ViewerActivityInterface) getActivity();
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mIsFullscreen = bundle.getBoolean(KEY_FULLSCREEN_ENABLED, false);
        }
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(getContentLayout(), viewGroup, false);
        if (showToolbar()) {
            Toolbar toolbar = (Toolbar) viewInflate.findViewById(R.id.toolbar);
            toolbar.setVisibility(0);
            int titleId = getTitleId();
            if (titleId != 0) {
                toolbar.setTitle(titleId);
            } else if (getTitleText() != null) {
                toolbar.setTitle(getTitleText());
            }
            getActivity().setActionBar(toolbar);
            int navigationDrawable = getNavigationDrawable();
            if (navigationDrawable != 0) {
                toolbar.setNavigationIcon(navigationDrawable);
            }
            int navigationAccessibility = getNavigationAccessibility();
            if (navigationAccessibility != 0) {
                toolbar.setNavigationContentDescription(navigationAccessibility);
            }
            toolbar.setNavigationOnClickListener((UserInputReducer.InputReducer) view -> onNavigationClick());
            if (getToolBarActionText() != 0) {
                Button button = (Button) toolbar.findViewById(R.id.end_action);
                button.setText(getToolBarActionText());
                button.setContentDescription(getString(getToolBarActionText()));
                button.setOnClickListener((UserInputReducer.InputReducer) view -> onActionClick());
            }
        }
        int controlsView = getControlsView();
        if (controlsView > 0) {
            this.mControlsView = viewInflate.findViewById(controlsView);
            showControls(isFullScreen());
        }
        return viewInflate;
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        this.mActivityInterface.registerOnBackPressListener(this);
        Window window = getActivity().getWindow();
        window.getDecorView().setSystemUiVisibility(0);
        window.getDecorView().setSystemUiVisibility(256);
        if (requiresFullScreen()) {
            window.getDecorView().setSystemUiVisibility(1536);
            if (this.mIsFullscreen) {
                showFullscreen();
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        this.mActivityInterface.unregisterOnBackPressListener(this);
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(KEY_FULLSCREEN_ENABLED, this.mIsFullscreen);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        SphinxProgressDialog sphinxProgressDialog = this.mProgressDialog;
        if (sphinxProgressDialog != null) {
            sphinxProgressDialog.dismiss();
        }
        super.onDestroy();
    }

    void showFullscreen() {
        this.mIsFullscreen = true;
        getActivity().getWindow().getDecorView().setSystemUiVisibility(3846);
    }

    void exitFullscreen() {
        this.mIsFullscreen = false;
        getActivity().getWindow().getDecorView().setSystemUiVisibility(1792);
    }

    boolean isFullScreen() {
        return this.mIsFullscreen;
    }

    public void showProgressDialog(@StringRes int i, boolean z) {
        if (isAdded()) {
            SphinxProgressDialog sphinxProgressDialog = this.mProgressDialog;
            if (sphinxProgressDialog == null) {
                this.mProgressDialog = new SphinxProgressDialog(getContext(), i, z);
            } else {
                sphinxProgressDialog.setContent(getContext(), i, z);
            }
            this.mProgressDialog.setCancelable(allowProgressDialogCancellation());
            this.mProgressDialog.setOnCancelListener(this);
            this.mProgressDialog.show();
        }
    }

    public void dismissProgressDialog() {
        SphinxProgressDialog sphinxProgressDialog = this.mProgressDialog;
        if (sphinxProgressDialog != null) {
            sphinxProgressDialog.dismiss();
        }
    }

    protected void handleFailedMesh() {
        if (isAdded()) {
            SphinxProgressDialog sphinxProgressDialog = this.mProgressDialog;
            if (sphinxProgressDialog != null) {
                sphinxProgressDialog.dismiss();
            }
            Toast.makeText(getContext(), R.string.viewer_no_content_provided, 1).show();
            getActivity().finish();
        }
    }

    void setToolbarActionVisibility(boolean z) {
        if (!showToolbar() || getView() == null) {
            return;
        }
        ((Toolbar) getView().findViewById(R.id.toolbar)).findViewById(R.id.end_action).setVisibility(z ? 0 : 8);
    }

    protected void onNavigationClick() {
        if (getFragmentManager().popBackStackImmediate()) {
            return;
        }
        getActivity().finish();
    }

    void showControls(boolean z) {
        if (z) {
            showFullscreen();
            this.mControlsView.setVisibility(8);
            this.mControlsView.startAnimation(AnimationUtils.loadAnimation(getContext(), android.R.anim.fade_out));
        } else {
            exitFullscreen();
            this.mControlsView.setVisibility(0);
            this.mControlsView.startAnimation(AnimationUtils.loadAnimation(getContext(), android.R.anim.fade_in));
        }
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        getActivity().onBackPressed();
    }
}
