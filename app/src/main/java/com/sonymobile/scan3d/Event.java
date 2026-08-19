package com.sonymobile.scan3d;

class Event {
    static final int CHANGE_FOCUS = 0;
    static final int SURFACE_RECEIVED = 1;
    static final int NEXT_STATE = 3;
    static final int BLOB_SCALE = 4;
    static final int NEXT_DEBUG_MODE = 6;
    static final int SURFACE_DESTROYED = 7;
    static final int RESTART = 9;
    static final int CAMERA_TEMPERATURE_WARNING = 10;
    static final int CAMERA_TEMPERATURE_SHUTDOWN = 11;
    static final int CLEAR_ENV_ERRORS = 12;
    static final int SET_LOCALE_IS_RTL = 13;

    private Object mArg1;
    private Object mArg2;
    private int mType;

    Event(int type) {
        mType = type;
    }

    <T> T getArg1() {
        return (T) mArg1;
    }

    <T> T getArg2() {
        return (T) mArg2;
    }

    int getType() {
        return mType;
    }

    void setArg1(Object arg1) {
        mArg1 = arg1;
    }

    void setArg2(Object arg2) {
        mArg2 = arg2;
    }
}
