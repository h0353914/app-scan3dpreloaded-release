package com.sonymobile.scan3d;

import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;

/* JADX INFO: loaded from: classes.dex */
public class WindowCallbackProxy implements Window.Callback {
    private Window.Callback mDelegate;

    WindowCallbackProxy(Window.Callback callback) {
        this.mDelegate = callback;
    }

    @Override // android.view.Window.Callback
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int i) {
        return this.mDelegate.onWindowStartingActionMode(callback, i);
    }

    @Override // android.view.Window.Callback
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
        return this.mDelegate.onWindowStartingActionMode(callback);
    }

    @Override // android.view.Window.Callback
    public void onWindowFocusChanged(boolean z) {
        this.mDelegate.onWindowFocusChanged(z);
    }

    @Override // android.view.Window.Callback
    public void onWindowAttributesChanged(WindowManager.LayoutParams layoutParams) {
        this.mDelegate.onWindowAttributesChanged(layoutParams);
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested() {
        return this.mDelegate.onSearchRequested();
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested(SearchEvent searchEvent) {
        return this.mDelegate.onSearchRequested(searchEvent);
    }

    @Override // android.view.Window.Callback
    public boolean onPreparePanel(int i, View view, Menu menu) {
        return this.mDelegate.onPreparePanel(i, view, menu);
    }

    @Override // android.view.Window.Callback
    public void onPanelClosed(int i, Menu menu) {
        this.mDelegate.onPanelClosed(i, menu);
    }

    @Override // android.view.Window.Callback
    public boolean onMenuOpened(int i, Menu menu) {
        return this.mDelegate.onMenuOpened(i, menu);
    }

    @Override // android.view.Window.Callback
    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        return this.mDelegate.onMenuItemSelected(i, menuItem);
    }

    @Override // android.view.Window.Callback
    public void onDetachedFromWindow() {
        this.mDelegate.onDetachedFromWindow();
    }

    @Override // android.view.Window.Callback
    public View onCreatePanelView(int i) {
        return this.mDelegate.onCreatePanelView(i);
    }

    @Override // android.view.Window.Callback
    public boolean onCreatePanelMenu(int i, Menu menu) {
        return this.mDelegate.onCreatePanelMenu(i, menu);
    }

    @Override // android.view.Window.Callback
    public void onContentChanged() {
        this.mDelegate.onContentChanged();
    }

    @Override // android.view.Window.Callback
    public void onAttachedToWindow() {
        this.mDelegate.onAttachedToWindow();
    }

    @Override // android.view.Window.Callback
    public void onActionModeStarted(ActionMode actionMode) {
        this.mDelegate.onActionModeStarted(actionMode);
    }

    @Override // android.view.Window.Callback
    public void onActionModeFinished(ActionMode actionMode) {
        this.mDelegate.onActionModeFinished(actionMode);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTrackballEvent(MotionEvent motionEvent) {
        return this.mDelegate.dispatchTrackballEvent(motionEvent);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        return this.mDelegate.dispatchTouchEvent(motionEvent);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return this.mDelegate.dispatchPopulateAccessibilityEvent(accessibilityEvent);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyShortcutEvent(KeyEvent keyEvent) {
        return this.mDelegate.dispatchKeyShortcutEvent(keyEvent);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return this.mDelegate.dispatchKeyEvent(keyEvent);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchGenericMotionEvent(MotionEvent motionEvent) {
        return this.mDelegate.dispatchGenericMotionEvent(motionEvent);
    }
}
