package com.sonymobile.scan3d.storageservice.ui.gallery.wizard;

import android.app.Activity;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.view.MotionEvent;
import android.widget.MediaController;
import android.widget.VideoView;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class TipVideoPlayerActivity extends Activity {
    public static final String EXTRA_VIDEO = "extra_video";
    private MediaController mMediaController;
    private MediaController.MediaPlayerControl mMediaPlayerControl = new MediaController.MediaPlayerControl() { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.wizard.TipVideoPlayerActivity.1
        @Override // android.widget.MediaController.MediaPlayerControl
        public boolean canPause() {
            return true;
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public boolean canSeekBackward() {
            return true;
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public boolean canSeekForward() {
            return true;
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public void start() {
            TipVideoPlayerActivity.this.mVideoView.start();
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public void seekTo(int i) {
            TipVideoPlayerActivity.this.mVideoView.seekTo(i);
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public void pause() {
            TipVideoPlayerActivity.this.mVideoView.pause();
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public boolean isPlaying() {
            return TipVideoPlayerActivity.this.mVideoView.isPlaying();
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public int getDuration() {
            return TipVideoPlayerActivity.this.mVideoView.getDuration();
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public int getCurrentPosition() {
            return TipVideoPlayerActivity.this.mVideoView.getCurrentPosition();
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public int getBufferPercentage() {
            return TipVideoPlayerActivity.this.mVideoView.getBufferPercentage();
        }

        @Override // android.widget.MediaController.MediaPlayerControl
        public int getAudioSessionId() {
            return TipVideoPlayerActivity.this.mVideoView.getAudioSessionId();
        }
    };
    private int mVideo;
    private VideoView mVideoView;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_tip_video_player);
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            this.mVideo = extras.getInt(EXTRA_VIDEO, 0);
        }
        this.mVideoView = (VideoView) findViewById(R.id.video);
        this.mVideoView.setVideoURI(Uri.parse("android.resource://" + getPackageName() + "/" + this.mVideo));
        this.mVideoView.setOnCompletionListener(mediaPlayer -> finish());
        this.mMediaController = new MediaController(this);
        this.mMediaController.setMediaPlayer(this.mMediaPlayerControl);
        this.mMediaController.setAnchorView(findViewById(R.id.video_top_layout));
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        this.mVideoView.start();
    }

    @Override // android.app.Activity
    protected void onStop() {
        this.mVideoView.stopPlayback();
        super.onStop();
    }

    @Override // android.app.Activity
    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 1) {
            if (this.mMediaController.isShown()) {
                this.mMediaController.hide();
            } else {
                this.mMediaController.show(0);
            }
        }
        return super.onTouchEvent(motionEvent);
    }
}
