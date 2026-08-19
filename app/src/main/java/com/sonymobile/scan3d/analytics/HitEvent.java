package com.sonymobile.scan3d.analytics;

import android.content.Context;

public enum HitEvent {
    SHARE_BUTTON_CLICKED("SharingButtonClicked"),
    SHARING_TAB_CLICKED("SharingTabClicked"),
    SHARING_CARD_CLICKED("SharingCardClicked"),
    PRINTING_TEXT_EDIT_CLICKED("PrintingTextEditClicked"),
    PRINTING_MODEL_EDIT_CLICKED("PrintingModelEditClicked"),
    PRINTING_MODEL_EDIT_DONE("PrintingModelEditDone"),
    PRINTING_SOCLE_EDITED("PrintingSocleEdited"),
    PRINTING_EDIT_DONE("PrintingEditDone"),
    GLASS_PRINTING_TEXT_EDIT_CLICKED("GlassPrintingTextEditClicked"),
    GLASS_PRINTING_ROTATION_EDIT_CLICKED("GlassPrintingRotationEditClicked"),
    GLASS_PRINTING_EDIT_DONE("GlassPrintingEditDone"),
    PRINTING_MATERIAL_SELECTED("PrintingMaterialSelected"),
    PRINTING_SIZE_SELECTED("PrintingSizeSelected"),
    PRINTING_SIZE_NOT_SELECTED_WARNING("PrintingSizeNotSelectedWarning"),
    PRINTING_CUSTOMIZATION_DONE("PrintingCustomizationDone"),
    PRINTING_REMOVE_SHADOWS_SHOWED("PrintingRemoveShadowsShowed"),
    PRINTING_REMOVE_SHADOWS_EDITED("PrintingRemoveShadowsEdited"),
    PRINTING_REMOVE_SHADOWS_DONE("PrintingRemoveShadowsDone"),
    PRINTING_PROVIDER_SELECTED("PrintingProviderSelected"),
    PRINTING_PRIVACY_DIALOG_SHOWED("PrintingPrivacyDialogShowed"),
    PRINTING_PRIVACY_ACCEPTED("PrintingPrivacyAccepted"),
    PRINTING_PRIVACY_REJECTED("PrintingPrivacyRejected"),
    PRINTING_UPLOAD_STARTED("PrintingUploadStarted"),
    PRINTING_UPLOAD_FAILED("PrintingUploadFailed"),
    PRINTING_UPLOAD_SUCCEEDED("PrintingUploadSucceeded"),
    DELETE("Delete"),
    RENAME("Rename"),
    EDIT_APPLY("Edit"),
    WALLPAPER("Wallpaper"),
    FIND_MORE_SHARE("Find more plugins in share"),
    FIND_MORE_PRINTING("Find more plugins in printing"),
    VIEW_VIA_WEBVIEWER("View", "Scan3D web viewer"),
    SHARE_VIA_WEBVIEWER("Share", "Scan3D web viewer"),
    UNSHARE_VIA_WEBVIEWER("Unshare", "Scan3D web viewer"),
    SHARE_MESH("Share"),
    SHARE_AS_FILE("Share", "Zip file"),
    ADV_SHARE_AS_FILE("AdvShare", "Advance file sharing"),
    SHARE_FACE_BLEND("Share", "Face blend"),
    SHARE_VIA_FACEBOOK("Share", "Facebook"),
    SHARE_AS_VIDEO("AdvShare", "ShareAsVideo"),
    VIDEO_STARTED("Video started"),
    VIDEO_FINISHED("Video finished"),
    SCAN_COUNT("Scan amount"),
    GALLERY_3D_BUTTON_CLICKED("3D button click"),
    USER_SIGNED_IN("User sign in"),
    USER_SIGNED_OUT("User sign out"),
    IMPROVEMENT_STARTED("ImprovementStarted"),
    IMPROVEMENT_RECEIVED("ImprovementReceived"),
    IMPROVEMENT_KEPT("ImprovementKept"),
    IMPROVEMENT_DISCARDED("ImprovementDiscarded"),
    ANIMATE_MODEL_CLICKED("AnimateModelClicked"),
    PLAY_WITH_ANIMATIONS_CLICKED("PlayWithAnimationsClicked"),
    RIGGING_PROCESS_STARTED("AnimationProcessStarted"),
    RIGGING_PROCESS_COMPLETED("AnimationProcessCompleted"),
    RIGGING_PROCESS_FAILED("AnimationProcessFailed"),
    ANIMATION_SCREEN_ENTERED("AnimationScreenEntered"),
    ANIMATION_SELECTED("AnimationSelected"),
    ANIMATION_SHARE_BUTTON_CLICKED("AnimationShareButtonClicked"),
    ANIMATION_SHARED("AnimationShared");

    private final String mAction;
    private final String mLabel;

    HitEvent(String action) {
        this(action, "");
    }

    HitEvent(String action, String label) {
        mAction = action;
        mLabel = label;
    }

    public void send(Context context) {
        send(context, mLabel, 1L);
    }

    public void send(Context context, long hits) {
        send(context, mLabel, hits);
    }

    public void send(Context context, long hits, int scanPolicy) {
        SBDPUtil.getInstance(context).pushEvent(mAction, mLabel, hits, scanPolicy);
    }

    public void send(Context context, String label) {
        send(context, label, 1L);
    }

    public void send(Context context, String label, long hits) {
        SBDPUtil.getInstance(context).pushEvent(mAction, label, hits);
    }
}
