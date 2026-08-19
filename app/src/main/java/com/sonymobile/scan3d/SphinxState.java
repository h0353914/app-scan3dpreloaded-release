package com.sonymobile.scan3d;

public enum SphinxState {
    kStateUninitialized,
    kStateInitTrack,
    kStateEstablishScale,
    kStateEstablishScaleLostTrack,
    kStateEstablishScaleDone,
    kStateSculpting,
    kStateSculptingLostTrack,
    kStateStopping,
    kStateSprayPainting,
    kStateSaving,
    kStateDone,
    kStateDestroyed,
    kStateBreakEstablish
}
