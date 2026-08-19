package com.sonymobile.scan3d.storageservice.ui.tips;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.XmlResourceParser;
import android.preference.PreferenceManager;
import android.util.ArraySet;
import androidx.annotation.Nullable;
import androidx.annotation.StringRes;
import androidx.annotation.VisibleForTesting;
import androidx.annotation.XmlRes;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class TipParser {
    public static final int FIRST_TIME_TUTORIAL_ADV = 4;
    public static final int FIRST_TIME_TUTORIAL_FACE = 1;
    public static final int FIRST_TIME_TUTORIAL_FOOD = 3;
    public static final int FIRST_TIME_TUTORIAL_HEAD = 2;
    public static final int FIRST_TIME_TUTORIAL_SELFIE = 0;
    private static final String PROMOTIONS_DATE_FORMAT = "yyyy-MM-dd";
    private static final String PROMOTIONS_JSON_DESCRIPTION = "json_description";
    private static final String PROMOTIONS_JSON_EXPIRE_DATE = "json_expire";
    private static final String TAG = "TipParser";
    private static final String TAG_CLIP = "Clip";
    private static final String TAG_TIP = "Tip";
    private static final String TAG_TIP_CATEGORY = "TipCategory";
    private static final String TAG_VIDEO = "Video";

    public static final class TipPair {
        private final TipCategory mCategory;
        private final Tip mTip;

        TipPair(TipCategory tipCategory, Tip tip) {
            this.mCategory = tipCategory;
            this.mTip = tip;
        }

        public TipCategory getCategory() {
            return this.mCategory;
        }

        public Tip getTip() {
            return this.mTip;
        }
    }

    public static List<TipCategory> getQuickTutorials(Context context) {
        return parse(context, R.xml.tips_tutorial);
    }

    public static List<Tip> getPromotionCards(Context context) {
        List<TipCategory> list = parse(context, R.xml.promotions_default);
        List<Tip> tips = list.size() == 1 ? list.get(0).getTips() : new ArrayList<>();
        if (context.getResources().getConfiguration().getLayoutDirection() == 1) {
            Collections.reverse(tips);
        }
        Config.customizePromotionsList(context, tips);
        cleanTipList(context, tips);
        return tips;
    }

    public static boolean isPromotionListPopulated(Context context) {
        return getPromotionCards(context).size() > 0;
    }

    private static void cleanTipList(Context context, List<Tip> list) {
        Set<Integer> descriptionIdsFromPrefs = getDescriptionIdsFromPrefs(context);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(PROMOTIONS_DATE_FORMAT, Locale.US);
        ArraySet arraySet = new ArraySet();
        for (Tip tip : list) {
            if (tip.isRemovable()) {
                String expireDate = tip.getExpireDate();
                if (expireDate != null) {
                    try {
                        if (System.currentTimeMillis() > simpleDateFormat.parse(expireDate).getTime()) {
                            arraySet.add(tip);
                        }
                    } catch (ParseException unused) {
                        DebugLog.d(TAG, "Wrong date format: " + expireDate + ". This promotion item will not be removed.");
                    }
                }
                if (descriptionIdsFromPrefs.contains(Integer.valueOf(tip.getDescription()))) {
                    arraySet.add(tip);
                }
            }
        }
        list.removeAll(arraySet);
    }

    @VisibleForTesting
    public static Set<Integer> getDescriptionIdsFromPrefs(Context context) {
        Set<String> stringSet = PreferenceManager.getDefaultSharedPreferences(context).getStringSet(context.getString(R.string.pref_key_promotion_items), new ArraySet());
        ArraySet arraySet = new ArraySet();
        for (String str : stringSet) {
            try {
                arraySet.add(Integer.valueOf(new JSONObject(str).getInt(PROMOTIONS_JSON_DESCRIPTION)));
            } catch (JSONException unused) {
                DebugLog.d(TAG, "Promotion json string bad format: " + str);
            }
        }
        return arraySet;
    }

    public static void saveRemovedItemToPrefs(@StringRes int i, @Nullable String str, Context context) {
        try {
            JSONObject jSONObjectCreateJSON = createJSON(i, str);
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
            Set<String> stringSet = defaultSharedPreferences.getStringSet(context.getString(R.string.pref_key_promotion_items), new ArraySet());
            ArraySet arraySet = new ArraySet();
            arraySet.addAll(stringSet);
            arraySet.add(jSONObjectCreateJSON.toString());
            SharedPreferences.Editor editorEdit = defaultSharedPreferences.edit();
            editorEdit.putStringSet(context.getString(R.string.pref_key_promotion_items), arraySet);
            editorEdit.apply();
        } catch (JSONException unused) {
            DebugLog.d(TAG, "Failed to add promotion to blacklist. Promo id: " + i);
        }
    }

    public static TipCategory getFirstTimeTutorial(Context context, int i) {
        List<TipCategory> list = parse(context, R.xml.tips_first_time_tutorial);
        if (i < 0 || i >= list.size()) {
            return null;
        }
        return list.get(i);
    }

    public static List<TipPair> getScanKeptTips(Context context, int i, int i2) {
        ArrayList arrayList = new ArrayList();
        List<TipCategory> list = parse(context, R.xml.tips_tutorial);
        list.addAll(parse(context, R.xml.tips_short));
        for (TipCategory tipCategory : list) {
            Iterator<Tip> it = tipCategory.getTipsForScanTypeOrPolicy(i, i2).iterator();
            while (it.hasNext()) {
                arrayList.add(new TipPair(tipCategory, it.next()));
            }
        }
        return arrayList;
    }

    public static List<TipPair> getScanDiscardedTips(Context context, int i, int i2) {
        ArrayList arrayList = new ArrayList();
        List<TipCategory> list = parse(context, R.xml.tips_tutorial);
        list.addAll(parse(context, R.xml.tips_short));
        for (TipCategory tipCategory : list) {
            for (Tip tip : tipCategory.getTipsForScanTypeOrPolicy(i, i2)) {
                if (!tip.isForKeptScanOnly()) {
                    arrayList.add(new TipPair(tipCategory, tip));
                }
            }
        }
        return arrayList;
    }

    private static List<TipCategory> parse(Context context, @XmlRes int i) {
        int layoutDirection = context.getResources().getConfiguration().getLayoutDirection();
        ArrayList<TipCategory> arrayList = new ArrayList<>();
        boolean isGooglePlayEnabled = Config.isGooglePlayEnabled(context);
        try {
            XmlResourceParser xmlResourceParser = context.getResources().getXml(i);
            try {
                int eventType = xmlResourceParser.getEventType();
                TipCategory tipCategory = null;
                Tip tip = null;
                while (eventType != 1) {
                    String name = xmlResourceParser.getName();
                    if (eventType == 3) {
                        switch (name) {
                            case TAG_TIP:
                                tip = null;
                                break;
                            case TAG_TIP_CATEGORY:
                                tipCategory = null;
                                break;
                        }
                    } else if (eventType == 2) {
                        switch (name) {
                            case TAG_TIP_CATEGORY:
                                tipCategory = TipCategory.newInstance(xmlResourceParser);
                                if (!tipCategory.isGoogleDependent() || isGooglePlayEnabled) {
                                    arrayList.add(tipCategory);
                                }
                                break;
                            case TAG_TIP:
                                if (tipCategory != null) {
                                    tip = Tip.newInstance(xmlResourceParser);
                                    tipCategory.addTip(tip);
                                }
                                break;
                            case TAG_CLIP:
                                if (tip != null) {
                                    tip.addClip(Clip.newInstance(xmlResourceParser));
                                }
                                break;
                            case TAG_VIDEO:
                                if (tip != null) {
                                    Video video = Video.newInstance(xmlResourceParser, isGooglePlayEnabled);
                                    if (video.isDisplayable()) {
                                        tip.setAdditionalVideo(video);
                                    }
                                }
                                break;
                        }
                    }
                    eventType = xmlResourceParser.next();
                }
            } catch (Throwable th) {
                if (xmlResourceParser != null) {
                    try {
                        xmlResourceParser.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
            if (xmlResourceParser != null) {
                xmlResourceParser.close();
            }
        } catch (Exception e) {
            throw new RuntimeException("Parsing failed", e);
        }
        if (layoutDirection == 1) {
            for (int i2 = 0; i2 < arrayList.size(); i2++) {
                TipCategory tipCategory2 = arrayList.get(i2);
                if (tipCategory2.hasTips()) {
                    tipCategory2.revertTips();
                }
            }
        }
        return arrayList;
    }

    private static JSONObject createJSON(@StringRes int i, @Nullable String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put(PROMOTIONS_JSON_DESCRIPTION, i);
        jSONObject.put(PROMOTIONS_JSON_EXPIRE_DATE, str);
        return jSONObject;
    }
}
