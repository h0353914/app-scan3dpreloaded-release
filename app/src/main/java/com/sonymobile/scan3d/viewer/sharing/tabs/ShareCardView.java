package com.sonymobile.scan3d.viewer.sharing.tabs;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.cardview.widget.CardView;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes2.dex */
public class ShareCardView extends CardView {
    public ShareCardView(@NonNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        setForeground(isEnabled() ? getContext().getDrawable(R.drawable.card_ripple) : new ColorDrawable(1476395007));
    }

    @Override // android.view.View
    public void setEnabled(boolean z) {
        if (z) {
            removeProgressBar();
        }
        setForeground(z ? getContext().getDrawable(R.drawable.card_ripple) : new ColorDrawable(1476395007));
    }

    public void addProgressBar() {
        setForeground(null);
        addView(LayoutInflater.from(getContext()).inflate(R.layout.sharing_card_progress_bar, (ViewGroup) this, false));
    }

    public void removeProgressBar() {
        View viewFindViewById = findViewById(R.id.progress_container);
        if (viewFindViewById != null) {
            removeView(viewFindViewById);
        }
    }
}
