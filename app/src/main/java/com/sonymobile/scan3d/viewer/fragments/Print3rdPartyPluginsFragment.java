package com.sonymobile.scan3d.viewer.fragments;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.core.content.FileProvider;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.google.android.gms.drive.DriveFile;
import com.sonymobile.scan3d.NativeEGL;
import com.sonymobile.scan3d.PrintExecution;
import com.sonymobile.scan3d.PrintMaterialType;
import com.sonymobile.scan3d.PrintSelection;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.sharing.NamedPlugin;
import com.sonymobile.scan3d.sharing.Plugin;
import com.sonymobile.scan3d.sharing.Plugin3rdParty;
import com.sonymobile.scan3d.sharing.PrintSharePlugin;
import com.sonymobile.scan3d.sharing.PrintShareStlPlugin;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.sharing.SharingManager;
import com.sonymobile.scan3d.storageservice.network.ContentType;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.PrintSize;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.DismissablePrivacyFragment;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.PrintPreparationResult;
import com.sonymobile.scan3d.viewer.PrivacyFragment;
import com.sonymobile.scan3d.viewer.asynctasks.ComputePrintMeshTask;
import java.io.File;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import org.apache.commons.io.FilenameUtils;

public class Print3rdPartyPluginsFragment extends BaseViewerFragment implements UserInputReducer.InputReducer, MeshHolderFragment.MeshLoadingListener, MeshHolderFragment.PrintMeshLoadingListener {
    private static final int COORD_SYSTEM_DEFAULT = 1618;
    private static final String KEY_COMPONENT_NAME = "component_name";
    private static final String KEY_PRINT_SELECTION = "print_selection";
    private static final String KEY_SELECTED_BUTTON = "key_selected_button";
    private static final String KEY_USE_PRINT_SHARE = "use_print_share";
    private static final String KEY_USE_PRINT_SHARE_STL = "use_print_share_stl";
    private static final String PRIVACY_DIALOG_TAG = "privacy_dialog";
    private ComponentName mComponentNameToStart;
    private View mLargeSize;
    private ListView mListView;
    private View mMediumSize;
    private MeshHolderFragment mMeshHolder;
    private ModelContainer mOrigContainer;
    private ModelContainer mPrintContainer;
    private PrintSelection mPrintSelection;
    private int mSelectedHeight;
    private View mSmallSize;
    private boolean mUsePrintSharePlugin;
    private boolean mUsePrintShareStl;
    private WorkerFragment mWorker;

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    boolean allowProgressDialogCancellation() {
        return false;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_print_3rd_parties_layout;
    }

