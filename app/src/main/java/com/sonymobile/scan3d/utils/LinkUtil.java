package com.sonymobile.scan3d.utils;

import android.content.Context;
import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.text.style.URLSpan;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.StringRes;

import java.lang.reflect.Method;

import com.sonymobile.scan3d.logging.DebugLog;

public class LinkUtil {
    private static final String CUSTOMER_ID = "ro.somc.customerid";
    private static final String GET_METHOD_NAME = "get";
    private static final String SW_VARIANT = "ro.semc.version.sw_variant";
    private static final String SYSTEM_PROPERTIES_CLASS_NAME = "android.os.SystemProperties";
    private static final String TAG = "com.sonymobile.scan3d.utils.LinkUtil";
    private static final String US_CUSTOMER_ID1 = "4431";
    private static final String US_CUSTOMER_ID2 = "9055";
    private static final String US_VARIANT = "us";

    public static SpannableStringBuilder createClickableLink(@NonNull Context context, @StringRes int resId,
                                                               UserInputReducer.InputReducer... inputReducerListeners) {
        Object[] args = generateGenericLinkTexts(inputReducerListeners.length);
        return createClickableLink(context, resId, args, inputReducerListeners);
    }

    public static SpannableStringBuilder createClickableLink(@NonNull Context context, @StringRes int resId,
                                                               Object[] args,
                                                               UserInputReducer.InputReducer[] inputReducerListeners) {
        String formatted = String.format(context.getString(resId), args);
        Spanned spanned = Html.fromHtml(formatted, 0);
        SpannableStringBuilder builder = new SpannableStringBuilder(spanned);
        URLSpan[] urlSpans = (URLSpan[]) builder.getSpans(0, spanned.length(), URLSpan.class);
        int listenerIndex = 0;
        for (int i = 0; i < urlSpans.length; i++) {
            URLSpan urlSpan = urlSpans[i];
            if (urlSpan.getURL() != null && urlSpan.getURL().length() > 0
                    && listenerIndex < inputReducerListeners.length) {
                UserInputReducer.InputReducer inputReducerListener = inputReducerListeners[listenerIndex];
                listenerIndex++;
                ClickableSpan clickableSpan = new ClickableSpan() {
                    @Override
                    public void onClick(@NonNull View view) {
                        inputReducerListener.onClick(view);
                    }
                };
                int start = builder.getSpanStart(urlSpan);
                int end = builder.getSpanEnd(urlSpan);
                int flags = builder.getSpanFlags(urlSpan);
                builder.setSpan(clickableSpan, start, end, flags);
            }
            builder.removeSpan(urlSpan);
        }
        return builder;
    }

    private static Object[] generateGenericLinkTexts(int count) {
        String[] result = new String[count];
        for (int i = 0; i < count; i++) {
            result[i] = "linktext" + i;
        }
        return result;
    }

    private static String getSystemProperties(String key) {
        String result = "";
        try {
            Class<?> cls = Class.forName(SYSTEM_PROPERTIES_CLASS_NAME);
            Method method = cls.getMethod(GET_METHOD_NAME, String.class);
            result = (String) method.invoke(cls, key);
        } catch (Exception e) {
            DebugLog.e(TAG, "Failed to get system properties. " + e.toString());
        }
        return result;
    }

    public static boolean isUSVariant() {
        String customerId = getSystemProperties(CUSTOMER_ID);
        if (TextUtils.isEmpty(customerId)) {
            String swVariant = getSystemProperties(SW_VARIANT);
            if (swVariant != null && swVariant.toLowerCase().startsWith(US_VARIANT)) {
                return true;
            }
            return false;
        }
        if (TextUtils.equals(customerId, US_CUSTOMER_ID1) || TextUtils.equals(customerId, US_CUSTOMER_ID2)) {
            return true;
        }
        return false;
    }
}
