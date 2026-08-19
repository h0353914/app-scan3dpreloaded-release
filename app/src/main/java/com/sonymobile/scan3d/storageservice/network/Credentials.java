package com.sonymobile.scan3d.storageservice.network;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: classes.dex */
public class Credentials implements Parcelable {
    public static final Parcelable.Creator<Credentials> CREATOR = new Parcelable.Creator<Credentials>() { // from class: com.sonymobile.scan3d.storageservice.network.Credentials.1
        @Override // android.os.Parcelable.Creator
        public Credentials createFromParcel(Parcel parcel) {
            return new Credentials(parcel);
        }
        @Override // android.os.Parcelable.Creator
        public Credentials[] newArray(int i) {
            return new Credentials[i];
        }
    };
    private final String mToken;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public Credentials(String str) {
        this.mToken = str;
    }

    protected Credentials(Parcel parcel) {
        this.mToken = parcel.readString();
    }

    public String getToken() {
        return this.mToken;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mToken);
    }
}
