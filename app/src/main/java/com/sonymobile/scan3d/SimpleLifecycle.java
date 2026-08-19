package com.sonymobile.scan3d;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SimpleLifecycle {
    private List<SimpleLifecycleObserver> mObservers = new ArrayList();

    public interface SimpleLifecycleObserver {
        void onStart(SimpleLifecycleOwner simpleLifecycleOwner);

        void onStop(SimpleLifecycleOwner simpleLifecycleOwner);
    }

    public interface SimpleLifecycleOwner {
        SimpleLifecycle getLifecycle();
    }

    public synchronized void addObserver(SimpleLifecycleObserver simpleLifecycleObserver) {
        if (!this.mObservers.contains(simpleLifecycleObserver)) {
            this.mObservers.add(simpleLifecycleObserver);
        }
    }

    public synchronized void removeObserver(SimpleLifecycleObserver simpleLifecycleObserver) {
        this.mObservers.remove(simpleLifecycleObserver);
    }

    public synchronized void onStart(SimpleLifecycleOwner simpleLifecycleOwner) {
        Iterator<SimpleLifecycleObserver> it = this.mObservers.iterator();
        while (it.hasNext()) {
            it.next().onStart(simpleLifecycleOwner);
        }
    }

    public synchronized void onStop(SimpleLifecycleOwner simpleLifecycleOwner) {
        Iterator<SimpleLifecycleObserver> it = this.mObservers.iterator();
        while (it.hasNext()) {
            it.next().onStop(simpleLifecycleOwner);
        }
    }
}
