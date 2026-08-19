package com.sonymobile.scan3d;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class ScanningPermissionsActivity extends Activity {
    private static final String[] CAMERA_PERMISSIONS = {"android.permission.CAMERA"};
    private static final int REQUEST_CODE_PERMISSIONS = 1000;
    public static final int RESULT_CODE_PERMISSIONS_APPROVED = 1;
    public static final int RESULT_CODE_PERMISSIONS_DECLINED = 2;
    private ViewGroup mPermissionsContainer;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_permissions);
        this.mPermissionsContainer = (ViewGroup) findViewById(R.id.permissions_list);
        findViewById(R.id.change_permissions_btn).setOnClickListener((UserInputReducer.InputReducer) view -> {
            if (PermissionUtil.shouldShowRequestPermissionRationale(this, CAMERA_PERMISSIONS)) {
                requestPermissions(CAMERA_PERMISSIONS, 1000);
            } else {
                PermissionUtil.startAppSettings(this);
            }
        });
    }

    @Override // android.app.Activity
    protected void onResume() {
        boolean z;
        super.onResume();
        this.mPermissionsContainer.removeAllViews();
        if (PermissionUtil.hasPermissions(this, CAMERA_PERMISSIONS)) {
            z = true;
        } else {
            addCameraPermission();
            z = false;
        }
        if (z) {
            setResult(1);
            finish();
        }
    }

    @Override // android.app.Activity
    public void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr) {
        if (i == 1000) {
            boolean z = true;
            for (int i2 = 0; i2 < strArr.length; i2++) {
                if (iArr[i2] != 0) {
                    z = false;
                }
            }
            if (z) {
                setResult(1);
                finish();
            } else {
                setResult(2);
            }
        }
    }

    private void addCameraPermission() {
        insertPermissionItem(R.drawable.permission_camera_icon, R.string.permission_camera_title, R.string.permission_camera_description);
    }

    private void insertPermissionItem(int i, int i2, int i3) {
        View viewInflate = getLayoutInflater().inflate(R.layout.permission_list_item, this.mPermissionsContainer, false);
        ((ImageView) viewInflate.findViewById(R.id.permission_icon)).setImageResource(i);
        ((TextView) viewInflate.findViewById(R.id.permission_name)).setText(i2);
        ((TextView) viewInflate.findViewById(R.id.permission_description)).setText(i3);
        this.mPermissionsContainer.addView(viewInflate);
    }
}
