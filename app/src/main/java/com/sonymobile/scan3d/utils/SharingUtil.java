package com.sonymobile.scan3d.utils;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.provider.MediaStore;

import androidx.core.content.FileProvider;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.animation.GLTFExporter;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executors;

public class SharingUtil {
    private static final String ALBUM_VIEW = "com.sonymobile.album.action.VIEW";
    private static final String EXTENSION_JPEG = "jpg";
    private static final String EXTENSION_MP4 = "mp4";
    private static final String FINAL_FILE_NAME = "3DCreator_%s.%s";
    private static final String MIME_TYPE_JPEG = "image/jpeg";
    private static final String MIME_TYPE_MP4 = "video/mp4";
    public static final int NOTIFY_ACTIVITY_STARTED = 2;
    public static final int NOTIFY_SHARE_FAILED = 1;
    public static final int NOTIFY_SHARE_READY = 0;
    public static final String TEMP_VIDEO_FILE_NAME = "sharevideo_temp.mp4";

    private static File createDateStampedFile(String directoryType, String extension) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
        String date = dateFormat.format(new Date());
        File dir = Environment.getExternalStoragePublicDirectory(directoryType);
        String name = String.format(FINAL_FILE_NAME, date, extension);
        return new File(dir, name);
    }

    private static Intent getAlbumViewIntent(Context context, Uri uri, String mimeType) {
        Intent intent = new Intent(ALBUM_VIEW);
        intent.addCategory(Intent.CATEGORY_DEFAULT);
        intent.setDataAndType(uri, mimeType);
        List<ResolveInfo> activities = context.getPackageManager().queryIntentActivities(intent, 0);
        if (activities.isEmpty()) {
            intent = new Intent(Intent.ACTION_VIEW, uri);
        }
        return intent;
    }

    public static File getResizedGLBFile(Context context, IFileSet fileSet, String path, int textureSize) {
        if (fileSet == null) {
            return null;
        }
        GLTFExporter exporter = new GLTFExporter();
        boolean loaded = exporter.load(path);
        File outFile = FsUtils.getShareGlbFile(context, fileSet.getName() + ".glb");
        if (loaded) {
            if (textureSize > 0) {
                exporter.reduceTextureSize(textureSize, textureSize);
            }
            loaded = exporter.save(outFile.getPath());
        }
        return loaded ? outFile : null;
    }

    public static File getRiggedFileForSharing(Context context, IFileSet fileSet, int textureSize) {
        String name = fileSet != null ? fileSet.getName() + ".glb" : "";
        File outFile = FsUtils.getShareGlbFile(context, name);
        boolean saved;
        if (fileSet != null) {
            String password = Vault.getPassword(context);
            GLTFExporter exporter = new GLTFExporter();
            saved = exporter.load(fileSet.getRiggedFileUrl(), password);
            if (saved) {
                if (textureSize > 0) {
                    exporter.reduceTextureSize(textureSize, textureSize);
                }
                saved = exporter.save(outFile.getPath());
            }
        } else {
            saved = false;
        }
        return saved ? outFile : null;
    }

    public static void saveImage(Context context, Handler handler, Bitmap bitmap) {
        SaveImage saveImage = new SaveImage(context, handler, bitmap);
        Executors.newSingleThreadExecutor().submit(saveImage);
    }

    public static void saveVideo(Context context, Handler handler, String source) {
        SaveVideo saveVideo = new SaveVideo(context, handler, source);
        Executors.newSingleThreadExecutor().submit(saveVideo);
    }

    public static void shareRiggedFile(Context context, Handler handler, Uri uri, int textureSize) {
        ShareRiggedFile shareRiggedFile = new ShareRiggedFile(context, handler, uri, textureSize);
        Executors.newSingleThreadExecutor().submit(shareRiggedFile);
    }

    public static void shareStaticFile(Context context, Handler handler, Uri uri) {
        ShareObjFile shareObjFile = new ShareObjFile(context, handler, uri);
        Executors.newSingleThreadExecutor().submit(shareObjFile);
    }

    private static class SaveImage implements Runnable {
        private WeakReference<Context> mContext;
        private Handler mHandler;
        private Bitmap mSource;

        SaveImage(Context context, Handler handler, Bitmap source) {
            mContext = new WeakReference<>(context);
            mHandler = handler;
            mSource = source;
        }

        @Override
        public void run() {
            Context context = mContext.get();
            if (context == null) {
                Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
                return;
            }
            File file = createDateStampedFile(Environment.DIRECTORY_PICTURES, EXTENSION_JPEG);
            try {
                try (FileOutputStream out = new FileOutputStream(file)) {
                    mSource.compress(Bitmap.CompressFormat.JPEG, 75, out);
                    ContentValues values = new ContentValues(3);
                    values.put("title", file.getName());
                    values.put("mime_type", MIME_TYPE_JPEG);
                    values.put("_data", file.getAbsolutePath());
                    Uri uri = context.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
                    if (uri != null) {
                        Intent intent = getAlbumViewIntent(context, uri, MIME_TYPE_JPEG);
                        Message.obtain(mHandler, NOTIFY_SHARE_READY, intent).sendToTarget();
                    } else {
                        Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
                    }
                }
            } catch (IOException e) {
                Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
            }
        }
    }

    private static class SaveVideo implements Runnable {
        private WeakReference<Context> mContext;
        private Handler mHandler;
        private String mSource;

        SaveVideo(Context context, Handler handler, String source) {
            mContext = new WeakReference<>(context);
            mHandler = handler;
            mSource = source;
        }

        @Override
        public void run() {
            Context context = mContext.get();
            if (context == null) {
                Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
                return;
            }
            File srcFile = new File(context.getFilesDir(), mSource);
            File dstFile = createDateStampedFile(Environment.DIRECTORY_MOVIES, EXTENSION_MP4);
            if (FsUtils.moveFile(srcFile, dstFile)) {
                Uri uri = MediaStoreUtil.insertVideo(context, dstFile);
                if (uri != null) {
                    FileTasks.scheduleShareFileDeletion(context);
                    Intent intent = getAlbumViewIntent(context, uri, MIME_TYPE_MP4);
                    Message.obtain(mHandler, NOTIFY_SHARE_READY, intent).sendToTarget();
                } else {
                    Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
                }
            } else {
                Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
            }
        }
    }

    private static class ShareObjFile implements Runnable {
        private WeakReference<Context> mContext;
        private final Handler mHandler;
        private final Uri mUri;

        ShareObjFile(Context context, Handler handler, Uri uri) {
            mContext = new WeakReference<>(context);
            mUri = uri;
            mHandler = handler;
        }

        @Override
        public void run() {
            Context context = mContext.get();
            if (context != null) {
                IFileSet fileSet = Factory.create(context, mUri);
                File zipFile = new File(fileSet.getZipFileUrl());
                File shareFile = FsUtils.getShareFile(context);
                try {
                    Vault.decrypt(context, zipFile, shareFile);
                    String authority = context.getString(R.string.file_provider_authority);
                    Uri uri = FileProvider.getUriForFile(context, authority, shareFile);
                    FileTasks.scheduleShareFileDeletion(context);
                    Message.obtain(mHandler, NOTIFY_SHARE_READY, fileSet.getScanType(), -1, uri).sendToTarget();
                } catch (IOException e) {
                    FsUtils.deleteShareFile(context);
                    Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
                }
            }
        }
    }

    private static class ShareRiggedFile implements Runnable {
        private WeakReference<Context> mContext;
        private final Handler mHandler;
        private final int mTextureSize;
        private final Uri mUri;

        ShareRiggedFile(Context context, Handler handler, Uri uri, int textureSize) {
            mContext = new WeakReference<>(context);
            mHandler = handler;
            mUri = uri;
            mTextureSize = textureSize;
        }

        @Override
        public void run() {
            Context context = mContext.get();
            if (context != null) {
                IFileSet fileSet = Factory.create(context, mUri);
                File file = getRiggedFileForSharing(context, fileSet, mTextureSize);
                if (file != null) {
                    String authority = context.getString(R.string.file_provider_authority);
                    Uri uri = FileProvider.getUriForFile(context, authority, file);
                    FileTasks.scheduleShareFileDeletion(context);
                    Message.obtain(mHandler, NOTIFY_SHARE_READY, fileSet.getScanType(), -1, uri).sendToTarget();
                } else {
                    FsUtils.deleteShareFile(context);
                    Message.obtain(mHandler, NOTIFY_SHARE_FAILED).sendToTarget();
                }
            }
        }
    }
}
