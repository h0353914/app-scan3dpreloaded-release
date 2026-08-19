package com.sonymobile.scan3d.storageservice.authentication;

import com.sonymobile.scan3d.BuildConfig;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.LinkUtil;

/* JADX INFO: loaded from: classes.dex */
public final class PrivacyPolicies {
    private PrivacyPolicies() {
    }

    public static PrivacyPolicy getPostProcessPrivacy() {
        PrivacyPolicy privacyPolicy = new PrivacyPolicy();
        privacyPolicy.setTitle(R.string.post_process_privacy_title);
        privacyPolicy.setDescription(R.string.post_process_privacy_description);
        if (LinkUtil.isUSVariant()) {
            privacyPolicy.setDisclaimer(R.string.us_post_process_privacy_disclaimer);
        } else {
            privacyPolicy.setDisclaimer(R.string.post_process_privacy_disclaimer);
        }
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_metadata, R.string.personal_data_item_scanning_metadata);
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_images, R.string.personal_data_item_images);
        return privacyPolicy;
    }

    public static PrivacyPolicy getPostProcessSigninPrivacy() {
        PrivacyPolicy privacyPolicy = new PrivacyPolicy();
        privacyPolicy.setTitle(R.string.sign_in_post_process_title);
        privacyPolicy.setDescription(R.string.sign_in_screen_description);
        if (BuildConfig.FLAVOR.equals("labs")) {
            privacyPolicy.setDisclaimer(R.string.about_dialog_privacy_labs);
        } else if (LinkUtil.isUSVariant()) {
            privacyPolicy.setDisclaimer(R.string.us_about_dialog_privacy);
        } else {
            privacyPolicy.setDisclaimer(R.string.about_dialog_privacy);
        }
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_email, R.string.personal_data_item_email);
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_account, R.string.personal_data_item_account_details);
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_scanned_model, R.string.personal_data_item_face_scan);
        return privacyPolicy;
    }

    static PrivacyPolicy getSigninPrivacy() {
        PrivacyPolicy privacyPolicy = new PrivacyPolicy();
        privacyPolicy.setTitle(R.string.sign_in_screen_title);
        privacyPolicy.setDescription(R.string.sign_in_screen_description);
        if (BuildConfig.FLAVOR.equals("labs")) {
            privacyPolicy.setDisclaimer(R.string.about_dialog_privacy_labs);
            privacyPolicy.addPersonalData(R.drawable.ic_personal_data_metadata, R.string.personal_data_item_scanning_metadata);
            privacyPolicy.addPersonalData(R.drawable.ic_personal_data_images, R.string.personal_data_item_images);
        } else if (LinkUtil.isUSVariant()) {
            privacyPolicy.setDisclaimer(R.string.us_about_dialog_privacy);
        } else {
            privacyPolicy.setDisclaimer(R.string.about_dialog_privacy);
        }
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_email, R.string.personal_data_item_email);
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_account, R.string.personal_data_item_account_details);
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_scanned_model, R.string.personal_data_item_face_scan);
        return privacyPolicy;
    }

    public static PrivacyPolicy getPersonalDataInfoPrivacy() {
        PrivacyPolicy privacyPolicy = new PrivacyPolicy();
        privacyPolicy.setTitle(R.string.personal_data_title);
        privacyPolicy.setDescription(R.string.sign_in_screen_description);
        if (BuildConfig.FLAVOR.equals("labs")) {
            privacyPolicy.setDisclaimer(R.string.about_dialog_privacy_labs);
            privacyPolicy.addPersonalData(R.drawable.ic_personal_data_metadata, R.string.personal_data_item_scanning_metadata);
            privacyPolicy.addPersonalData(R.drawable.ic_personal_data_images, R.string.personal_data_item_images);
        } else if (LinkUtil.isUSVariant()) {
            privacyPolicy.setDisclaimer(R.string.us_about_dialog_privacy);
        } else {
            privacyPolicy.setDisclaimer(R.string.about_dialog_privacy);
        }
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_email, R.string.personal_data_item_email);
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_account, R.string.personal_data_item_account_details);
        privacyPolicy.addPersonalData(R.drawable.ic_personal_data_scanned_model, R.string.personal_data_item_face_scan);
        return privacyPolicy;
    }
}
