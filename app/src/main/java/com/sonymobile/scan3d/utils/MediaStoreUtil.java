package com.sonymobile.scan3d.utils;

import android.content.ContentValues;
import android.content.Context;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.provider.MediaStore;

import androidx.annotation.NonNull;

import java.io.File;

public final class MediaStoreUtil {
    private static final String MIME_TYPE_MP4 = "video/mp4";

    private MediaStoreUtil() {
    }

    public static Uri insertVideo(Context context, @NonNull File file) {
        ContentValues values = new ContentValues(4);
        values.put("title", file.getName());
        values.put("mime_type", MIME_TYPE_MP4);
        values.put("_data", file.getAbsolutePath());
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(context, Uri.fromFile(file));
            String duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
            values.put("duration", Long.valueOf(Long.parseLong(duration)));
        } catch (Throwable th) {
        }
        try {
            retriever.release();
        } catch (Exception e) {
            // MediaMetadataRetriever.release() only declares "throws IOException" on newer
            // platform API levels (compileSdk 30's android.jar, used by the Gradle build of
            // this same source, does not) -- catch the unchecked-safe Exception supertype so
            // this compiles under both; nothing meaningful to recover here either way.
        }
        return context.getContentResolver().insert(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, values);
    }
}
