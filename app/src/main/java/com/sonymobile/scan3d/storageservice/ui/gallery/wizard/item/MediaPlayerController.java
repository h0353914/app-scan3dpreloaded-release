package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.media.TimedText;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.view.Surface;
import android.view.TextureView;
import android.widget.TextView;
import androidx.annotation.RawRes;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.utils.ScreenUtil;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes.dex */
public class MediaPlayerController implements TextureView.SurfaceTextureListener, MediaPlayer.OnCompletionListener {
    private static final String ANDROID_RESOURCE_SCHEME = "android.resource://";
    private static final String TAG = "MediaPlayerController";
    protected Context mContext;
    private Executor mExecutor;
    private boolean mIsFullScreenVideo;
    protected boolean mIsMediaPlayerPrepared;
    protected boolean mIsResumed;
    private MediaPlayer mMediaPlayer;
    protected boolean mPageSelected;
    private AsyncTask<Void, Void, Void> mPrepareTask;
    private int mRunningTasks;
    private TextView mSubtitles;
    private Surface mSurface;
    protected boolean mSurfaceAvailable;
    protected boolean mSurfaceSet;
    protected TextureView mTextView;

    public void onCompletion(MediaPlayer mediaPlayer) {
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
    }

    static /* synthetic */ int access$110(MediaPlayerController mediaPlayerController) {
        int i = mediaPlayerController.mRunningTasks;
        mediaPlayerController.mRunningTasks = i - 1;
        return i;
    }

    public void setResumed(boolean z) {
        this.mIsResumed = z;
        onStateChange();
    }

    public void setSurfaceAvailable(boolean z) {
        this.mSurfaceAvailable = z;
        if (this.mSurfaceAvailable && this.mSurface == null) {
            this.mSurface = new Surface(this.mTextView.getSurfaceTexture());
            if (this.mIsFullScreenVideo) {
                ScreenUtil.setAspectRatio(this.mTextView);
            }
        }
        onStateChange();
    }

    private void onStateChange() {
        if (this.mIsMediaPlayerPrepared) {
            if (this.mSurfaceAvailable && !this.mSurfaceSet) {
                this.mSurfaceSet = true;
                this.mMediaPlayer.setSurface(this.mSurface);
            }
            if (this.mIsResumed && this.mSurfaceAvailable && this.mPageSelected) {
                this.mMediaPlayer.start();
                return;
            }
            if (this.mSurfaceAvailable) {
                if (this.mMediaPlayer.isPlaying()) {
                    this.mMediaPlayer.pause();
                }
                this.mMediaPlayer.seekTo(0);
                this.mTextView.invalidate();
                TextView textView = this.mSubtitles;
                if (textView != null) {
                    textView.setVisibility(4);
                }
            }
        }
    }

    public void init(Context context, TextureView textureView, TextView textView, Executor executor, boolean z) {
        this.mContext = context;
        this.mTextView = textureView;
        textureView.setSurfaceTextureListener(this);
        textureView.setScaleX(1.00001f);
        this.mSubtitles = textView;
        this.mExecutor = executor;
        this.mIsFullScreenVideo = z;
    }

