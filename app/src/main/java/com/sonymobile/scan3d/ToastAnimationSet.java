package com.sonymobile.scan3d;

import android.os.Handler;
import android.view.View;
import android.view.animation.Animation;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ToastAnimationSet {
    List<IAsyncAction> mAnimationQueue;
    private Handler mHandler;
    private boolean mIsRunning;
    private ToastAnimationListener mToastAnimationListener;

    private interface IAsyncAction {
        void execute(ToastAnimationSet toastAnimationSet);
    }

    public interface ToastAnimationListener {
        void onAllAnimationsComplete(ToastAnimationSet toastAnimationSet);

        void onAnimationEnd(View view, Animation animation);

        void onAnimationStart(View view, Animation animation);
    }

    public void cancel() {
        this.mAnimationQueue.clear();
        this.mIsRunning = false;
    }

    public static class Builder {
        List<IAsyncAction> mAnimationQueue = new ArrayList();
        private ToastAnimationListener mListener;

        public void setListener(ToastAnimationListener toastAnimationListener) {
            this.mListener = toastAnimationListener;
        }

        public Builder addAnimation(View view, Animation animation) {
            this.mAnimationQueue.add(new AnimationAction(view, animation));
            return this;
        }

        public Builder addDelay(long j) {
            this.mAnimationQueue.add(new DelayAction(j));
            return this;
        }

        public ToastAnimationSet build() {
            ToastAnimationSet toastAnimationSet = new ToastAnimationSet();
            toastAnimationSet.mAnimationQueue = new ArrayList(this.mAnimationQueue);
            toastAnimationSet.mToastAnimationListener = this.mListener;
            return toastAnimationSet;
        }
    }

    private static class AnimationAction implements IAsyncAction {
        private Animation mAnimation;
        private View mView;

        private AnimationAction(View view, Animation animation) {
            this.mView = view;
            this.mAnimation = animation;
        }

        @Override // com.sonymobile.scan3d.ToastAnimationSet.IAsyncAction
        public void execute(final ToastAnimationSet toastAnimationSet) {
            this.mAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.sonymobile.scan3d.ToastAnimationSet.AnimationAction.1
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                    toastAnimationSet.notifyAnimationStart(AnimationAction.this.mView, AnimationAction.this.mAnimation);
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    animation.setAnimationListener(null);
                    toastAnimationSet.notifyAnimationEnd(AnimationAction.this.mView, AnimationAction.this.mAnimation);
                    toastAnimationSet.handleNext();
                }
            });
            this.mView.startAnimation(this.mAnimation);
        }
    }

    private static class DelayAction implements IAsyncAction {
        private long mDelayMs;

        private DelayAction(long j) {
            this.mDelayMs = j;
        }

        @Override // com.sonymobile.scan3d.ToastAnimationSet.IAsyncAction
        public void execute(ToastAnimationSet toastAnimationSet) {
            Handler handler = toastAnimationSet.mHandler;
            handler.postDelayed(toastAnimationSet::handleNext, this.mDelayMs);
        }
    }

    private ToastAnimationSet() {
        this.mAnimationQueue = new ArrayList();
        this.mIsRunning = false;
    }

    public void execute() {
        if (this.mIsRunning) {
            throw new IllegalStateException("Error: The toast animation set is already executing.");
        }
        this.mHandler = new Handler();
        if (isEmpty()) {
            return;
        }
        this.mIsRunning = true;
        handleNext();
    }

    private void handleNext() {
        if (this.mIsRunning) {
            if (!isEmpty()) {
                this.mAnimationQueue.remove(0).execute(this);
            } else {
                notifyAllAnimationsComplete();
            }
        }
    }

    private void notifyAnimationStart(View view, Animation animation) {
        ToastAnimationListener toastAnimationListener = this.mToastAnimationListener;
        if (toastAnimationListener != null) {
            toastAnimationListener.onAnimationStart(view, animation);
        }
    }

    private void notifyAnimationEnd(View view, Animation animation) {
        ToastAnimationListener toastAnimationListener = this.mToastAnimationListener;
        if (toastAnimationListener != null) {
            toastAnimationListener.onAnimationEnd(view, animation);
        }
    }

    private void notifyAllAnimationsComplete() {
        ToastAnimationListener toastAnimationListener = this.mToastAnimationListener;
        if (toastAnimationListener != null) {
            toastAnimationListener.onAllAnimationsComplete(this);
        }
    }

    private boolean isEmpty() {
        return this.mAnimationQueue.size() == 0;
    }
}
