package com.sonymobile.scan3d.storageservice.provider;

import android.content.UriMatcher;

public class Matcher extends UriMatcher {
    public static final int FILE_RECORDS = 0x1;
    public static final int FILE_RECORD_ID = 0x0;
    public static final int IMPROVEMENT_RECORDS = 0x8;
    public static final int IMPROVEMENT_RECORD_ID = 0x7;
    public static final int UPLOAD_FILE_RECORDS = 0x5;
    public static final int UPLOAD_FILE_RECORD_ID = 0x4;
    public static final int UPLOAD_FILE_RECORD_PROVIDER_ID = 0x6;
    public static final int UPLOAD_RECORDS = 0x3;
    public static final int UPLOAD_RECORD_ID = 0x2;

    public Matcher() {
        super(UriMatcher.NO_MATCH);
        addURI(Contract.AUTHORITY, "model/file/#", FILE_RECORD_ID);
        addURI(Contract.AUTHORITY, "model/file", FILE_RECORDS);
        addURI(Contract.AUTHORITY, "upload/#", UPLOAD_RECORD_ID);
        addURI(Contract.AUTHORITY, "upload", UPLOAD_RECORDS);
        addURI(Contract.AUTHORITY, "model/file/#/upload/#", UPLOAD_FILE_RECORD_ID);
        addURI(Contract.AUTHORITY, "model/file/#/upload", UPLOAD_FILE_RECORDS);
        addURI(Contract.AUTHORITY, "model/file/#/upload/*", UPLOAD_FILE_RECORD_PROVIDER_ID);
        addURI(Contract.AUTHORITY, "improvement/#", IMPROVEMENT_RECORD_ID);
        addURI(Contract.AUTHORITY, "improvement", IMPROVEMENT_RECORDS);
    }
}
