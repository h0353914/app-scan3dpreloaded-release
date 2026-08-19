package com.sonymobile.scan3d.storageservice.authentication;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.TextView;
import android.widget.Toolbar;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.utils.LinkUtil;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class SigninLearnMoreActivity extends Activity {
    private static final String TAG = "SigninLearnMoreActivity";

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setRequestedOrientation(14);
        setContentView(R.layout.signin_learn_more_layout);
        ((Toolbar) findViewById(R.id.toolbar)).setNavigationOnClickListener(new View.OnClickListener() {
            final SigninLearnMoreActivity f$0 = SigninLearnMoreActivity.this; // from class: com.sonymobile.scan3d.storageservice.authentication.-$$Lambda$SigninLearnMoreActivity$1fMdJwn7mg7jrOPP7nWV42UFUeI
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.finishAfterTransition();
            }
        });
        TextView textView = (TextView) findViewById(R.id.learn_more_support_forum_link);
        textView.setText(LinkUtil.createClickableLink(getApplicationContext(), R.string.storage_service_signin_learn_more_workaround_support_forum_txt, new UserInputReducer.InputReducer() {
            final SigninLearnMoreActivity f$0 = SigninLearnMoreActivity.this; // from class: com.sonymobile.scan3d.storageservice.authentication.-$$Lambda$SigninLearnMoreActivity$Ne77jEyDtd8jmPByDRaVlWF_Ze4
            @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
            public final void doClick(View view) {
                SigninLearnMoreActivity.lambda$onCreate$1(this.f$0, view);
            }
        }));
        textView.setMovementMethod(LinkMovementMethod.getInstance());
    }

    public static /* synthetic */ void lambda$onCreate$1(SigninLearnMoreActivity signinLearnMoreActivity, View view) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(signinLearnMoreActivity.getString(R.string.sony_support_forum_url)));
        try {
            signinLearnMoreActivity.startActivity(intent);
        } catch (ActivityNotFoundException unused) {
            DebugLog.d(TAG, "Couldn't find a browser.");
        }
    }

    public static Intent getLaunchIntent(Context context) {
        return new Intent(context, (Class<?>) SigninLearnMoreActivity.class);
    }
}
