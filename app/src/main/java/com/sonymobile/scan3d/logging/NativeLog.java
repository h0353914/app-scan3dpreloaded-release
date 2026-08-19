package com.sonymobile.scan3d.logging;

import java.io.PrintWriter;
import java.io.StringWriter;

public final class NativeLog {
    private static final String TAG_JAVA = "JAVA";

    public NativeLog() {
    }

    private static String addMessage(String tag, String msg, Throwable tr) {
        StringBuilder sb = new StringBuilder();
        sb.append("JAVA ");
        sb.append("[");
        sb.append(tag);
        sb.append("] ");
        sb.append(msg);
        if (tr != null) {
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            tr.printStackTrace(printWriter);
            printWriter.flush();
            sb.append(" ");
            sb.append(stringWriter.toString());
        }
        return sb.toString();
    }

    private static native void e(String msg);

    public static void e(String tag, String msg) {
        e(tag, msg, null);
    }

    public static void e(String tag, String msg, Throwable tr) {
        e(addMessage(tag, msg, tr));
    }

    private static native void v(String msg);

    public static void v(String tag, String msg) {
        v(tag, msg, null);
    }

    public static void v(String tag, String msg, Throwable tr) {
        v(addMessage(tag, msg, tr));
    }
}
