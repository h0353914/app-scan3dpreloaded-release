package com.sonymobile.scan3d;

/* JADX INFO: loaded from: classes.dex */
public class SphinxResourceLookup {
    private final int[][] mMsgIdToResourceLookup = new int[37][];
    private final int[] mButtonIdToResourceLookup = new int[3];
    private final int[] mStageIdToResourceLookup = new int[5];
    private final int[] mSoundResourceLookup = new int[12];

    public SphinxResourceLookup() {
        int[][] iArr = this.mMsgIdToResourceLookup;
        iArr[0] = new int[]{R.string.dialog_break_scanning_hint_too_hot_message};
        iArr[1] = new int[]{R.string.dialog_break_scanning_hint_low_battery_message};
        iArr[2] = new int[]{R.string.dialog_break_scanning_hint_low_storage_message};
        iArr[3] = new int[]{R.string.toast_warning_too_slow};
        iArr[22] = new int[]{R.string.toast_message_init_sculpt_tips};
        iArr[23] = new int[]{R.string.toast_message_init_sculpt_tips_food};
        iArr[4] = new int[]{R.string.toast_warning_too_fast};
        iArr[5] = new int[]{R.string.toast_message_scan_coverage_reminder};
        iArr[6] = new int[]{R.string.toast_message_scan_almost_done};
        iArr[7] = new int[]{R.string.toast_message_uninitialized};
        iArr[8] = new int[]{R.string.toast_message_uninitialized_food};
        iArr[9] = new int[]{R.string.toast_message_face_tutorial_calibration_2};
        iArr[11] = new int[]{R.string.toast_message_face_tutorial_calibration_2};
        iArr[10] = new int[]{R.string.toast_message_food_tutorial_calibration_2};
        iArr[12] = new int[]{R.string.toast_message_face_tutorial_calibration_2};
        iArr[13] = new int[]{R.string.toast_message_resize_blob};
        iArr[14] = new int[]{R.string.toast_message_pre_sculpting};
        iArr[15] = new int[]{R.string.toast_warning_tracking_lost};
        iArr[16] = new int[]{R.string.toast_warning_tracking_lost_food};
        iArr[17] = new int[]{R.string.toast_warning_too_close};
        iArr[24] = new int[]{R.string.toast_warning_long_scan};
        iArr[25] = new int[]{R.string.toast_message_uninitialized_free_form};
        iArr[26] = new int[]{R.string.toast_message_establish_scale_free_form};
        iArr[27] = new int[]{R.string.toast_message_init_sculpt_tips_free_form};
        iArr[28] = new int[]{R.string.toast_warning_tracking_lost_free_form};
        iArr[18] = new int[]{R.string.toast_message_tutorial_frame_target_1, R.string.toast_message_tutorial_frame_target_2, R.string.toast_message_tutorial_frame_target_3};
        iArr[19] = new int[]{R.string.toast_message_tutorial_calibration_1, R.string.toast_message_face_tutorial_calibration_2};
        iArr[20] = new int[]{R.string.toast_message_tutorial_frame_target_1, R.string.toast_message_tutorial_frame_target_2};
        iArr[21] = new int[]{R.string.toast_message_tutorial_calibration_1, R.string.toast_message_head_tutorial_calibration_2, R.string.toast_message_head_tutorial_calibration_3};
        iArr[34] = new int[]{R.string.toast_message_face_tutorial_calibration_2, R.string.toast_message_selfie_tutorial_calibration_2};
        iArr[29] = new int[]{R.string.toast_warning_pacman_wrong_starting_direction};
        iArr[30] = new int[]{R.string.thermal_sphinx_toast_getting_hot};
        iArr[31] = new int[]{R.string.toast_warning_pose_not_stable};
        iArr[32] = new int[]{R.string.toast_message_frame_target_selfie};
        iArr[35] = new int[]{R.string.toast_message_frame_target_selfie_1, R.string.toast_message_frame_target_selfie_2};
        iArr[33] = new int[]{R.string.toast_message_tutorial_calibration_1, R.string.toast_message_food_tutorial_calibration_2};
        int[] iArr2 = this.mSoundResourceLookup;
        iArr2[1] = R.raw.notification;
        iArr2[0] = R.raw.warning;
        iArr2[2] = R.raw.catch_a_dot1;
        iArr2[3] = R.raw.catch_a_dot2;
        iArr2[4] = R.raw.catch_a_dot3;
        iArr2[5] = R.raw.catch_a_dot4;
        iArr2[6] = R.raw.catch_a_dot5;
        iArr2[7] = R.raw.catch_a_dot6;
        iArr2[8] = R.raw.catch_a_dot7;
        iArr2[9] = R.raw.catch_a_dot8;
        iArr2[10] = R.raw.complete_360;
        iArr2[11] = R.raw.big_reveal;
        int[] iArr3 = this.mButtonIdToResourceLookup;
        iArr3[0] = R.string.scan_button_start;
        iArr3[1] = R.string.scan_button_next;
        iArr3[2] = R.string.scan_button_done;
        int[] iArr4 = this.mStageIdToResourceLookup;
        iArr4[0] = R.string.stage_frame;
        iArr4[1] = R.string.stage_calibration;
        iArr4[2] = R.string.stage_calculate;
        iArr4[3] = R.string.stage_adjust_sphere;
        iArr4[4] = R.string.stage_sculpting;
    }

    public int[] getMsgResources(int i) {
        if (i >= 0 && i < 37) {
            return this.mMsgIdToResourceLookup[i];
        }
        throw new IllegalArgumentException("No mapping for the provided Sphinx msg id. Received id=" + i);
    }

    public int getButtonResource(int i) {
        if (i >= 0 && i < 3) {
            return this.mButtonIdToResourceLookup[i];
        }
        throw new IllegalArgumentException("No mapping for the provided Sphinx button id. Received id=" + i);
    }

    public int getStageResource(int i) {
        if (i >= 0 && i < 5) {
            return this.mStageIdToResourceLookup[i];
        }
        throw new IllegalArgumentException("No mapping for the provided Sphinx stage id. Received id=" + i);
    }

    public int getSoundResource(int i) {
        if (i >= 0 && i < 12) {
            return this.mSoundResourceLookup[i];
        }
        throw new IllegalArgumentException("No mapping for the provided Sphinx sound id. Received id=" + i);
    }
}
