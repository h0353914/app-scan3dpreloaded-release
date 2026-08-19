package com.sonymobile.scan3d.animation;

import android.content.Context;

import androidx.annotation.NonNull;

public enum AnimationResources {
    NONE(null, "animation_face_none"),
    IDLE("Idle", "animation_face_idle"),
    ANGRY("Angry", "animation_face_angry"),
    FROWN("Frown", "animation_face_frown"),
    LAUGH("Laugh", "animation_face_laugh"),
    SAD("Sad", "animation_face_sad"),
    SCARED("Scared", "animation_face_scared"),
    SMILE("Smile", "animation_face_smile"),
    SURPRISED("Surprised", "animation_face_surprised"),
    YAWN("Yawn", "animation_face_yawn"),
    WINK("Wink", "animation_face_wink");

    public static final String TYPE_DRAWABLE = "drawable";
    public static final String TYPE_STRING = "string";

    private final String mAnimationName;
    private final String mResourceName;

    AnimationResources(String animationName, String resourceName) {
        mAnimationName = animationName;
        mResourceName = resourceName;
    }

    public static AnimationResources fromString(Context context, @NonNull String name) {
        AnimationResources result;
        try {
            result = valueOf(name.toUpperCase());
        } catch (NullPointerException | IllegalArgumentException e) {
            result = null;
        }
        if (result != null) {
            if (result.getResource(context, TYPE_STRING, result.mResourceName) > 0
                    && result.getResource(context, TYPE_DRAWABLE, result.mResourceName) > 0) {
                return result;
            }
        }
        return null;
    }

    private int getResource(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    public int getDrawable(Context context) {
        return getResource(context, TYPE_DRAWABLE, mResourceName);
    }

    public int getNameId(Context context) {
        return getResource(context, TYPE_STRING, mResourceName);
    }
}
