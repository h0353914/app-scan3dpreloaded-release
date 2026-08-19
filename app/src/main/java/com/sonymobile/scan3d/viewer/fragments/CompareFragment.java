package com.sonymobile.scan3d.viewer.fragments;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.ContentValues;
import android.graphics.Point;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ToggleButton;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.CompareImprovedMeshViewer;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;
import com.sonymobile.scan3d.viewer.SplitScreenView;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;

/* JADX INFO: loaded from: classes2.dex */
public class CompareFragment extends ActionGLFragment implements OnNameChangedListener, YesNoQuestionFragment.OnYesNoListener {
    private static final String DIALOG_TAG = "com.sonymobile.scan3d.viewer.fragments.CompareFragment";
    private static final String KEY_ANIMATION_COMPLETED = "KEY_ANIMATION_COMPLETED";
    private static final String KEY_IMPROVEMENT = "KEY_IMPROVEMENTS";
    private static final String KEY_SHOW_IMPROVED = "KEY_SHOW_IMPROVED";
    private static final int QUESTION_DISCARD_IMPROVEMENT_ID = 0;
    private View mBottomBar;
    private CompareImprovedMeshViewer mCompareImprovedMeshViewer;
    private MeshHolderFragment mImprovedMeshHolder;
    private ModelContainer mImprovedModelContainer;
    private IntroAnimation mIntroAnimation;
    private ToggleButton mKnobButton;
    private View mKnobButtonParent;
    private boolean mOriginalMeshFailedToLoad;
    private int mScreenWidth;
    private View mSplitLine;
    private SplitScreenView mSplitScreenView;
    private boolean mShowImproved = true;
    private boolean mAnimationCompleted = false;

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_compare;
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    protected boolean showToolbar() {
        return false;
    }

