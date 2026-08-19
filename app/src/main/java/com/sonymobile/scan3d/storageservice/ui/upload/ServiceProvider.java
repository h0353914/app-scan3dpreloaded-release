package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;
import androidx.annotation.AnyRes;
import androidx.annotation.DrawableRes;
import com.google.android.gms.drive.DriveFile;
import com.sonymobile.scan3d.PrintSelection;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.network.ContentType;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Upload;
import com.sonymobile.scan3d.storageservice.ui.upload.webviewer.WebViewerActionTask;
import com.sonymobile.scan3d.storageservice.ui.upload.webviewer.WebViewerAuthenticationFragment;
import com.sonymobile.scan3d.utils.PrintMaterial;
import com.sonymobile.scan3d.utils.PrintSize;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public enum ServiceProvider {
    WEBVIEWER(R.string.provider_web_viewer_name, R.string.web_viewer_description_text, R.mipmap.ic_launcher, 0, Action.SHARE, Action.UNSHARE, Action.VIEW) {
        @Override // com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider
        void sendCartScreenEvent(Context context) {
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider
        ActionTask create(IFileSet iFileSet, Credentials credentials, Action action, Uri uri, Bundle bundle) {
            return new WebViewerActionTask(this, iFileSet, credentials, action, uri, bundle);
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider
        Intent getIntent(Context context, Action action, String str, Credentials credentials, Bundle bundle) {
            Shareable shareable = new Shareable(bundle.getBundle(ActionActivity.EXTRA_SHAREABLE));
            switch (action) {
                case SHARE:
                    Intent urlShareIntent = ServiceProvider.getUrlShareIntent(context, Config.getWebViewerShareUrl(context, str, shareable));
                    HitEvent.SHARE_VIA_WEBVIEWER.send(context, 1L);
                    return urlShareIntent;
                case UNSHARE:
                    HitEvent.UNSHARE_VIA_WEBVIEWER.send(context, 1L);
                    return null;
                case VIEW:
                    Intent intent = new Intent("android.intent.action.VIEW");
                    intent.setData(Uri.parse(Config.getWebViewerShareUrl(context, str, shareable)));
                    intent.setFlags(DriveFile.MODE_READ_ONLY);
                    HitEvent.VIEW_VIA_WEBVIEWER.send(context, 1L);
                    return intent;
                default:
                    return null;
            }
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider
        ListenableFragment getAuthenticationFragment(Context context, int i) {
            return WebViewerAuthenticationFragment.newInstance(i);
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider
        boolean isValid(Context context, Upload upload, Action action) {
            if (action != Action.UNSHARE) {
                return upload.getUid() != null;
            }
            return upload.getUid() == null;
        }

        @Override // com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider
        void sendActionScreenEvent(Context context) {
            ScreenEvent.WEBVIEWER_SCREEN.send(context);
        }
    };

    public static final int COORD_SYSTEM_DEFAULT = 1618;
    public static final int JPEG_FORMAT_SUPPORTED = 100;
    public static final int NO_FORMAT_SUPPORTED = -1;
    private static final int NO_RES_ID = 0;
    public static final int OBJ_FORMAT_SUPPORTED = 0;
    public static final int PNG_FORMAT_SUPPORTED = 101;
    private static final String PREFERENCE_SHOW_INFO_SUFFIX = "_show_info_pref";
    public static final int VRML_FORMAT_SUPPORTED = 1;
    private final int mDescriptionResourceId;
    private final int mLogoResId;
    private final int mPrivacyLinkResId;
    private final int mServiceProviderResId;
    private final List<Action> mSupportedActions;

    public boolean getAdjustColors() {
        return true;
    }

    ListenableFragment getAuthenticationFragment(Context context, int i) {
        return null;
    }

    public int getCoordSystem() {
        return COORD_SYSTEM_DEFAULT;
    }

    Intent getIntent(Context context, Action action, String str, Credentials credentials, Bundle bundle) {
        return null;
    }

    Intent getLearnMoreIntent(Context context) {
        return null;
    }

    @DrawableRes
    public int getMonitorImageId() {
        return 0;
    }

    public int getSupportedModelFormat() {
        return -1;
    }

    Map<PrintMaterial, Set<PrintSize>> getSupportedPrintMaterials() {
        return null;
    }

    public int getSupportedTextureFormat() {
        return -1;
    }

    boolean isPasswordProtected() {
        return false;
    }

    boolean isValid(Context context, Upload upload, Action action) {
        return false;
    }

    public float minimumDimensionConstraint() {
        return -1.0f;
    }

    abstract void sendActionScreenEvent(Context context);

    abstract void sendCartScreenEvent(Context context);

    ServiceProvider(int i, int i2, int i3, int i4, Action... actionArr) {
        this.mServiceProviderResId = i;
        this.mDescriptionResourceId = i2;
        this.mLogoResId = i3;
        this.mSupportedActions = Arrays.asList(actionArr);
        this.mPrivacyLinkResId = i4;
    }

    ActionTask create(IFileSet iFileSet, Credentials credentials, Action action, Uri uri, Bundle bundle) {
        throw new UnsupportedOperationException("Unsupported for " + name());
    }

    public boolean isActionSupported(Action action) {
        return this.mSupportedActions.contains(action);
    }

    public String getPrivacyLink(Context context) {
        return context.getString(throwOnNoResource(this.mPrivacyLinkResId));
    }

    public void view(Context context, IFileSet iFileSet, Shareable.Type type) {
        Shareable shareable = new Shareable();
        shareable.setFileSet(iFileSet).setShareType(type);
        view(context, iFileSet, shareable);
    }

    public void view(Context context, IFileSet iFileSet, Shareable shareable) {
        if (isActionSupported(Action.VIEW)) {
            context.startActivity(ActionActivity.getStartIntent(context, iFileSet, this, Action.VIEW, shareable));
        }
    }

    public void share(Context context, IFileSet iFileSet, Shareable shareable) {
        if (isActionSupported(Action.SHARE)) {
            context.startActivity(ActionActivity.getStartIntent(context, iFileSet, this, Action.SHARE, shareable));
        }
    }

    public void unshare(Context context, IFileSet iFileSet) {
        if (isActionSupported(Action.UNSHARE)) {
            context.startActivity(ActionActivity.getStartIntent(context, iFileSet, this, Action.UNSHARE));
        }
    }

    public void print(Context context, IFileSet iFileSet, Bundle bundle) {
        if (isActionSupported(Action.PRINT)) {
            Intent startIntent = ActionActivity.getStartIntent(context, iFileSet, this, Action.PRINT);
            startIntent.putExtras(bundle);
            context.startActivity(startIntent);
        }
    }

    public void printCustom(Context context, IFileSet iFileSet, Bundle bundle) {
        if (isActionSupported(Action.PRINT_CUSTOM)) {
            Intent startIntent = ActionActivity.getStartIntent(context, iFileSet, this, Action.PRINT_CUSTOM);
            startIntent.putExtras(bundle);
            context.startActivity(startIntent);
        }
    }

    public boolean isEnabled(Context context) {
        return Config.isProviderEnabled(context, getId());
    }

    boolean startActivity(Context context, String str, String str2, Credentials credentials, Bundle bundle) {
        Intent intent = getIntent(context, getAction(str), str2, credentials, bundle);
        if (intent == null) {
            return false;
        }
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        context.startActivity(intent);
        return true;
    }

    final Action getAction(String str) {
        return Action.getAction(str);
    }

    boolean needsAuthentication(Context context, UploadData uploadData) {
        return (uploadData.isValid() || getAuthenticationFragment(context, 0) == null) ? false : true;
    }

    InfoFragment getInfoFragment(Context context, int i) {
        return InfoFragment.newInstance(i, getServiceProviderName(), getLogo(), getDescription(), R.string.upload_welcome_accept_txt, canLearnMore(context) ? R.string.upload_welcome_learn_more_txt : 0);
    }

    MonitorFragment getMonitorFragment(IFileSet iFileSet, Credentials credentials) {
        if (isActionSupported(Action.PRINT)) {
            return PrintMonitorFragment.newInstance(iFileSet, this, credentials, getMonitorImageId());
        }
        return MonitorFragment.newInstance(iFileSet, this, credentials);
    }

    public int getLogo() {
        return throwOnNoResource(this.mLogoResId);
    }

    public String getServiceProviderName(Context context) {
        return context.getString(getServiceProviderName());
    }

    public int getServiceProviderName() {
        return throwOnNoResource(this.mServiceProviderResId);
    }

    public String getId() {
        return name().toLowerCase(Locale.US);
    }

    public static List<ServiceProvider> getPrintableServiceProviders(Context context) {
        ArrayList arrayList = new ArrayList();
        for (ServiceProvider serviceProvider : values()) {
            if (serviceProvider.isActionSupported(Action.PRINT)) {
                arrayList.add(serviceProvider);
            }
        }
        return applyCustomization(context, arrayList);
    }

    public static List<ServiceProvider> getCustomPrintServiceProviders(Context context) {
        ArrayList arrayList = new ArrayList();
        for (ServiceProvider serviceProvider : values()) {
            if (serviceProvider.isActionSupported(Action.PRINT_CUSTOM)) {
                arrayList.add(serviceProvider);
            }
        }
        return applyCustomization(context, arrayList);
    }

    public static Set<PrintMaterial> getSupportedMaterials(Context context) {
        TreeSet treeSet = new TreeSet();
        Iterator<ServiceProvider> it = getPrintableServiceProviders(context).iterator();
        while (it.hasNext()) {
            treeSet.addAll(it.next().getSupportedPrintMaterials().keySet());
        }
        return treeSet;
    }

    public static Set<PrintSize> getSupportedSizes(Context context, PrintMaterial printMaterial) {
        TreeSet treeSet = new TreeSet();
        if (printMaterial != null) {
            Iterator<ServiceProvider> it = getPrintableServiceProviders(context).iterator();
            while (it.hasNext()) {
                Set<PrintSize> set = it.next().getSupportedPrintMaterials().get(printMaterial);
                if (set != null && !treeSet.containsAll(set)) {
                    treeSet.addAll(set);
                }
            }
        }
        return treeSet;
    }

    public static boolean hasPrintProviders(Context context) {
        return getPrintableServiceProviders(context).size() > 0;
    }

    final boolean showInfo(Context context) {
        if (this.mDescriptionResourceId == 0) {
            return false;
        }
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(getPreferenceName(), true);
    }

    final void hideInfo(Context context) {
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(getPreferenceName(), false).apply();
    }

    final List<Action> getSupportedActions() {
        return this.mSupportedActions;
    }

    private boolean canLearnMore(Context context) {
        return getLearnMoreIntent(context) != null;
    }

    private int getDescription() {
        return throwOnNoResource(this.mDescriptionResourceId);
    }

    private boolean isPrintSupported(PrintSelection printSelection) {
        Set<PrintSize> set;
        return isActionSupported(Action.PRINT) && printSelection != null && (set = getSupportedPrintMaterials().get(printSelection.getMaterial())) != null && set.contains(printSelection.getSize());
    }

    private int throwOnNoResource(@AnyRes int i) {
        if (i != 0) {
            return i;
        }
        throw new UnsupportedOperationException("Invalid resource id for " + name());
    }

    private static Intent getUrlShareIntent(Context context, String str) {
        Intent intent = new Intent("android.intent.action.SEND");
        intent.setType(ContentType.PLAIN_TEXT.toMimeString());
        intent.putExtra("android.intent.extra.SUBJECT", context.getString(R.string.share_subject_txt));
        intent.putExtra("android.intent.extra.TEXT", str);
        Intent intentCreateChooser = Intent.createChooser(intent, context.getString(R.string.upload_share_with_txt));
        intentCreateChooser.setFlags(DriveFile.MODE_READ_ONLY);
        return intentCreateChooser;
    }

    private String getPreferenceName() {
        return name().toLowerCase(Locale.US).concat(PREFERENCE_SHOW_INFO_SUFFIX);
    }

    private static List<ServiceProvider> applyCustomization(Context context, List<ServiceProvider> list) {
        ArrayList arrayList = new ArrayList();
        for (ServiceProvider serviceProvider : list) {
            if (serviceProvider.isEnabled(context)) {
                arrayList.add(serviceProvider);
            }
        }
        return arrayList;
    }
}
