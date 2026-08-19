package com.sonymobile.scan3d.viewer.fragments;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.LinkUtil;
import com.sonymobile.scan3d.utils.UserInputReducer;
import com.sonymobile.scan3d.viewer.sharing.tabs.TabPagePrint;
import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public class NoLocalPrintersFragment extends Fragment {
    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(R.layout.fragment_no_printers, viewGroup, false);
        if (Locale.JAPANESE.getISO3Language().equals(Locale.getDefault().getISO3Language())) {
            viewInflate.findViewById(R.id.description_text).setVisibility(4);
        }
        TextView textView = (TextView) viewInflate.findViewById(R.id.description_text);
        textView.setText(LinkUtil.createClickableLink(getContext(), R.string.print_3rd_party_plugins_no_apps_descr, new UserInputReducer.InputReducer() {
            final NoLocalPrintersFragment f$0 = NoLocalPrintersFragment.this; // from class: com.sonymobile.scan3d.viewer.fragments.-$$Lambda$NoLocalPrintersFragment$nvX8EoZgP40e2FCUGNt8HJcXO_s
            @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
            public final void doClick(View view) {
                NoLocalPrintersFragment.lambda$onCreateView$0(this.f$0, view);
            }
        }));
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        viewInflate.findViewById(R.id.btn_action).setOnClickListener(new UserInputReducer.InputReducer() {
            final NoLocalPrintersFragment f$0 = NoLocalPrintersFragment.this; // from class: com.sonymobile.scan3d.viewer.fragments.-$$Lambda$NoLocalPrintersFragment$e_MTCshYu5f5q2qS6PUcKgTt2hU
            @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
            public final void doClick(View view) {
                TabPagePrint.showFragment(this.f$0.getFragmentManager(), PrintPreviewFragment.newInstance());
            }
        });
        final ScrollView scrollView = (ScrollView) viewInflate.findViewById(R.id.scroller);
        scrollView.post(new Runnable() { // from class: com.sonymobile.scan3d.viewer.fragments.-$$Lambda$NoLocalPrintersFragment$NB4p4TKnISt5MJCsLvjZCTYHV4I
            @Override // java.lang.Runnable
            public final void run() {
                scrollView.fullScroll(130);
            }
        });
        return viewInflate;
    }

    public static /* synthetic */ void lambda$onCreateView$0(NoLocalPrintersFragment noLocalPrintersFragment, View view) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(noLocalPrintersFragment.getString(R.string.find_local_printers_url)));
        noLocalPrintersFragment.startActivity(intent);
    }
}
