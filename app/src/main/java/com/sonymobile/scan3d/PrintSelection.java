package com.sonymobile.scan3d;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;

import androidx.annotation.NonNull;

import java.util.Arrays;

import com.sonymobile.scan3d.utils.PrintMaterial;
import com.sonymobile.scan3d.utils.PrintSize;

public final class PrintSelection implements Parcelable, Cloneable {
    public static final Parcelable.Creator<PrintSelection> CREATOR = new Parcelable.Creator<PrintSelection>() {
        @Override
        public PrintSelection createFromParcel(Parcel parcel) {
            return new PrintSelection(parcel);
        }

        @Override
        public PrintSelection[] newArray(int size) {
            return new PrintSelection[size];
        }
    };

    private static final double EPSILON = 1.0E-5;

    private static final float[] IDENTITY = {
            1.0f, 0.0f, 0.0f, 0.0f,
            0.0f, 1.0f, 0.0f, 0.0f,
            0.0f, 0.0f, 1.0f, 0.0f,
            0.0f, 0.0f, 0.0f, 1.0f
    };

    public static final String SELECTION_KEY_PARCELABLE = "com.sonymobile.scan3d.extra.PRINT_SELECTION";

    private boolean mAdjustColors;
    private String mInscription;
    private String mMaterial;
    private PrintType mPrintType;
    private float mRemoveShadows;
    private int mScanType;
    private PrintSize mSize;
    private float mSizeConstraintMinDim;
    private String mTextOverride;
    private float mTextSize;
    private float[] mTransform;

    public PrintSelection() {
        mSize = PrintSize.SMALL;
    }

    private PrintSelection(Parcel parcel) {
        mSize = PrintSize.SMALL;
        mMaterial = parcel.readString();
        mSize = PrintSize.valueOf(parcel.readString());
        mRemoveShadows = parcel.readFloat();
        mAdjustColors = parcel.readByte() != 0;
        mPrintType = (PrintType) parcel.readSerializable();
        mTextOverride = parcel.readString();
        mInscription = parcel.readString();
        mTransform = parcel.createFloatArray();
        mScanType = parcel.readInt();
        mSizeConstraintMinDim = parcel.readFloat();
        mTextSize = parcel.readFloat();
    }

    @Override
    public PrintSelection clone() {
        PrintSelection printSelection = new PrintSelection();
        printSelection.mMaterial = mMaterial;
        printSelection.mSize = mSize;
        printSelection.mRemoveShadows = mRemoveShadows;
        printSelection.mAdjustColors = mAdjustColors;
        printSelection.mPrintType = mPrintType;
        printSelection.mTextOverride = mTextOverride;
        printSelection.mInscription = mInscription;
        printSelection.mTransform = (mTransform != null) ? getTransform() : null;
        printSelection.mScanType = mScanType;
        printSelection.mSizeConstraintMinDim = mSizeConstraintMinDim;
        printSelection.mTextSize = mTextSize;
        return printSelection;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public boolean getAdjustColors() {
        return mAdjustColors;
    }

    public String getInscription() {
        return mInscription;
    }

    public PrintMaterial getMaterial() {
        if (mMaterial != null) {
            return PrintMaterial.valueOf(mMaterial);
        }
        return null;
    }

    public float getMetricSize() {
        if (mSize != null) {
            return mSize.getSize();
        }
        return 0;
    }

    public PrintType getPrintType() {
        return mPrintType;
    }

    public float getRemoveShadows() {
        return mRemoveShadows;
    }

    public PrintSize getSize() {
        return mSize;
    }

    public float getSizeConstraintMinDim() {
        return mSizeConstraintMinDim;
    }

    public String getTextOverride() {
        return mTextOverride;
    }

    public float getTextSize() {
        return mTextSize;
    }

    public float[] getTransform() {
        float[] transform = mTransform;
        if (transform == null) {
            transform = IDENTITY;
        }
        return Arrays.copyOf(transform, transform.length);
    }

    public boolean isValid() {
        if (mMaterial != null
                && PrintMaterial.valueOf(mMaterial).getType() != null
                && mPrintType != null) {
            return true;
        }
        return false;
    }

    public boolean matchesSelection(PrintSelection printSelection) {
        if (printSelection != null
                && TextUtils.equals(mMaterial, printSelection.mMaterial)
                && mSize == printSelection.mSize
                && mAdjustColors == printSelection.mAdjustColors
                && Math.abs(mRemoveShadows - printSelection.mRemoveShadows) < EPSILON
                && TextUtils.equals(mTextOverride, printSelection.mTextOverride)
                && mPrintType == printSelection.mPrintType
                && mScanType == printSelection.mScanType
                && Arrays.equals(getTransform(), printSelection.getTransform())
                && TextUtils.equals(mInscription, printSelection.mInscription)
                && Math.abs(mSizeConstraintMinDim - printSelection.mSizeConstraintMinDim) < EPSILON
                && Math.abs(mTextSize - printSelection.mTextSize) < EPSILON) {
            return true;
        }
        return false;
    }

    public void resetTransform() {
        mTransform = null;
    }

    public void setColorAdjustments(boolean adjustColors, float removeShadows) {
        mAdjustColors = adjustColors;
        mRemoveShadows = removeShadows;
    }

    public void setInscription(String inscription) {
        mInscription = inscription;
    }

    public void setMaterial(PrintMaterial material) {
        mMaterial = material.name();
    }

    public void setPrintType(PrintType printType) {
        mPrintType = printType;
    }

    public void setScanType(int scanType) {
        mScanType = scanType;
    }

    public void setSize(PrintSize size) {
        mSize = size;
    }

    public void setSizeConstraintMinDim(float sizeConstraintMinDim) {
        mSizeConstraintMinDim = sizeConstraintMinDim;
    }

    public void setTextOverride(String textOverride) {
        mTextOverride = textOverride;
    }

    public void setTextSize(float textSize) {
        if (textSize < 0) {
            textSize = 0;
        }
        mTextSize = textSize;
    }

    public void setTransform(@NonNull float[] transform) {
        mTransform = Arrays.copyOfRange(transform, 0, transform.length);
    }

    public boolean shouldRecomputeHeight() {
        return mTransform == null;
    }

    @Override
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeString(mMaterial);
        parcel.writeString(mSize.name());
        parcel.writeFloat(mRemoveShadows);
        parcel.writeByte((byte) (mAdjustColors ? 1 : 0));
        parcel.writeSerializable(mPrintType);
        parcel.writeString(mTextOverride);
        parcel.writeString(mInscription);
        parcel.writeFloatArray(mTransform);
        parcel.writeInt(mScanType);
        parcel.writeFloat(mSizeConstraintMinDim);
        parcel.writeFloat(mTextSize);
    }
}
