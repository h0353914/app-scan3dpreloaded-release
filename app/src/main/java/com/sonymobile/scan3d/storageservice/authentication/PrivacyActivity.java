package com.sonymobile.scan3d.storageservice.authentication;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.LinkUtil;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class PrivacyActivity extends AuthActivity {
    public static final String EXTRA_PRIVACY = "com.sonymobile.scan3d.extras.PRIVACY";
    public static final String EXTRA_VIEW = "com.sonymobile.scan3d.extras.VIEW_PRIVACY";
    private TextView mDescription;
    private TextView mDisclaimer;
    private TextView mTitle;

    public int getLayoutResource() {
        return R.layout.privacy_layout;
    }

    public PrivacyActivity() {
        super(false);
    }

    public PrivacyActivity(boolean z) {
        super(z);
    }

    private static class PersonalDataAdapter extends ArrayAdapter<PrivacyPolicy.PersonalData> {
        PersonalDataAdapter(Context context, PrivacyPolicy privacyPolicy) {
            super(context, R.layout.component_personal_data_item, privacyPolicy.getPersonalData());
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        @NonNull
        public View getView(int i, @Nullable View view, @NonNull ViewGroup viewGroup) {
            if (view == null) {
                view = LayoutInflater.from(getContext()).inflate(R.layout.component_personal_data_item, viewGroup, false);
            }
            ImageView imageView = (ImageView) view.findViewById(R.id.img_personal_data);
            TextView textView = (TextView) view.findViewById(R.id.txt_personal_data);
            view.setOnClickListener(null);
            PrivacyPolicy.PersonalData item = getItem(i);
            imageView.setImageResource(item.icon);
            textView.setText(item.text);
            return view;
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.AuthActivity, android.app.Activity
    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setContentView(getLayoutResource());
        boolean booleanExtra = getIntent().getBooleanExtra(EXTRA_VIEW, false);
        this.mTitle = (TextView) findViewById(R.id.title_text);
        this.mDescription = (TextView) findViewById(R.id.description_text);
        this.mDisclaimer = (TextView) findViewById(R.id.disclaimer_text);
        Button button = (Button) findViewById(R.id.button_ok);
        if (button != null) {
            if (booleanExtra) {
                button.setText(android.R.string.ok);
            }
            button.setOnClickListener((UserInputReducer.InputReducer) view -> onResultReceived(true, null));
        }
        Button button2 = (Button) findViewById(R.id.button_cancel);
        if (button2 != null) {
            if (booleanExtra) {
                button2.setVisibility(8);
            } else {
                button2.setOnClickListener((UserInputReducer.InputReducer) view -> onResultReceived(false, null));
            }
        }
        PrivacyPolicy signinPrivacy = (PrivacyPolicy) getIntent().getParcelableExtra(EXTRA_PRIVACY);
        if (signinPrivacy == null) {
            signinPrivacy = PrivacyPolicies.getSigninPrivacy();
        }
        setupPrivacyStatement(signinPrivacy);
    }

    private void setupPrivacyStatement(PrivacyPolicy privacyPolicy) {
        this.mTitle.setText(privacyPolicy.getTitle());
        this.mDescription.setText(privacyPolicy.getDescription());
        this.mDisclaimer.setText(createClickableText(privacyPolicy));
        this.mDisclaimer.setMovementMethod(LinkMovementMethod.getInstance());
    }

    private SpannableStringBuilder createClickableText(PrivacyPolicy privacyPolicy) {
        final PersonalDataAdapter personalDataAdapter = new PersonalDataAdapter(this, privacyPolicy);
        UserInputReducer.InputReducer inputReducer = view -> new AlertDialog.Builder(this).setTitle(R.string.personal_data_title).setAdapter(personalDataAdapter, null).setPositiveButton(android.R.string.ok, (dialogInterface, i) -> dialogInterface.dismiss()).create().show();
        return LinkUtil.isUSVariant() ? LinkUtil.createClickableLink(getApplicationContext(), privacyPolicy.getDisclaimer(), inputReducer, view -> launchUrl(getString(R.string.us_privacy_policy_url)), view -> launchUrl(getString(R.string.us_ca_privacy_policy_url))) : LinkUtil.createClickableLink(getApplicationContext(), privacyPolicy.getDisclaimer(), inputReducer, view -> launchUrl(getString(R.string.about_terms_of_use_url)));
    }

    private void launchUrl(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(str));
        startActivity(intent);
    }
}
