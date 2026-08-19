package com.sonymobile.scan3d.viewer;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Outline;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.Size;
import androidx.fragment.app.FragmentActivity;
import androidx.loader.app.LoaderManager;
import androidx.loader.content.CursorLoader;
import androidx.loader.content.Loader;
import com.facebook.drawee.view.SimpleDraweeView;
import com.google.android.gms.drive.DriveFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.storageservice.ui.gallery.ImageCache;
import com.sonymobile.scan3d.storageservice.ui.gallery.LazyLoader;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SelectImprovementActivity extends FragmentActivity implements LoaderManager.LoaderCallbacks<Cursor>, AdapterView.OnItemClickListener {
    public static final String EXTRA_IMPROVEMENTS = "com.sonymobile.scan3d.extra.IMPROVEMENTS";
    private static final String TAG = "com.sonymobile.scan3d.viewer.SelectImprovementActivity";
    private ImprovementAdapter mAdapter;
    private ListView mListView;

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoaderReset(@NonNull Loader<Cursor> loader) {
    }

    private static class ImprovementAdapter extends BaseAdapter {
        private static final ViewOutlineProvider OVAL_OUTLINE_PROVIDER = new ViewOutlineProvider() { // from class: com.sonymobile.scan3d.viewer.SelectImprovementActivity.ImprovementAdapter.1
            @Override // android.view.ViewOutlineProvider
            public void getOutline(View view, Outline outline) {
                outline.setOval(0, 0, view.getWidth(), view.getHeight());
            }
        };
        private ImageCache mCache = new ImageCache();
        private Context mContext;
        private List<IFileSet> mImprovementFileSet;

        ImprovementAdapter(Context context) {
            this.mContext = context;
        }

        private void setImprovedFileSets(List<IFileSet> list) {
            this.mImprovementFileSet = list;
            notifyDataSetChanged();
        }

        private void release() {
            this.mCache.stop();
        }

        @Override // android.widget.Adapter
        public int getCount() {
            List<IFileSet> list = this.mImprovementFileSet;
            if (list != null) {
                return list.size();
            }
            return 0;
        }

        @Override // android.widget.Adapter
        public IFileSet getItem(int i) {
            return this.mImprovementFileSet.get(i);
        }

        @Override // android.widget.Adapter
        public long getItemId(int i) {
            return getItem(i).getId();
        }

        @Override // android.widget.Adapter
        public View getView(int i, View view, ViewGroup viewGroup) {
            if (view == null) {
                view = LayoutInflater.from(this.mContext).inflate(R.layout.component_improvement_list_item, viewGroup, false);
            }
            IFileSet item = getItem(i);
            ((TextView) view.findViewById(R.id.improvement_text)).setText(item.getName());
            SimpleDraweeView simpleDraweeView = (SimpleDraweeView) view.findViewById(R.id.improvement_image);
            simpleDraweeView.setOutlineProvider(OVAL_OUTLINE_PROVIDER);
            simpleDraweeView.setClipToOutline(true);
            LazyLoader.load(simpleDraweeView, item);
            return view;
        }
    }

    public static Intent getStartIntent(Context context, @NonNull @Size(min = 2) ArrayList<Improvement> arrayList) {
        if (arrayList.size() < 2) {
            throw new IllegalArgumentException("Should be more than one improvement");
        }
        Intent intent = new Intent(context, (Class<?>) SelectImprovementActivity.class);
        intent.putParcelableArrayListExtra(EXTRA_IMPROVEMENTS, arrayList);
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        return intent;
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_select_improvement);
        ((Button) findViewById(R.id.cancel)).setOnClickListener((UserInputReducer.InputReducer) view -> this.finish());
        this.mAdapter = new ImprovementAdapter(this);
        this.mListView = (ListView) findViewById(R.id.select_improvement_list);
        this.mListView.setAdapter((ListAdapter) this.mAdapter);
        this.mListView.setOnItemClickListener(this);
        LoaderManager.getInstance(this).initLoader(0, null, this);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        LoaderManager.getInstance(this).restartLoader(0, null, this);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        ImprovementAdapter improvementAdapter = this.mAdapter;
        if (improvementAdapter != null) {
            improvementAdapter.release();
        }
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    @NonNull
    public Loader<Cursor> onCreateLoader(int i, @Nullable Bundle bundle) {
        return createLoaderForImprovementFileSets(getIntent().getParcelableArrayListExtra(EXTRA_IMPROVEMENTS));
    }

    @Override // androidx.loader.app.LoaderManager.LoaderCallbacks
    public void onLoadFinished(@NonNull Loader<Cursor> loader, Cursor cursor) {
        List<IFileSet> listCreateFileRecords = Factory.createFileRecords(cursor);
        DebugLog.d(TAG, "onLoadFinished(): Found " + listCreateFileRecords.size() + " improved scans.");
        this.mListView.setVisibility(0);
        this.mAdapter.setImprovedFileSets(listCreateFileRecords);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        ArrayList<Improvement> arrayListImprovementExtra = getIntent().getParcelableArrayListExtra(EXTRA_IMPROVEMENTS);
        for (Improvement improvement : arrayListImprovementExtra) {
            if (j == improvement.getFileSetId()) {
                startActivity(ViewerActivity.getImprovementIntent(this, improvement));
                finish();
                return;
            }
        }
    }

    private CursorLoader createLoaderForImprovementFileSets(@NonNull ArrayList<Improvement> arrayList) {
        StringBuilder sb = new StringBuilder("_id=?");
        String[] strArr = new String[arrayList.size()];
        for (int i = 0; i < strArr.length; i++) {
            if (i > 0) {
                sb.append(" OR ");
                sb.append("_id=?");
            }
            strArr[i] = String.valueOf(arrayList.get(i).getFileSetId());
        }
        return Factory.createFileRecordLoader(this, sb.toString(), strArr, null);
    }
}
