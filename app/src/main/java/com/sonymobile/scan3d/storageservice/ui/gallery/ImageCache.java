package com.sonymobile.scan3d.storageservice.ui.gallery;

import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.util.LruCache;

/* JADX INFO: loaded from: classes.dex */
public class ImageCache {
    private static final float CACHE_RATIO = 0.4f;
    private static final int KB = 1024;
    private static final int MAX_MEMORY_RATIO = 10;
    private static final float THUMBNAIL_CACHE_RATIO = 0.6f;
    private static final int THUMBNAIL_SCALE_FACTOR = 8;
    private final LruCache<Integer, Bitmap> mCache;
    private boolean mCaching;
    private final LruCache<Integer, Bitmap> mThumbnailCache;

    private class ThumbnailTask extends AsyncTask<Void, Void, Bitmap> {
        private final Bitmap mBitmap;
        private final int mKey;

        ThumbnailTask(int i, Bitmap bitmap) {
            this.mKey = i;
            this.mBitmap = bitmap;
        }

        @Override // android.os.AsyncTask
        protected Bitmap doInBackground(Void... voidArr) {
            int width = Math.round(this.mBitmap.getWidth() / 8.0f);
            int height = Math.round(this.mBitmap.getHeight() / 8.0f);
            return Bitmap.createScaledBitmap(this.mBitmap, width, height, false);
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(Bitmap bitmap) {
            if (bitmap != null) {
                if (ImageCache.this.mCaching) {
                    ImageCache.this.mThumbnailCache.put(Integer.valueOf(this.mKey), bitmap);
                } else {
                    bitmap.recycle();
                }
            }
        }
    }

    public ImageCache() {
        float fMaxMemory = (int) (Runtime.getRuntime().maxMemory() / 10240);
        int iRound = Math.round(CACHE_RATIO * fMaxMemory);
        int iRound2 = Math.round(fMaxMemory * THUMBNAIL_CACHE_RATIO);
        this.mCache = new LruCache<Integer, Bitmap>(iRound) { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.ImageCache.1
            @Override // android.util.LruCache
            protected int sizeOf(Integer num, Bitmap bitmap) {
                return bitmap.getByteCount() / 1024;
            }

            @Override // android.util.LruCache
            protected void entryRemoved(boolean z, Integer num, Bitmap bitmap, Bitmap bitmap2) {
                if (z && ImageCache.this.mCaching && ImageCache.this.mThumbnailCache.get(num) == null) {
                    new ThumbnailTask(num.intValue(), bitmap).execute(new Void[0]);
                }
            }
        };
        this.mThumbnailCache = new LruCache<Integer, Bitmap>(iRound2) { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.ImageCache.2
            @Override // android.util.LruCache
            protected int sizeOf(Integer num, Bitmap bitmap) {
                return bitmap.getByteCount() / 1024;
            }
        };
        this.mCaching = true;
    }

    public void start() {
        this.mCaching = true;
    }

    public void stop() {
        this.mCaching = false;
        this.mCache.evictAll();
        this.mThumbnailCache.evictAll();
    }

    public boolean isCached(String str) {
        return this.mCache.get(Integer.valueOf(str.hashCode())) != null;
    }

    public void add(String str, Bitmap bitmap) {
        this.mCache.put(Integer.valueOf(str.hashCode()), bitmap);
        this.mThumbnailCache.remove(Integer.valueOf(str.hashCode()));
    }

    public Bitmap getBitmap(String str) {
        return this.mCache.get(Integer.valueOf(str.hashCode()));
    }

    public Bitmap getThumbnail(String str) {
        return this.mThumbnailCache.get(Integer.valueOf(str.hashCode()));
    }
}
