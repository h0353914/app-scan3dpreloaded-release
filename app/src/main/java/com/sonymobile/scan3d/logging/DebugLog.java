package com.sonymobile.scan3d.logging;

import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class DebugLog {
    private static final boolean DEBUG_ENABLED = true;
    private static final String TAG = "Sculpt3D";

    private DebugLog() {
    }

    private static String addMessage(String tag, String msg) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(tag);
        sb.append("] ");
        sb.append(msg);
        return sb.toString();
    }

    public static void d(String tag, String msg) {
        Log.d(TAG, addMessage(tag, msg));
    }

    public static void d(String tag, String msg, Throwable tr) {
        Log.d(TAG, addMessage(tag, msg), tr);
    }

    public static void e(String tag, String msg) {
        Log.e(TAG, addMessage(tag, msg));
    }

    public static void e(String tag, String msg, Throwable tr) {
        Log.e(TAG, addMessage(tag, msg), tr);
    }

    public static void s(String tag, String msg) {
        s(tag, msg, 5);
    }

    public static void s(String tag, String msg, int depth) {
        Log.d(TAG, addMessage(tag, msg));
        if (depth > 0) {
            StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
            List<Object> elements = Arrays.asList(Arrays.copyOfRange(stackTrace, 3, stackTrace.length));
            ArrayList<Object> list = new ArrayList<>(elements);
            int index = 0;
            for (Object element : list) {
                StackTraceElement traceElement = (StackTraceElement) element;
                index++;
                if (index > depth) {
                    break;
                }
                StringBuilder sb = new StringBuilder();
                sb.append(addMessage(tag, traceElement.getClassName()));
                sb.append(".");
                sb.append(traceElement.getMethodName());
                sb.append(":");
                sb.append(traceElement.getLineNumber());
                Log.d(TAG, sb.toString());
            }
        }
    }

    public static void v(String tag, String msg) {
        Log.v(TAG, addMessage(tag, msg));
    }

    public static void v(String tag, String msg, Throwable tr) {
        Log.v(TAG, addMessage(tag, msg), tr);
    }

    public static void w(String tag, String msg) {
        Log.w(TAG, addMessage(tag, msg));
    }

    public static void w(String tag, String msg, Throwable tr) {
        Log.w(TAG, addMessage(tag, msg), tr);
    }
}
