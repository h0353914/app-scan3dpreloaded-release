package com.sonymobile.scan3d.widgets;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;

import androidx.annotation.StringRes;

import com.sonymobile.scan3d.R;

public class SphinxProgressDialog extends AlertDialog {
    public SphinxProgressDialog(Context context, @StringRes int textResId, boolean transparentBackground) {
        super(context);
        setContent(context, textResId, transparentBackground);
    }

    public void setContent(Context context, @StringRes int textResId, boolean transparentBackground) {
        View view = LayoutInflater.from(context).inflate(R.layout.sphinx_progress_dialog, null);
        TextView textView = (TextView) view.findViewById(R.id.progress_text);
        textView.setText(textResId);
        ViewGroup content = (ViewGroup) view.findViewById(R.id.dialog_content);
        if (transparentBackground) {
            content.setBackgroundColor(context.getColor(android.R.color.transparent));
        } else {
            content.setBackground(context.getDrawable(R.drawable.progress_dialog_opaque_background));
        }
        setView(view);
    }

    @Override
    public void show() {
        Window window = getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(0));
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        }
        setCanceledOnTouchOutside(false);
        super.show();
    }
}
