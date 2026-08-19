package com.sonymobile.scan3d.storageservice.ui.gallery.wizard;

import android.app.ActionBar;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.fragment.AboutTechFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.fragment.ExpandableListFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.fragment.PagerFragment;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class WizardActivity extends FragmentActivity {
    public static final String EXTRA_CATEGORY = "com.sonymobile.scan3d.extras.TIP_CATEGORY";
    public static final String EXTRA_TIP_INDEX = "com.sonymobile.scan3d.extras.TIP_INDEX";

    public static void showWizard(Context context, TipCategory tipCategory, Tip tip) {
        showWizard(context, tipCategory, getCurrentItem(tipCategory, tip));
    }

    static void showWizard(Context context, TipCategory tipCategory, int i) {
        context.startActivity(getStartIntent(context, tipCategory, i));
    }

    public static Intent getStartIntent(Context context, TipCategory tipCategory, int i) {
        Intent intent = new Intent(context, (Class<?>) WizardActivity.class);
        intent.putExtra("com.sonymobile.scan3d.extras.TIP_CATEGORY", tipCategory);
        intent.putExtra(EXTRA_TIP_INDEX, i);
        return intent;
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.wizard_activity_layout);
        TipCategory tipCategory = (TipCategory) getIntent().getParcelableExtra("com.sonymobile.scan3d.extras.TIP_CATEGORY");
        if (tipCategory != null) {
            int intExtra = getIntent().getIntExtra(EXTRA_TIP_INDEX, 0);
            Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
            setActionBar(toolbar);
            toolbar.setNavigationOnClickListener(view -> finishAfterTransition());
            ActionBar actionBar = getActionBar();
            if (actionBar != null) {
                actionBar.setTitle(tipCategory.getTitle());
            }
            if (bundle == null) {
                ScreenEvent.SCREEN_EVENT_FROM_REFERENS_ID.send(this, tipCategory.getScreenEvent());
            }
            Fragment fragmentNewInstance = null;
            int wizardType = tipCategory.getWizardType();
            if (wizardType != 0) {
                switch (wizardType) {
                    case 2:
                        fragmentNewInstance = ExpandableListFragment.newInstance(tipCategory);
                        break;
                    case 3:
                        int actionUrl = tipCategory.getActionUrl();
                        if (actionUrl > 0) {
                            Intent intent = new Intent("android.intent.action.VIEW");
                            intent.setData(Uri.parse(getString(actionUrl)));
                            startActivity(intent);
                            finish();
                        }
                        break;
                    default:
                        fragmentNewInstance = PagerFragment.newInstance(tipCategory, intExtra);
                        break;
                }
            } else {
                fragmentNewInstance = AboutTechFragment.newInstance();
            }
            if (fragmentNewInstance != null) {
                FragmentTransaction fragmentTransactionBeginTransaction = getSupportFragmentManager().beginTransaction();
                fragmentTransactionBeginTransaction.replace(R.id.content, fragmentNewInstance, PagerFragment.class.getName());
                fragmentTransactionBeginTransaction.commit();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("No tip category added.");
    }

    private static List<Tip> getTipsWithVisuals(TipCategory tipCategory) {
        ArrayList arrayList = new ArrayList();
        for (Tip tip : tipCategory.getTips()) {
            if (tip.getType() > 0) {
                arrayList.add(tip);
            }
        }
        return arrayList;
    }

    private static int getCurrentItem(TipCategory tipCategory, Tip tip) {
        if (tip != null) {
            List<Tip> tipsWithVisuals = getTipsWithVisuals(tipCategory);
            for (int i = 0; i < tipsWithVisuals.size(); i++) {
                if (tipsWithVisuals.get(i) == tip) {
                    return i;
                }
            }
        }
        return 0;
    }
}
