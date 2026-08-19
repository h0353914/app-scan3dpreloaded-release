package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.Context;
import android.os.Bundle;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.OnBackPressListener;

/* JADX INFO: loaded from: classes.dex */
public abstract class ListenableFragment<T> extends Fragment implements OnBackPressListener {
    public static final String KEY_ID = "id";
    private int mId;
    private IStatusListener<T> mListener;

    public boolean onBackPressed() {
        return false;
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mId = getArguments().getInt("id");
    }

    @Override // androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        try {
            this.mListener = (IStatusListener) getActivity();
        } catch (ClassCastException unused) {
            throw new ClassCastException(getActivity().toString() + " must implement IStatusListener");
        }
    }

    public void onSuccess(T t) {
        this.mListener.onSuccess(this.mId, t);
    }

    public void onFailure(int i) {
        this.mListener.onFailure(this.mId, i);
    }

    public void onDismiss() {
        this.mListener.onDismiss(this.mId);
    }

    public void onCancel() {
        this.mListener.onCancel(this.mId);
    }
}
