package com.sonymobile.scan3d.viewer.sharing.tabs;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RadioButton;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.VisibleForTesting;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.view.ContextThemeWrapper;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.PermissionUtil;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.animation.GLTFExporter;
import com.sonymobile.scan3d.sharing.LocalPlugin;
import com.sonymobile.scan3d.sharing.Plugin;
import com.sonymobile.scan3d.sharing.Plugin3rdParty;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.sharing.SharingManager;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.viewer.DismissablePrivacyFragment;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.PrivacyFragment;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;
import com.sonymobile.scan3d.viewer.fragments.AnimationFragment;
import com.sonymobile.scan3d.viewer.fragments.FaceBlendIntroFragment;
import com.sonymobile.scan3d.viewer.fragments.PropsFragment;
import com.sonymobile.scan3d.viewer.fragments.ShareAsVideoFragment;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import com.sonymobile.scan3d.wallpaper.SphinxWallpaperService;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class TabPageShare extends TabPageBase implements YesNoQuestionFragment.OnYesNoListener {
    private static final int ANIMATE_MODEL_DIALOG_ID = 10;
    private static final String KEY_COMPONENT_NAME = "component_name";
    private static final String KEY_SELECTED_PLUGIN_NAME = "plugin_name";
    private static final String KEY_SHAREABLE = "shareable";
    private static final String KEY_TEXTURE_SIZE = "texture_size";
    private static final String KEY_VIEW_MATRIX = "view_matrix";
    private static final String TAG = "TabPageShare";
    private ComponentName mComponentName;
    private boolean mHasFacePlugins = false;
    private String mSelectedPluginName;
    private int mTextureSize;

    public enum SharingConclusion {
        SEND_OBJ_ZIP,
        SEND_GLTF,
        ASK_TO_ANIMATE,
        ANIMATE_WITHOUT_ASKING,
        UNSUPPORTED_ERROR
    }

    static class ReduceSizeManager {
        private static ReduceSizeManager sInstance;
        WeakReference<ReduceGLTFSizeListener> mListener;
        private Shareable mResult;
        private TaskState mState = TaskState.IDLE;
        private ReduceGLTFSizeTask mTask;

        public interface ReduceGLTFSizeListener {
            void onReductionDone(Shareable shareable);
        }

        private enum TaskState {
            IDLE,
            RUNNING,
            FINISHED
        }

        private ReduceSizeManager() {
        }

        public static ReduceSizeManager getInstance() {
            if (sInstance == null) {
                sInstance = new ReduceSizeManager();
            }
            return sInstance;
        }

        boolean isTaskRunning() {
            return this.mState == TaskState.RUNNING;
        }

        public void addListener(ReduceGLTFSizeListener reduceGLTFSizeListener) {
            if (reduceGLTFSizeListener != null) {
                WeakReference<ReduceGLTFSizeListener> weakReference = this.mListener;
                if (weakReference != null) {
                    weakReference.clear();
                }
                this.mListener = new WeakReference<>(reduceGLTFSizeListener);
                if (this.mState == TaskState.FINISHED) {
                    this.mState = TaskState.IDLE;
                    reduceGLTFSizeListener.onReductionDone(this.mResult);
                }
            }
        }

        void unregisterListener(ReduceGLTFSizeListener reduceGLTFSizeListener) {
            WeakReference<ReduceGLTFSizeListener> weakReference;
            if (reduceGLTFSizeListener == null || (weakReference = this.mListener) == null || weakReference.get() != reduceGLTFSizeListener) {
                return;
            }
            this.mListener.clear();
        }

        void startReduction(Context context, Shareable shareable, String str, String str2) {
            if (this.mState == TaskState.IDLE) {
                this.mTask = new ReduceGLTFSizeTask(context, shareable, str2);
                this.mTask.execute(str);
                this.mState = TaskState.RUNNING;
            }
        }

        void reductionDone(ReduceGLTFSizeTask reduceGLTFSizeTask, Shareable shareable) {
            ReduceGLTFSizeTask reduceGLTFSizeTask2 = this.mTask;
            if (reduceGLTFSizeTask2 != reduceGLTFSizeTask || reduceGLTFSizeTask2 == null) {
                return;
            }
            this.mState = TaskState.FINISHED;
            this.mTask = null;
            WeakReference<ReduceGLTFSizeListener> weakReference = this.mListener;
            if (weakReference != null) {
                ReduceGLTFSizeListener reduceGLTFSizeListener = weakReference.get();
                if (reduceGLTFSizeListener != null) {
                    this.mState = TaskState.IDLE;
                    reduceGLTFSizeListener.onReductionDone(shareable);
                    return;
                }
                return;
            }
            this.mResult = shareable;
        }
    }

    private static class ReduceGLTFSizeTask extends AsyncTask<String, Void, File> {
        WeakReference<Context> mContext;
        String mExportName;
        Shareable mShareable;

        ReduceGLTFSizeTask(Context context, Shareable shareable, String str) {
            this.mContext = new WeakReference<>(context);
            this.mShareable = shareable;
            this.mExportName = str;
        }

        @Override // android.os.AsyncTask
        protected File doInBackground(String... strArr) {
            GLTFExporter gLTFExporter = new GLTFExporter();
            Context context = this.mContext.get();
            if (context == null || !gLTFExporter.load(strArr[0], Vault.getPassword(context)) || !gLTFExporter.reduceSize(this.mShareable.getTextureSize())) {
                return null;
            }
            File shareGlbFile = FsUtils.getShareGlbFile(context, this.mExportName);
            gLTFExporter.save(shareGlbFile.getAbsolutePath(), false);
            this.mShareable.setUrl(shareGlbFile.getAbsolutePath());
            return shareGlbFile;
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(File file) {
            super.onPostExecute(file);
            ReduceSizeManager.getInstance().reductionDone(this, file != null ? this.mShareable : null);
        }
    }

    public static TabPageShare newInstance(IFileSet iFileSet, int i, float[] fArr, Shareable shareable) {
        TabPageShare tabPageShare = new TabPageShare();
        Bundle baseArguments = getBaseArguments(iFileSet, i);
        baseArguments.putFloatArray(KEY_VIEW_MATRIX, fArr);
        baseArguments.putBundle("shareable", shareable.toBundle());
        tabPageShare.setArguments(baseArguments);
        return tabPageShare;
    }

    @Override // com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase
    protected boolean hasFacePlugins() {
        return this.mHasFacePlugins;
    }

    @Override // com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase
    protected List<Plugin> getPlugins() {
        int i;
        Context context = getContext();
        List<Plugin> arrayList = new ArrayList<>();
        int scanType = this.mFileSet.getScanType();
        Shareable shareable = new Shareable(getArguments().getBundle("shareable"));
        boolean zIsGooglePlayEnabled = Config.isGooglePlayEnabled(context);
        Shareable.Type shareType = getShareable().getShareType();
        if (zIsGooglePlayEnabled) {
            LocalPlugin webViewerSharePlugin = new WebViewerSharePlugin();
            if (webViewerSharePlugin.isEnabled(shareType, context, scanType)) {
                i = 1;
                arrayList.add(0, webViewerSharePlugin);
            } else {
                i = 0;
            }
        } else {
            i = 0;
        }
        addPlugin(arrayList, new FileSharePlugin(), shareType, scanType);
        addPlugin(arrayList, new FaceBlendPlugin(), shareType, scanType);
        addPlugin(arrayList, new PropsPlugin(), shareType, scanType);
        if (this.mFileSet.isImprovement()) {
            addPlugin(arrayList, new FileShareAdvPlugin(), shareType, scanType);
        }
        addPlugin(arrayList, new ShareAsVideoPlugin(), shareType, scanType);
        addPlugins(arrayList, SharingConstants.Category.SHARE, scanType, shareable.getScanFormat());
        addPlugins(arrayList, SharingConstants.Category.GAMING, scanType);
        addPlugin(arrayList, new WallpaperPlugin(), shareType, scanType);
        addPlugins(arrayList, SharingConstants.Category.MISC, scanType);
        if (zIsGooglePlayEnabled) {
            addPlugin(arrayList, new FindMorePlugin(), shareType, scanType);
        }
        rearrangePluginList(arrayList, i);
        return arrayList;
    }

    private void addPlugin(List<Plugin> list, Plugin plugin, Shareable.Type type, int i) {
        if (plugin.isEnabled(type, getContext(), i)) {
            list.add(plugin);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase, androidx.fragment.app.Fragment
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mComponentName = (ComponentName) bundle.getParcelable(KEY_COMPONENT_NAME);
            this.mTextureSize = bundle.getInt(KEY_TEXTURE_SIZE, 0);
            this.mSelectedPluginName = bundle.getString(KEY_SELECTED_PLUGIN_NAME);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable(KEY_COMPONENT_NAME, this.mComponentName);
        bundle.putInt(KEY_TEXTURE_SIZE, this.mTextureSize);
        bundle.putString(KEY_SELECTED_PLUGIN_NAME, this.mSelectedPluginName);
    }

    @Override // com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase
    protected void onClickPlugin(Plugin plugin, int i) {
        sendClickEvent(plugin);
        Shareable shareable = getShareable();
        shareable.setFileSet(MeshHolderFragment.getInstance(getActivity()).getFileSet());
        IFileSet fileSet = shareable.getFileSet();
        if (plugin instanceof Plugin3rdParty) {
            Plugin3rdParty plugin3rdParty = (Plugin3rdParty) plugin;
            shareable.setRecipient(plugin3rdParty.getComponentName()).setTextureSize(plugin3rdParty.getTextureSize());
            handleSharing(getContext(), shareable, plugin3rdParty.getSupportedMimeTypes(), plugin3rdParty.getPreferredMimeType(), plugin3rdParty.getAppName(), plugin3rdParty.getComponentName(), plugin3rdParty.getTextureSize(), this);
            return;
        }
        plugin.shareMesh(getContext(), fileSet, i);
    }

    @VisibleForTesting
    public static SharingConclusion getSharingConclusion(@NonNull Shareable shareable, @NonNull ArrayList<String> arrayList, @Nullable String str) {
        IFileSet fileSet = shareable.getFileSet();
        boolean zEquals = SharingConstants.SCAN_3D_MIME_TYPE.equals(str);
        boolean z = arrayList.contains(SharingConstants.SCAN_3D_MIME_TYPE) || zEquals;
        boolean zEquals2 = SharingConstants.GLTF_MIME_TYPE.equals(str);
        boolean z2 = arrayList.contains(SharingConstants.GLTF_MIME_TYPE) || zEquals2;
        boolean zEquals3 = SharingConstants.NO_MIME_TYPE_PREFERRED.equals(str);
        boolean zIsRiggable = fileSet.isRiggable();
        boolean zIsRigged = fileSet.isRigged();
        switch (shareable.getShareType()) {
            case ANIMATION:
                if (z2) {
                    return SharingConclusion.SEND_GLTF;
                }
                return SharingConclusion.UNSUPPORTED_ERROR;
            case PROPS:
                return SharingConclusion.UNSUPPORTED_ERROR;
            default:
                if (!z && !zIsRiggable) {
                    return SharingConclusion.UNSUPPORTED_ERROR;
                }
                if (z && zEquals) {
                    return SharingConclusion.SEND_OBJ_ZIP;
                }
                if (z2 && zEquals2) {
                    if (!zIsRiggable) {
                        return SharingConclusion.SEND_OBJ_ZIP;
                    }
                    if (zIsRigged) {
                        return SharingConclusion.SEND_GLTF;
                    }
                    if (!z) {
                        return SharingConclusion.ANIMATE_WITHOUT_ASKING;
                    }
                    return SharingConclusion.ASK_TO_ANIMATE;
                }
                if (!z && z2) {
                    if (zIsRigged) {
                        return SharingConclusion.SEND_GLTF;
                    }
                    return SharingConclusion.ANIMATE_WITHOUT_ASKING;
                }
                if (z && z2 && zEquals3) {
                    if (zIsRigged) {
                        return SharingConclusion.SEND_GLTF;
                    }
                    return SharingConclusion.SEND_OBJ_ZIP;
                }
                if (z) {
                    return SharingConclusion.SEND_OBJ_ZIP;
                }
                return SharingConclusion.UNSUPPORTED_ERROR;
        }
    }

    private static void handleSharing(@NonNull Context context, @NonNull Shareable shareable, @NonNull ArrayList<String> arrayList, @Nullable String str, @Nullable String str2, @Nullable ComponentName componentName, int i, @NonNull TabPageShare tabPageShare) {
        IFileSet fileSet = shareable.getFileSet();
        switch (getSharingConclusion(shareable, arrayList, str)) {
            case SEND_OBJ_ZIP:
                shareable.setUrl(fileSet.getZipFileUrl());
                shareable.setScanFormat(0);
                break;
            case SEND_GLTF:
                shareable.setUrl(fileSet.getRiggedFileUrl());
                shareable.setScanFormat(1);
                break;
            case ASK_TO_ANIMATE:
                tabPageShare.showAnimationDialog(str2, componentName, i);
                break;
            case ANIMATE_WITHOUT_ASKING:
                shareable.setRecipient(componentName).setTextureSize(i);
                shareable.setScanFormat(1);
                tabPageShare.showFragment(AnimationFragment.newInstance(shareable, true));
                break;
            default:
                Log.w(TAG, "An odd sharing state occurred. Supported: " + arrayList + ", Preferred: " + str + ", Rigged: " + shareable.getFileSet().isRigged() + ", Riggable: " + shareable.getFileSet().isRiggable());
                shareable.setUrl(fileSet.getZipFileUrl());
                shareable.setScanFormat(0);
                break;
        }
        if (TextUtils.isEmpty(shareable.getUrl())) {
            return;
        }
        shareable.share(context);
    }

    private void showAnimationDialog(String str, ComponentName componentName, int i) {
        this.mComponentName = componentName;
        this.mTextureSize = i;
        ArrayList arrayList = new ArrayList();
        arrayList.add(str);
        YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(10, R.string.animate_before_share_title, R.string.animate_before_share_desc, arrayList, R.string.dialog_button_yes, R.string.dialog_button_no, null);
        yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
        yesNoQuestionFragmentNewInstance.show(getFragmentManager(), "dialog_tag");
    }

    private void rearrangePluginList(List<Plugin> list, int i) {
        List<Plugin> arrayList = new ArrayList<>();
        for (Plugin plugin : list) {
            if ((plugin instanceof Plugin3rdParty) && ((Plugin3rdParty) plugin).getComponentName().getPackageName().equals("com.sonymobile.androidapp.cameraaddon.areffect")) {
                arrayList.add(plugin);
            }
        }
        for (Plugin plugin2 : arrayList) {
            if (list.remove(plugin2)) {
                list.add(i, plugin2);
            }
        }
    }

    private void addPlugins(List<Plugin> list, SharingConstants.Category category, int i) {
        addPlugins(list, category, i, 0);
    }

    private void addPlugins(List<Plugin> list, SharingConstants.Category category, int i, int i2) {
        SharingManager sharingManager = SharingManager.getInstance();
        Set<Plugin> plugins = sharingManager.getPlugins(category, i);
        this.mHasFacePlugins |= sharingManager.hasPluginsExact(category, 256);
        this.mHasFacePlugins = sharingManager.hasPluginsExact(category, 257) | this.mHasFacePlugins;
        Shareable.Type shareType = getShareable().getShareType();
        if (plugins != null) {
            for (Plugin plugin : plugins) {
                if (plugin instanceof Plugin3rdParty) {
                    Plugin3rdParty plugin3rdParty = (Plugin3rdParty) plugin;
                    if (plugin3rdParty.isPrivileged()) {
                        addPlugin(list, plugin3rdParty, shareType, i);
                    } else {
                        addPlugin(list, new Plugin3rdPartyWithPrivacyDialog(this, plugin3rdParty), shareType, i);
                    }
                } else {
                    addPlugin(list, plugin, shareType, i);
                }
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr) {
        boolean z = false;
        int i2 = 0;
        while (true) {
            if (i2 >= strArr.length) {
                z = true;
                break;
            } else if (iArr[i2] != 0) {
                break;
            } else {
                i2++;
            }
        }
        this.mPermissionsHandler.removeCallbacksAndMessages(null);
        if (z) {
            if (this.mPermissionsContainer.getVisibility() == 0) {
                this.mPermissionsHandler.post(PermissionUtil.removePermissionsContainer(this.mPermissionsContainer));
            }
            shareToPlugin(this.mSelectedPluginName);
            return;
        }
        PermissionUtil.showPermissionsSnackbar(this.mPermissionsHandler, this.mPermissionsContainer);
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        if (i != 10) {
            return;
        }
        Shareable shareable = getShareable();
        shareable.setRecipient(this.mComponentName).setTextureSize(this.mTextureSize);
        shareable.setScanFormat(1);
        ((YesNoQuestionFragment) getFragmentManager().findFragmentByTag("dialog_tag")).dismiss();
        showFragment(AnimationFragment.newInstance(shareable, true));
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
        if (i != 10) {
            return;
        }
        Shareable shareable = getShareable();
        shareable.setRecipient(this.mComponentName).setUrl(this.mFileSet.getZipFileUrl());
        shareable.setScanFormat(0);
        shareable.share(getContext());
    }

    private void shareToPlugin(String str) {
        if (((str.hashCode() == -985351510 && str.equals("ShareAsVideo")) ? (byte) 0 : (byte) -1) != 0) {
            return;
        }
        showShareAsVideoFragment();
    }

    private void showShareAsVideoFragment() {
        showFragment(ShareAsVideoFragment.newInstance(getShareable()));
        HitEvent.SHARE_AS_VIDEO.send(getContext(), 1L);
    }

    private Shareable getShareable() {
        return new Shareable(getArguments().getBundle("shareable"));
    }

    public static class ThirdPartyPrivacyDialog extends PrivacyFragment {
        private static final String ARG_APP_NAME = "appName";
        private static final String ARG_PREFERRED_MIMETYPE = "preferredMimeType";
        private static final String ARG_SHAREABLE = "shareable";
        private static final String ARG_SUPPORTED_MIMETYPE = "supportedMimeType";

        @Override // com.sonymobile.scan3d.viewer.PrivacyFragment
        protected String getPrivacyLink() {
            return null;
        }

        @Override // com.sonymobile.scan3d.viewer.PrivacyFragment
        protected void onPositiveAnswer() {
            Bundle arguments = getArguments();
            Shareable shareable = new Shareable(arguments.getBundle("shareable"));
            ArrayList<String> stringArrayList = arguments.getStringArrayList(ARG_SUPPORTED_MIMETYPE);
            String string = arguments.getString(ARG_PREFERRED_MIMETYPE);
            int i = arguments.getInt(TabPageShare.KEY_TEXTURE_SIZE, 0);
            ComponentName componentName = (ComponentName) arguments.getParcelable(TabPageShare.KEY_COMPONENT_NAME);
            String string2 = arguments.getString(ARG_APP_NAME);
            shareable.setRecipient(componentName).setTextureSize(i);
            TabPageShare.handleSharing(getContext(), shareable, stringArrayList == null ? new ArrayList<>() : stringArrayList, string, string2, componentName, i, (TabPageShare) getTargetFragment());
        }

        @Override // com.sonymobile.scan3d.viewer.PrivacyFragment
        protected String getApplicationName() {
            return getArguments().getString(ARG_APP_NAME);
        }

        public static ThirdPartyPrivacyDialog newInstance(TabPageShare tabPageShare, Plugin3rdParty plugin3rdParty, Shareable shareable) {
            Bundle bundle = new Bundle();
            bundle.putBundle("shareable", shareable.toBundle());
            bundle.putParcelable(TabPageShare.KEY_COMPONENT_NAME, plugin3rdParty.getComponentName());
            bundle.putString(ARG_APP_NAME, plugin3rdParty.getAppName());
            bundle.putStringArrayList(ARG_SUPPORTED_MIMETYPE, plugin3rdParty.getSupportedMimeTypes());
            bundle.putString(ARG_PREFERRED_MIMETYPE, plugin3rdParty.getPreferredMimeType());
            bundle.putInt(TabPageShare.KEY_TEXTURE_SIZE, plugin3rdParty.getTextureSize());
            ThirdPartyPrivacyDialog thirdPartyPrivacyDialog = new ThirdPartyPrivacyDialog();
            thirdPartyPrivacyDialog.setArguments(bundle);
            thirdPartyPrivacyDialog.setTargetFragment(tabPageShare, 0);
            return thirdPartyPrivacyDialog;
        }
    }

    private class Plugin3rdPartyWithPrivacyDialog implements Plugin {
        private final TabPageShare mFragment;
        private final Plugin3rdParty mPlugin;

        Plugin3rdPartyWithPrivacyDialog(TabPageShare tabPageShare, Plugin3rdParty plugin3rdParty) {
            this.mFragment = tabPageShare;
            this.mPlugin = plugin3rdParty;
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public Drawable getImage() {
            return this.mPlugin.getImage();
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public String getTitle() {
            return this.mPlugin.getTitle();
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            ThirdPartyPrivacyDialog.newInstance(this.mFragment, this.mPlugin, TabPageShare.this.getShareable()).show(TabPageShare.this.getFragmentManager(), (String) null);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return this.mPlugin.getBackgroundColor();
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public List<String> getSupportedMimeTypes() {
            return this.mPlugin.getSupportedMimeTypes();
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return this.mPlugin.isEnabled(type, context, i);
        }
    }

    public static class WebViewerPrivacyDialog extends DismissablePrivacyFragment {
        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected void onPositiveAnswer() {
            Shareable shareable = new Shareable(getArguments().getBundle("shareable"));
            IFileSet fileSet = shareable.getFileSet();
            switch (shareable.getShareType()) {
                case ANIMATION:
                case PROPS:
                    shareable.share(getContext());
                    break;
                default:
                    if (fileSet.isRigged()) {
                        ((TabPageShare) getTargetFragment()).showFragment(AnimationFragment.newInstance(shareable, false));
                    } else {
                        shareable.share(getContext());
                    }
                    break;
            }
            dismiss();
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getTitle() {
            return getString(R.string.consent_share_webviewer_title);
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getDescription() {
            return getString(R.string.consent_share_webviewer_description);
        }

        public static WebViewerPrivacyDialog newInstance(String str, Shareable shareable, TabPageShare tabPageShare) {
            Bundle bundle = new Bundle();
            bundle.putString(DismissablePrivacyFragment.ARG_CHECKBOX_KEY, str);
            bundle.putBundle("shareable", shareable.toBundle());
            WebViewerPrivacyDialog webViewerPrivacyDialog = new WebViewerPrivacyDialog();
            webViewerPrivacyDialog.setTargetFragment(tabPageShare, 0);
            webViewerPrivacyDialog.setArguments(bundle);
            return webViewerPrivacyDialog;
        }
    }

    private class WebViewerSharePlugin extends LocalPlugin {
        private static final String KEY_DONT_SHOW_AGAIN = "WebViewerSharePlugin_dontShowAgain";
        private static final String WEBVIEWER_NAME = "WebViewer";

        WebViewerSharePlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_webviewer, R.string.share_at_webviewer, WEBVIEWER_NAME);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            boolean z = PreferenceManager.getDefaultSharedPreferences(context).getBoolean(KEY_DONT_SHOW_AGAIN, false);
            Shareable shareable = TabPageShare.this.getShareable();
            shareable.setRecipient(ServiceProvider.WEBVIEWER);
            if (z) {
                switch (shareable.getShareType()) {
                    case ANIMATION:
                    case PROPS:
                        shareable.share(TabPageShare.this.getContext());
                        break;
                    default:
                        if (iFileSet.isRigged()) {
                            TabPageShare.this.showFragment(AnimationFragment.newInstance(shareable, false));
                        } else {
                            shareable.share(TabPageShare.this.getContext());
                        }
                        break;
                }
            }
            WebViewerPrivacyDialog.newInstance(KEY_DONT_SHOW_AGAIN, shareable, TabPageShare.this).show(TabPageShare.this.getFragmentManager(), (String) null);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPageShare.this.getContext().getColor(R.color.sharing_webviewer);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return ServiceProvider.WEBVIEWER.isEnabled(context);
        }
    }

    public static class FileSharePrivacyDialog extends DismissablePrivacyFragment {
        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected void onPositiveAnswer() {
            Shareable shareable = new Shareable(getArguments().getBundle("shareable"));
            switch (shareable.getShareType()) {
                case ANIMATION:
                case PROPS:
                    shareable.share(getContext());
                    break;
                default:
                    if (shareable.getFileSet().isRigged()) {
                        ((TabPageShare) getTargetFragment()).showFragment(AnimationFragment.newInstance(shareable, false));
                    } else {
                        shareable.share(getContext());
                    }
                    break;
            }
            getFragmentManager().popBackStack();
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getTitle() {
            return getString(R.string.consent_file_share_title);
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getDescription() {
            return getString(R.string.consent_file_share_description);
        }

        public static FileSharePrivacyDialog newInstance(String str, Shareable shareable, Fragment fragment) {
            Bundle bundle = new Bundle();
            bundle.putString(DismissablePrivacyFragment.ARG_CHECKBOX_KEY, str);
            bundle.putBundle("shareable", shareable.toBundle());
            FileSharePrivacyDialog fileSharePrivacyDialog = new FileSharePrivacyDialog();
            fileSharePrivacyDialog.setArguments(bundle);
            fileSharePrivacyDialog.setTargetFragment(fragment, 0);
            return fileSharePrivacyDialog;
        }
    }

    public static class FileShareAdvPrivacyDialog extends DismissablePrivacyFragment {
        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected void onPositiveAnswer() {
            Shareable shareable = new Shareable(getArguments().getBundle("shareable"));
            Bundle bundle = new Bundle();
            bundle.putBundle("shareable", shareable.toBundle());
            RadioButtonDialogFragment radioButtonDialogFragmentNewInstance = RadioButtonDialogFragment.newInstance(shareable);
            radioButtonDialogFragmentNewInstance.setArguments(bundle);
            radioButtonDialogFragmentNewInstance.show(getFragmentManager(), (String) null);
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getTitle() {
            return getString(R.string.consent_file_share_title);
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getDescription() {
            return getString(R.string.consent_file_share_description);
        }

        public static FileShareAdvPrivacyDialog newInstance(String str, Shareable shareable, Fragment fragment) {
            Bundle bundle = new Bundle();
            bundle.putBundle("shareable", shareable.toBundle());
            bundle.putString(DismissablePrivacyFragment.ARG_CHECKBOX_KEY, str);
            FileShareAdvPrivacyDialog fileShareAdvPrivacyDialog = new FileShareAdvPrivacyDialog();
            fileShareAdvPrivacyDialog.setArguments(bundle);
            fileShareAdvPrivacyDialog.setTargetFragment(fragment, 0);
            return fileShareAdvPrivacyDialog;
        }
    }

    private class FileSharePlugin extends LocalPlugin {
        private static final String ADV_FILE_SHARE_NAME = "AdvFileSharing";
        private static final String KEY_DONT_SHOW_AGAIN = "FileSharePlugin_dontShowAgain";

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return true;
        }

        FileSharePlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_as_file, R.string.share_as_file_title, ADV_FILE_SHARE_NAME);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            Shareable shareable = TabPageShare.this.getShareable();
            boolean z = PreferenceManager.getDefaultSharedPreferences(context).getBoolean("FileSharePlugin_dontShowAgain", false);
            switch (shareable.getShareType()) {
                case ANIMATION:
                case PROPS:
                    if (!z) {
                        FileSharePrivacyDialog.newInstance("FileSharePlugin_dontShowAgain", shareable, TabPageShare.this).show(TabPageShare.this.getFragmentManager(), (String) null);
                    } else {
                        shareable.share(TabPageShare.this.getContext());
                        TabPageShare.this.getFragmentManager().popBackStack();
                    }
                    break;
                default:
                    shareable.setRecipientRequired(false);
                    if (iFileSet.isRigged()) {
                        TabPageShare.this.showFragment(AnimationFragment.newInstance(shareable, false));
                    } else if (z) {
                        shareable.share(TabPageShare.this.getContext());
                    } else {
                        FileSharePrivacyDialog.newInstance("FileSharePlugin_dontShowAgain", shareable, TabPageShare.this).show(TabPageShare.this.getFragmentManager(), (String) null);
                    }
                    break;
            }
            HitEvent.SHARE_AS_FILE.send(context, 1L);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPageShare.this.getContext().getColor(R.color.sharing_as_file);
        }

        @Override // com.sonymobile.scan3d.sharing.LocalPlugin, com.sonymobile.scan3d.sharing.Plugin
        public List<String> getSupportedMimeTypes() {
            List<String> arrayList = new ArrayList<>();
            arrayList.add(SharingConstants.SCAN_3D_MIME_TYPE);
            arrayList.add(SharingConstants.GLTF_MIME_TYPE);
            return arrayList;
        }
    }

    private class FileShareAdvPlugin extends LocalPlugin {
        private static final String FILE_SHARE_NAME = "ShareFile";
        private static final String KEY_DONT_SHOW_AGAIN = "FileShareAdvPlugin_dontShowAgain";

        FileShareAdvPlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_advancedexport, R.string.share_adv_file_title, FILE_SHARE_NAME);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            Shareable shareable = TabPageShare.this.getShareable();
            if (PreferenceManager.getDefaultSharedPreferences(context).getBoolean(KEY_DONT_SHOW_AGAIN, false)) {
                RadioButtonDialogFragment.newInstance(shareable).show(TabPageShare.this.getFragmentManager(), (String) null);
            } else {
                FileShareAdvPrivacyDialog.newInstance(KEY_DONT_SHOW_AGAIN, shareable, TabPageShare.this).show(TabPageShare.this.getFragmentManager(), (String) null);
            }
            HitEvent.ADV_SHARE_AS_FILE.send(context, 1L);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPageShare.this.getContext().getColor(R.color.sharing_as_file_adv);
        }

        @Override // com.sonymobile.scan3d.sharing.LocalPlugin, com.sonymobile.scan3d.sharing.Plugin
        public List<String> getSupportedMimeTypes() {
            List<String> arrayList = new ArrayList<>();
            arrayList.add(SharingConstants.SCAN_3D_MIME_TYPE);
            return arrayList;
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return type == Shareable.Type.DEFAULT;
        }
    }

    public static class RadioButtonDialogFragment extends DialogFragment {
        private static final String ARG_SHAREABLE = "shareable";
        boolean mIsTessellated = false;

        public static RadioButtonDialogFragment newInstance(Shareable shareable) {
            Bundle bundle = new Bundle();
            bundle.putBundle("shareable", shareable.toBundle());
            RadioButtonDialogFragment radioButtonDialogFragment = new RadioButtonDialogFragment();
            radioButtonDialogFragment.setArguments(bundle);
            return radioButtonDialogFragment;
        }

        @Override // androidx.fragment.app.DialogFragment
        @NonNull
        @SuppressLint({"InflateParams"})
        public Dialog onCreateDialog(Bundle bundle) {
            AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(getActivity(), R.style.SphinxAppCompactDialog));
            View viewInflate = getActivity().getLayoutInflater().inflate(R.layout.adv_sharing_layout, (ViewGroup) null);
            builder.setTitle(R.string.adv_sharing_checkbox_title);
            builder.setView(viewInflate);
            final RadioButton radioButton = (RadioButton) viewInflate.findViewById(R.id.no_adv_sharing);
            final RadioButton radioButton2 = (RadioButton) viewInflate.findViewById(R.id.adv_sharing);
            viewInflate.findViewById(R.id.no_adv_share_layout).setOnClickListener(view -> lambda$onCreateDialog$0(this, radioButton, radioButton2, view));
            viewInflate.findViewById(R.id.adv_sharing_layout).setOnClickListener(view -> lambda$onCreateDialog$1(this, radioButton, radioButton2, view));
            builder.setNegativeButton(android.R.string.cancel, (DialogInterface.OnClickListener) null).setPositiveButton(R.string.action_share_button, (dialogInterface, i) -> lambda$onCreateDialog$2(this, dialogInterface, i));
            return builder.create();
        }

        public static /* synthetic */ void lambda$onCreateDialog$0(RadioButtonDialogFragment radioButtonDialogFragment, RadioButton radioButton, RadioButton radioButton2, View view) {
            radioButton.setChecked(true);
            radioButton2.setChecked(false);
            radioButtonDialogFragment.mIsTessellated = false;
        }

        public static /* synthetic */ void lambda$onCreateDialog$1(RadioButtonDialogFragment radioButtonDialogFragment, RadioButton radioButton, RadioButton radioButton2, View view) {
            radioButton.setChecked(false);
            radioButton2.setChecked(true);
            radioButtonDialogFragment.mIsTessellated = true;
        }

        public static /* synthetic */ void lambda$onCreateDialog$2(RadioButtonDialogFragment radioButtonDialogFragment, DialogInterface dialogInterface, int i) {
            Shareable shareable = new Shareable(radioButtonDialogFragment.getArguments().getBundle("shareable"));
            shareable.setTessellated(radioButtonDialogFragment.mIsTessellated);
            shareable.share(radioButtonDialogFragment.getContext());
            radioButtonDialogFragment.dismiss();
        }
    }

    private class FaceBlendPlugin extends LocalPlugin {
        private static final String SHARE_FACE_BLEND = "Face blend";

        FaceBlendPlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_face_blend, R.string.share_as_faceblend, SHARE_FACE_BLEND);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            TabPageShare tabPageShare = TabPageShare.this;
            tabPageShare.showFragment(FaceBlendIntroFragment.newInstance(tabPageShare.mFileSet));
            HitEvent.SHARE_AS_FILE.send(context, 1L);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPageShare.this.getContext().getColor(R.color.sharing_as_face_blend);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getTextColor(Context context) {
            return context.getColor(R.color.sharing_as_face_blend_text_color);
        }

        @Override // com.sonymobile.scan3d.sharing.LocalPlugin, com.sonymobile.scan3d.sharing.Plugin
        public List<String> getSupportedMimeTypes() {
            List<String> arrayList = new ArrayList<>();
            arrayList.add(SharingConstants.SCAN_3D_MIME_TYPE);
            return arrayList;
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return type == Shareable.Type.DEFAULT && (i == 256 || i == 257);
        }
    }

    private class PropsPlugin extends LocalPlugin {
        private static final String SHARE_PROPS = "Props";

        PropsPlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_props, R.string.share_props, SHARE_PROPS);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            TabPageShare.this.showFragment(PropsFragment.newInstance());
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPageShare.this.getContext().getColor(R.color.sharing_props);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return type == Shareable.Type.DEFAULT && (i == 256 || i == 257);
        }
    }

    private class ShareAsVideoPlugin extends LocalPlugin {
        private static final String SHARE_AS_VIDEO_NAME = "ShareAsVideo";

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return R.color.sharing_as_video;
        }

        ShareAsVideoPlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_as_video, R.string.share_as_video, SHARE_AS_VIDEO_NAME);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            String[] permissions = PermissionUtil.Permissions.STORAGE.getPermissions();
            int requestCode = PermissionUtil.Permissions.STORAGE.getRequestCode();
            String[] missingPermissions = PermissionUtil.getMissingPermissions(TabPageShare.this.getContext(), permissions);
            if (missingPermissions.length <= 0) {
                TabPageShare.this.showShareAsVideoFragment();
                return;
            }
            TabPageShare.this.setupPermissionsButton(R.string.storage_permissons_needed, permissions, requestCode);
            TabPageShare.this.mSelectedPluginName = SHARE_AS_VIDEO_NAME;
            TabPageShare.this.requestPermissions(missingPermissions, requestCode);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getTextColor(Context context) {
            return context.getColor(R.color.sharing_as_video);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return (type == Shareable.Type.DEFAULT || type == Shareable.Type.PROPS) && (i == 256 || i == 257);
        }
    }

    private class WallpaperPlugin extends LocalPlugin {
        private static final String WALLPAPER_NAME = "LiveWallpaper";

        WallpaperPlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_wallpaper, R.string.share_set_as_wallpaper, WALLPAPER_NAME);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            SphinxWallpaperService.setAsWallpaper(TabPageShare.this.getContext(), iFileSet.getUri(), iFileSet.isRigged());
            HitEvent.WALLPAPER.send(context, 1L);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPageShare.this.getContext().getColor(R.color.sharing_wallpaper);
        }

        @Override // com.sonymobile.scan3d.sharing.LocalPlugin, com.sonymobile.scan3d.sharing.Plugin
        public List<String> getSupportedMimeTypes() {
            List<String> arrayList = new ArrayList<>();
            arrayList.add(SharingConstants.SCAN_3D_MIME_TYPE);
            arrayList.add(SharingConstants.GLTF_MIME_TYPE);
            return arrayList;
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return type != Shareable.Type.PROPS;
        }
    }

    private class FindMorePlugin extends LocalPlugin {
        private static final String FIND_MORE_NAME = "FindMoreApps";

        FindMorePlugin() {
            super(TabPageShare.this.getContext(), R.drawable.share_moreapps, R.string.find_more_apps, FIND_MORE_NAME);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            if (TabPageShare.this.startGooglePlay("\"" + context.getString(R.string.google_play_search_all_plugins) + "\"")) {
                HitEvent.FIND_MORE_SHARE.send(this.mContext, 1L);
            }
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPageShare.this.getContext().getColor(R.color.sharing_find_more);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return type != Shareable.Type.PROPS;
        }
    }
}
