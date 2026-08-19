package com.sonymobile.scan3d.utils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

public class SphinxZipCopy {
    private ByteBuffer mInputBuffer;
    private long mNativeHandle;

    static {
        classInit();
    }

    public SphinxZipCopy() {
        mNativeHandle = create();
    }

    private static native void classInit();

    private native long create();

    private native void destroy();

    private native boolean init();

    private boolean next() throws IOException {
        int result = nextChunk();
        if (result < 0) {
            throw new IOException("nextChunk failure in native code");
        }
        return result == 0;
    }

    private native int nextChunk();

    private native void setInputBufferNative(ByteBuffer buffer, String password);

    public native ByteBuffer getOutputBuffer();

    public synchronized void release() {
        mInputBuffer = null;
        if (mNativeHandle != 0) {
            destroy();
            mNativeHandle = 0;
        }
    }

    public native boolean run();

    public void setInputBuffer(ByteBuffer buffer, String password) {
        mInputBuffer = buffer;
        setInputBufferNative(mInputBuffer, password);
    }

    public native void setInputFile(String path, String password);

    public native void setOutputBuffer(String password);

    public native void setOutputFile(String path, String password);

    public InputStream stream() throws IOException {
        return new ZipCopyStream(this);
    }

    private class ZipCopyStream extends InputStream {
        ByteBuffer mBuffer;
        boolean mEnd = false;

        ZipCopyStream(SphinxZipCopy sphinxZipCopy) throws IOException {
            if (init()) {
                refresh();
            } else {
                throw new IOException("Failed to initialize stream");
            }
        }

        private void refresh() throws IOException {
            if (next()) {
                mBuffer = getOutputBuffer();
            } else {
                mEnd = true;
            }
        }

        @Override
        public boolean markSupported() {
            return false;
        }

        @Override
        public int read() throws IOException {
            if (!mEnd && !mBuffer.hasRemaining()) {
                refresh();
            }
            if (mBuffer.hasRemaining()) {
                return mBuffer.get();
            }
            return -1;
        }

        @Override
        public int read(byte[] b, int off, int len) throws IOException {
            if (off < 0 || len < 0 || len > b.length - off) {
                throw new IndexOutOfBoundsException();
            }
            if (!mEnd && !mBuffer.hasRemaining()) {
                refresh();
            }
            len = Math.min(len, mBuffer.remaining());
            if (len > 0) {
                mBuffer.get(b, off, len);
            }
            if (len == 0) {
                len = -1;
            }
            return len;
        }
    }
}
