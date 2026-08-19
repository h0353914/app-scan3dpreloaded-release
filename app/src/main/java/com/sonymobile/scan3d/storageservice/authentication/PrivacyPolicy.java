package com.sonymobile.scan3d.storageservice.authentication;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.DrawableRes;
import androidx.annotation.StringRes;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class PrivacyPolicy implements Parcelable {
    public static final Parcelable.Creator<PrivacyPolicy> CREATOR = new Parcelable.Creator<PrivacyPolicy>() { // from class: com.sonymobile.scan3d.storageservice.authentication.PrivacyPolicy.1
        @Override // android.os.Parcelable.Creator
        public PrivacyPolicy createFromParcel(Parcel parcel) {
            return new PrivacyPolicy(parcel);
        }
        @Override // android.os.Parcelable.Creator
        public PrivacyPolicy[] newArray(int i) {
            return new PrivacyPolicy[i];
        }
    };

    @StringRes
    private int mDescriptionResId;

    @StringRes
    private int mDisclaimerResId;
    private List<PersonalData> mPersonalData;

    @StringRes
    private int mTitleResId;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    static class PersonalData implements Parcelable {
        public static final Parcelable.Creator<PersonalData> CREATOR = new Parcelable.Creator<PersonalData>() { // from class: com.sonymobile.scan3d.storageservice.authentication.PrivacyPolicy.PersonalData.1
            @Override // android.os.Parcelable.Creator
            public PersonalData createFromParcel(Parcel parcel) {
                return new PersonalData(parcel);
            }
            @Override // android.os.Parcelable.Creator
            public PersonalData[] newArray(int i) {
                return new PersonalData[i];
            }
        };

        @DrawableRes
        public final int icon;

        @StringRes
        public final int text;

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        PersonalData(Parcel parcel) {
            this.icon = parcel.readInt();
            this.text = parcel.readInt();
        }

        PersonalData(@DrawableRes int i, @StringRes int i2) {
            this.icon = i;
            this.text = i2;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(this.icon);
            parcel.writeInt(this.text);
        }

        public int hashCode() {
            return Objects.hash(Integer.valueOf(this.icon), Integer.valueOf(this.text));
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PersonalData)) {
                return false;
            }
            PersonalData personalData = (PersonalData) obj;
            return this.icon == personalData.icon && this.text == personalData.text;
        }
    }

    private PrivacyPolicy(Parcel parcel) {
        this();
        this.mTitleResId = parcel.readInt();
        this.mDescriptionResId = parcel.readInt();
        this.mDisclaimerResId = parcel.readInt();
        parcel.readTypedList(this.mPersonalData, PersonalData.CREATOR);
    }

    PrivacyPolicy() {
        this.mPersonalData = new ArrayList();
        this.mPersonalData = new ArrayList();
    }

    void setTitle(@StringRes int i) {
        this.mTitleResId = i;
    }

    void setDescription(@StringRes int i) {
        this.mDescriptionResId = i;
    }

    void setDisclaimer(@StringRes int i) {
        this.mDisclaimerResId = i;
    }

    @StringRes
    int getTitle() {
        return this.mTitleResId;
    }

    @StringRes
    int getDescription() {
        return this.mDescriptionResId;
    }

    void addPersonalData(@DrawableRes int i, @StringRes int i2) {
        this.mPersonalData.add(new PersonalData(i, i2));
    }

    List<PersonalData> getPersonalData() {
        return this.mPersonalData;
    }

    @StringRes
    int getDisclaimer() {
        return this.mDisclaimerResId;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mTitleResId);
        parcel.writeInt(this.mDescriptionResId);
        parcel.writeInt(this.mDisclaimerResId);
        parcel.writeTypedList(this.mPersonalData);
    }
}
