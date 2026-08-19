package com.sonymobile.scan3d.recording;

import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicLong;

public interface AudioSource {
    void done();

    void init();

    int write(ByteBuffer buffer, AtomicLong presentationTimeUs);
}
