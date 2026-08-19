package com.sonymobile.scan3d.viewer;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.google.android.vending.expansion.downloader.Constants;
import com.sonymobile.scan3d.PrintSelection;
import com.sonymobile.scan3d.ScenoID;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.asynctasks.ComputePrintMeshTask;
import com.sonymobile.scan3d.viewer.asynctasks.LoadModelTask;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public class MeshHolderFragment extends Fragment {
    private static final String KEY_PRINT_SELECTION = "PRINT_SELECTION";
    private static final String KEY_URI = "uri";
    private ModelContainer mAltPrintModel;
    private ContentObserver mContentObserver;
    private ContentResolver mContentResolver;
    private ComputePrintMeshTask mCurrentComputePrintMeshTask;
    private FaceBlender mFaceBlender;
    private IFileSet mFileSet;
    private MeshLoadingListener mListener;
    private ModelContainer mModel;
    private String mName;
    private Runnable mOnChangeRunnable;
    private String mPath;
    private PrintSelection mPendingSelection;
    private PrintSelection mPrevSelection;
    private ModelContainer mPrintEditModel;
    private PrintPreparationResult mPrintError;
    private ModelContainer mPrintModel;
    private ModelContainer mSocleModel;
    private SphanRenderer mSphanRenderer;
    private int mTextLimit;
    private Uri mUri;
    private float[] mViewerViewMatrix;
    private Executor mExecutor = Executors.newSingleThreadExecutor();
    private LoadTaskState mPrintTaskState = LoadTaskState.STATE_NOT_LOADED;
    private LoadTaskState mOrgTaskState = LoadTaskState.STATE_NOT_LOADED;
    private Handler mHandler = new Handler();
    private ScenoID mScenography = ScenoID.SCENO_TEXTURED;
    private boolean mUseUntexturedShading = false;
    private int mPrintEditorSeek = -1;

    public enum LoadRiggedMeshState {
        NOT_LOADED,
        LOADED,
        FAILED
    }

    public enum LoadTaskState {
        STATE_NOT_LOADED,
        STATE_LOADED,
        STATE_FAILED,
        STATE_LOADING
    }

    public interface MeshLoadingListener {
        void onMeshLoadFailed(Uri uri);

        void onMeshLoaded(Uri uri, ModelContainer modelContainer);

        void onMeshLoading(Uri uri);
    }

    public interface PrintMeshLoadingListener {
        void onPrintMeshComputed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4);

        void onPrintMeshFailed(ModelContainer modelContainer, ModelContainer modelContainer2, ModelContainer modelContainer3, ModelContainer modelContainer4, PrintPreparationResult printPreparationResult);

        void onPrintMeshLoading();
    }

    public static MeshHolderFragment getInstance(FragmentActivity fragmentActivity) {
        return getInstance(fragmentActivity, fragmentActivity.getIntent().getData());
    }

    public static MeshHolderFragment getInstance(FragmentActivity fragmentActivity, Uri uri) {
        FragmentManager supportFragmentManager = fragmentActivity.getSupportFragmentManager();
        MeshHolderFragment meshHolderFragment = (MeshHolderFragment) supportFragmentManager.findFragmentByTag(uri.getLastPathSegment());
        if (meshHolderFragment != null) {
            return meshHolderFragment;
        }
        MeshHolderFragment meshHolderFragment2 = new MeshHolderFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_URI, uri);
        meshHolderFragment2.setArguments(bundle);
        FragmentTransaction fragmentTransactionBeginTransaction = supportFragmentManager.beginTransaction();
        fragmentTransactionBeginTransaction.add(meshHolderFragment2, uri.getLastPathSegment());
        fragmentTransactionBeginTransaction.commit();
        return meshHolderFragment2;
    }

    public void setMeshLoadingListener(final MeshLoadingListener meshLoadingListener) {
        this.mListener = meshLoadingListener;
        if (meshLoadingListener != null) {
            switch (this.mOrgTaskState) {
                case STATE_LOADED:
                    this.mHandler.post(() -> meshLoadingListener.onMeshLoaded(this.mUri, this.mModel));
                    break;
                case STATE_FAILED:
                    this.mHandler.post(() -> meshLoadingListener.onMeshLoadFailed(this.mUri));
                    break;
                default:
                    this.mHandler.post(() -> meshLoadingListener.onMeshLoading(this.mUri));
                    break;
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        this.mListener = null;
        super.onDetach();
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mPendingSelection = (PrintSelection) bundle.getParcelable(KEY_PRINT_SELECTION);
        } else {
            this.mPendingSelection = new PrintSelection();
        }
        setRetainInstance(true);
        this.mUri = (Uri) getArguments().getParcelable(KEY_URI);
        loadMesh();
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        bundle.putParcelable(KEY_PRINT_SELECTION, getPendingPrintSelection());
        super.onSaveInstanceState(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        destroy();
        super.onDestroy();
    }

    private void loadMesh() {
        this.mOrgTaskState = LoadTaskState.STATE_LOADING;
        new LoadModelTask(getContext()) {
            @Override // android.os.AsyncTask
            protected void onPostExecute(LoadModelTask.MeshAsyncTaskResult meshAsyncTaskResult) {
                if (meshAsyncTaskResult != null) {
                    MeshHolderFragment.this.mOrgTaskState = LoadTaskState.STATE_LOADED;
                    IFileSet iFileSet = meshAsyncTaskResult.fileset;
                    MeshHolderFragment.this.mFileSet = iFileSet;
                    MeshHolderFragment.this.mName = iFileSet.getName();
                    MeshHolderFragment.this.mPath = iFileSet.getZipFileUrl();
                    MeshHolderFragment.this.setModelContainer(meshAsyncTaskResult.model);
                    if (MeshHolderFragment.this.mListener != null) {
                        MeshHolderFragment.this.mHandler.post(() -> MeshHolderFragment.this.mListener.onMeshLoaded(MeshHolderFragment.this.mUri, MeshHolderFragment.this.mModel));
                        return;
                    }
                    return;
                }
                MeshHolderFragment.this.mOrgTaskState = LoadTaskState.STATE_FAILED;
                if (MeshHolderFragment.this.mListener != null) {
                    MeshHolderFragment.this.mHandler.post(() -> MeshHolderFragment.this.mListener.onMeshLoadFailed(MeshHolderFragment.this.mUri));
                }
            }
        }.executeOnExecutor(this.mExecutor, this.mUri);
    }

    public boolean computePrintMesh(final PrintMeshLoadingListener printMeshLoadingListener) {
        PrintSelection pendingPrintSelection = getPendingPrintSelection();
        if ((this.mPrintTaskState == LoadTaskState.STATE_LOADED || this.mPrintTaskState == LoadTaskState.STATE_FAILED) && pendingPrintSelection.matchesSelection(this.mPrevSelection)) {
            switch (this.mPrintTaskState) {
                case STATE_LOADED:
                    this.mHandler.post(() -> printMeshLoadingListener.onPrintMeshComputed(this.mPrintModel, this.mAltPrintModel, this.mPrintEditModel, this.mSocleModel));
                    return false;
                case STATE_FAILED:
                    this.mHandler.post(() -> printMeshLoadingListener.onPrintMeshFailed(this.mPrintModel, this.mAltPrintModel, this.mPrintEditModel, this.mSocleModel, this.mPrintError));
                    return false;
                default:
                    return false;
            }
        }
        Handler handler = this.mHandler;
        printMeshLoadingListener.getClass();
        handler.post(printMeshLoadingListener::onPrintMeshLoading);
        Calendar calendar = Calendar.getInstance();
        String str = "Xperia " + calendar.get(1) + Constants.FILENAME_SEQUENCE_SEPARATOR + (calendar.get(2) + 1);
        pendingPrintSelection.setScanType(getScanType());
        pendingPrintSelection.setInscription(str);
        this.mPrintTaskState = LoadTaskState.STATE_LOADING;
        ComputePrintMeshTask computePrintMeshTask = this.mCurrentComputePrintMeshTask;
        if (computePrintMeshTask != null) {
            computePrintMeshTask.cancel(true);
        }
        this.mCurrentComputePrintMeshTask = new ComputePrintMeshTask(getContext(), pendingPrintSelection.clone(), this.mModel, this.mFileSet, true, true) { // from class: com.sonymobile.scan3d.viewer.MeshHolderFragment.2
            @Override // com.sonymobile.scan3d.viewer.asynctasks.ComputePrintMeshTask, android.os.AsyncTask
            protected void onCancelled() {
                super.onCancelled();
                MeshHolderFragment.this.mPrintTaskState = LoadTaskState.STATE_NOT_LOADED;
            }

            @Override // android.os.AsyncTask
            protected void onPostExecute(ComputePrintMeshTask.PrintMeshLoaderResult printMeshLoaderResult) {
                MeshHolderFragment.this.setPrintLoadResult(printMeshLoaderResult);
                MeshHolderFragment.this.setTextLimit(printMeshLoaderResult.textLimit);
                if (printMeshLoaderResult.errorType == PrintPreparationResult.SUCCESS) {
                    MeshHolderFragment.this.mPrintTaskState = LoadTaskState.STATE_LOADED;
                    printMeshLoadingListener.onPrintMeshComputed(MeshHolderFragment.this.mPrintModel, MeshHolderFragment.this.mAltPrintModel, MeshHolderFragment.this.mPrintEditModel, MeshHolderFragment.this.mSocleModel);
                } else {
                    MeshHolderFragment.this.mPrintTaskState = LoadTaskState.STATE_FAILED;
                    printMeshLoadingListener.onPrintMeshFailed(MeshHolderFragment.this.mPrintModel, MeshHolderFragment.this.mAltPrintModel, MeshHolderFragment.this.mPrintEditModel, MeshHolderFragment.this.mSocleModel, printMeshLoaderResult.errorType);
                }
                MeshHolderFragment.this.mCurrentComputePrintMeshTask = null;
            }
        };
        this.mCurrentComputePrintMeshTask.executeOnExecutor(this.mExecutor, new Void[0]);
        return true;
    }

    public SphanRenderer createSphanRenderer(@Nullable Context context) {
        if (this.mSphanRenderer == null && context != null) {
            this.mSphanRenderer = new SphanRenderer(context);
        }
        return this.mSphanRenderer;
    }

    public FaceBlender createOrGetFaceBlender() {
        if (this.mFaceBlender == null) {
            this.mFaceBlender = new FaceBlender();
        }
        return this.mFaceBlender;
    }

    public void resetFaceBlender() {
        FaceBlender faceBlender = this.mFaceBlender;
        if (faceBlender != null) {
            faceBlender.reset();
        }
    }

    public float[] getViewerViewMatrix() {
        float[] fArr = this.mViewerViewMatrix;
        if (fArr != null) {
            return (float[]) fArr.clone();
        }
        return null;
    }

    public void setViewerViewMatrix(float[] fArr) {
        this.mViewerViewMatrix = (float[]) fArr.clone();
    }

    public LoadRiggedMeshState loadRiggedMesh() throws AssertionError {
        this.mFileSet = Factory.create(getContext(), this.mUri);
        IFileSet iFileSet = this.mFileSet;
        if (iFileSet != null) {
            String riggedFileUrl = iFileSet.getRiggedFileUrl();
            if (riggedFileUrl == null || TextUtils.isEmpty(riggedFileUrl)) {
                return LoadRiggedMeshState.NOT_LOADED;
            }
            String password = Vault.getPassword(getContext());
            if (this.mSphanRenderer.getMeshCount() < 2) {
                this.mSphanRenderer.load(riggedFileUrl, password);
            }
            return LoadRiggedMeshState.LOADED;
        }
        return LoadRiggedMeshState.FAILED;
    }

    public boolean loadMeshIntoSphan() {
        IFileSet iFileSetCreate = Factory.create(getContext(), this.mUri);
        if (iFileSetCreate == null) {
            return false;
        }
        if (this.mFileSet == null) {
            this.mFileSet = iFileSetCreate;
        }
        return this.mSphanRenderer.load(iFileSetCreate.getZipFileUrl(), Vault.getPassword(getContext()));
    }

    public void setScenography(ScenoID scenoID) {
        this.mScenography = scenoID;
    }

    private void setModelContainer(ModelContainer modelContainer) {
        ModelContainer modelContainer2 = this.mModel;
        if (modelContainer2 != null && modelContainer2 != modelContainer) {
            modelContainer2.release();
        }
        this.mModel = modelContainer;
    }

    public PrintSelection getPendingPrintSelection() {
        return this.mPendingSelection;
    }

    public void resetPendingPrintSelection() {
        this.mPendingSelection = new PrintSelection();
    }

    private void destroy() {
        SphanRenderer sphanRenderer = this.mSphanRenderer;
        if (sphanRenderer != null) {
            sphanRenderer.release();
            this.mSphanRenderer = null;
        }
        FaceBlender faceBlender = this.mFaceBlender;
        if (faceBlender != null) {
            faceBlender.release();
            this.mFaceBlender = null;
        }
        setPrintModel(null);
        setModelContainer(null);
        setAltPrintModel(null);
        setSocleModel(null);
        setPrintEditModel(null);
    }

    public ScenoID getScenography() {
        return this.mScenography;
    }

    public void setUseUntexturedShading(boolean z) {
        this.mUseUntexturedShading = z;
    }

    public boolean usingUntexturedShading() {
        return this.mUseUntexturedShading;
    }

    public void setName(String str) {
        if (str.equals(this.mName)) {
            return;
        }
        FileTasks.updateName(getContext(), this.mUri, str, true);
        HitEvent.RENAME.send(getContext(), 1L);
        setPrintModel(null);
        this.mName = str;
        this.mPrintTaskState = LoadTaskState.STATE_NOT_LOADED;
    }

    public IFileSet getFileSet() {
        return this.mFileSet;
    }

    public void syncFileSet() {
        this.mFileSet = Factory.create(getContext(), this.mUri);
    }

    public void setFileSetChangeRunnable(Runnable runnable) {
        this.mOnChangeRunnable = runnable;
    }

    private static class DbObserverTask extends AsyncTask<Void, Void, IFileSet> {
        private WeakReference<Context> mContext;
        private WeakReference<MeshHolderFragment> mParentRef;
        private Uri mUri;

        DbObserverTask(MeshHolderFragment meshHolderFragment, Activity activity) {
            this.mParentRef = new WeakReference<>(meshHolderFragment);
            this.mContext = new WeakReference<>(activity.getApplicationContext());
            this.mUri = meshHolderFragment.mUri;
        }

        @Override // android.os.AsyncTask
        protected IFileSet doInBackground(Void... voidArr) {
            Context context = this.mContext.get();
            if (context != null) {
                return Factory.create(context, this.mUri);
            }
            return null;
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(IFileSet iFileSet) {
            MeshHolderFragment meshHolderFragment;
            if (iFileSet == null || (meshHolderFragment = this.mParentRef.get()) == null) {
                return;
            }
            meshHolderFragment.mFileSet = iFileSet;
            if (meshHolderFragment.mOnChangeRunnable != null) {
                meshHolderFragment.mOnChangeRunnable.run();
            }
        }
    }

    public void enableFileSetObserver() {
        if (this.mContentObserver == null) {
            this.mContentObserver = new ContentObserver(new Handler(getActivity().getMainLooper())) { // from class: com.sonymobile.scan3d.viewer.MeshHolderFragment.3
                @Override // android.database.ContentObserver
                public void onChange(boolean z, Uri uri) {
                    super.onChange(z, uri);
                    FragmentActivity activity = MeshHolderFragment.this.getActivity();
                    if (activity != null) {
                        new DbObserverTask(MeshHolderFragment.this, activity).execute(new Void[0]);
                    }
                }
            };
        }
        this.mContentResolver = getContext().getContentResolver();
        this.mContentResolver.registerContentObserver(this.mFileSet.getUri(), false, this.mContentObserver);
    }

    public void disableFileSetObserver() {
        ContentResolver contentResolver = this.mContentResolver;
        if (contentResolver != null) {
            contentResolver.unregisterContentObserver(this.mContentObserver);
            this.mContentResolver = null;
        }
    }

    public String getName() {
        String str = this.mName;
        return str == null ? "" : str;
    }

    public String getPath() {
        return this.mPath;
    }

    public int getScanType() {
        ModelContainer modelContainer = this.mModel;
        if (modelContainer != null) {
            return modelContainer.getScanType();
        }
        return 0;
    }

    public int getScanPolicyMode() {
        ModelContainer modelContainer = this.mModel;
        if (modelContainer != null) {
            return modelContainer.getScanPolicyMode();
        }
        return -1;
    }

    public void setTextLimit(int i) {
        this.mTextLimit = i;
    }

    public int getTextLimit() {
        return this.mTextLimit;
    }

    public void setNotLoaded() {
        this.mPrintTaskState = LoadTaskState.STATE_NOT_LOADED;
    }

    public void setPrintModel(ModelContainer modelContainer) {
        ModelContainer modelContainer2 = this.mPrintModel;
        if (modelContainer2 != null && modelContainer2 != modelContainer) {
            modelContainer2.release();
        }
        this.mPrintModel = modelContainer;
        if (modelContainer == null) {
            setNotLoaded();
        }
    }

    private void setPrintEditModel(ModelContainer modelContainer) {
        ModelContainer modelContainer2 = this.mPrintEditModel;
        if (modelContainer2 != null) {
            modelContainer2.release();
        }
        this.mPrintEditModel = modelContainer;
    }

    private void setSocleModel(ModelContainer modelContainer) {
        ModelContainer modelContainer2 = this.mSocleModel;
        if (modelContainer2 != null) {
            modelContainer2.release();
        }
        this.mSocleModel = modelContainer;
    }

    private void setAltPrintModel(ModelContainer modelContainer) {
        ModelContainer modelContainer2 = this.mAltPrintModel;
        if (modelContainer2 != null) {
            modelContainer2.release();
        }
        this.mAltPrintModel = modelContainer;
    }

    public void setPrintEditorSeek(int i) {
        this.mPrintEditorSeek = i;
    }

    public int getPrintEditorSeek() {
        return this.mPrintEditorSeek;
    }

    public void setPrintLoadResult(ComputePrintMeshTask.PrintMeshLoaderResult printMeshLoaderResult) {
        this.mPrevSelection = printMeshLoaderResult.printSelection;
        setPrintModel(printMeshLoaderResult.printContainer);
        setSocleModel(printMeshLoaderResult.socleContainer);
        setAltPrintModel(printMeshLoaderResult.altPrintContainer);
        setPrintEditModel(printMeshLoaderResult.printEditContainer);
        this.mPrintError = printMeshLoaderResult.errorType;
    }
}
