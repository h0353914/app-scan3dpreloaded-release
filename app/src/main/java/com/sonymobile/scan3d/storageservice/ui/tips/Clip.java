package com.sonymobile.scan3d.storageservice.ui.tips;

import android.content.res.XmlResourceParser;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public final class Clip implements Parcelable {
    private static final String ATTR_LOOP = "loop";
    private static final String ATTR_SOURCE = "source";
    private static final String ATTR_TEXT = "text";
    public static final Parcelable.Creator<Clip> CREATOR = new Parcelable.Creator<Clip>() { // from class: com.sonymobile.scan3d.storageservice.ui.tips.Clip.1
        @Override // android.os.Parcelable.Creator
        public Clip createFromParcel(Parcel parcel) {
            return new Clip(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public Clip[] newArray(int i) {
            return new Clip[i];
        }
    };
    private boolean mLoop;
    private int mSource;
    private String mSourceText;
    private int mText;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    static Clip newInstance(XmlResourceParser xmlResourceParser) {
        Clip clip = new Clip();
        clip.mSourceText = xmlResourceParser.getAttributeValue(null, "source");
        clip.mSource = xmlResourceParser.getAttributeResourceValue(null, "source", 0);
        clip.mText = xmlResourceParser.getAttributeResourceValue(null, ATTR_TEXT, 0);
        clip.mLoop = xmlResourceParser.getAttributeBooleanValue(null, ATTR_LOOP, false);
        return clip;
    }

    private Clip() {
    }

    private Clip(Parcel parcel) {
        this.mSource = parcel.readInt();
        this.mText = parcel.readInt();
        this.mLoop = parcel.readInt() == 1;
        this.mSourceText = parcel.readString();
    }

    public int getSource() {
        return this.mSource;
    }

    public String getSourcePath() {
        return this.mSourceText;
    }

    public int getText() {
        return this.mText;
    }

    public boolean shouldLoop() {
        return this.mLoop;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mSource);
        parcel.writeInt(this.mText);
        parcel.writeInt(this.mLoop ? 1 : 0);
        parcel.writeString(this.mSourceText);
    }
}
