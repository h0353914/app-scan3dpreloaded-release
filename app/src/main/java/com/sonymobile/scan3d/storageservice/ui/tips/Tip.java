package com.sonymobile.scan3d.storageservice.ui.tips;

import android.content.res.XmlResourceParser;
import android.graphics.Color;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.ColorInt;
import androidx.annotation.DrawableRes;
import androidx.annotation.RawRes;
import androidx.annotation.StringRes;
import com.sonymobile.scan3d.EnvironmentError;
import com.sonymobile.scan3d.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class Tip implements Parcelable {
    private static final String ATTR_ACTION_TIP = "actionOnClick";
    private static final String ATTR_BACKGROUND_COLOR = "backgroundColor";
    private static final String ATTR_DESCRIPTION = "description";
    private static final String ATTR_EXPIRE_DATE = "expire";
    private static final String ATTR_IMAGE = "image";
    private static final String ATTR_IS_REMOVABLE = "removable";
    private static final String ATTR_KEPT_SCAN_ONLY = "keptScanOnly";
    private static final String ATTR_LINK_TEXT = "linkText";
    private static final String ATTR_POSITIVE_ACTION = "dialogPositiveAction";
    private static final String ATTR_POSITIVE_BUTTON = "dialogPositiveButton";
    private static final String ATTR_REQUIRES_GOOGLE_PLAY = "requiresGooglePlay";
    private static final String ATTR_SCAN_POLICY = "scanPolicy";
    private static final String ATTR_SCAN_TYPE = "scanType";
    private static final String ATTR_SHORT_DESCRIPTION = "shortDesc";
    private static final String ATTR_TITLE = "title";
    private static final String ATTR_VIDEO = "video";
    private static final String ATTR_VIDEO_SUBTITLES = "subtitles";
    private static final String ATTR_YOUTUBE_URL = "youtubeUrl";
    public static final Parcelable.Creator<Tip> CREATOR = new Parcelable.Creator<Tip>() { // from class: com.sonymobile.scan3d.storageservice.ui.tips.Tip.1
        @Override // android.os.Parcelable.Creator
        public Tip createFromParcel(Parcel parcel) {
            return new Tip(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public Tip[] newArray(int i) {
            return new Tip[i];
        }
    };
    private static final String DELIMITER = ",";
    public static final int TYPE_DEFAULT = 0;
    public static final int TYPE_IMAGE = 1;
    public static final int TYPE_SEQUENCE = 4;
    public static final int TYPE_VIDEO = 3;
    public static final int TYPE_YOUTUBE = 2;

    @StringRes
    private int mActionOnClick;
    private Video mAdditionalVideo;

    @ColorInt
    private int mBackgroundColor;
    private List<Clip> mClips;

    @StringRes
    private int mDescription;
    private boolean mExcludeable;
    private String mExpiryDate;
    private boolean mGooglePlayRequired;

    @DrawableRes
    private int mImage;
    private boolean mKeptScanOnly;

    @StringRes
    private int mLinkText;
    private int mPositiveAction;

    @StringRes
    private int mPositiveButton;
    private boolean mRemovable;
    private List<Integer> mScanPolicies;
    private List<Integer> mScanTypes;

    @StringRes
    private int mShortDescription;
    private String mTipVideoName;
    private int mTipVideoSubtitles;

    @StringRes
    private int mTitle;
    private String mYoutubeUrl;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public enum Priority {
        LONG_SCAN(R.string.tips_short_long_scan_short_desc, android.R.string.ok),
        SHORT_SCAN(R.string.tips_short_quick_scan_short_desc, android.R.string.ok),
        RESTORE(R.string.tips_short_backup_short_desc, R.string.tips_dialog_button_backup, R.string.tip_dialog_action_turn_on_backup);

        private final int mPositiveAction;
        private final int mPositiveButton;
        private final int mShortDescription;

        Priority(int i, int i2) {
            this(i, i2, 0);
        }

        Priority(int i, int i2, int i3) {
            this.mShortDescription = i;
            this.mPositiveButton = i2;
            this.mPositiveAction = i3;
        }

        public int getShortDescription() {
            return this.mShortDescription;
        }

        public int getPositiveButton() {
            return this.mPositiveButton;
        }

        public int getPositiveAction() {
            return this.mPositiveAction;
        }

        public Tip getAsTip() {
            return Tip.newInstance(this);
        }
    }

    static Tip newInstance(XmlResourceParser xmlResourceParser) {
        Tip tip = new Tip();
        tip.mTitle = xmlResourceParser.getAttributeResourceValue(null, ATTR_TITLE, 0);
        tip.mDescription = xmlResourceParser.getAttributeResourceValue(null, ATTR_DESCRIPTION, 0);
        tip.mLinkText = xmlResourceParser.getAttributeResourceValue(null, ATTR_LINK_TEXT, 0);
        tip.mImage = xmlResourceParser.getAttributeResourceValue(null, ATTR_IMAGE, 0);
        tip.mTipVideoSubtitles = xmlResourceParser.getAttributeResourceValue(null, ATTR_VIDEO_SUBTITLES, 0);
        tip.mTipVideoName = xmlResourceParser.getAttributeValue(null, ATTR_VIDEO);
        tip.mYoutubeUrl = xmlResourceParser.getAttributeValue(null, ATTR_YOUTUBE_URL);
        tip.mShortDescription = xmlResourceParser.getAttributeResourceValue(null, ATTR_SHORT_DESCRIPTION, 0);
        String attributeValue = xmlResourceParser.getAttributeValue(null, ATTR_BACKGROUND_COLOR);
        if (attributeValue != null) {
            tip.mBackgroundColor = Color.parseColor(attributeValue);
        }
        String attributeValue2 = xmlResourceParser.getAttributeValue(null, ATTR_SCAN_TYPE);
        if (attributeValue2 != null) {
            for (String str : attributeValue2.split(",")) {
                tip.mScanTypes.add(Integer.decode(str));
            }
        }
        String attributeValue3 = xmlResourceParser.getAttributeValue(null, ATTR_SCAN_POLICY);
        if (attributeValue3 != null) {
            for (String str2 : attributeValue3.split(",")) {
                tip.mScanPolicies.add(Integer.decode(str2));
            }
        }
        tip.mKeptScanOnly = xmlResourceParser.getAttributeBooleanValue(null, ATTR_KEPT_SCAN_ONLY, false);
        tip.mPositiveAction = xmlResourceParser.getAttributeResourceValue(null, ATTR_POSITIVE_ACTION, 0);
        tip.mPositiveButton = xmlResourceParser.getAttributeResourceValue(null, ATTR_POSITIVE_BUTTON, 0);
        tip.mExpiryDate = xmlResourceParser.getAttributeValue(null, ATTR_EXPIRE_DATE);
        tip.mActionOnClick = xmlResourceParser.getAttributeResourceValue(null, ATTR_ACTION_TIP, 0);
        tip.mGooglePlayRequired = xmlResourceParser.getAttributeBooleanValue(null, ATTR_REQUIRES_GOOGLE_PLAY, false);
        tip.mRemovable = xmlResourceParser.getAttributeBooleanValue(null, ATTR_IS_REMOVABLE, false);
        return tip;
    }

    private static Tip newInstance(Priority priority) {
        Tip tip = new Tip();
        tip.mShortDescription = priority.getShortDescription();
        tip.mPositiveAction = priority.getPositiveAction();
        tip.mPositiveButton = priority.getPositiveButton();
        return tip;
    }

    public static Tip newInstance(EnvironmentError.ErrorType errorType) {
        int i;
        switch (errorType) {
            case TYPE_BAD_LOOP_CLOSURE:
                i = R.string.warning_bad_loop_closure;
                break;
            case TYPE_LOW_TEXTURE_AREA:
                i = R.string.warning_low_texture_area;
                break;
            case TYPE_TOO_BRIGHT:
                i = R.string.warning_too_bright;
                break;
            case TYPE_TOO_DARK:
                i = R.string.warning_bad_light;
                break;
            case TYPE_UNEVEN_LIGHT:
                i = R.string.warning_uneven_light;
                break;
            default:
                throw new RuntimeException("Unknown errors type: " + errorType);
        }
        Tip tip = new Tip();
        tip.mTitle = R.string.dialog_environment_quality_title;
        tip.mShortDescription = i;
        tip.mPositiveAction = 0;
        tip.mPositiveButton = android.R.string.ok;
        tip.mExcludeable = false;
        return tip;
    }

    private Tip() {
        this.mClips = new ArrayList();
        this.mScanTypes = new ArrayList();
        this.mScanPolicies = new ArrayList();
        this.mExcludeable = true;
    }

    private Tip(Parcel parcel) {
        this();
        this.mTitle = parcel.readInt();
        this.mDescription = parcel.readInt();
        this.mBackgroundColor = parcel.readInt();
        this.mImage = parcel.readInt();
        this.mTipVideoSubtitles = parcel.readInt();
        this.mTipVideoName = parcel.readString();
        this.mAdditionalVideo = (Video) parcel.readParcelable(Video.class.getClassLoader());
        this.mYoutubeUrl = parcel.readString();
        parcel.readTypedList(this.mClips, Clip.CREATOR);
        this.mShortDescription = parcel.readInt();
        parcel.readList(this.mScanTypes, List.class.getClassLoader());
        parcel.readList(this.mScanPolicies, List.class.getClassLoader());
        this.mKeptScanOnly = parcel.readInt() == 1;
        this.mPositiveAction = parcel.readInt();
        this.mPositiveButton = parcel.readInt();
        this.mExcludeable = parcel.readInt() == 1;
        this.mExpiryDate = parcel.readString();
        this.mLinkText = parcel.readInt();
        this.mActionOnClick = parcel.readInt();
        this.mGooglePlayRequired = parcel.readInt() == 1;
        this.mRemovable = parcel.readInt() == 1;
    }

    void addClip(Clip clip) {
        this.mClips.add(clip);
    }

    void setAdditionalVideo(Video video) {
        this.mAdditionalVideo = video;
    }

    @ColorInt
    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    @StringRes
    public int getLinkText() {
        return this.mLinkText;
    }

    @StringRes
    public int getActionOnClick() {
        return this.mActionOnClick;
    }

    public String getExpireDate() {
        return this.mExpiryDate;
    }

    public boolean isGooglePlayRequired() {
        return this.mGooglePlayRequired;
    }

    public boolean isRemovable() {
        return this.mRemovable;
    }

    @StringRes
    public int getTitle() {
        return this.mTitle;
    }

    public boolean isExcludeable() {
        return this.mExcludeable;
    }

    @StringRes
    public int getDescription() {
        return this.mDescription;
    }

    @DrawableRes
    public int getImage() {
        return this.mImage;
    }

    public String getVideoName() {
        return this.mTipVideoName;
    }

    @RawRes
    public int getSubtitles() {
        return this.mTipVideoSubtitles;
    }

    public String getYoutubeUrl() {
        return this.mYoutubeUrl;
    }

    public Video getAdditionalVideo() {
        return this.mAdditionalVideo;
    }

    public List<Clip> getClips() {
        return this.mClips;
    }

    public int getType() {
        String str = this.mTipVideoName;
        if (str != null && !str.isEmpty()) {
            return 3;
        }
        if (this.mYoutubeUrl != null) {
            return 2;
        }
        if (this.mImage != 0) {
            return 1;
        }
        return this.mClips.size() > 0 ? 4 : 0;
    }

    public boolean hasTextRepresentations() {
        return (this.mDescription == 0 && this.mTitle == 0) ? false : true;
    }

    @StringRes
    public int getShortDescription() {
        return this.mShortDescription;
    }

    List<Integer> getScanTypes() {
        return this.mScanTypes;
    }

    List<Integer> getScanPolicies() {
        return this.mScanPolicies;
    }

    boolean isForKeptScanOnly() {
        return this.mKeptScanOnly;
    }

    public int getPositiveAction() {
        return this.mPositiveAction;
    }

    @StringRes
    public int getPositiveButton() {
        return this.mPositiveButton;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mTitle);
        parcel.writeInt(this.mDescription);
        parcel.writeInt(this.mBackgroundColor);
        parcel.writeInt(this.mImage);
        parcel.writeInt(this.mTipVideoSubtitles);
        parcel.writeString(this.mTipVideoName);
        parcel.writeParcelable(this.mAdditionalVideo, 0);
        parcel.writeString(this.mYoutubeUrl);
        parcel.writeTypedList(this.mClips);
        parcel.writeInt(this.mShortDescription);
        parcel.writeList(this.mScanTypes);
        parcel.writeList(this.mScanPolicies);
        parcel.writeInt(this.mKeptScanOnly ? 1 : 0);
        parcel.writeInt(this.mPositiveAction);
        parcel.writeInt(this.mPositiveButton);
        parcel.writeInt(this.mExcludeable ? 1 : 0);
        parcel.writeString(this.mExpiryDate);
        parcel.writeInt(this.mLinkText);
        parcel.writeInt(this.mActionOnClick);
        parcel.writeInt(this.mGooglePlayRequired ? 1 : 0);
        parcel.writeInt(this.mRemovable ? 1 : 0);
    }
}
