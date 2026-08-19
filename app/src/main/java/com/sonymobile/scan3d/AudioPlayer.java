package com.sonymobile.scan3d;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import com.sonymobile.scan3d.logging.DebugLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class AudioPlayer implements MediaPlayer.OnCompletionListener, MediaPlayer.OnPreparedListener, MediaPlayer.OnErrorListener {
    private static final String TAG = "com.sonymobile.scan3d.AudioPlayer";
    private final List<HintPlayer> mActivePlayers = new ArrayList();
    private final Context mContext;

    public AudioPlayer(Context context) {
        this.mContext = context;
    }

    public void stopAll() {
        for (HintPlayer hintPlayer : this.mActivePlayers) {
            hintPlayer.stop();
            hintPlayer.release();
        }
        this.mActivePlayers.clear();
    }

    public void stop(int i) {
        for (HintPlayer hintPlayer : this.mActivePlayers) {
            if (hintPlayer.getId() == i) {
                this.mActivePlayers.remove(hintPlayer);
                hintPlayer.stop();
                hintPlayer.release();
                return;
            }
        }
    }

    public void play(int i, int i2) {
        HintPlayer hintPlayer = new HintPlayer(i);
        try {
            try (AssetFileDescriptor assetFileDescriptor = this.mContext.getResources().openRawResourceFd(i2)) {
                hintPlayer.setDataSource(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
                hintPlayer.setOnPreparedListener(this);
                hintPlayer.setOnCompletionListener(this);
                hintPlayer.setOnErrorListener(this);
                hintPlayer.prepareAsync();
            }
        } catch (IOException e) {
            DebugLog.e(TAG, "Play failed", e);
            hintPlayer.release();
        }
    }

    @Override // android.media.MediaPlayer.OnErrorListener
    public boolean onError(MediaPlayer mediaPlayer, int i, int i2) {
        DebugLog.d(TAG, "Play failed with what=" + i + ", extra=" + i2);
        mediaPlayer.release();
        return false;
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    public void onPrepared(MediaPlayer mediaPlayer) {
        this.mActivePlayers.add((HintPlayer) mediaPlayer);
        mediaPlayer.start();
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mediaPlayer) {
        this.mActivePlayers.remove(mediaPlayer);
        mediaPlayer.release();
    }

    private static class HintPlayer extends MediaPlayer {
        private final int mId;

        public HintPlayer(int i) {
            this.mId = i;
        }

        public int getId() {
            return this.mId;
        }
    }
}
