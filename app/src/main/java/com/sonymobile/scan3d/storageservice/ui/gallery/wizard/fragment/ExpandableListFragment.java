package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.fragment;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ExpandableListFragment extends Fragment implements AdapterView.OnItemClickListener {
    public static final String KEY_CATEGORY = "key_category";

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        View viewFindViewById = view.findViewById(R.id.expand_indicator);
        View viewFindViewById2 = view.findViewById(R.id.content_layout);
        boolean zIsSelected = viewFindViewById.isSelected();
        viewFindViewById.setSelected(!zIsSelected);
        viewFindViewById2.setVisibility(zIsSelected ? 8 : 0);
    }

    private static class ListAdapter extends BaseAdapter {
        private Context mContext;
        private final List<Tip> mTips;

        @Override // android.widget.Adapter
        public long getItemId(int i) {
            return i;
        }

        ListAdapter(Context context, List<Tip> list) {
            this.mContext = context;
            this.mTips = list;
        }

        @Override // android.widget.Adapter
        public Tip getItem(int i) {
            return this.mTips.get(i);
        }

        @Override // android.widget.Adapter
        public View getView(int i, View view, ViewGroup viewGroup) {
            if (view == null) {
                view = LayoutInflater.from(this.mContext).inflate(R.layout.tip_wizard_expandable_list_item, viewGroup, false);
            }
            Tip item = getItem(i);
            ((TextView) view.findViewById(R.id.title_text)).setText(item.getTitle());
            ((TextView) view.findViewById(R.id.description_text)).setText(item.getDescription());
            if (item.getImage() != 0) {
                ImageView imageView = (ImageView) view.findViewById(R.id.image);
                imageView.setVisibility(0);
                imageView.setImageResource(item.getImage());
            }
            return view;
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return this.mTips.size();
        }
    }

    public static ExpandableListFragment newInstance(TipCategory tipCategory) {
        Bundle bundle = new Bundle();
        bundle.putParcelable("key_category", tipCategory);
        ExpandableListFragment expandableListFragment = new ExpandableListFragment();
        expandableListFragment.setArguments(bundle);
        return expandableListFragment;
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(R.layout.wizard_fragment_list, viewGroup, false);
        List<Tip> expandableTips = getExpandableTips((TipCategory) getArguments().getParcelable("key_category"));
        ListView listView = (ListView) viewInflate.findViewById(R.id.list);
        listView.setAdapter((android.widget.ListAdapter) new ListAdapter(getContext(), expandableTips));
        listView.setOnItemClickListener(this);
        return viewInflate;
    }

    private static List<Tip> getExpandableTips(TipCategory tipCategory) {
        ArrayList arrayList = new ArrayList();
        for (Tip tip : tipCategory.getTips()) {
            if (tip.getType() <= 1) {
                arrayList.add(tip);
            }
        }
        return arrayList;
    }
}
