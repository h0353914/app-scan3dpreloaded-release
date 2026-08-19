package com.sonymobile.scan3d.animation;

import android.content.Context;
import android.net.Uri;

import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.viewer.SphanRenderer;
import com.sonymobile.scan3d.viewer.asynctasks.RigModelTask;

import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.Queue;
import java.util.Set;

public class RigModelManager implements ObjToGltfConverter.GltfConversionListener {
    private static RigModelManager sRigModelManager;

    private final Queue<RigRequest> mActiveRigRequests;

    private RigModelManager() {
        mActiveRigRequests = new ArrayDeque<>();
    }

    public static RigModelManager getInstance() {
        if (sRigModelManager == null) {
            sRigModelManager = new RigModelManager();
        }
        return sRigModelManager;
    }

    private RigRequest getRigRequest(Uri uri) {
        for (RigRequest request : mActiveRigRequests) {
            if (request.mUri.equals(uri)) {
                return request;
            }
        }
        return null;
    }

    private RigRequest removeRigRequest(Uri uri) {
        for (RigRequest request : mActiveRigRequests) {
            if (request.mUri.equals(uri)) {
                mActiveRigRequests.remove(request);
                return request;
            }
        }
        return null;
    }

    public void addListener(Uri uri, ObjToGltfConverter.GltfConversionListener listener) {
        RigRequest request = getRigRequest(uri);
        if (request != null) {
            request.addListener(listener);
        }
    }

    public boolean isRigging(Uri uri) {
        return getRigRequest(uri) != null;
    }

    @Override
    public void onConversionDone(Uri uri) {
        RigRequest request = removeRigRequest(uri);
        if (request != null && request.mListener != null) {
            request.mListener.forEach(listener -> listener.onConversionDone(uri));
        }
    }

    @Override
    public void onConversionFailed(Uri uri) {
        RigRequest request = removeRigRequest(uri);
        if (request != null && request.mListener != null) {
            request.mListener.forEach(listener -> listener.onConversionFailed(uri));
        }
    }

    public void removeListener(Uri uri, ObjToGltfConverter.GltfConversionListener listener) {
        RigRequest request = getRigRequest(uri);
        if (request != null) {
            request.removeListener(listener);
        }
    }

    public void rigModel(Context context, SphanRenderer renderer, Uri uri, ObjToGltfConverter.GltfConversionListener listener) {
        RigRequest request = getRigRequest(uri);
        if (request == null) {
            HitEvent.RIGGING_PROCESS_STARTED.send(context);
            RigRequest newRequest = new RigRequest(context, renderer, uri, listener);
            mActiveRigRequests.add(newRequest);
            newRequest.rigModel();
        }
    }

    class RigRequest {
        private final Set<ObjToGltfConverter.GltfConversionListener> mListener;
        private RigModelTask mRigModelTask;
        private Uri mUri;

        RigRequest(Context context, SphanRenderer renderer, Uri uri, ObjToGltfConverter.GltfConversionListener listener) {
            mUri = uri;
            mListener = new HashSet<>();
            mListener.add(listener);
            mRigModelTask = new RigModelTask(context, renderer, RigModelManager.this);
        }

        private void addListener(ObjToGltfConverter.GltfConversionListener listener) {
            mListener.add(listener);
        }

        private void removeListener(ObjToGltfConverter.GltfConversionListener listener) {
            mListener.remove(listener);
        }

        private void rigModel() {
            mRigModelTask.execute(mUri);
        }
    }
}
