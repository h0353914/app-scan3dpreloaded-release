package com.sonymobile.scan3d.editor;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toolbar;
import android.widget.ViewSwitcher;

import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;

import com.sonymobile.scan3d.FxAdjustType;
import com.sonymobile.scan3d.FxManagerEffects;
import com.sonymobile.scan3d.FxScaleType;
import com.sonymobile.scan3d.OnBackPressListener;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ScenoID;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import com.sonymobile.scan3d.utils.UserInputReducer.InputReducer;
import com.sonymobile.scan3d.viewer.MeshRenderer;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;
import com.sonymobile.scan3d.viewer.ViewerGLTextureView;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;
import com.sonymobile.scan3d.viewer.asynctasks.SaveModelTask;
import com.sonymobile.scan3d.viewer.fragments.EditNameFragment;
import com.sonymobile.scan3d.widgets.SphinxProgressDialog;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class EditorFragment extends Fragment implements OnBackPressListener, InputReducer,
        YesNoQuestionFragment.OnYesNoListener, OnNameChangedListener, SeekBar.OnSeekBarChangeListener,
        ViewerGLTextureView.SurfaceListener {

    private static final String ARGS_FACE_DETECTED = "param_face_detected";
    private static final String ARGS_MODEL = "param_model";
    private static final String ARGS_NAME = "param_name";
    private static final String DIALOG_TAG = "editor_discard_dialog";
    private static final String EDITOR_PREFERENCE_DISMISSED = "editor_preference_dismissed";
    private static final int ID_CANCEL_EFFECT = 2;
    private static final int ID_CANCEL_PARAM = 3;
    private static final int ID_EXIT = 1;
    private static final String TAG = "EditorFragment";

    private boolean mBeginCalled;
    private ViewGroup mBottomBarAction;
    private ViewGroup mBottomBarCurrent;
    private ViewGroup mBottomBarMain;
    private ViewGroup mBottomBarParameters;
    private ViewGroup mBottomBarSlider;
    private TextView mBottomBarSliderLabel;
    private SeekBar mBottomBarSliderValue;
    private EffectGroup mCurrentEffectGroup;
    private int mCurrentParam;
    private List<EffectGroup> mEffectGroups;
    private FxManager mFxManager;
    private ViewerGLTextureView mGLTextureView;
    private Handler mHandler;
    private boolean mIsChanged;
    private ModelContainer mModel;
    private ModelContainer mModelOrig;
    private List<ViewGroup> mParamIcons;
    private MeshRenderer mRenderer;
    private boolean mUiActionPending;

    public EditorFragment() {
        mHandler = new Handler();
        mUiActionPending = false;
        mBeginCalled = false;
        mEffectGroups = new ArrayList<>();
        mParamIcons = new ArrayList<>();
    }

    public static Fragment newInstance(ModelContainer model, String name, boolean faceDetected) {
        EditorFragment fragment = new EditorFragment();
        Bundle args = new Bundle();
        args.putParcelable(ARGS_MODEL, model);
        args.putString(ARGS_NAME, name);
        args.putBoolean(ARGS_FACE_DETECTED, faceDetected);
        fragment.setArguments(args);
        return fragment;
    }

    private void applyParam() {
        if (!mBeginCalled) {
            return;
        }
        paramClosed();
    }

    private boolean beginUIGLAction() {
        if (mUiActionPending) {
            DebugLog.v(TAG, "beginUIGLAction ignored, mUiActionPending==true!");
            return false;
        }
        mUiActionPending = true;
        return true;
    }

    private void cancelEffectGroup() {
        if (!beginUIGLAction()) {
            return;
        }
        mBeginCalled = false;
        runOnGLThenUIThread(
                () -> mFxManager.end(false),
                () -> {
                    gotoMainView();
                    endUIGLAction();
                });
    }

    private void cancelParam() {
        if (!mBeginCalled) {
            return;
        }
        mFxManager.restoreParams();
        paramClosed();
    }

    private EffectGroup createAdjustEffectsGroup() {
        EffectGroup group = new EffectGroup(R.string.editor_adjust, R.drawable.editor_adjust, 0,
                FxManagerEffects.EFFECT_ADJUST);
        group.add(FxAdjustType.ADJUST_BRIGHTNESS, R.string.editor_adjust_brightness,
                R.drawable.editor_adjust_brightness, true);
        group.add(FxAdjustType.ADJUST_CONTRAST, R.string.editor_adjust_contrast,
                R.drawable.editor_adjust_contrast, true);
        group.add(FxAdjustType.ADJUST_SHADOWS, R.string.editor_adjust_shadows,
                R.drawable.editor_adjust_shadows, true);
        group.add(FxAdjustType.ADJUST_SMOOTH, R.string.editor_adjust_smooth,
                R.drawable.editor_adjust_smooth, true);
        boolean faceDetected = getArguments().getBoolean(ARGS_FACE_DETECTED);
        group.add(FxAdjustType.ADJUST_EYES, R.string.editor_adjust_eyes, R.string.editor_enlarge_eyes,
                R.drawable.editor_adjust_eyes, faceDetected);
        return group;
    }

    private EffectGroup createCropEffectsGroup() {
        return new EffectGroup(R.string.editor_crop, R.drawable.editor_crop, R.string.editor_crop_button,
                FxManagerEffects.EFFECT_CUT);
    }

    private void createMainBottomBar(LayoutInflater inflater, ViewGroup container) {
        for (EffectGroup group : mEffectGroups) {
            TextView item = (TextView) inflater.inflate(R.layout.editor_bottombar_item, container, false);
            item.setCompoundDrawablesWithIntrinsicBounds(0, group.getDrawable(), 0, 0);
            item.setText(group.getText());
            item.setOnClickListener(this);
            item.setTag(R.id.TAG_EDIT_EFFECT_ID, group);
            container.addView(item);
        }
    }

    private EffectGroup createMorphEffectsGroup() {
        EffectGroup group = new EffectGroup(R.string.editor_morph, R.drawable.editor_morph, 0,
                FxManagerEffects.EFFECT_SCALE);
        group.add(FxScaleType.SCALE_ALIEN, R.string.editor_morph_alien, R.drawable.editor_morph_alien, true);
        group.add(FxScaleType.SCALE_BRUTE, R.string.editor_morph_big_chin, R.drawable.editor_morph_bigchin, true);
        group.add(FxScaleType.SCALE_ROUND, R.string.editor_morph_round, R.drawable.editor_morph_round, true);
        group.add(FxScaleType.SCALE_SLIM, R.string.editor_morph_slim, R.drawable.editor_morph_slim, true);
        return group;
    }

    private void endUIGLAction() {
        mUiActionPending = false;
    }

    private void fadeIn(ViewGroup group, boolean enabled) {
        for (int i = 0; i < group.getChildCount(); i++) {
            group.getChildAt(i).setEnabled(enabled);
        }
        group.setVisibility(View.VISIBLE);
        Animation animation = AnimationUtils.loadAnimation(group.getContext(), R.anim.editor_slide_in);
        group.startAnimation(animation);
    }

    private void fadeOut(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            group.getChildAt(i).setEnabled(false);
        }
        group.setVisibility(View.GONE);
        Animation animation = AnimationUtils.loadAnimation(group.getContext(), R.anim.editor_fade_out);
        group.startAnimation(animation);
    }

    private void gotoEffectGroup(EffectGroup effectGroup) {
        if (!beginUIGLAction()) {
            return;
        }
        runOnGLThenUIThread(
                () -> mFxManager.begin(effectGroup.getEffectId()),
                () -> {
                    showBottomBar(loadEffectsBottomBar(effectGroup), true);
                    updateToolbar(effectGroup, false);
                    mBeginCalled = true;
                    endUIGLAction();
                });
    }

    private void gotoMainView() {
        showBottomBar(mBottomBarMain, true);
        updateToolbar(null, false);
        mCurrentEffectGroup = null;
        requestRenderGLTextureView();
    }

    private ViewGroup loadEffectsBottomBar(EffectGroup effectGroup) {
        switch (mFxManager.getType()) {
            case ACTION:
                Button button = mBottomBarAction.findViewById(R.id.btn_action);
                button.setText(effectGroup.getButtonLabel());
                return mBottomBarAction;
            case MULTI:
            case RADIO:
                effectGroup.addParameters();
                return mBottomBarParameters;
            default:
                return null;
        }
    }

    private void paramClosed() {
        updateParamViews();
        updateToolbar(mCurrentEffectGroup, false);
        HitEvent.EDIT_APPLY.send(getContext(), mCurrentEffectGroup.getEffectId().name());
        showBottomBar(mBottomBarParameters, true);
        requestRenderGLTextureView();
    }

    private void requestRenderGLTextureView() {
        if (mGLTextureView.isAttachedToWindow()) {
            mGLTextureView.requestRender();
        }
    }

    private void runOnGLThenUIThread(Runnable glAction, Runnable uiAction) {
        mGLTextureView.queueEvent(() -> {
            glAction.run();
            mHandler.post(uiAction);
        });
    }

    private void saveModel(String name) {
        FragmentActivity activity = getActivity();
        if (activity == null) {
            return;
        }
        if (!beginUIGLAction()) {
            return;
        }
        runOnGLThenUIThread(mFxManager::updateModel, () -> {
            SaveModelTask task = new SaveModelTask(activity, mModel, name) {
                private SphinxProgressDialog dialog;

                @Override
                protected void onPreExecute() {
                    super.onPreExecute();
                    dialog = new SphinxProgressDialog(activity,
                            R.string.editor_saving_model_progress, false);
                    dialog.show();
                }

                @Override
                protected void onPostExecute(Result result) {
                    super.onPostExecute(result);
                    File file = new File(result.path);
                    ITransientFileSet fileSet = Factory.create(activity, result.name, file, null, 0,
                            result.scanType);
                    Uri uri;
                    if (fileSet != null) {
                        uri = activity.getContentResolver().insert(Contract.FileRecord.CONTENT_URI,
                                fileSet.toContentValues());
                    } else {
                        uri = null;
                    }
                    dialog.dismiss();
                    Intent intent = new Intent();
                    intent.setData(uri);
                    activity.setResult(Activity.RESULT_OK, intent);
                    activity.finish();
                    endUIGLAction();
                }
            };
            task.execute();
            mIsChanged = false;
            updateToolbar(null, false);
        });
    }

    private void setNoFaceDetectedMessageVisibility(boolean visible) {
        View root = getView();
        if (root != null) {
            View message = root.findViewById(R.id.no_face_detected);
            message.setVisibility(visible ? View.VISIBLE : View.GONE);
        }
    }

    private void setupOrientation(int orientation) {
        if (orientation == Configuration.ORIENTATION_LANDSCAPE) {
            ((LinearLayout) mBottomBarAction).setHorizontalGravity(Gravity.END);
        } else if (orientation == Configuration.ORIENTATION_PORTRAIT) {
            ((LinearLayout) mBottomBarAction).setHorizontalGravity(Gravity.CENTER_HORIZONTAL);
        }
    }

    private void setupToolbar(View root) {
        Toolbar toolbar = root.findViewById(R.id.toolbar);
        ViewSwitcher toolbarAction = toolbar.findViewById(R.id.toolbar_action);
        toolbarAction.setDisplayedChild(0);
        toolbarAction.setEnabled(false);

        View applyAction = toolbar.findViewById(R.id.apply_action);
        applyAction.setOnClickListener((InputReducer) v -> {
            if (!beginUIGLAction()) {
                return;
            }
            mBeginCalled = false;
            runOnGLThenUIThread(
                    () -> {
                        mIsChanged |= mFxManager.isChanged();
                        mFxManager.end(true);
                    },
                    () -> {
                        gotoMainView();
                        endUIGLAction();
                    });
        });

        View saveAction = toolbar.findViewById(R.id.save_action);
        saveAction.setOnClickListener((InputReducer) v -> {
            FragmentManager fragmentManager = getFragmentManager();
            String name = getArguments().getString(ARGS_NAME);
            EditNameFragment dialog = EditNameFragment.newInstance(name, R.string.dialog_edit_name_title, this);
            dialog.show(fragmentManager, DIALOG_TAG);
        });

        toolbar.setNavigationOnClickListener((InputReducer) v -> {
            if (!onBackPressed()) {
                getActivity().finishAfterTransition();
            }
        });
    }

    private void showBottomBar(ViewGroup bar, boolean enabled) {
        if (mBottomBarCurrent != null) {
            fadeOut(mBottomBarCurrent);
        }
        if (bar != null) {
            fadeIn(bar, enabled);
        }
        mBottomBarCurrent = bar;
    }

    private void showDiscardDialog(int id) {
        FragmentManager fragmentManager = getFragmentManager();
        YesNoQuestionFragment dialog = YesNoQuestionFragment.newInstance(id, 0,
                R.string.editor_dialog_discard_description, R.string.editor_dialog_discard_button_discard,
                R.string.editor_dialog_discard_button_keep, null);
        dialog.setTargetFragment(this, 0);
        dialog.show(fragmentManager, DIALOG_TAG);
    }

    private void showParam(EffectGroup effectGroup, int labelRes, int paramIndex, boolean faceDetected) {
        if (mBeginCalled && mCurrentEffectGroup == effectGroup) {
            mFxManager.saveParams();
            mCurrentParam = paramIndex;
            mBottomBarSliderLabel.setText(labelRes);
            int max = mBottomBarSliderValue.getMax();
            mBottomBarSliderValue.setProgress((int) (max * mFxManager.getParamValue(paramIndex)));
            updateParamFromSeekBar();
            updateToolbar(mCurrentEffectGroup, true);
            setNoFaceDetectedMessageVisibility(!faceDetected);
            showBottomBar(mBottomBarSlider, faceDetected);
        }
    }

    private void updateParamFromSeekBar() {
        float value = (float) mBottomBarSliderValue.getProgress() / mBottomBarSliderValue.getMax();
        mFxManager.setParamValue(mCurrentParam, value);
        requestRenderGLTextureView();
    }

    private void updateParamViews() {
        for (int i = 0; i < mFxManager.getParamCount(); i++) {
            ImageView check = mParamIcons.get(i).findViewById(R.id.check);
            check.setVisibility(mFxManager.isParamChanged(i) ? View.VISIBLE : View.GONE);
        }
    }

    private void updateToolbar(EffectGroup effectGroup, boolean hideSwitcher) {
        Toolbar toolbar = getView().findViewById(R.id.toolbar);
        ViewSwitcher toolbarAction = toolbar.findViewById(R.id.toolbar_action);
        if (effectGroup != null) {
            toolbar.setTitle(effectGroup.getText());
            toolbar.setNavigationIcon(R.drawable.ic_close_24dp);
            toolbar.setNavigationContentDescription(getString(R.string.accessibility_close_button));
            toolbarAction.setDisplayedChild(1);
            toolbarAction.setVisibility(hideSwitcher ? View.GONE : View.VISIBLE);
            toolbar.setBackgroundColor(getResources().getColor(R.color.editor_effects, getActivity().getTheme()));
        } else {
            toolbar.setNavigationIcon(R.drawable.ic_arrow_back_24dp);
            toolbar.setNavigationContentDescription(getString(R.string.accessibility_back_button));
            toolbar.setTitle(R.string.editor_title);
            toolbar.setBackgroundColor(
                    getResources().getColor(R.color.editor_main_actions, getActivity().getTheme()));
            toolbarAction.setEnabled(mIsChanged);
            View saveAction = toolbar.findViewById(R.id.save_action);
            saveAction.setEnabled(mIsChanged);
            toolbarAction.setDisplayedChild(0);
            toolbarAction.setVisibility(View.VISIBLE);
        }
    }

    @Override
    public void doClick(View view) {
        if (mFxManager == null) {
            return;
        }
        EffectGroup effectGroup = (EffectGroup) view.getTag(R.id.TAG_EDIT_EFFECT_ID);
        if (effectGroup != null) {
            mCurrentEffectGroup = effectGroup;
            gotoEffectGroup(mCurrentEffectGroup);
            requestRenderGLTextureView();
        }
    }

    public boolean isUiActionPending() {
        return mUiActionPending;
    }

    @Override
    public boolean onBackPressed() {
        if (mUiActionPending) {
            DebugLog.v(TAG, "onBackPressed ignored, mUiActionPending==true!");
            return true;
        }
        if (mBottomBarCurrent == mBottomBarSlider) {
            setNoFaceDetectedMessageVisibility(false);
            if (mFxManager.isParamChanged(mCurrentParam)) {
                showDiscardDialog(ID_CANCEL_PARAM);
            } else {
                cancelParam();
            }
            return true;
        }
        if (mCurrentEffectGroup != null) {
            if (mFxManager.isChanged()) {
                showDiscardDialog(ID_CANCEL_EFFECT);
            } else {
                cancelEffectGroup();
            }
            return true;
        }
        if (mIsChanged) {
            showDiscardDialog(ID_EXIT);
            return true;
        }
        return false;
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        setupOrientation(newConfig.orientation);
        requestRenderGLTextureView();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mModelOrig = getArguments().getParcelable(ARGS_MODEL);
        mRenderer = new MeshRenderer();
        mEffectGroups.add(createAdjustEffectsGroup());
        mEffectGroups.add(createCropEffectsGroup());
        mEffectGroups.add(createMorphEffectsGroup());
        if (mModelOrig.isEmpty()) {
            Log.e(TAG, "Model is missing, closing activity! (probably process was restarted)");
            getActivity().finish();
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_editor, container, false);

        mGLTextureView = root.findViewById(R.id.glTextureView);
        mGLTextureView.start(mRenderer, ScenoID.SCENO_TEXTURED);
        mGLTextureView.addSurfaceListener(this);

        setupToolbar(root);

        mBottomBarAction = root.findViewById(R.id.bottom_bar_action);
        mBottomBarSlider = root.findViewById(R.id.bottom_bar_slider);
        mBottomBarSliderLabel = mBottomBarSlider.findViewById(R.id.bottom_bar_slider_title);
        mBottomBarSliderValue = mBottomBarSlider.findViewById(R.id.bottom_bar_slider_value);
        mBottomBarSliderValue.setOnSeekBarChangeListener(this);

        View applyButton = mBottomBarSlider.findViewById(R.id.bottom_bar_slider_apply);
        applyButton.setOnClickListener((InputReducer) v -> applyParam());

        View cancelButton = mBottomBarSlider.findViewById(R.id.bottom_bar_slider_cancel);
        cancelButton.setOnClickListener((InputReducer) v -> cancelParam());

        mBottomBarParameters = root.findViewById(R.id.bottom_bar_params);
        mBottomBarMain = root.findViewById(R.id.bottom_bar_main_container);
        createMainBottomBar(inflater, mBottomBarMain);

        View btnAction = mBottomBarAction.findViewById(R.id.btn_action);
        btnAction.setOnClickListener((InputReducer) v -> {
            if (!beginUIGLAction()) {
                return;
            }
            runOnGLThenUIThread(mFxManager::doAction, () -> {
                requestRenderGLTextureView();
                endUIGLAction();
            });
        });

        setupOrientation(getResources().getConfiguration().orientation);

        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        if (!preferences.getBoolean(EDITOR_PREFERENCE_DISMISSED, false)) {
            LinearLayout hints = root.findViewById(R.id.hints);
            hints.setVisibility(View.VISIBLE);
            View gotIt = hints.findViewById(R.id.got_it);
            gotIt.setOnClickListener((InputReducer) v -> {
                preferences.edit().putBoolean(EDITOR_PREFERENCE_DISMISSED, true).apply();
                hints.setVisibility(View.GONE);
            });
        }

        return root;
    }

    @Override
    public void onDestroy() {
        mRenderer.release();
        mRenderer = null;
        super.onDestroy();
    }

    @Override
    public void onNameChanged(String name) {
        saveModel(name);
    }

    @Override
    public void onNegativeAnswer(int id, Parcelable extra) {
    }

    @Override
    public void onPause() {
        super.onPause();
        mGLTextureView.onPause();
    }

    @Override
    public void onPositiveAnswer(int id, Parcelable extra) {
        switch (id) {
            case ID_EXIT:
                getActivity().finishAfterTransition();
                break;
            case ID_CANCEL_EFFECT:
                cancelEffectGroup();
                break;
            case ID_CANCEL_PARAM:
                cancelParam();
                break;
            default:
                throw new RuntimeException("Unknown id " + id);
        }
    }

    @Override
    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
        if (!mBeginCalled) {
            return;
        }
        updateParamFromSeekBar();
    }

    @Override
    public void onResume() {
        super.onResume();
        mGLTextureView.onResume();
    }

    @Override
    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override
    public void onStop() {
        DialogFragment dialog = (DialogFragment) getFragmentManager().findFragmentByTag(DIALOG_TAG);
        if (dialog != null) {
            dialog.dismissAllowingStateLoss();
        }
        super.onStop();
    }

    @Override
    public void onStopTrackingTouch(SeekBar seekBar) {
    }

    @Override
    public void onSurfaceChanged(int width, int height) {
    }

    @Override
    public void onSurfaceCreated() {
        mModel = mModelOrig.copy();
        mFxManager = new FxManager(mModel, mRenderer);
        mHandler.post(this::gotoMainView);
    }

    @Override
    public void onSurfaceDestroyed() {
        if (mFxManager != null) {
            if (mBeginCalled) {
                mFxManager.end(false);
                mBeginCalled = false;
            }
            mRenderer.removeMeshes();
            mFxManager.release();
            mFxManager = null;
            mIsChanged = false;
        }
        if (mModel != null) {
            mModel.release();
            mModel = null;
        }
    }

    class EffectGroup {
        private int mActionButtonLabel;
        private FxManagerEffects mEffectId;
        private List<EffectDescription> mEffects;
        private int mMainDrawable;
        private int mMainText;

        EffectGroup(int mainText, int mainDrawable, int actionButtonLabel, FxManagerEffects effectId) {
            mEffects = new ArrayList<>();
            mMainText = mainText;
            mMainDrawable = mainDrawable;
            mActionButtonLabel = actionButtonLabel;
            mEffectId = effectId;
        }

        private void addParameters() {
            mBottomBarParameters.removeAllViews();
            mParamIcons.clear();
            for (EffectDescription description : mEffects) {
                ViewGroup itemView = (ViewGroup) getActivity().getLayoutInflater()
                        .inflate(R.layout.editor_effectgroup_param, mBottomBarParameters, false);
                itemView.setOnClickListener((InputReducer) v -> showParam(EffectGroup.this,
                        description.longLabel, description.ord, description.enabled));
                TextView label = itemView.findViewById(R.id.label);
                label.setCompoundDrawablesWithIntrinsicBounds(0, description.icon, 0, 0);
                label.setText(description.label);
                ImageView check = itemView.findViewById(R.id.check);
                check.setVisibility(View.GONE);
                mBottomBarParameters.addView(itemView);
                mParamIcons.add(itemView);
            }
        }

        <T extends Enum<T>> void add(T effect, int label, int longLabel, int icon, boolean enabled) {
            mEffects.add(new EffectDescription(effect.ordinal(), label, longLabel, icon, enabled));
        }

        <T extends Enum<T>> void add(T effect, int label, int icon, boolean enabled) {
            add(effect, label, label, icon, enabled);
        }

        int getButtonLabel() {
            return mActionButtonLabel;
        }

        int getDrawable() {
            return mMainDrawable;
        }

        FxManagerEffects getEffectId() {
            return mEffectId;
        }

        int getText() {
            return mMainText;
        }

        class EffectDescription {
            boolean enabled;
            int icon;
            int label;
            int longLabel;
            int ord;

            EffectDescription(int ord, int label, int longLabel, int icon, boolean enabled) {
                this.ord = ord;
                this.label = label;
                this.longLabel = longLabel;
                this.icon = icon;
                this.enabled = enabled;
            }
        }
    }
}