    public void setVideoFileResource(final AssetFileDescriptor assetFileDescriptor, @RawRes final int i) {
        this.mIsMediaPlayerPrepared = false;
        this.mRunningTasks++;
        AsyncTask<Void, Void, Void> asyncTask = this.mPrepareTask;
        if (asyncTask != null) {
            asyncTask.cancel(false);
        }
        this.mPrepareTask = new AsyncTask<Void, Void, Void>() { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.MediaPlayerController.1
            @Override // android.os.AsyncTask
            protected Void doInBackground(Void... voidArr) {
                try {
                    if (MediaPlayerController.this.mMediaPlayer == null) {
                        MediaPlayerController.this.mMediaPlayer = new MediaPlayer();
                        MediaPlayerController.this.mMediaPlayer.setOnCompletionListener(MediaPlayerController.this);
                    }
                    MediaPlayerController.this.mMediaPlayer.reset();
                    MediaPlayerController.this.mMediaPlayer.setDataSource(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
                    MediaPlayerController.this.mMediaPlayer.prepare();
                    return null;
                } catch (IOException e) {
                    throw new RuntimeException("Failed to start a video[" + assetFileDescriptor + "] " + e.getMessage());
                }
            }

            @Override // android.os.AsyncTask
            protected void onPostExecute(Void r2) {
                MediaPlayerController mediaPlayerController = MediaPlayerController.this;
                mediaPlayerController.mSurfaceSet = false;
                MediaPlayerController.access$110(mediaPlayerController);
                int i2 = i;
                if (i2 != 0) {
                    MediaPlayerController.this.setSubtitles(i2);
                }
                if (MediaPlayerController.this.mRunningTasks == 0) {
                    MediaPlayerController mediaPlayerController2 = MediaPlayerController.this;
                    mediaPlayerController2.mIsMediaPlayerPrepared = true;
                    mediaPlayerController2.onStateChange();
                }
            }

            @Override // android.os.AsyncTask
            protected void onCancelled(Void r2) {
                MediaPlayerController.access$110(MediaPlayerController.this);
                if (MediaPlayerController.this.mRunningTasks != 0 || MediaPlayerController.this.mMediaPlayer == null) {
                    return;
                }
                MediaPlayerController mediaPlayerController = MediaPlayerController.this;
                mediaPlayerController.mIsMediaPlayerPrepared = true;
                mediaPlayerController.releaseMediaPlayer();
            }
        };
        this.mPrepareTask.executeOnExecutor(this.mExecutor, new Void[0]);
    }

    private void setSubtitles(@RawRes int i) {
        File file = null;
        InputStream inputStream = null;
        try {
            inputStream = this.mContext.getResources().openRawResource(i);
            try {
                file = File.createTempFile("" + i, ".srt");
                try (OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8)) {
                    boolean hasLines = false;
                    try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
                        String line;
                        while ((line = bufferedReader.readLine()) != null) {
                            outputStreamWriter.write(line);
                            outputStreamWriter.write("\n");
                            hasLines = true;
                        }
                    }
                    if (hasLines) {
                        this.mMediaPlayer.setOnTimedTextListener((mediaPlayer, timedText) -> {
                            String text = timedText.getText();
                            if (!TextUtils.isEmpty(text)) {
                                this.mSubtitles.setVisibility(0);
                                this.mSubtitles.setText(text);
                            } else {
                                this.mSubtitles.setVisibility(4);
                            }
                        });
                        this.mMediaPlayer.addTimedTextSource(file.getPath(), "application/x-subrip");
                        MediaPlayer.TrackInfo[] trackInfo = this.mMediaPlayer.getTrackInfo();
                        int j = 0;
                        while (true) {
                            if (j >= trackInfo.length) {
                                break;
                            }
                            if (trackInfo[j].getTrackType() == 3) {
                                this.mMediaPlayer.selectTrack(j);
                                break;
                            }
                            j++;
                        }
                    }
                }
            } catch (Resources.NotFoundException unused) {
                DebugLog.d(TAG, "No subtitles resource found");
            } catch (IOException unused2) {
                DebugLog.d(TAG, "Failed to create subtitles file.");
            }
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException | Resources.NotFoundException unused3) {
                }
            }
        }
        if (file != null && !file.delete()) {
            DebugLog.d(TAG, "Failed to delete temp file.");
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
        setSurfaceAvailable(true);
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        setSurfaceAvailable(false);
        return false;
    }

    public void setPageSelected(boolean z) {
        if (this.mPageSelected == z) {
            return;
        }
        this.mPageSelected = z;
        onStateChange();
    }

    public void release() {
        releaseMediaPlayer();
        Surface surface = this.mSurface;
        if (surface != null) {
            surface.release();
        }
        AsyncTask<Void, Void, Void> asyncTask = this.mPrepareTask;
        if (asyncTask != null) {
            asyncTask.cancel(false);
        }
    }

    private void releaseMediaPlayer() {
        if (this.mIsMediaPlayerPrepared) {
            this.mMediaPlayer.stop();
            this.mMediaPlayer.reset();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
            this.mIsMediaPlayerPrepared = false;
        }
    }
}
