package com.sonymobile.scan3d.sharing;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;

import com.sonymobile.scan3d.storageservice.Config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class SharingManager {
    public static final String SCAN_TYPE_DELIMITER = ",";
    public static final int kScanTypeAny = 0x7fffffff;
    private static SharingManager sInstance;

    private final Context mContext;
    private Executor mExecutor;
    private List<OnPluginUpdateListener> mListeners;
    private Map<SharingConstants.Category, Map<Integer, Set<Plugin>>> mPlugins;

    private SharingManager(Context context) {
        mListeners = new ArrayList<>();
        mExecutor = Executors.newSingleThreadExecutor();
        mContext = context;

        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.PACKAGE_ADDED");
        filter.addAction("android.intent.action.PACKAGE_CHANGED");
        filter.addAction("android.intent.action.PACKAGE_REMOVED");
        filter.addDataScheme("package");
        context.registerReceiver(new PackageChangedReceiver(), filter);

        new LoadPluginsTask().executeOnExecutor(mExecutor, new Void[0]);
    }

    public static SharingManager getInstance() {
        if (sInstance != null) {
            return sInstance;
        }
        throw new IllegalStateException("Init() should be called first!");
    }

    public static synchronized void init(Context context) {
        if (sInstance != null) {
            throw new IllegalStateException("Init() called twice, something is wrong");
        }
        sInstance = new SharingManager(context.getApplicationContext());
    }

    public static int[] parseType(String type) {
        Set<Integer> types = new HashSet<>();
        for (String token : type.split(SCAN_TYPE_DELIMITER)) {
            switch (token) {
                case "face":
                    types.add(Integer.valueOf(0x100));
                    break;
                case "head":
                    types.add(Integer.valueOf(0x101));
                    break;
                case "food":
                    types.add(Integer.valueOf(0x200));
                    break;
                case "*":
                    types.add(Integer.valueOf(0x7fffffff));
                    break;
                default:
                    break;
            }
        }
        int[] result = new int[types.size()];
        int i = 0;
        for (Integer value : types) {
            result[i] = value.intValue();
            i++;
        }
        return result;
    }

    private void safeAddAllToSet(Set<Plugin> dest, Set<Plugin> src) {
        if (src != null) {
            dest.addAll(src);
        }
    }

    public Set<Plugin> getPlugins(SharingConstants.Category category, int scanType) {
        if (mPlugins == null) {
            return null;
        }
        Set<Plugin> result = new LinkedHashSet<>();
        safeAddAllToSet(result, mPlugins.get(category).get(Integer.valueOf(scanType)));
        safeAddAllToSet(result, mPlugins.get(category).get(Integer.valueOf(kScanTypeAny)));
        return result;
    }

    public Set<Plugin> getPluginsExact(SharingConstants.Category category, int scanType) {
        if (mPlugins == null) {
            return null;
        }
        Set<Plugin> result = new LinkedHashSet<>();
        safeAddAllToSet(result, mPlugins.get(category).get(Integer.valueOf(scanType)));
        return result;
    }

    public boolean hasPlugins(SharingConstants.Category category, int scanType) {
        Set<Plugin> plugins = getPlugins(category, scanType);
        return plugins != null && plugins.size() > 0;
    }

    public boolean hasPluginsExact(SharingConstants.Category category, int scanType) {
        Set<Plugin> plugins = getPluginsExact(category, scanType);
        return plugins != null && plugins.size() > 0;
    }

    public void registerPluginUpdateListener(OnPluginUpdateListener listener) {
        mListeners.add(listener);
        if (mPlugins != null) {
            listener.onPluginsChanged();
        }
    }

    public void unregisterPluginUpdateListener(OnPluginUpdateListener listener) {
        mListeners.remove(listener);
    }

    private class PackageChangedReceiver extends BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            new LoadPluginsTask().executeOnExecutor(mExecutor, new Void[0]);
        }
    }

    private class LoadPluginsTask extends AsyncTask<Void, Void, Map<SharingConstants.Category, Map<Integer, Set<Plugin>>>> {
        private void addPluginPackagesByMime(String mimeType, Map<String, ResolveInfo> map) {
            Intent intent = new Intent("android.intent.action.SEND");
            intent.setType(mimeType);
            List<ResolveInfo> resolveInfos = mContext.getPackageManager().queryIntentActivities(intent, PackageManager.GET_META_DATA | PackageManager.GET_RESOLVED_FILTER);

            for (ResolveInfo resolveInfo : resolveInfos) {
                Iterator<String> typesIterator = resolveInfo.filter.typesIterator();
                if (typesIterator == null) {
                    continue;
                }
                while (typesIterator.hasNext()) {
                    String type = typesIterator.next();
                    if (!type.equals(mimeType)) {
                        continue;
                    }
                    if (map.containsKey(resolveInfo.activityInfo.name)) {
                        continue;
                    }
                    map.put(resolveInfo.activityInfo.name, resolveInfo);
                }
            }
        }

        private String getMetaValue(Bundle bundle, String key) {
            if (bundle == null) {
                return null;
            }
            return bundle.getString(key, null);
        }

        private Set<Plugin> getPluginList(Map<SharingConstants.Category, Map<Integer, Set<Plugin>>> plugins, SharingConstants.Category category, int scanType) {
            Map<Integer, Set<Plugin>> byCategory = plugins.get(category);
            return byCategory.computeIfAbsent(Integer.valueOf(scanType), k -> new HashSet<>());
        }

        private List<ResolveInfo> getPluginPackages() {
            Map<String, ResolveInfo> map = new HashMap<>();
            addPluginPackagesByMime(SharingConstants.SCAN_3D_MIME_TYPE, map);
            addPluginPackagesByMime(SharingConstants.STL_MIME_TYPE, map);
            addPluginPackagesByMime(SharingConstants.GLTF_MIME_TYPE, map);
            return new ArrayList<>(map.values());
        }

        @Override
        protected Map<SharingConstants.Category, Map<Integer, Set<Plugin>>> doInBackground(Void... voids) {
            Map<SharingConstants.Category, Map<Integer, Set<Plugin>>> plugins = new HashMap<>();
            for (SharingConstants.Category category : SharingConstants.Category.values()) {
                plugins.put(category, new HashMap<>());
            }

            List<ResolveInfo> resolveInfos = getPluginPackages();
            PackageManager packageManager = mContext.getPackageManager();

            for (ResolveInfo resolveInfo : resolveInfos) {
                Bundle metaData = resolveInfo.activityInfo.metaData;
                String scanTypeValue = getMetaValue(metaData, SharingConstants.Meta.SCAN_TYPE);
                String categoryValue = getMetaValue(metaData, SharingConstants.Meta.CATEGORY);

                if (categoryValue == null || scanTypeValue == null) {
                    Log.d("SharingManager", "meta keys com.sonymobile.scan3d.meta.category or com.sonymobile.scan3d.meta.scan_type are missing for activity " + resolveInfo.activityInfo.name + " skipping");
                    continue;
                }

                if (!Config.isProviderEnabled(mContext, resolveInfo.activityInfo.packageName)) {
                    continue;
                }

                SharingConstants.Category category = SharingConstants.Category.parse(categoryValue);
                if (category == null) {
                    category = SharingConstants.Category.MISC;
                }

                int[] scanTypes = parseType(scanTypeValue);
                for (int scanType : scanTypes) {
                    Set<Plugin> pluginSet = getPluginList(plugins, category, scanType);
                    Plugin3rdParty plugin = new Plugin3rdParty(mContext, packageManager, resolveInfo, category, scanType);
                    if (plugin.isValid()) {
                        pluginSet.add(plugin);
                    }
                }
            }
            return plugins;
        }

        @Override
        protected void onPostExecute(Map<SharingConstants.Category, Map<Integer, Set<Plugin>>> result) {
            if (mPlugins == null || !mPlugins.equals(result)) {
                mPlugins = result;
                for (OnPluginUpdateListener listener : mListeners) {
                    listener.onPluginsChanged();
                }
            }
        }
    }
}
