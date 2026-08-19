package com.sonymobile.scan3d.storageservice.provider;

import android.content.Context;
import android.net.Uri;

import com.android.vending.expansion.zipfile.APEZProvider;
import com.sonymobile.scan3d.R;

public class ExpansionProvider extends APEZProvider {
    private static final Uri CONTENT_URI;

    static {
        CONTENT_URI = Uri.parse("content://com.sonymobile.scan3d.expansionprovider");
    }

    public static Uri getExpressionUri(Model model) {
        return Uri.parse(CONTENT_URI + "/" + model.getExpressionFilename());
    }

    public static Uri getModelUri(Model model) {
        return Uri.parse(CONTENT_URI + "/" + model.getModelFileName());
    }

    @Override
    public String getAuthority() {
        Context context = getContext();
        return context.getString(R.string.expansion_provider_authority);
    }

    public enum Model {
        MANGA("manga_model.glb", "manga_expr.lua"),
        MONSTER("monster_model.glb", "monster_expr.lua");

        private String mExpressionFilename;
        private String mModelFilename;

        Model(String modelFilename, String expressionFilename) {
            mModelFilename = modelFilename;
            mExpressionFilename = expressionFilename;
        }

        private String getExpressionFilename() {
            return mExpressionFilename;
        }

        private String getModelFileName() {
            return mModelFilename;
        }
    }
}