    public static Print3rdPartyPluginsFragment newInstance(@NonNull PrintSelection printSelection) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_PRINT_SELECTION, printSelection.clone());
        Print3rdPartyPluginsFragment print3rdPartyPluginsFragment = new Print3rdPartyPluginsFragment();
        print3rdPartyPluginsFragment.setArguments(bundle);
        return print3rdPartyPluginsFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(@NonNull View view, Bundle bundle) {
        int i;
        super.onViewCreated(view, bundle);
        if (bundle != null) {
            this.mSelectedHeight = bundle.getInt(KEY_SELECTED_BUTTON, 0);
            this.mPrintSelection = (PrintSelection) bundle.getParcelable(KEY_PRINT_SELECTION);
            this.mComponentNameToStart = (ComponentName) bundle.getParcelable(KEY_COMPONENT_NAME);
            this.mUsePrintSharePlugin = bundle.getBoolean(KEY_USE_PRINT_SHARE);
            this.mUsePrintShareStl = bundle.getBoolean(KEY_USE_PRINT_SHARE_STL);
        } else {
            this.mPrintSelection = (PrintSelection) getArguments().getParcelable(KEY_PRINT_SELECTION);
        }
        this.mWorker = getWorkerFragment();
        this.mSmallSize = view.findViewById(R.id.size_small);
        this.mSmallSize.setOnClickListener(this);
        this.mMediumSize = view.findViewById(R.id.size_medium);
        this.mMediumSize.setOnClickListener(this);
        this.mLargeSize = view.findViewById(R.id.size_large);
        this.mLargeSize.setOnClickListener(this);
        this.mListView = (ListView) view.findViewById(R.id.list_view);
        this.mListView.setOnItemClickListener((adapterView, view2, i2, j) -> {
            if (this.mSelectedHeight == 0) {
                Toast.makeText(getContext(), R.string.print_customization_select_height_toast, 0).show();
                return;
            }
            PrinterPluginsAdapter printerPluginsAdapter = (PrinterPluginsAdapter) this.mListView.getAdapter();
            this.mUsePrintShareStl = printerPluginsAdapter.getItem(i2) instanceof PrintShareStlPlugin;
            this.mUsePrintSharePlugin = this.mUsePrintShareStl || (printerPluginsAdapter.getItem(i2) instanceof PrintSharePlugin);
            if (this.mUsePrintSharePlugin) {
                this.mComponentNameToStart = null;
                if (PreferenceManager.getDefaultSharedPreferences(getContext()).getBoolean(PrintSharePlugin.KEY_DONT_SHOW_AGAIN, false)) {
                    onPositiveAnswer();
                } else {
                    PrintSharePrivacyDialog printSharePrivacyDialogNewInstance = PrintSharePrivacyDialog.newInstance(PrintSharePlugin.KEY_DONT_SHOW_AGAIN);
                    printSharePrivacyDialogNewInstance.setTargetFragment(this, 0);
                    printSharePrivacyDialogNewInstance.show(getFragmentManager(), PRIVACY_DIALOG_TAG);
                }
                HitEvent.SHARE_AS_FILE.send(view2.getContext(), 1L);
                return;
            }
            this.mComponentNameToStart = printerPluginsAdapter.getComponentForPosition(i2);
            this.mUsePrintShareStl = printerPluginsAdapter.componentSupportsMime(i2, SharingConstants.STL_MIME_TYPE);
            PrintPrivacyDialog printPrivacyDialogNewInstance = PrintPrivacyDialog.newInstance(printerPluginsAdapter.getNameForPosition(i2));
            printPrivacyDialogNewInstance.setTargetFragment(this, 0);
            printPrivacyDialogNewInstance.show(getFragmentManager(), PRIVACY_DIALOG_TAG);
        });
        if (bundle != null && (i = this.mSelectedHeight) != 0) {
            onClick(view.findViewById(i));
        }
        this.mMeshHolder = MeshHolderFragment.getInstance(getActivity());
        this.mMeshHolder.setMeshLoadingListener(this);
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        if (isAdded()) {
            this.mOrigContainer = modelContainer;
            this.mMeshHolder.computePrintMesh(this);
            this.mListView.setAdapter((ListAdapter) new PrinterPluginsAdapter());
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
        handleFailedMesh();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoading(Uri uri) {
        showProgressDialog(R.string.saving_print_geometry, true);
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshComputed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4) {
        if (isAdded()) {
            dismissProgressDialog();
            this.mPrintContainer = modelContainer;
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshFailed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4, PrintPreparationResult printPreparationResult) {
        handleFailedMesh();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.PrintMeshLoadingListener
    public void onPrintMeshLoading() {
        showProgressDialog(R.string.saving_print_geometry, true);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt(KEY_SELECTED_BUTTON, this.mSelectedHeight);
        bundle.putParcelable(KEY_PRINT_SELECTION, this.mPrintSelection);
        bundle.putParcelable(KEY_COMPONENT_NAME, this.mComponentNameToStart);
        bundle.putBoolean(KEY_USE_PRINT_SHARE, this.mUsePrintSharePlugin);
        bundle.putBoolean(KEY_USE_PRINT_SHARE_STL, this.mUsePrintShareStl);
    }

    public static class PrintPrivacyDialog extends PrivacyFragment {
        private static final String ARG_NAME = "arg_name";

        @Override // com.sonymobile.scan3d.viewer.PrivacyFragment
        protected String getPrivacyLink() {
            return null;
        }

        @Override // com.sonymobile.scan3d.viewer.PrivacyFragment
        protected void onPositiveAnswer() {
            ((Print3rdPartyPluginsFragment) getTargetFragment()).onPositiveAnswer();
        }

        @Override // com.sonymobile.scan3d.viewer.PrivacyFragment
        protected String getApplicationName() {
            return getArguments().getString(ARG_NAME);
        }

        public static PrintPrivacyDialog newInstance(String str) {
            Bundle bundle = new Bundle();
            bundle.putString(ARG_NAME, str);
            PrintPrivacyDialog printPrivacyDialog = new PrintPrivacyDialog();
            printPrivacyDialog.setArguments(bundle);
            return printPrivacyDialog;
        }
    }

    public static class PrintSharePrivacyDialog extends DismissablePrivacyFragment {
        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected void onPositiveAnswer() {
            ((Print3rdPartyPluginsFragment) getTargetFragment()).onPositiveAnswer();
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getTitle() {
            return getString(R.string.consent_file_share_title);
        }

        @Override // com.sonymobile.scan3d.viewer.DismissablePrivacyFragment
        protected String getDescription() {
            return getString(R.string.consent_file_share_description);
        }

        public static PrintSharePrivacyDialog newInstance(String str) {
            Bundle bundle = new Bundle();
            bundle.putString(DismissablePrivacyFragment.ARG_CHECKBOX_KEY, str);
            PrintSharePrivacyDialog printSharePrivacyDialog = new PrintSharePrivacyDialog();
            printSharePrivacyDialog.setArguments(bundle);
            return printSharePrivacyDialog;
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.mActivityInterface = (ViewerActivityInterface) getActivity();
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        boolean z;
        boolean z2 = true;
        boolean z3 = false;
        switch (view.getId()) {
            case R.id.size_large /* 2131296682 */:
                this.mPrintSelection.setSize(PrintSize.X_LARGE);
                z = true;
                z2 = false;
                break;
            case R.id.size_medium /* 2131296683 */:
                this.mPrintSelection.setSize(PrintSize.LARGE);
                z = false;
                break;
            case R.id.size_small /* 2131296684 */:
                this.mPrintSelection.setSize(PrintSize.SMALL);
                z = false;
                z3 = true;
                z2 = false;
                break;
            default:
                throw new IllegalStateException("Unexpected view: " + view);
        }
        this.mSmallSize.setSelected(z3);
        this.mMediumSize.setSelected(z2);
        this.mLargeSize.setSelected(z);
        this.mSelectedHeight = view.getId();
    }

    private void onPositiveAnswer() {
        showProgressDialog(R.string.saving_print_geometry, true);
        this.mWorker.setTargetFragment(this, 0);
        this.mWorker.executeAsync(this.mMeshHolder, this.mOrigContainer, this.mPrintContainer, this.mPrintSelection);
    }

    private class PrinterPluginsAdapter extends BaseAdapter {
        private final Plugin[] mPlugins;

        @Override // android.widget.Adapter
        public long getItemId(int i) {
            return i;
        }

        PrinterPluginsAdapter() {
            PrintSharePlugin printSharePlugin = new PrintSharePlugin(Print3rdPartyPluginsFragment.this);
            PrintShareStlPlugin printShareStlPlugin = new PrintShareStlPlugin(Print3rdPartyPluginsFragment.this);
            Set<Plugin> plugins = SharingManager.getInstance().getPlugins(SharingConstants.Category.PRINT, Print3rdPartyPluginsFragment.this.mMeshHolder.getScanType());
            if (plugins != null) {
                this.mPlugins = new Plugin[plugins.size() + 2];
                plugins.toArray(this.mPlugins);
                this.mPlugins[plugins.size()] = printSharePlugin;
                this.mPlugins[plugins.size() + 1] = printShareStlPlugin;
                return;
            }
            this.mPlugins = new Plugin[]{printSharePlugin, printShareStlPlugin};
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return this.mPlugins.length;
        }

        @Override // android.widget.Adapter
        public Object getItem(int i) {
            return this.mPlugins[i];
        }

        @Override // android.widget.Adapter
        public View getView(int i, View view, ViewGroup viewGroup) {
            if (view == null) {
                view = LayoutInflater.from(Print3rdPartyPluginsFragment.this.getContext()).inflate(R.layout.printer_plugin_item, viewGroup, false);
            }
            ((TextView) view.findViewById(R.id.text)).setText(((NamedPlugin) this.mPlugins[i]).getAppName());
            ((ImageView) view.findViewById(R.id.image)).setImageDrawable(((NamedPlugin) this.mPlugins[i]).getAppIcon());
            return view;
        }

        ComponentName getComponentForPosition(int i) {
            Plugin plugin = this.mPlugins[i];
            if (plugin instanceof Plugin3rdParty) {
                return ((Plugin3rdParty) plugin).getComponentName();
            }
            return null;
        }

        String getNameForPosition(int i) {
            return ((NamedPlugin) this.mPlugins[i]).getAppName();
        }

        boolean componentSupportsMime(int i, String str) {
            Plugin plugin = this.mPlugins[i];
            if (plugin instanceof Plugin3rdParty) {
                return ((Plugin3rdParty) plugin).supportsMime(str);
            }
            return false;
        }
    }

    private void onRescalingDone(ModelContainer modelContainer, String str) {
        if (modelContainer != null) {
            new SaveModelForPrintPlugin(this.mUsePrintSharePlugin ? null : this.mComponentNameToStart, str, this.mUsePrintShareStl, modelContainer).execute(new Void[0]);
        } else {
            dismissProgressDialog();
        }
    }

    private WorkerFragment getWorkerFragment() {
        FragmentManager fragmentManager = getFragmentManager();
        WorkerFragment workerFragment = (WorkerFragment) fragmentManager.findFragmentByTag(WorkerFragment.TAG);
        if (workerFragment != null) {
            return workerFragment;
        }
        FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
        WorkerFragment workerFragment2 = new WorkerFragment();
        fragmentTransactionBeginTransaction.add(workerFragment2, WorkerFragment.TAG).commit();
        return workerFragment2;
    }

    public static class WorkerFragment extends Fragment {
        public static final String TAG = "com.sonymobile.scan3d.viewer.fragments.Print3rdPartyPluginsFragment$WorkerFragment";
        private MeshHolderFragment mMeshData;
        private ModelContainer mOrigContainer;
        private ModelContainer mPrintContainer;
        private PrintSelection mPrintSelection;
        private final Executor sExecutor = Executors.newSingleThreadExecutor();

        @Override // androidx.fragment.app.Fragment
        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            setRetainInstance(true);
        }

        void executeAsync(MeshHolderFragment meshHolderFragment, ModelContainer modelContainer, ModelContainer modelContainer2, @NonNull PrintSelection printSelection) {
            this.mMeshData = meshHolderFragment;
            this.mPrintSelection = printSelection;
            this.mOrigContainer = modelContainer;
            this.mPrintContainer = modelContainer2;
            createTask().executeOnExecutor(this.sExecutor, new Void[0]);
        }

        private ComputePrintMeshTask createTask() {
            return new ComputePrintMeshTask(getContext(), this.mPrintSelection, this.mOrigContainer, this.mMeshData.getFileSet(), false, false) { // from class: com.sonymobile.scan3d.viewer.fragments.Print3rdPartyPluginsFragment.WorkerFragment.1
                @Override // android.os.AsyncTask
                protected void onPostExecute(ComputePrintMeshTask.PrintMeshLoaderResult printMeshLoaderResult) {
                    if (printMeshLoaderResult.errorType != PrintPreparationResult.SUCCESS) {
                        Toast.makeText(WorkerFragment.this.getContext(), R.string.printpreparation_unknown_fail, 0).show();
                    }
                    Print3rdPartyPluginsFragment print3rdPartyPluginsFragment = (Print3rdPartyPluginsFragment) WorkerFragment.this.getTargetFragment();
                    if (print3rdPartyPluginsFragment != null) {
                        print3rdPartyPluginsFragment.onRescalingDone(printMeshLoaderResult.printContainer, printMeshLoaderResult.name);
                    }
                    printMeshLoaderResult.printContainer.release();
                }
            };
        }
    }

    private class SaveModelForPrintPlugin extends AsyncTask<Void, Void, Pair<String, String>> {
        private final ComponentName mComponent;
        private final String mName;
        private final ModelContainer mPrintModel;
        private final boolean mUseStl;

        SaveModelForPrintPlugin(ComponentName componentName, String str, boolean z, ModelContainer modelContainer) {
            this.mComponent = componentName;
            this.mPrintModel = modelContainer.copy();
            this.mName = str;
            this.mUseStl = z;
        }

        @Override // android.os.AsyncTask
        protected Pair<String, String> doInBackground(Void... voidArr) {
            String path;
            if (this.mUseStl) {
                path = FsUtils.getShareFile(Print3rdPartyPluginsFragment.this.getContext(), this.mName + ".stl").getPath();
                PrintExecution.exportPrintToSTL(this.mPrintModel.getNativeHandle(), path, 0);
            } else {
                long jCreateContext = NativeEGL.createContext(null, true);
                path = FsUtils.getShareFile(Print3rdPartyPluginsFragment.this.getContext(), this.mName + FsUtils.ZIP_SUFFIX).getPath();
                PrintExecution.exportPrintToZip(this.mPrintModel.getNativeHandle(), path, PrintMaterialType.ORIGINAL.ordinal(), false, 0.0f, false, false, 1618, 0);
                NativeEGL.destroyContext(jCreateContext);
            }
            return new Pair<>(path, this.mName);
        }

        @Override // android.os.AsyncTask
        protected void onCancelled() {
            super.onCancelled();
            this.mPrintModel.release();
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(Pair<String, String> pair) {
            FileTasks.scheduleShareFileDeletion(Print3rdPartyPluginsFragment.this.getContext());
            Print3rdPartyPluginsFragment.this.dismissProgressDialog();
            FragmentActivity activity = Print3rdPartyPluginsFragment.this.getActivity();
            if (activity != null) {
                Intent intent = new Intent("android.intent.action.SEND");
                File file = new File((String) pair.first);
                boolean zEquals = FilenameUtils.getExtension((String) pair.first).equals(SharingConstants.STL_FILE_EXTENSION);
                Uri uriForFile = FileProvider.getUriForFile(activity, Print3rdPartyPluginsFragment.this.getString(R.string.file_provider_authority), file);
                intent.setType(zEquals ? SharingConstants.STL_MIME_TYPE : ContentType.ZIP.toMimeString());
                intent.putExtra("android.intent.extra.STREAM", uriForFile);
                ComponentName componentName = this.mComponent;
                if (componentName != null) {
                    intent.setComponent(componentName);
                    intent.setDataAndType(uriForFile, zEquals ? SharingConstants.STL_MIME_TYPE : SharingConstants.SCAN_3D_MIME_TYPE);
                }
                intent.putExtra("android.intent.extra.SUBJECT", String.format(Print3rdPartyPluginsFragment.this.getString(R.string.share_as_file_message_title), pair.second));
                intent.setFlags(DriveFile.MODE_READ_ONLY);
                Print3rdPartyPluginsFragment.this.startActivity(intent);
            }
            this.mPrintModel.release();
        }
    }
}
