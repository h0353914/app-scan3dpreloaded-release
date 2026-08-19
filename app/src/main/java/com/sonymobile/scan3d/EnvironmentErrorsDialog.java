package com.sonymobile.scan3d;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.util.ArrayList;
import java.util.List;

public class EnvironmentErrorsDialog extends DialogFragment {
    private ErrorDialogCallback mCallback;
    private List<EnvironmentError> mErrors = new ArrayList();

    public interface ErrorDialogCallback {
        EnvironmentError[] getErrors();

        void onErrorShown(EnvironmentError environmentError, boolean z);

        void onIgnoreErrors();

        void onRestartScanClicked(boolean z);
    }

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        setCancelable(false);
        Dialog dialog = new Dialog(getActivity(), R.style.SphinxAppCompactDialog);
        dialog.setCanceledOnTouchOutside(false);
        dialog.getWindow().addFlags(8);
        dialog.setOnShowListener(dialogInterface -> {
            getDialog().getWindow().getDecorView().setSystemUiVisibility(getActivity().getWindow().getDecorView().getSystemUiVisibility());
            getDialog().getWindow().clearFlags(8);
        });
        return dialog;
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof ErrorDialogCallback) {
            this.mCallback = (ErrorDialogCallback) context;
            for (EnvironmentError environmentError : this.mCallback.getErrors()) {
                if (environmentError.critical) {
                    this.mErrors.add(environmentError);
                }
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.environment_errors_dialog, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(@NonNull View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        ViewPager viewPager = (ViewPager) view.findViewById(R.id.view_pager);
        ErrorAdapter errorAdapter = new ErrorAdapter(getChildFragmentManager(), this.mErrors, this.mCallback);
        viewPager.setAdapter(errorAdapter);
        if (getContext().getResources().getConfiguration().getLayoutDirection() == 1) {
            viewPager.setCurrentItem(errorAdapter.getCount() - 1);
        }
        view.findViewById(R.id.button_new_scan).setOnClickListener((UserInputReducer.InputReducer) view2 -> {
            this.mCallback.onRestartScanClicked(false);
            dismiss();
        });
        view.findViewById(R.id.button_continue).setOnClickListener((UserInputReducer.InputReducer) view2 -> {
            this.mCallback.onIgnoreErrors();
            dismiss();
        });
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(@NonNull DialogInterface dialogInterface) {
        this.mCallback.onIgnoreErrors();
    }

    private static class ErrorAdapter extends FragmentStatePagerAdapter {
        private ErrorDialogCallback mCallback;
        List<EnvironmentError> mErrors;

        public ErrorAdapter(FragmentManager fragmentManager, List<EnvironmentError> list, ErrorDialogCallback errorDialogCallback) {
            super(fragmentManager, 1);
            this.mCallback = errorDialogCallback;
            this.mErrors = list;
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter
        @NonNull
        public Fragment getItem(int i) {
            Bundle bundle = new Bundle();
            EnvironmentError environmentError = this.mErrors.get(i);
            this.mCallback.onErrorShown(environmentError, true);
            switch (environmentError.type) {
                case TYPE_TOO_DARK:
                    BadLightFragment badLightFragment = new BadLightFragment();
                    bundle.putParcelable("image", environmentError.primaryImage);
                    bundle.putInt("text", R.string.warning_bad_light);
                    badLightFragment.setArguments(bundle);
                    return badLightFragment;
                case TYPE_TOO_BRIGHT:
                    BadLightFragment badLightFragment2 = new BadLightFragment();
                    bundle.putParcelable("image", environmentError.primaryImage);
                    bundle.putInt("text", R.string.warning_too_bright);
                    badLightFragment2.setArguments(bundle);
                    return badLightFragment2;
                case TYPE_UNEVEN_LIGHT:
                    UnevenLightFragment unevenLightFragment = new UnevenLightFragment();
                    bundle.putParcelable("light_image", environmentError.primaryImage);
                    bundle.putParcelable("dark_image", environmentError.secondaryImage);
                    bundle.putInt("text", R.string.warning_uneven_light);
                    unevenLightFragment.setArguments(bundle);
                    return unevenLightFragment;
                case TYPE_LOW_TEXTURE_AREA:
                    BadTextureFragment badTextureFragment = new BadTextureFragment();
                    bundle.putParcelable("image", environmentError.primaryImage);
                    bundle.putInt("text", R.string.warning_low_texture_area);
                    badTextureFragment.setArguments(bundle);
                    return badTextureFragment;
                case TYPE_BAD_LOOP_CLOSURE:
                    BadLoopClosureFragment badLoopClosureFragment = new BadLoopClosureFragment();
                    bundle.putInt("text", R.string.warning_bad_loop_closure);
                    bundle.putParcelable("origin_img", environmentError.primaryImage);
                    bundle.putParcelable("best_img", environmentError.secondaryImage);
                    badLoopClosureFragment.setArguments(bundle);
                    return badLoopClosureFragment;
                default:
                    throw new IllegalStateException("Unknown type");
            }
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getCount() {
            return this.mErrors.size();
        }
    }

    public static class BadLightFragment extends Fragment {
        static final String ARG_IMAGE = "image";
        static final String ARG_TEXT = "text";

        @Override // androidx.fragment.app.Fragment
        @Nullable
        public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View viewInflate = layoutInflater.inflate(R.layout.fragment_environment1picture, viewGroup, false);
            ((ImageView) viewInflate.findViewById(R.id.image)).setImageBitmap((Bitmap) getArguments().getParcelable(ARG_IMAGE));
            ((TextView) viewInflate.findViewById(R.id.message)).setText(getArguments().getInt(ARG_TEXT));
            return viewInflate;
        }
    }

    public static class BadTextureFragment extends Fragment {
        static final String ARG_IMAGE = "image";
        static final String ARG_TEXT = "text";

        @Override // androidx.fragment.app.Fragment
        @Nullable
        public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View viewInflate = layoutInflater.inflate(R.layout.fragment_environment1picture, viewGroup, false);
            ((ImageView) viewInflate.findViewById(R.id.image)).setImageBitmap((Bitmap) getArguments().getParcelable(ARG_IMAGE));
            ((TextView) viewInflate.findViewById(R.id.message)).setText(getArguments().getInt(ARG_TEXT));
            return viewInflate;
        }
    }

    public static class BadLoopClosureFragment extends Fragment {
        static final String ARG_IMAGE_BEST = "best_img";
        static final String ARG_IMAGE_ORIGIN = "origin_img";
        static final String ARG_TEXT = "text";

        @Override // androidx.fragment.app.Fragment
        @Nullable
        public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View viewInflate = layoutInflater.inflate(R.layout.fragment_environment2pictures, viewGroup, false);
            ((ImageView) viewInflate.findViewById(R.id.left_image)).setImageBitmap((Bitmap) getArguments().getParcelable(ARG_IMAGE_ORIGIN));
            ((ImageView) viewInflate.findViewById(R.id.right_image)).setImageBitmap((Bitmap) getArguments().getParcelable(ARG_IMAGE_BEST));
            ((TextView) viewInflate.findViewById(R.id.message)).setText(getArguments().getInt(ARG_TEXT));
            return viewInflate;
        }
    }

    public static class UnevenLightFragment extends Fragment {
        static final String ARG_DARK_IMAGE = "dark_image";
        static final String ARG_LIGHT_IMAGE = "light_image";
        static final String ARG_TEXT = "text";

        @Override // androidx.fragment.app.Fragment
        @Nullable
        public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View viewInflate = layoutInflater.inflate(R.layout.fragment_environment2pictures, viewGroup, false);
            ((ImageView) viewInflate.findViewById(R.id.left_image)).setImageBitmap((Bitmap) getArguments().getParcelable(ARG_LIGHT_IMAGE));
            ((ImageView) viewInflate.findViewById(R.id.right_image)).setImageBitmap((Bitmap) getArguments().getParcelable(ARG_DARK_IMAGE));
            ((TextView) viewInflate.findViewById(R.id.message)).setText(getArguments().getInt(ARG_TEXT));
            return viewInflate;
        }
    }
}
