package com.sonymobile.scan3d.storageservice.ui.tips;

import android.content.res.XmlResourceParser;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.AnyRes;
import androidx.annotation.StringRes;

/* JADX INFO: loaded from: classes.dex */
public final class Video implements Parcelable {
    private static final String ATTR_SOURCE = "source";
    private static final String ATTR_TEXT = "text";
    private static final String ATTR_URI = "uri";
    public static final Parcelable.Creator<Video> CREATOR = new Parcelable.Creator<Video>() { // from class: com.sonymobile.scan3d.storageservice.ui.tips.Video.1
        @Override // android.os.Parcelable.Creator
        public Video createFromParcel(Parcel parcel) {
            return new Video(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public Video[] newArray(int i) {
            return new Video[i];
        }
    };

    @StringRes
    private int mText;

    @AnyRes
    private int mVideoResourceId;

    @AnyRes
    private int mYoutubeUrlResId;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    static Video newInstance(XmlResourceParser xmlResourceParser, boolean z) {
        Video video = new Video();
        video.mVideoResourceId = xmlResourceParser.getAttributeResourceValue(null, "source", 0);
        video.mText = xmlResourceParser.getAttributeResourceValue(null, ATTR_TEXT, 0);
        if (z) {
            video.mYoutubeUrlResId = xmlResourceParser.getAttributeResourceValue(null, ATTR_URI, 0);
        }
        return video;
    }

    private Video() {
    }

    private Video(Parcel parcel) {
        this.mVideoResourceId = parcel.readInt();
        this.mText = parcel.readInt();
        this.mYoutubeUrlResId = parcel.readInt();
    }

    @AnyRes
    public int getVideoResourceId() {
        return this.mVideoResourceId;
    }

    @AnyRes
    public int getUriResourceId() {
        return this.mYoutubeUrlResId;
    }

    boolean isDisplayable() {
        return (this.mYoutubeUrlResId == 0 && this.mVideoResourceId == 0) ? false : true;
    }

    public int getText() {
        return this.mText;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mVideoResourceId);
        parcel.writeInt(this.mText);
        parcel.writeInt(this.mYoutubeUrlResId);
    }
}
