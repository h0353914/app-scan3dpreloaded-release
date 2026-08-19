package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toolbar;
import androidx.annotation.DrawableRes;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.activity.GalleryActivity;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class PrintMonitorFragment extends MonitorFragment implements UserInputReducer.InputReducer {
    private static final String KEY_IMAGE = "image";
    private static final String KEY_UPLOAD_FAILED = "upload_failed";
    private TextView mDescription;
    private View mProgressBar;
    private TextView mTitle;
    private boolean mUploadFailed;

    public static PrintMonitorFragment newInstance(IFileSet iFileSet, ServiceProvider serviceProvider, Credentials credentials, @DrawableRes int i) {
        PrintMonitorFragment printMonitorFragment = new PrintMonitorFragment();
        Bundle bundlePrepareArgs = prepareArgs(iFileSet, serviceProvider, credentials);
        bundlePrepareArgs.putInt(KEY_IMAGE, i);
        printMonitorFragment.setArguments(bundlePrepareArgs);
        return printMonitorFragment;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.MonitorFragment, androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        if (getArguments().getInt(KEY_IMAGE) != 0) {
            return layoutInflater.inflate(R.layout.upload_monitor_with_image_layout, viewGroup, false);
        }
        return layoutInflater.inflate(R.layout.upload_monitor_layout, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, @Nullable Bundle bundle) {
        ServiceProvider serviceProvider = getServiceProvider();
        if (bundle != null) {
            this.mUploadFailed = bundle.getBoolean(KEY_UPLOAD_FAILED, false);
        }
        FragmentActivity activity = getActivity();
        Toolbar toolbar = (Toolbar) view.findViewById(R.id.toolbar);
        toolbar.setTitle(serviceProvider.getServiceProviderName(activity));
        activity.setActionBar(toolbar);
        toolbar.setNavigationIcon(R.drawable.ic_arrow_back_24dp);
        toolbar.setNavigationContentDescription(getString(R.string.accessibility_back_button));
        toolbar.setNavigationOnClickListener((UserInputReducer.InputReducer) view2 -> getActivity().finish());
        view.findViewById(R.id.upload_hide_button).setOnClickListener(this);
        this.mProgressBar = view.findViewById(R.id.upload_progress_bar);
        this.mTitle = (TextView) view.findViewById(R.id.upload_title);
        this.mDescription = (TextView) view.findViewById(R.id.upload_description);
        updateViews();
        int i = getArguments().getInt(KEY_IMAGE);
        if (i != 0) {
            ImageView imageView = (ImageView) view.findViewById(R.id.upload_image);
            imageView.setImageResource(i);
            imageView.setVisibility(0);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(KEY_UPLOAD_FAILED, this.mUploadFailed);
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        gotoGallery();
    }

    private void gotoGallery() {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            Intent intent = new Intent(activity, (Class<?>) GalleryActivity.class);
            intent.addFlags(268468224);
            activity.startActivity(intent);
            activity.finish();
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.MonitorFragment
    protected void onHandleNoUploadRecord() {
        this.mUploadFailed = true;
        updateViews();
    }

    private void updateViews() {
        if (this.mUploadFailed) {
            IFileSet iFileSet = (IFileSet) getArguments().getParcelable("fileset");
            String string = getString(ServiceProvider.valueOf(getArguments().getString("service_provider", null)).getServiceProviderName());
            this.mProgressBar.setVisibility(4);
            this.mTitle.setText(R.string.print_select_service_upload_failed_title);
            this.mDescription.setText(getString(R.string.print_select_service_upload_failed_description, iFileSet.getName(), string));
            return;
        }
        this.mProgressBar.setVisibility(0);
        this.mTitle.setText(R.string.upload_error_dialog_title);
        this.mDescription.setText(R.string.print_select_service_delay_info);
    }
}
