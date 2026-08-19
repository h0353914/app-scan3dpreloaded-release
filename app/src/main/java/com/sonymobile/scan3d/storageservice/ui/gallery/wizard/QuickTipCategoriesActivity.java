package com.sonymobile.scan3d.storageservice.ui.gallery.wizard;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toolbar;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import com.sonymobile.scan3d.storageservice.ui.tips.TipParser;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class QuickTipCategoriesActivity extends FragmentActivity {
    private static final int ANIMATION_DURATION = 20;
    private QuickTipCategoriesAdapter mAdapter;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_quick_tip_categories);
        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.recyclerView);
        this.mAdapter = new QuickTipCategoriesAdapter(this);
        recyclerView.setAdapter(this.mAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        ((Toolbar) findViewById(R.id.toolbar)).setNavigationOnClickListener(view -> finishAfterTransition());
    }

    private class QuickTipCategoriesAdapter extends RecyclerView.Adapter {
        private List<TipCategory> mCategories;
        private int mExpandedItemPosition = 0;

        QuickTipCategoriesAdapter(Context context) {
            this.mCategories = TipParser.getQuickTutorials(context);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return QuickTipCategoriesActivity.this.new QuickTipCategoryHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.quick_tip_category_item, viewGroup, false));
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
            ((QuickTipCategoryHolder) viewHolder).bind(this.mCategories.get(i), this.mExpandedItemPosition);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.mCategories.size();
        }

        private void toggleExpand(int i) {
            int i2 = this.mExpandedItemPosition;
            if (i2 != -1) {
                notifyItemChanged(i2);
            }
            notifyItemChanged(i);
            this.mExpandedItemPosition = i;
        }
    }

    private class QuickTipCategoryHolder extends RecyclerView.ViewHolder implements UserInputReducer.InputReducer {
        private TipCategory mCategory;
        private final Context mContext;
        private TextView mDescriptionView;
        private View mExpandedView;
        private ImageView mImageView;
        private View mItemRoot;
        private final int mTitleSizeCollapsed;
        private final int mTitleSizeExpanded;
        private TextView mTitleView;

        QuickTipCategoryHolder(View view) {
            super(view);
            this.mContext = view.getContext();
            this.mItemRoot = view;
            this.mTitleView = (TextView) view.findViewById(R.id.title);
            this.mDescriptionView = (TextView) view.findViewById(R.id.description);
            this.mImageView = (ImageView) view.findViewById(R.id.image);
            this.mExpandedView = view.findViewById(R.id.layout_expanded);
            view.findViewById(R.id.show_me).setOnClickListener(this);
            view.setOnClickListener(this);
            int[] iArr = {android.R.attr.textSize};
            TypedArray typedArrayObtainStyledAttributes = QuickTipCategoriesActivity.this.obtainStyledAttributes(R.style.QuickTipItem_Title, iArr);
            this.mTitleSizeExpanded = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
            typedArrayObtainStyledAttributes.recycle();
            TypedArray typedArrayObtainStyledAttributes2 = QuickTipCategoriesActivity.this.obtainStyledAttributes(R.style.QuickTipItem_Subtitle, iArr);
            this.mTitleSizeCollapsed = typedArrayObtainStyledAttributes2.getDimensionPixelSize(0, 0);
            typedArrayObtainStyledAttributes2.recycle();
        }

        @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
        public void doClick(View view) {
            if (view.getId() != R.id.show_me) {
                QuickTipCategoriesActivity.this.mAdapter.toggleExpand(getAdapterPosition());
            } else {
                ScreenEvent.SCREEN_EVENT_FROM_REFERENS_ID.send(QuickTipCategoriesActivity.this, this.mCategory.getScreenEvent());
                WizardActivity.showWizard(this.mContext, this.mCategory, 0);
            }
        }

        void bind(TipCategory tipCategory, int i) {
            ValueAnimator valueAnimatorOfFloat;
            this.mCategory = tipCategory;
            this.mTitleView.setText(tipCategory.getTitle());
            this.mDescriptionView.setText(tipCategory.getDescription());
            int backgroundColor = tipCategory.getBackgroundColor();
            if (backgroundColor != 0) {
                this.mItemRoot.setBackgroundColor(QuickTipCategoriesActivity.this.getColor(backgroundColor));
            }
            int adapterPosition = getAdapterPosition();
            final int i2;
            if (adapterPosition == i) {
                valueAnimatorOfFloat = ValueAnimator.ofFloat(this.mTitleSizeCollapsed, this.mTitleSizeExpanded);
                this.mTitleView.setTextAppearance(R.style.QuickTipItem_Title);
                this.mImageView.setImageResource(tipCategory.getImage());
                this.mExpandedView.setVisibility(0);
                i2 = R.style.QuickTipItem_Title;
            } else {
                valueAnimatorOfFloat = ValueAnimator.ofFloat(this.mTitleSizeExpanded, this.mTitleSizeCollapsed);
                this.mTitleView.setTextAppearance(R.style.QuickTipItem_Subtitle);
                this.mImageView.setImageResource(tipCategory.getImageSmall());
                this.mExpandedView.setVisibility(8);
                i2 = R.style.QuickTipItem_Subtitle;
            }
            valueAnimatorOfFloat.addUpdateListener(valueAnimator -> this.mTitleView.setTextAppearance(i2));
            valueAnimatorOfFloat.setDuration(20L).start();
        }
    }
}
