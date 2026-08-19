package com.sonymobile.scan3d.storageservice.ui.tips;

import android.content.res.XmlResourceParser;
import android.os.Parcel;
import android.os.Parcelable;
import com.sonymobile.scan3d.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class TipCategory implements Parcelable {
    private static final String ATTR_ACTION_URL = "actionUrl";
    private static final String ATTR_BG_COLOR = "backgroundColor";
    private static final String ATTR_DESCRIPTION = "description";
    private static final String ATTR_GOOGLE_PLAY = "isGoogleDependant";
    private static final String ATTR_IMAGE = "image";
    private static final String ATTR_IMAGE_SMALL = "imageSmall";
    private static final String ATTR_SCREEN_EVENT = "screenEvent";
    private static final String ATTR_TITLE = "title";
    private static final String ATTR_WIZARD_TYPE = "wizardType";
    public static final Parcelable.Creator<TipCategory> CREATOR = new Parcelable.Creator<TipCategory>() { // from class: com.sonymobile.scan3d.storageservice.ui.tips.TipCategory.1
        @Override // android.os.Parcelable.Creator
        public TipCategory createFromParcel(Parcel parcel) {
            return new TipCategory(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public TipCategory[] newArray(int i) {
            return new TipCategory[i];
        }
    };
    public static final int TYPE_ABOUT_TECHNOLOGY = 0;
    public static final int TYPE_ACTION = 3;
    public static final int TYPE_LIST = 2;
    public static final int TYPE_PAGER = 1;
    private int mActionUrl;
    private int mBackgroundColor;
    private int mDescription;
    private int mImage;
    private int mImageSmall;
    private boolean mIsGoogleDependant;
    private int mScreenEvent;
    private List<Tip> mTips;
    private int mTitle;
    private int mWizardType;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    static TipCategory newInstance(XmlResourceParser xmlResourceParser) {
        TipCategory tipCategory = new TipCategory();
        tipCategory.mTitle = xmlResourceParser.getAttributeResourceValue(null, ATTR_TITLE, 0);
        tipCategory.mDescription = xmlResourceParser.getAttributeResourceValue(null, ATTR_DESCRIPTION, 0);
        tipCategory.mImage = xmlResourceParser.getAttributeResourceValue(null, ATTR_IMAGE, 0);
        tipCategory.mImageSmall = xmlResourceParser.getAttributeResourceValue(null, ATTR_IMAGE_SMALL, 0);
        tipCategory.mBackgroundColor = xmlResourceParser.getAttributeResourceValue(null, ATTR_BG_COLOR, 0);
        tipCategory.mActionUrl = xmlResourceParser.getAttributeResourceValue(null, ATTR_ACTION_URL, 0);
        tipCategory.mScreenEvent = xmlResourceParser.getAttributeResourceValue(null, ATTR_SCREEN_EVENT, 0);
        tipCategory.mWizardType = xmlResourceParser.getAttributeResourceValue(null, ATTR_WIZARD_TYPE, R.string.wizard_type_pager);
        tipCategory.mIsGoogleDependant = xmlResourceParser.getAttributeBooleanValue(null, ATTR_GOOGLE_PLAY, false);
        if (tipCategory.mScreenEvent != 0) {
            return tipCategory;
        }
        throw new IllegalStateException("No screen event set.");
    }

    private TipCategory() {
        this.mTips = new ArrayList();
    }

    private TipCategory(Parcel parcel) {
        this();
        this.mTitle = parcel.readInt();
        this.mDescription = parcel.readInt();
        parcel.readTypedList(this.mTips, Tip.CREATOR);
        this.mImage = parcel.readInt();
        this.mImageSmall = parcel.readInt();
        this.mBackgroundColor = parcel.readInt();
        this.mActionUrl = parcel.readInt();
        this.mScreenEvent = parcel.readInt();
        this.mWizardType = parcel.readInt();
        this.mIsGoogleDependant = parcel.readInt() == 1;
    }

    void addTip(Tip tip) {
        this.mTips.add(tip);
    }

    public int getScreenEvent() {
        return this.mScreenEvent;
    }

    public int getTitle() {
        return this.mTitle;
    }

    public int getDescription() {
        return this.mDescription;
    }

    public List<Tip> getTips() {
        return this.mTips;
    }

    public boolean hasTips() {
        return !this.mTips.isEmpty();
    }

    void revertTips() {
        Collections.reverse(this.mTips);
    }

    public int getImage() {
        return this.mImage;
    }

    public int getImageSmall() {
        return this.mImageSmall;
    }

    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public int getActionUrl() {
        return this.mActionUrl;
    }

    boolean isGoogleDependent() {
        return this.mIsGoogleDependant;
    }

    public int getWizardType() {
        switch (this.mWizardType) {
            case R.string.wizard_type_about_technology /* 2131755923 */:
                return 0;
            case R.string.wizard_type_action /* 2131755924 */:
                return 3;
            case R.string.wizard_type_list /* 2131755925 */:
                return 2;
            default:
                return 1;
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mTitle);
        parcel.writeInt(this.mDescription);
        parcel.writeTypedList(this.mTips);
        parcel.writeInt(this.mImage);
        parcel.writeInt(this.mImageSmall);
        parcel.writeInt(this.mBackgroundColor);
        parcel.writeInt(this.mActionUrl);
        parcel.writeInt(this.mScreenEvent);
        parcel.writeInt(this.mWizardType);
        parcel.writeInt(this.mIsGoogleDependant ? 1 : 0);
    }

    List<Tip> getTipsForScanTypeOrPolicy(int i, int i2) {
        List<Tip> arrayList = new ArrayList<>();
        for (Tip tip : this.mTips) {
            if (tip.getScanTypes().contains(Integer.valueOf(i)) || tip.getScanPolicies().contains(Integer.valueOf(i2))) {
                arrayList.add(tip);
            }
        }
        return arrayList;
    }
}