    public static CompareFragment newInstance(Improvement improvement) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_IMPROVEMENT, improvement);
        CompareFragment compareFragment = new CompareFragment();
        compareFragment.setArguments(bundle);
        return compareFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewStateRestored(Bundle bundle) {
        boolean zIsChecked = this.mKnobButton.isChecked();
        super.onViewStateRestored(bundle);
        this.mKnobButton.setChecked(zIsChecked);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        if (this.mAnimationCompleted) {
            CompareImprovedMeshViewer compareImprovedMeshViewer = this.mCompareImprovedMeshViewer;
            if (compareImprovedMeshViewer != null) {
                compareImprovedMeshViewer.setTextured(this.mKnobButton.isChecked() ? 1.0f : 0.0f);
                requestRenderGLTextureView();
            }
            this.mKnobButtonParent.setVisibility(0);
            this.mBottomBar.setVisibility(0);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        this.mImprovedMeshHolder = this.mMeshHolderFragment;
        this.mMeshHolderFragment = MeshHolderFragment.getInstance(getActivity(), getOriginalUri());
        this.mMeshHolderFragment.setMeshLoadingListener(this);
        if (bundle != null) {
            this.mShowImproved = bundle.getBoolean(KEY_SHOW_IMPROVED, true);
            this.mAnimationCompleted = bundle.getBoolean(KEY_ANIMATION_COMPLETED, false);
        }
        this.mKnobButton = (ToggleButton) viewOnCreateView.findViewById(R.id.texture_knob);
        this.mKnobButtonParent = viewOnCreateView.findViewById(R.id.texture_knob_parent);
        this.mBottomBar = viewOnCreateView.findViewById(R.id.bottom_bar);
        this.mSplitScreenView = (SplitScreenView) viewOnCreateView.findViewById(R.id.split_screen);
        this.mSplitLine = viewOnCreateView.findViewById(R.id.line);
        this.mKnobButtonParent.setOnClickListener((UserInputReducer.InputReducer) view -> {
            ToggleButton toggleButton = this.mKnobButton;
            toggleButton.setChecked(!toggleButton.isChecked());
            this.mCompareImprovedMeshViewer.setTextured(this.mKnobButton.isChecked() ? 0.0f : 1.0f);
            requestRenderGLTextureView();
        });
        WindowManager windowManager = (WindowManager) getContext().getSystemService("window");
        Point point = new Point();
        windowManager.getDefaultDisplay().getSize(point);
        this.mScreenWidth = point.x;
        return viewOnCreateView;
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        IntroAnimation introAnimation = this.mIntroAnimation;
        if (introAnimation != null) {
            introAnimation.cancelAnimation();
        }
        CompareImprovedMeshViewer compareImprovedMeshViewer = this.mCompareImprovedMeshViewer;
        if (compareImprovedMeshViewer != null) {
            compareImprovedMeshViewer.release();
        }
        super.onDestroyView();
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(KEY_SHOW_IMPROVED, this.mShowImproved);
        bundle.putBoolean(KEY_ANIMATION_COMPLETED, this.mAnimationCompleted);
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        if (isAdded()) {
            if (uri.equals(getImprovedUri())) {
                this.mImprovedModelContainer = modelContainer;
            } else {
                this.mModelContainer = modelContainer;
            }
            updateUi();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment, com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
        if (isAdded()) {
            if (getOriginalUri().equals(uri)) {
                this.mOriginalMeshFailedToLoad = true;
                updateUi();
            } else {
                handleFailedMesh();
            }
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.ActionGLFragment
    void setupBottomBar(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        layoutInflater.inflate(R.layout.component_compare_bottom_bar, viewGroup);
        UserInputReducer.InputReducer inputReducer = view -> {
            int id = view.getId();
            if (id == R.id.discard) {
                showDiscardDialog();
            } else {
                if (id != R.id.keep) {
                    return;
                }
                showEditNameDialog();
            }
        };
        viewGroup.findViewById(R.id.keep).setOnClickListener(inputReducer);
        viewGroup.findViewById(R.id.discard).setOnClickListener(inputReducer);
    }

    @Override // com.sonymobile.scan3d.viewer.OnNameChangedListener
    public void onNameChanged(String str) {
        this.mImprovedMeshHolder.setName(str);
        Improvement improvement = (Improvement) getArguments().getParcelable(KEY_IMPROVEMENT);
        FileTasks.delete(getContext(), improvement.getUri());
        ContentValues contentValues = new ContentValues(2);
        contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 0);
        contentValues.put(Contract.FileRecord.COLUMN_IMPROVEMENT, (Boolean) true);
        FileTasks.update(getContext(), improvement.getFileSetUri(), contentValues, true);
        HitEvent.IMPROVEMENT_KEPT.send(getContext(), 1L);
        gotoViewer();
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        FileTasks.deleteImprovement(getContext(), (Improvement) getArguments().getParcelable(KEY_IMPROVEMENT));
        HitEvent.IMPROVEMENT_DISCARDED.send(getContext(), 1L);
        getActivity().finish();
    }

    private void updateUi() {
        if (this.mCompareImprovedMeshViewer == null && isAdded()) {
            if (this.mModelContainer != null && this.mImprovedModelContainer != null) {
                dismissProgressDialog();
                this.mCompareImprovedMeshViewer = new CompareImprovedMeshViewer(this.mModelContainer, this.mImprovedModelContainer, getRenderer());
                requestRenderGLTextureView();
                this.mSplitScreenView.setOnSplitScreenViewListener(f -> {
                    this.mSplitLine.setX(this.mScreenWidth * f);
                    this.mCompareImprovedMeshViewer.setSplitRatio(f);
                    requestRenderGLTextureView();
                });
                this.mSplitScreenView.setVisibility(0);
                this.mSplitLine.setVisibility(0);
                this.mCompareImprovedMeshViewer.setTextured(this.mKnobButton.isChecked() ? 1.0f : 0.0f);
                if (this.mAnimationCompleted) {
                    return;
                }
                this.mIntroAnimation = new IntroAnimation();
                this.mIntroAnimation.startAnimation();
                return;
            }
            if (this.mImprovedModelContainer == null || !this.mOriginalMeshFailedToLoad) {
                return;
            }
            dismissProgressDialog();
            this.mAnimationCompleted = true;
            this.mCompareImprovedMeshViewer = new CompareImprovedMeshViewer(null, this.mImprovedModelContainer, getRenderer());
            this.mCompareImprovedMeshViewer.setTextured(this.mKnobButton.isChecked() ? 1.0f : 0.0f);
            this.mCompareImprovedMeshViewer.setSplitRatio(0.0f);
            requestRenderGLTextureView();
            this.mKnobButtonParent.setVisibility(0);
            this.mBottomBar.setVisibility(0);
        }
    }

    private void showEditNameDialog() {
        Improvement improvement = (Improvement) getArguments().getParcelable(KEY_IMPROVEMENT);
        ScanAddedFragment.newInstance(improvement.getFileSetUri(), this, improvement.getName()).show(getFragmentManager(), DIALOG_TAG);
    }

    private void showDiscardDialog() {
        FragmentManager fragmentManager = getFragmentManager();
        YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(0, R.string.dialog_discard_scan_description, R.string.storage_service_dialog_button_discard_txt);
        yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
        yesNoQuestionFragmentNewInstance.show(fragmentManager, DIALOG_TAG);
    }

    private void gotoViewer() {
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, ViewerFragment.newInstance());
        fragmentTransactionBeginTransaction.commit();
    }

    private Uri getImprovedUri() {
        return ((Improvement) getArguments().getParcelable(KEY_IMPROVEMENT)).getFileSetUri();
    }

    private Uri getOriginalUri() {
        return ((Improvement) getArguments().getParcelable(KEY_IMPROVEMENT)).getParentUri();
    }

    private class IntroAnimation implements Animator.AnimatorListener, ValueAnimator.AnimatorUpdateListener {
        private static final int SPLIT_SCREEN_ANIMATION_DURATION = 2000;
        private static final int TEXTURE_ANIMATION_DURATION = 2000;
        private ValueAnimator mSplitScreenAnimator;
        private ValueAnimator mTextureAnimator;

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animator) {
        }

        private IntroAnimation() {
        }

        public void startAnimation() {
            CompareFragment.this.mCompareImprovedMeshViewer.setTextured(0.0f);
            CompareFragment.this.mSplitScreenView.setEnabled(false);
            this.mSplitScreenAnimator = ValueAnimator.ofFloat(CompareFragment.this.mSplitScreenView.maxSplitScreenRatio(), CompareFragment.this.mSplitScreenView.minSplitScreenRatio());
            this.mSplitScreenAnimator.setDuration(2000L);
            this.mSplitScreenAnimator.addListener(this);
            this.mSplitScreenAnimator.addUpdateListener(this);
            this.mSplitScreenAnimator.start();
        }

        public void cancelAnimation() {
            ValueAnimator valueAnimator = this.mSplitScreenAnimator;
            if (valueAnimator != null) {
                valueAnimator.cancel();
            }
            ValueAnimator valueAnimator2 = this.mTextureAnimator;
            if (valueAnimator2 != null) {
                valueAnimator2.cancel();
            }
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animator) {
            if (animator == this.mTextureAnimator) {
                CompareFragment.this.mKnobButtonParent.setVisibility(0);
                CompareFragment.this.mBottomBar.setVisibility(0);
                CompareFragment.this.mAnimationCompleted = true;
                CompareFragment.this.mSplitScreenView.setEnabled(true);
                return;
            }
            if (animator == this.mSplitScreenAnimator) {
                this.mTextureAnimator = ValueAnimator.ofFloat(0.0f, 1.0f);
                this.mTextureAnimator.setDuration(2000L);
                this.mTextureAnimator.addListener(this);
                this.mTextureAnimator.addUpdateListener(this);
                this.mTextureAnimator.start();
            }
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            if (valueAnimator == this.mTextureAnimator) {
                CompareFragment.this.mCompareImprovedMeshViewer.setTextured(((Float) valueAnimator.getAnimatedValue()).floatValue());
            } else if (valueAnimator == this.mSplitScreenAnimator) {
                CompareFragment.this.mSplitScreenView.setSplitScreenRatio(((Float) valueAnimator.getAnimatedValue()).floatValue());
            }
            CompareFragment.this.requestRenderGLTextureView();
        }
    }
}
