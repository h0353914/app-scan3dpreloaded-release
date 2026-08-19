package com.sonymobile.scan3d.sharing;

import java.util.Locale;

public class SharingConstants {
    public static final String EXTRA_EXCLUDE_URIS = "com.sonymobile.scan3d.intent.extra.EXCLUDE_URIS";
    public static final String EXTRA_EXPLANATORY_TEXT = "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT";
    public static final String EXTRA_SCAN_TYPE = "com.sonymobile.scan3d.intent.extra.SCAN_TYPE";
    public static final String GLTF_MIME_TYPE = "model/gltf-binary";
    public static final String NO_MIME_TYPE_PREFERRED = "no_mime_type_preferred";
    public static final String OBJ_MIME_TYPE = "application/zip";
    public static final String PICKER_EXTRA_MIME_TYPES = "com.sonymobile.scan3d.intent.extra.MIME_TYPES";
    static final String[] PRIVILEGED_PLUGINS;
    public static final String SCAN_3D_MIME_TYPE = "application/vnd.sony.scan3d";
    public static final String STL_FILE_EXTENSION = "stl";
    public static final String STL_MIME_TYPE = "application/sla";

    static {
        PRIVILEGED_PLUGINS = new String[]{"com.sonymobile.androidapp.cameraaddon.areffect", "com.sonymobile.androidapp.machichara"};
    }

    public enum Category {
        PRINT("print"),
        SHARE("share"),
        GAMING("gaming"),
        MISC("misc");

        public final String name;

        Category(String name) {
            this.name = name;
        }

        public static Category parse(String value) {
            value = value.trim().toLowerCase(Locale.US);
            for (Category category : values()) {
                if (category.name.equals(value)) {
                    return category;
                }
            }
            return null;
        }
    }

    public static class Meta {
        public static final String CATEGORY = "com.sonymobile.scan3d.meta.category";
        public static final String IMAGE = "com.sonymobile.scan3d.meta.image";
        public static final String LABEL = "com.sonymobile.scan3d.meta.label";
        public static final String PREFERRED_MIMETYPE = "com.sonymobile.scan3d.meta.preferred_mimetype";
        public static final String REDUCED_TEXTURE = "com.sonymobile.scan3d.meta.reduced_texture";
        public static final String SCAN_TYPE = "com.sonymobile.scan3d.meta.scan_type";
    }
}
