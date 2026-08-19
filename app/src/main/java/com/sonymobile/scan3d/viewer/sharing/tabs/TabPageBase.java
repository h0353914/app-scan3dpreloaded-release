package com.sonymobile.scan3d.viewer.sharing.tabs;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.sonymobile.scan3d.PermissionUtil;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.sharing.LocalPlugin;
import com.sonymobile.scan3d.sharing.NamedPlugin;
import com.sonymobile.scan3d.sharing.OnPluginUpdateListener;
import com.sonymobile.scan3d.sharing.Plugin;
import com.sonymobile.scan3d.sharing.SharingManager;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public abstract class TabPageBase extends Fragment implements OnPluginUpdateListener {
    private static final String ARG_FILESET = "fileset";
    private static final String ARG_POLICY = "policy";
    protected static final String DIALOG_TAG = "dialog_tag";
    private static final String KEY_BUSY_PLUGIN = "BUSY_PLUGIN";
    protected static final int NO_BUSY_PLUGINS = -1;
    private static final String TAG = "com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase";
    private PluginAdapter mAdapter;
    private int mBusyPlugin = -1;
    protected IFileSet mFileSet;
    protected View mPermissionsContainer;
    protected Handler mPermissionsHandler;
    protected OnPluginUpdateListener mPluginUpdateListener;
    private int mPolicy;

    protected abstract List<Plugin> getPlugins();

    protected abstract boolean hasFacePlugins();

    @Override // androidx.fragment.app.Fragment
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        this.mFileSet = (IFileSet) getArguments().getParcelable(ARG_FILESET);
        this.mPolicy = getArguments().getInt("policy");
        this.mPermissionsHandler = new Handler();
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        final View viewInflate = layoutInflater.inflate(R.layout.fragment_scan_sharing_page, viewGroup, false);
        final RecyclerView recyclerView = (RecyclerView) viewInflate.findViewById(R.id.recyclerView);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        this.mBusyPlugin = bundle != null ? bundle.getInt(KEY_BUSY_PLUGIN, -1) : -1;
        this.mPluginUpdateListener = () -> lambda$onCreateView$0(this, recyclerView, viewInflate);
        this.mPermissionsContainer = viewInflate.findViewById(R.id.permissions_container);
        return viewInflate;
    }

    public static /* synthetic */ void lambda$onCreateView$0(TabPageBase tabPageBase, RecyclerView recyclerView, View view) {
        List<Plugin> plugins = tabPageBase.getPlugins();
        if (plugins.isEmpty()) {
            recyclerView.setVisibility(8);
            view.findViewById(R.id.emptyPage).setVisibility(0);
            return;
        }
        tabPageBase.mAdapter = tabPageBase.new PluginAdapter(plugins);
        recyclerView.setAdapter(tabPageBase.mAdapter);
        view.findViewById(R.id.emptyPage).setVisibility(8);
        recyclerView.setVisibility(0);
        if (tabPageBase.mBusyPlugin > -1) {
            tabPageBase.mAdapter.notifyDataSetChanged();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        SharingManager.getInstance().registerPluginUpdateListener(this);
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt(KEY_BUSY_PLUGIN, this.mBusyPlugin);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        SharingManager.getInstance().unregisterPluginUpdateListener(this);
    }

    protected static Bundle getBaseArguments(IFileSet iFileSet, int i) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(ARG_FILESET, iFileSet);
        bundle.putInt("policy", i);
        return bundle;
    }

    protected void onClickPlugin(Plugin plugin, int i) {
        sendClickEvent(plugin);
        plugin.shareMesh(getContext(), this.mFileSet);
    }

    protected void updateAdapter(int i) {
        this.mBusyPlugin = i;
        PluginAdapter pluginAdapter = this.mAdapter;
        if (pluginAdapter != null) {
            pluginAdapter.notifyDataSetChanged();
        }
    }

    protected void sendClickEvent(Plugin plugin) {
        if (plugin instanceof NamedPlugin) {
            HitEvent.SHARING_CARD_CLICKED.send(getContext(), ((NamedPlugin) plugin).getAppName());
        } else if (plugin instanceof LocalPlugin) {
            HitEvent.SHARING_CARD_CLICKED.send(getContext(), ((LocalPlugin) plugin).getDescriptor());
        } else {
            HitEvent.SHARING_CARD_CLICKED.send(getContext(), "UnknownCard");
        }
    }

    protected boolean startGooglePlay(String str) {
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setPackage("com.android.vending");
            intent.setData(Uri.parse("market://search?c=apps&q=" + str));
            startActivity(intent);
            return true;
        } catch (ActivityNotFoundException unused) {
            DebugLog.d(TAG, "No google play found");
            return false;
        }
    }

    @Override // com.sonymobile.scan3d.sharing.OnPluginUpdateListener
    public void onPluginsChanged() {
        View view = getView();
        if (view == null) {
            return;
        }
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.recyclerView);
        List<Plugin> plugins = getPlugins();
        if (plugins.isEmpty()) {
            recyclerView.setVisibility(8);
            view.findViewById(R.id.emptyPage).setVisibility(0);
            return;
        }
        this.mAdapter = new PluginAdapter(plugins);
        recyclerView.setAdapter(this.mAdapter);
        view.findViewById(R.id.emptyPage).setVisibility(8);
        recyclerView.setVisibility(0);
        if (this.mBusyPlugin > -1) {
            this.mAdapter.notifyDataSetChanged();
        }
    }

    private class ViewHolder extends RecyclerView.ViewHolder {
        private static final int VIEW_TYPE = 2131493040;
        private final View mCardContent;
        private final ImageView mImageView;
        private final View mRootView;
        private final TextView mTitleView;

        ViewHolder(View view) {
            super(view);
            this.mRootView = view;
            this.mCardContent = view.findViewById(R.id.card_content);
            this.mImageView = (ImageView) view.findViewById(R.id.info_image);
            this.mTitleView = (TextView) view.findViewById(R.id.info_title);
        }

        public void bind(final Plugin plugin) {
            Context context = TabPageBase.this.getContext();
            if (TabPageBase.this.mBusyPlugin > -1) {
                this.mRootView.setEnabled(false);
                if (TabPageBase.this.mBusyPlugin == getAdapterPosition()) {
                    ((ShareCardView) this.mRootView).addProgressBar();
                } else {
                    ((ShareCardView) this.mRootView).removeProgressBar();
                }
                this.mRootView.setOnClickListener(view -> Toast.makeText(TabPageBase.this.getContext(), R.string.share_toast_loading_ongoing, 0).show());
            } else {
                this.mRootView.setEnabled(true);
                this.mRootView.setOnClickListener(view -> TabPageBase.this.onClickPlugin(plugin, getAdapterPosition()));
            }
            this.mCardContent.setBackgroundColor(plugin.getBackgroundColor());
            this.mImageView.setImageDrawable(plugin.getImage());
            this.mTitleView.setText(plugin.getTitle());
            if (plugin.getBackgroundColor() == context.getColor(R.color.sharing_find_more)) {
                this.mTitleView.setBackgroundColor(plugin.getBackgroundColor());
                this.mTitleView.setTextColor(context.getColor(R.color.card_dark_text));
            } else {
                this.mTitleView.setBackgroundColor(plugin.getTextColor(context));
                this.mTitleView.setTextColor(context.getColor(R.color.card_white_text));
            }
        }
    }

    private static class InfoCard {
        public final String text;

        private InfoCard(String str) {
            this.text = str;
        }
    }

    private class InfoHolder extends RecyclerView.ViewHolder {
        private static final int VIEW_TYPE = 2131493042;
        private final TextView mTextView;

        InfoHolder(View view) {
            super(view);
            this.mTextView = (TextView) view.findViewById(R.id.info_title);
        }

        public void bind(InfoCard infoCard) {
            this.mTextView.setText(infoCard.text);
        }
    }

    private class PluginAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
        private final List<Object> mPlugins = new ArrayList();

        PluginAdapter(List<Plugin> list) {
            int scanType = TabPageBase.this.mFileSet.getScanType();
            boolean z = TabPageBase.this.mPolicy == 0 || TabPageBase.this.mPolicy == 10 || TabPageBase.this.mPolicy == 1 || TabPageBase.this.mPolicy == 11;
            boolean z2 = scanType == 256 || scanType == 257;
            if (z && TabPageBase.this.hasFacePlugins() && !z2) {
                this.mPlugins.add(new InfoCard(TabPageBase.this.getContext().getString(R.string.no_faces_detected_card)));
            }
            this.mPlugins.addAll(list);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        @NonNull
        public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
            if (i == R.layout.sharing_card) {
                return TabPageBase.this.new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.sharing_card, viewGroup, false));
            }
            if (i == R.layout.sharing_info_card) {
                return TabPageBase.this.new InfoHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.sharing_info_card, viewGroup, false));
            }
            throw new RuntimeException("Unknown ViewType: " + i);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(@NonNull RecyclerView.ViewHolder viewHolder, int i) {
            if (this.mPlugins.get(i) instanceof InfoCard) {
                ((InfoHolder) viewHolder).bind((InfoCard) this.mPlugins.get(i));
            } else {
                ((ViewHolder) viewHolder).bind((Plugin) this.mPlugins.get(i));
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemViewType(int i) {
            return this.mPlugins.get(i) instanceof InfoCard ? R.layout.sharing_info_card : R.layout.sharing_card;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.mPlugins.size();
        }
    }

    protected static void showFragment(FragmentManager fragmentManager, Fragment fragment) {
        FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
        fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
        fragmentTransactionBeginTransaction.replace(R.id.fragment_container, fragment);
        fragmentTransactionBeginTransaction.addToBackStack(fragment.getClass().getName());
        fragmentTransactionBeginTransaction.commit();
    }

    protected void showFragment(Fragment fragment) {
        showFragment(getParentFragment().getFragmentManager(), fragment);
    }

    protected void setupPermissionsButton(int i, final String[] strArr, final int i2) {
        ((TextView) this.mPermissionsContainer.findViewById(R.id.permissions_text)).setText(i);
        ((Button) this.mPermissionsContainer.findViewById(R.id.permissions_button)).setOnClickListener(view -> lambda$setupPermissionsButton$1(this, strArr, i2, view));
    }

    public static /* synthetic */ void lambda$setupPermissionsButton$1(TabPageBase tabPageBase, String[] strArr, int i, View view) {
        tabPageBase.mPermissionsContainer.setVisibility(4);
        if (PermissionUtil.shouldShowRequestPermissionRationale(tabPageBase.getActivity(), strArr)) {
            tabPageBase.requestPermissions(strArr, i);
        } else {
            PermissionUtil.startAppSettings(tabPageBase.getContext());
        }
    }
}
