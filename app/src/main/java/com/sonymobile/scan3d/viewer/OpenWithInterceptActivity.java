package com.sonymobile.scan3d.viewer;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.widget.Toast;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.Scan3DApp;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.StreamUtils;
import com.sonymobile.scan3d.storageservice.ui.activity.OnBoardingActivity;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public class OpenWithInterceptActivity extends Activity {
    public static final String TAG = "OpenWithInterceptActivity";
    private static final String TEMP_FILE_NAME = "temp.zip";
    private Uri mLoadedScanUri;
    private boolean mWaitForOnboarding = true;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!Scan3DApp.isPartOfBetaProgram(this)) {
            finish();
            return;
        }
        if (PreferenceManager.getDefaultSharedPreferences(this).getBoolean(getString(R.string.pref_key_show_onboarding), true)) {
            startActivityForResult(new Intent(this, (Class<?>) OnBoardingActivity.class), 0);
        } else {
            this.mWaitForOnboarding = false;
        }
        startScanValidation();
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        this.mWaitForOnboarding = false;
        openInViewer();
    }

    private void startScanValidation() {
        new AsyncTask<Uri, Void, Uri>() { // from class: com.sonymobile.scan3d.viewer.OpenWithInterceptActivity.1
            @Override // android.os.AsyncTask
            protected Uri doInBackground(Uri[] uriArr) {
                Uri uri = uriArr[0];
                try (InputStream inputStreamOpenInputStream = OpenWithInterceptActivity.this.getContentResolver().openInputStream(uri)) {
                    if (inputStreamOpenInputStream == null) {
                        return null;
                    }
                    File fileCreateTempFile = OpenWithInterceptActivity.this.createTempFile();
                    StreamUtils.saveToDisc(fileCreateTempFile, inputStreamOpenInputStream);
                    if (!FsUtils.validScan3dFile(fileCreateTempFile)) {
                        return null;
                    }
                    File fileCreateDateStampedFile = OpenWithInterceptActivity.this.createDateStampedFile();
                    Uri uriInsertFromFile;
                    if (fileCreateTempFile.renameTo(fileCreateDateStampedFile)) {
                        uriInsertFromFile = FsUtils.insertFromFile(OpenWithInterceptActivity.this, "", fileCreateDateStampedFile, null, 0, 257);
                        if (uriInsertFromFile == null) {
                            DebugLog.d(OpenWithInterceptActivity.TAG, "Deleting scan file after failing to create record: " + fileCreateDateStampedFile.delete());
                        }
                    } else {
                        uriInsertFromFile = null;
                    }
                    return uriInsertFromFile;
                } catch (IOException e) {
                    DebugLog.e(OpenWithInterceptActivity.TAG, "Exception when copying external file.", e);
                    return null;
                } catch (SecurityException e2) {
                    DebugLog.e(OpenWithInterceptActivity.TAG, "Could not read " + uri + "due to: " + e2.getCause());
                    return null;
                }
            }

            @Override // android.os.AsyncTask
            protected void onPostExecute(Uri uri) {
                if (uri != null) {
                    OpenWithInterceptActivity.this.mLoadedScanUri = uri;
                    OpenWithInterceptActivity.this.openInViewer();
                } else {
                    Toast.makeText(OpenWithInterceptActivity.this.getApplicationContext(), R.string.viewer_invalid_file, 1).show();
                    OpenWithInterceptActivity.this.finish();
                }
            }
        }.execute(getIntent().getData());
    }

    private void openInViewer() {
        Uri uri = this.mLoadedScanUri;
        if (uri == null || this.mWaitForOnboarding) {
            return;
        }
        ViewerActivity.showInOpenWithMode(this, uri);
        finish();
    }

    private File createDateStampedFile() {
        String str = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
        String str2 = getFilesDir().getAbsolutePath() + FsUtils.RESULTS_DIR_NAME;
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        return new File(str2 + "/3DCreator_" + str + ".obj.zip");
    }

    private File createTempFile() {
        return new File(getFilesDir().getAbsolutePath() + "/" + TEMP_FILE_NAME);
    }
}
