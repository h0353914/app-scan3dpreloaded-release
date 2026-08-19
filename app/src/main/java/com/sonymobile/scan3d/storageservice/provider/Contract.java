package com.sonymobile.scan3d.storageservice.provider;

import android.net.Uri;
import android.provider.BaseColumns;

public final class Contract {
    public static final String AUTHORITY = "com.sonymobile.scan3d.storageprovider";
    public static final Uri BASE_URI;
    public static final long INVALID_DATABASE_ID = -0x1L;

    static {
        BASE_URI = new Uri.Builder()
                .scheme("content")
                .authority(AUTHORITY)
                .build();
    }

    public static final class FileRecord implements BaseColumns {
        public static final String COLUMN_CREATED = "created";
        public static final String COLUMN_DOWNLOADABLE = "downloadable";
        public static final String COLUMN_ETAG = "eTag";
        public static final String COLUMN_IDENTIFIER = "identifier";
        public static final String COLUMN_IMPROVEMENT = "is_improvement";
        public static final String COLUMN_IS_RIGGABLE = "riggable";
        public static final String COLUMN_LOG_TRANSFER_ID = "log_transfer_id";
        public static final String COLUMN_LOG_URL = "log_url";
        public static final String COLUMN_NAME = "name";
        public static final String COLUMN_PROP_MESH_URL = "prop_mesh_url";
        public static final String COLUMN_RIGGED_PREVIEW_URL = "rigged_preview_url";
        public static final String COLUMN_RIGGED_SCAN_URL = "rigged_scan_url";
        public static final String COLUMN_SCAN_TYPE = "scan_type";
        public static final String COLUMN_SHARED_MESHES = "shared_meshes";
        public static final String COLUMN_SHARE_HASH = "share_hash";
        public static final String COLUMN_SYNC_STATE = "sync_state";
        public static final String COLUMN_THUMBNAIL_URL = "thumb_url";
        public static final String COLUMN_TRANSFER_FLAGS = "transfer_flags";
        public static final String COLUMN_URL = "url";
        public static final String COLUMN_VISIBLE = "visible";
        public static final Uri CONTENT_URI;
        public static final int DELETED_FILE = 0x7;
        public static final String DIR = "model/file";
        public static final int DOWNLOADING_FILE = 0x4;
        public static final int EXAMPLE_SCAN = 0x8;
        public static final int FLAG_LOG_UPLOADED = 0x8;
        public static final int FLAG_METADATA_UPLOADED = 0x20;
        public static final int FLAG_PREVIEW_DOWNLOADED = 0x2;
        public static final int FLAG_PREVIEW_UPLOADED = 0x10;
        public static final int FLAG_SCAN_DOWNLOADED = 0x1;
        public static final int FLAG_SCAN_UPLOADED = 0x4;
        public static final int LOCAL_FILE = 0x0;
        public static final int METADATA_CHANGED = 0x6;
        public static final String MIME_DIR = "vnd.android.cursor.dir/file";
        public static final String MIME_ITEM = "vnd.android.cursor.item/file";
        public static final int NEW_IMPROVEMENT = 0xa;
        public static final int NEW_SCAN = 0x9;
        public static final int SERVER_FILE = 0x1;
        public static final int SYNCED_FILE = 0x2;
        public static final String TABLE_NAME = "file";
        public static final int UPLOADING_FILE = 0x3;

        static {
            CONTENT_URI = Uri.withAppendedPath(BASE_URI, DIR);
        }
    }

    public static final class ImprovementRecord implements BaseColumns {
        public static final String COLUMN_CREATED = "created";
        public static final String COLUMN_FAIL_STATE = "fail_state";
        public static final String COLUMN_FILE_SET_ID = "file_set_id";
        public static final String COLUMN_IMPROVEMENT_TYPE = "improvement_type";
        public static final String COLUMN_NAME = "name";
        public static final String COLUMN_PARENT_ID = "parent_id";
        public static final String COLUMN_S3_KEY = "s3_key";
        public static final String COLUMN_SCAN_TYPE = "scan_type";
        public static final String COLUMN_SQS_MESSAGE_ID = "sqs_message_id";
        public static final Uri CONTENT_URI;
        public static final String DIR = "improvement";
        public static final int GENERAL_FAILURE = 0x1;
        public static final String MIME_DIR = "vnd.android.cursor.dir/scan_improvement";
        public static final String MIME_ITEM = "vnd.android.cursor.item/scan_improvement";
        public static final int NO_FAILURE = -0x1;
        public static final int PERMANENT_FAILURE = 0x2;
        public static final String TABLE_NAME = "improvement";

        static {
            CONTENT_URI = Uri.withAppendedPath(BASE_URI, DIR);
        }
    }

    public static final class UploadRecord implements BaseColumns {
        public static final String COLUMN_PARENT_ID = "parent_id";
        public static final String COLUMN_PROVIDER = "provider";
        public static final String COLUMN_STATE = "state";
        public static final String COLUMN_UID = "uid";
        public static final Uri CONTENT_URI;
        public static final String DIR = "upload";
        public static final String MIME_DIR = "vnd.android.cursor.dir/scan_upload";
        public static final String MIME_ITEM = "vnd.android.cursor.item/scan_upload";
        public static final int STATE_FAILED = 0x3;
        public static final int STATE_NOT_STARTED = -0x1;
        public static final int STATE_PENDING = 0x0;
        public static final int STATE_RUNNING = 0x1;
        public static final int STATE_SUCCESS = 0x2;
        public static final String TABLE_NAME = "upload";

        static {
            CONTENT_URI = Uri.withAppendedPath(BASE_URI, DIR);
        }
    }
}
