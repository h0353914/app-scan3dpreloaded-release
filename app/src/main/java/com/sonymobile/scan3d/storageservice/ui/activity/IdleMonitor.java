package com.sonymobile.scan3d.storageservice.ui.activity;

import android.os.Handler;
import android.os.Message;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.function.Predicate;

/* JADX INFO: loaded from: classes.dex */
public class IdleMonitor implements Handler.Callback {
    private static final long DEFAULT_TICK_INTERVAL = 1000;
    private static final int MESSAGE_TICK = 1;
    private final Handler mIdleHandler;
    private final ArrayList<ListenerRegistration> mListenerRegistrations;
    private boolean mMonitorEnabled;
    private final long mTickInterval;
    private int mTicksSinceInteraction;

    public interface OnIdleListener {
        public static final int FINISHED = -1;

        int onIdle(int i, int i2, int i3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    static class ListenerRegistration {
        private int mCount;
        private final int mId;
        private final OnIdleListener mListener;
        private int mNextIdleTickNum;
        private int mTicksPassed;

        ListenerRegistration(int i, OnIdleListener onIdleListener, int i2) {
            this.mId = i;
            this.mListener = onIdleListener;
            this.mNextIdleTickNum = i2;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean conditionalNotifyListener(int i) {
            if (i - this.mTicksPassed != this.mNextIdleTickNum) {
                return false;
            }
            this.mTicksPassed = i;
            OnIdleListener onIdleListener = this.mListener;
            int i2 = this.mId;
            int i3 = this.mCount + 1;
            this.mCount = i3;
            this.mNextIdleTickNum = onIdleListener.onIdle(i2, i, i3);
            return this.mNextIdleTickNum <= 0;
        }

        void reset() {
            this.mTicksPassed = 0;
        }
    }

    public IdleMonitor(long j) {
        this.mIdleHandler = new Handler(this);
        this.mListenerRegistrations = new ArrayList<>();
        this.mTickInterval = j;
        this.mTicksSinceInteraction = 0;
    }

    public IdleMonitor() {
        this(1000L);
    }

    public Handler getIdleHandler() {
        return this.mIdleHandler;
    }

    public int getNumberOfIdleListeners() {
        return this.mListenerRegistrations.size();
    }

    public void addIdleListener(int i, OnIdleListener onIdleListener, int i2) {
        this.mListenerRegistrations.add(new ListenerRegistration(i, onIdleListener, i2));
        if (this.mMonitorEnabled) {
            return;
        }
        this.mMonitorEnabled = true;
        sendTick();
    }

    static /* synthetic */ boolean lambda$removeIdleListener$0(int i, ListenerRegistration listenerRegistration) {
        return listenerRegistration.mId == i;
    }

    public void removeIdleListener(final int i) {
        this.mListenerRegistrations.removeIf(new Predicate() { // from class: com.sonymobile.scan3d.storageservice.ui.activity.-$$Lambda$IdleMonitor$16CTs2_19b6xS_eUOn6tZrtO2g8
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return IdleMonitor.lambda$removeIdleListener$0(i, (IdleMonitor.ListenerRegistration) obj);
            }
        });
    }

    public boolean onIdle(final int i) {
        this.mListenerRegistrations.removeIf(new Predicate() { // from class: com.sonymobile.scan3d.storageservice.ui.activity.-$$Lambda$IdleMonitor$5mHX2ARZV3JMYSJVYjyaLhxgnUU
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return ((IdleMonitor.ListenerRegistration) obj).conditionalNotifyListener(i);
            }
        });
        return this.mMonitorEnabled && this.mListenerRegistrations.size() > 0;
    }

    public void onDestroy() {
        this.mListenerRegistrations.clear();
    }

    public void onResume() {
        if (this.mMonitorEnabled || this.mListenerRegistrations.size() <= 0) {
            return;
        }
        this.mMonitorEnabled = true;
        sendTick();
    }

    public void onPause() {
        reset();
        this.mIdleHandler.removeMessages(1);
        this.mMonitorEnabled = false;
    }

    public void onUserInteraction() {
        reset();
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        if (message.what != 1) {
            return false;
        }
        int i = this.mTicksSinceInteraction + 1;
        this.mTicksSinceInteraction = i;
        if (onIdle(i)) {
            sendTick();
        }
        return true;
    }

    private void sendTick() {
        this.mIdleHandler.sendEmptyMessageDelayed(1, this.mTickInterval);
    }

    private void reset() {
        this.mTicksSinceInteraction = 0;
        Iterator<ListenerRegistration> it = this.mListenerRegistrations.iterator();
        while (it.hasNext()) {
            it.next().reset();
        }
    }
}
