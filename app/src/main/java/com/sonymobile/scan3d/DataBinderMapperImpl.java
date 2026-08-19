package com.sonymobile.scan3d;

import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.View;
import androidx.databinding.DataBinderMapper;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import com.sonymobile.scan3d.databinding.ComponentFaceblendBottomBarBindingImpl;
import com.sonymobile.scan3d.databinding.ComponentFaceblendBottomBarBindingLandImpl;
import com.sonymobile.scan3d.databinding.ComponentFaceblendSeekbarBindingImpl;
import com.sonymobile.scan3d.databinding.ComponentSharingBarBindingImpl;
import com.sonymobile.scan3d.databinding.ComponentSharingBarItemBindingImpl;
import com.sonymobile.scan3d.databinding.PrintPreviewBarBindingImpl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class DataBinderMapperImpl extends DataBinderMapper {
    private static final SparseIntArray INTERNAL_LAYOUT_ID_LOOKUP = new SparseIntArray(5);
    private static final int LAYOUT_COMPONENTFACEBLENDBOTTOMBAR = 1;
    private static final int LAYOUT_COMPONENTFACEBLENDSEEKBAR = 2;
    private static final int LAYOUT_COMPONENTSHARINGBAR = 3;
    private static final int LAYOUT_COMPONENTSHARINGBARITEM = 4;
    private static final int LAYOUT_PRINTPREVIEWBAR = 5;

    static {
        INTERNAL_LAYOUT_ID_LOOKUP.put(R.layout.component_faceblend_bottom_bar, 1);
        INTERNAL_LAYOUT_ID_LOOKUP.put(R.layout.component_faceblend_seekbar, 2);
        INTERNAL_LAYOUT_ID_LOOKUP.put(R.layout.component_sharing_bar, 3);
        INTERNAL_LAYOUT_ID_LOOKUP.put(R.layout.component_sharing_bar_item, 4);
        INTERNAL_LAYOUT_ID_LOOKUP.put(R.layout.print_preview_bar, 5);
    }

    @Override // androidx.databinding.DataBinderMapper
    public ViewDataBinding getDataBinder(DataBindingComponent dataBindingComponent, View view, int i) {
        int i2 = INTERNAL_LAYOUT_ID_LOOKUP.get(i);
        if (i2 <= 0) {
            return null;
        }
        Object tag = view.getTag();
        if (tag == null) {
            throw new RuntimeException("view must have a tag");
        }
        switch (i2) {
            case 1:
                if ("layout/component_faceblend_bottom_bar_0".equals(tag)) {
                    return new ComponentFaceblendBottomBarBindingImpl(dataBindingComponent, view);
                }
                if ("layout-land/component_faceblend_bottom_bar_0".equals(tag)) {
                    return new ComponentFaceblendBottomBarBindingLandImpl(dataBindingComponent, view);
                }
                throw new IllegalArgumentException("The tag for component_faceblend_bottom_bar is invalid. Received: " + tag);
            case 2:
                if ("layout/component_faceblend_seekbar_0".equals(tag)) {
                    return new ComponentFaceblendSeekbarBindingImpl(dataBindingComponent, view);
                }
                throw new IllegalArgumentException("The tag for component_faceblend_seekbar is invalid. Received: " + tag);
            case 3:
                if ("layout/component_sharing_bar_0".equals(tag)) {
                    return new ComponentSharingBarBindingImpl(dataBindingComponent, view);
                }
                throw new IllegalArgumentException("The tag for component_sharing_bar is invalid. Received: " + tag);
            case 4:
                if ("layout/component_sharing_bar_item_0".equals(tag)) {
                    return new ComponentSharingBarItemBindingImpl(dataBindingComponent, view);
                }
                throw new IllegalArgumentException("The tag for component_sharing_bar_item is invalid. Received: " + tag);
            case 5:
                if ("layout/print_preview_bar_0".equals(tag)) {
                    return new PrintPreviewBarBindingImpl(dataBindingComponent, view);
                }
                throw new IllegalArgumentException("The tag for print_preview_bar is invalid. Received: " + tag);
            default:
                return null;
        }
    }

    @Override // androidx.databinding.DataBinderMapper
    public ViewDataBinding getDataBinder(DataBindingComponent dataBindingComponent, View[] viewArr, int i) {
        if (viewArr == null || viewArr.length == 0 || INTERNAL_LAYOUT_ID_LOOKUP.get(i) <= 0 || viewArr[0].getTag() != null) {
            return null;
        }
        throw new RuntimeException("view must have a tag");
    }

    @Override // androidx.databinding.DataBinderMapper
    public int getLayoutId(String str) {
        Integer num;
        if (str == null || (num = InnerLayoutIdLookup.sKeys.get(str)) == null) {
            return 0;
        }
        return num.intValue();
    }

    @Override // androidx.databinding.DataBinderMapper
    public String convertBrIdToString(int i) {
        return InnerBrLookup.sKeys.get(i);
    }

    @Override // androidx.databinding.DataBinderMapper
    public List<DataBinderMapper> collectDependencies() {
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(new androidx.databinding.library.baseAdapters.DataBinderMapperImpl());
        return arrayList;
    }

    private static class InnerBrLookup {
        static final SparseArray<String> sKeys = new SparseArray<>(7);

        private InnerBrLookup() {
        }

        static {
            sKeys.put(0, "_all");
            sKeys.put(1, "improveDrawable");
            sKeys.put(2, "drawable");
            sKeys.put(3, "socleDrawable");
            sKeys.put(4, "animText");
            sKeys.put(5, "text");
        }
    }

    private static class InnerLayoutIdLookup {
        static final HashMap<String, Integer> sKeys = new HashMap<>(6);

        private InnerLayoutIdLookup() {
        }

        static {
            sKeys.put("layout/component_faceblend_bottom_bar_0", Integer.valueOf(R.layout.component_faceblend_bottom_bar));
            sKeys.put("layout-land/component_faceblend_bottom_bar_0", Integer.valueOf(R.layout.component_faceblend_bottom_bar));
            sKeys.put("layout/component_faceblend_seekbar_0", Integer.valueOf(R.layout.component_faceblend_seekbar));
            sKeys.put("layout/component_sharing_bar_0", Integer.valueOf(R.layout.component_sharing_bar));
            sKeys.put("layout/component_sharing_bar_item_0", Integer.valueOf(R.layout.component_sharing_bar_item));
            sKeys.put("layout/print_preview_bar_0", Integer.valueOf(R.layout.print_preview_bar));
        }
    }
}
