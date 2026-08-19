package com.sonymobile.scan3d.utils;

import android.os.Handler;
import android.view.View;

public class UserInputReducer {
    private static final int INPUT_DELAY = 200;
    private static final Runnable sEnableInput = () -> sEnabled = true;
    private static boolean sEnabled = true;

    public interface InputReducer extends View.OnClickListener {
        void doClick(View view);

        default void onClick(View view) {
            if (sEnabled) {
                sEnabled = false;
                doClick(view);
                new Handler().postDelayed(sEnableInput, INPUT_DELAY);
            }
        }
    }
}
