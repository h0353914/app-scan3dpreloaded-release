package com.sonymobile.scan3d.viewer.sharing;

import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import java.math.BigInteger;

/* JADX INFO: loaded from: classes2.dex */
public class Shareable {
    private static final String KEY_FILESET = "fileset";
    private static final String KEY_IS_TESSELATED = "is_tesselated";
    private static final String KEY_RECIPIENT_CN = "recipient_component_name";
    private static final String KEY_RECIPIENT_REQUIRED = "recipient_required";
    private static final String KEY_RECIPIENT_SP = "recipient_service_provider";
    private static final String KEY_SCANFORMAT = "scanformat";
    private static final String KEY_SHARETYPE = "sharetype";
    private static final String KEY_TEXTURE_SIZE = "texture_size";
    private static final String KEY_URL = "url";
    private static final String KEY_VIEW_MATRIX = "view_matrix";
    private IFileSet mFileSet;
    private boolean mIsTessellated;
    private ComponentName mRecipientComponentName;
    private boolean mRecipientRequired;
    private ServiceProvider mRecipientServiceProvider;
    private int mScanFormat;
    private Type mShareType;
    private int mTextureSize;
    private String mUrl;
    private float[] mViewMatrix;

    public enum Type {
        DEFAULT(1),
        ANIMATION(4),
        PROPS(5);

        private final int mCloudContentType;

        Type(int i) {
            this.mCloudContentType = i;
        }

        public int getCloudContentType() {
            return this.mCloudContentType;
        }
    }

    public Shareable() {
        this.mRecipientRequired = true;
    }

    public Shareable(Bundle bundle) {
        this.mRecipientRequired = true;
        if (bundle != null) {
            this.mFileSet = (IFileSet) bundle.getParcelable(KEY_FILESET);
            this.mUrl = bundle.getString("url");
            this.mScanFormat = bundle.getInt(KEY_SCANFORMAT);
            this.mShareType = (Type) bundle.getSerializable(KEY_SHARETYPE);
            this.mRecipientComponentName = (ComponentName) bundle.getParcelable(KEY_RECIPIENT_CN);
            this.mRecipientServiceProvider = (ServiceProvider) bundle.getSerializable(KEY_RECIPIENT_SP);
            this.mRecipientRequired = bundle.getBoolean(KEY_RECIPIENT_REQUIRED);
            this.mTextureSize = bundle.getInt(KEY_TEXTURE_SIZE);
            this.mIsTessellated = bundle.getBoolean(KEY_IS_TESSELATED);
            this.mViewMatrix = bundle.getFloatArray(KEY_VIEW_MATRIX);
        }
    }

    public int getScanFormat() {
        return this.mScanFormat;
    }

    public String getUrl() {
        return this.mUrl;
    }

    public Type getShareType() {
        return this.mShareType;
    }

    public IFileSet getFileSet() {
        return this.mFileSet;
    }

    public Object getRecipient() {
        ComponentName componentName = this.mRecipientComponentName;
        return componentName != null ? componentName : this.mRecipientServiceProvider;
    }

    public boolean isRecipientRequired() {
        return this.mRecipientRequired;
    }

    public int getTextureSize() {
        return this.mTextureSize;
    }

    public boolean isTessellated() {
        return this.mIsTessellated;
    }

    public float[] getViewMatrix() {
        return (float[]) this.mViewMatrix.clone();
    }

    public boolean isShared() {
        IFileSet iFileSet = this.mFileSet;
        return iFileSet != null && BigInteger.valueOf((long) iFileSet.getSharedMeshes()).testBit(this.mShareType.getCloudContentType());
    }

    public Shareable setFileSet(IFileSet iFileSet) {
        this.mFileSet = iFileSet;
        return this;
    }

    public Shareable setShareType(Type type) {
        this.mShareType = type;
        return this;
    }

    public Shareable setUrl(String str) {
        this.mUrl = str;
        return this;
    }

    public Shareable setScanFormat(int i) {
        this.mScanFormat = i;
        return this;
    }

    public Shareable setRecipient(ComponentName componentName) {
        this.mRecipientComponentName = componentName;
        this.mRecipientServiceProvider = null;
        this.mRecipientRequired = true;
        return this;
    }

    public Shareable setRecipient(ServiceProvider serviceProvider) {
        this.mRecipientServiceProvider = serviceProvider;
        this.mRecipientComponentName = null;
        this.mRecipientRequired = true;
        return this;
    }

    public Shareable setRecipientRequired(boolean z) {
        this.mRecipientRequired = z;
        this.mRecipientServiceProvider = null;
        this.mRecipientComponentName = null;
        return this;
    }

    public Shareable setTextureSize(int i) {
        this.mTextureSize = i;
        return this;
    }

    public Shareable setTessellated(boolean z) {
        this.mIsTessellated = z;
        return this;
    }

    public Shareable setViewMatrix(float[] fArr) {
        if (fArr != null) {
            this.mViewMatrix = (float[]) fArr.clone();
        }
        return this;
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_FILESET, this.mFileSet);
        bundle.putString("url", this.mUrl);
        bundle.putInt(KEY_SCANFORMAT, this.mScanFormat);
        bundle.putSerializable(KEY_SHARETYPE, this.mShareType);
        bundle.putParcelable(KEY_RECIPIENT_CN, this.mRecipientComponentName);
        bundle.putSerializable(KEY_RECIPIENT_SP, this.mRecipientServiceProvider);
        bundle.putBoolean(KEY_RECIPIENT_REQUIRED, this.mRecipientRequired);
        bundle.putInt(KEY_TEXTURE_SIZE, this.mTextureSize);
        bundle.putBoolean(KEY_IS_TESSELATED, this.mIsTessellated);
        bundle.putFloatArray(KEY_VIEW_MATRIX, this.mViewMatrix);
        return bundle;
    }

    public void share(Context context) {
        share(context, null);
    }

    public void share(Context context, Handler handler) {
        if (this.mRecipientServiceProvider != null) {
            if (AnonymousClass1.$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$ServiceProvider[this.mRecipientServiceProvider.ordinal()] != 1) {
                return;
            }
            this.mRecipientServiceProvider.share(context, this.mFileSet, this);
            return;
        }
        switch (this.mScanFormat) {
            case 0:
                FileTasks.shareMesh(context, this.mFileSet, this.mRecipientComponentName, this.mIsTessellated);
                break;
            case 1:
                switch (this.mShareType) {
                    case ANIMATION:
                    case DEFAULT:
                        FileTasks.shareGltfMesh(context, this.mFileSet, this.mRecipientComponentName, this.mTextureSize, handler);
                        break;
                    case PROPS:
                        FileTasks.shareGltfObject(context, this.mFileSet, this.mUrl, this.mRecipientComponentName, this.mTextureSize);
                        break;
                }
                break;
        }
    }

    /* JADX INFO: renamed from: com.sonymobile.scan3d.viewer.sharing.Shareable$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$ServiceProvider;
        static final /* synthetic */ int[] $SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type;

        static {
            $SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type = new int[Type.values().length];
            try {
                $SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type[Type.ANIMATION.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type[Type.DEFAULT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type[Type.PROPS.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$ServiceProvider = new int[ServiceProvider.values().length];
            try {
                $SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$ServiceProvider[ServiceProvider.WEBVIEWER.ordinal()] = 1;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }
}
