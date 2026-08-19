package com.sonymobile.scan3d.storageservice.provider;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import androidx.annotation.VisibleForTesting;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class DatabaseHelper extends SQLiteOpenHelper {
    private static final String CREATE_FILE_TABLE = "CREATE TABLE IF NOT EXISTS file (_id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, created DATETIME DEFAULT CURRENT_TIMESTAMP, thumb_url VARCHAR, url VARCHAR, sync_state INTEGER,log_url VARCHAR, scan_type INTEGER DEFAULT -1, identifier VARCHAR, transfer_flags INTEGER DEFAULT 0, eTag VARCHAR, downloadable BOOLEAN DEFAULT 0, log_transfer_id INTEGER DEFAULT -1, visible BOOLEAN DEFAULT 0, share_hash VARCHAR, is_improvement BOOLEAN DEFAULT 0, rigged_scan_url VARCHAR DEFAULT NULL,riggable BOOLEAN DEFAULT 1, rigged_preview_url VARCHAR DEFAULT NULL, prop_mesh_url VARCHAR DEFAULT NULL, shared_meshes INTEGER DEFAULT 0, UNIQUE (identifier) ON CONFLICT IGNORE)";
    private static final String CREATE_IMPROVEMENT_TABLE = "CREATE TABLE IF NOT EXISTS improvement (_id INTEGER PRIMARY KEY AUTOINCREMENT, s3_key VARCHAR, parent_id INTEGER DEFAULT -1, fail_state INTEGER DEFAULT -1, name VARCHAR, sqs_message_id VARCHAR, improvement_type VARCHAR, created DATETIME DEFAULT CURRENT_TIMESTAMP, scan_type INTEGER DEFAULT 0, file_set_id INTEGER DEFAULT -1, UNIQUE (parent_id, improvement_type) ON CONFLICT IGNORE)";
    private static final String CREATE_UPLOAD_TABLE = "CREATE TABLE IF NOT EXISTS upload (_id INTEGER PRIMARY KEY AUTOINCREMENT, provider VARCHAR, uid VARCHAR, state INTEGER, parent_id INTEGER REFERENCES file (_id) ON DELETE CASCADE, UNIQUE (parent_id, provider) ON CONFLICT IGNORE)";
    private static final String DATABASE_NAME = "contentstorage.db";
    static final int DATABASE_VERSION = 17;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.provider.DatabaseHelper";
    private Context mContext;

    DatabaseHelper(Context context) {
        this(context, DATABASE_NAME);
    }

    @VisibleForTesting
    DatabaseHelper(Context context, String str) {
        super(context, str, (SQLiteDatabase.CursorFactory) null, 17);
        this.mContext = context;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(CREATE_FILE_TABLE);
        sQLiteDatabase.execSQL(CREATE_UPLOAD_TABLE);
        sQLiteDatabase.execSQL(CREATE_IMPROVEMENT_TABLE);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onConfigure(SQLiteDatabase sQLiteDatabase) {
        super.onConfigure(sQLiteDatabase);
        sQLiteDatabase.setForeignKeyConstraintsEnabled(true);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        DebugLog.d(TAG, "onUpgrade(): from " + i + " to " + i2);
        if (i == 1) {
            try {
                try {
                    sQLiteDatabase.beginTransaction();
                    sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN log_url VARCHAR");
                    sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN transfer_flags INTEGER DEFAULT 0");
                    i++;
                    sQLiteDatabase.setTransactionSuccessful();
                } catch (Exception e) {
                    DebugLog.e(TAG, "Failed to upgrade database.", e);
                }
                sQLiteDatabase.endTransaction();
            } catch (Throwable th) {
                sQLiteDatabase.endTransaction();
                throw th;
            }
        }
        if (i == 2) {
            try {
                try {
                    sQLiteDatabase.beginTransaction();
                    sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN sketchfab_uid VARCHAR");
                    i++;
                    sQLiteDatabase.setTransactionSuccessful();
                } catch (Exception e2) {
                    DebugLog.e(TAG, "Failed to upgrade database.", e2);
                }
                sQLiteDatabase.endTransaction();
            } catch (Throwable th2) {
                sQLiteDatabase.endTransaction();
                throw th2;
            }
        }
        if (i == 3) {
            i++;
        }
        try {
            if (i == 4) {
                try {
                    sQLiteDatabase.beginTransaction();
                    sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN sculpteo_uid VARCHAR");
                    sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN print_file_url VARCHAR");
                    i++;
                    sQLiteDatabase.setTransactionSuccessful();
                } catch (Exception e3) {
                    DebugLog.e(TAG, "Failed to upgrade database.", e3);
                }
                sQLiteDatabase.endTransaction();
            }
            if (i == 5) {
                try {
                    try {
                        sQLiteDatabase.beginTransaction();
                        sQLiteDatabase.execSQL(CREATE_UPLOAD_TABLE);
                        i++;
                        sQLiteDatabase.setTransactionSuccessful();
                    } catch (Exception e4) {
                        DebugLog.e(TAG, "Failed to upgrade database.", e4);
                    }
                    sQLiteDatabase.endTransaction();
                } catch (Throwable th3) {
                    sQLiteDatabase.endTransaction();
                    throw th3;
                }
            }
            if (i == 6) {
                try {
                    try {
                        sQLiteDatabase.beginTransaction();
                        sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN policy_mode INTEGER DEFAULT -1");
                        i++;
                        sQLiteDatabase.setTransactionSuccessful();
                    } catch (Exception e5) {
                        DebugLog.e(TAG, "Failed to upgrade database.", e5);
                    }
                    sQLiteDatabase.endTransaction();
                } catch (Throwable th4) {
                    sQLiteDatabase.endTransaction();
                    throw th4;
                }
            }
            if (i == 7 && upgradeTo8(sQLiteDatabase)) {
                i++;
            }
            try {
                if (i == 8) {
                    try {
                        sQLiteDatabase.beginTransaction();
                        sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN share_hash VARCHAR DEFAULT NULL");
                        sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN visible BOOLEAN DEFAULT 0");
                        sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN downloadable BOOLEAN DEFAULT 0");
                        for (IFileSet iFileSet : Factory.create(sQLiteDatabase)) {
                            long id = iFileSet.getId();
                            int syncState = iFileSet.getSyncState();
                            if (iFileSet.isRemote() || !iFileSet.isValid() || syncState == 7) {
                                iFileSet.deleteAllFiles(this.mContext);
                                sQLiteDatabase.delete("file", "_id=?", new String[]{String.valueOf(id)});
                            } else if (iFileSet.getSyncState() != 8) {
                                ContentValues contentValues = new ContentValues(2);
                                contentValues.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, (Integer) 0);
                                contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 0);
                                sQLiteDatabase.update("file", contentValues, "_id=?", new String[]{String.valueOf(id)});
                            }
                        }
                        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS upload");
                        sQLiteDatabase.execSQL(CREATE_UPLOAD_TABLE);
                        i++;
                        sQLiteDatabase.setTransactionSuccessful();
                    } catch (Exception e6) {
                        DebugLog.e(TAG, "Failed to upgrade database.", e6);
                    }
                    sQLiteDatabase.endTransaction();
                }
                try {
                    if (i == 9) {
                        try {
                            sQLiteDatabase.beginTransaction();
                            sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN log_transfer_id INTEGER DEFAULT -1");
                            sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS improvement (_id INTEGER PRIMARY KEY AUTOINCREMENT, s3_key VARCHAR, parent_id INTEGER DEFAULT -1, name VARCHAR, sqs_message_id VARCHAR, improvement_type VARCHAR, scan_type INTEGER DEFAULT 0, file_set_id INTEGER DEFAULT -1, UNIQUE (parent_id, improvement_type) ON CONFLICT IGNORE)");
                            i++;
                            sQLiteDatabase.setTransactionSuccessful();
                        } catch (Exception e7) {
                            DebugLog.e(TAG, "Failed to upgrade database.", e7);
                        }
                        sQLiteDatabase.endTransaction();
                    }
                    if (i == 10) {
                        try {
                            try {
                                sQLiteDatabase.beginTransaction();
                                sQLiteDatabase.execSQL("ALTER TABLE improvement ADD COLUMN fail_state INTEGER DEFAULT -1");
                                i++;
                                sQLiteDatabase.setTransactionSuccessful();
                            } catch (Exception e8) {
                                DebugLog.e(TAG, "Failed to upgrade database.", e8);
                            }
                            sQLiteDatabase.endTransaction();
                        } catch (Throwable th5) {
                            sQLiteDatabase.endTransaction();
                            throw th5;
                        }
                    }
                    if (i == 11) {
                        try {
                            try {
                                sQLiteDatabase.beginTransaction();
                                sQLiteDatabase.execSQL("DROP TABLE IF EXISTS improvement");
                                sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS improvement (_id INTEGER PRIMARY KEY AUTOINCREMENT, s3_key VARCHAR, parent_id INTEGER DEFAULT -1, name VARCHAR, sqs_message_id VARCHAR, improvement_type VARCHAR, fail_state INTEGER DEFAULT -1, scan_type INTEGER DEFAULT 0, created DATETIME DEFAULT CURRENT_TIMESTAMP, file_set_id INTEGER DEFAULT -1, UNIQUE (parent_id, improvement_type) ON CONFLICT IGNORE)");
                                i++;
                                sQLiteDatabase.setTransactionSuccessful();
                            } catch (Exception e9) {
                                DebugLog.e(TAG, "Failed to upgrade database.", e9);
                            }
                            sQLiteDatabase.endTransaction();
                        } catch (Throwable th6) {
                            sQLiteDatabase.endTransaction();
                            throw th6;
                        }
                    }
                    if (i == 12) {
                        try {
                            try {
                                sQLiteDatabase.beginTransaction();
                                sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN is_improvement BOOLEAN DEFAULT 0");
                                i++;
                                sQLiteDatabase.setTransactionSuccessful();
                            } catch (Exception e10) {
                                DebugLog.e(TAG, "Failed to upgrade database.", e10);
                            }
                            sQLiteDatabase.endTransaction();
                        } catch (Throwable th7) {
                            sQLiteDatabase.endTransaction();
                            throw th7;
                        }
                    }
                    try {
                        if (i == 13) {
                            try {
                                sQLiteDatabase.beginTransaction();
                                sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN rigged_scan_url VARCHAR DEFAULT NULL");
                                sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN riggable BOOLEAN DEFAULT 1");
                                i++;
                                sQLiteDatabase.setTransactionSuccessful();
                            } catch (Exception e11) {
                                DebugLog.d(TAG, "Failed to upgrade database.", e11);
                            }
                            sQLiteDatabase.endTransaction();
                        }
                        try {
                            if (i == 14) {
                                try {
                                    sQLiteDatabase.beginTransaction();
                                    sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN rigged_preview_url VARCHAR DEFAULT NULL");
                                    i++;
                                    sQLiteDatabase.setTransactionSuccessful();
                                } catch (Exception e12) {
                                    DebugLog.d(TAG, "Failed to upgrade database.", e12);
                                }
                                sQLiteDatabase.endTransaction();
                            }
                            if (i == 15) {
                                try {
                                    try {
                                        sQLiteDatabase.beginTransaction();
                                        sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN prop_mesh_url VARCHAR DEFAULT NULL");
                                        sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN shared_meshes INTEGER DEFAULT 0");
                                        i++;
                                        sQLiteDatabase.setTransactionSuccessful();
                                    } catch (Exception e13) {
                                        DebugLog.d(TAG, "Failed to upgrade database.", e13);
                                    }
                                    sQLiteDatabase.endTransaction();
                                } catch (Throwable th8) {
                                    sQLiteDatabase.endTransaction();
                                    throw th8;
                                }
                            }
                            try {
                                if (i == 16) {
                                    try {
                                        sQLiteDatabase.beginTransaction();
                                        sQLiteDatabase.delete("upload", "provider!=?", new String[]{ServiceProvider.WEBVIEWER.name()});
                                        sQLiteDatabase.setTransactionSuccessful();
                                    } catch (Exception e14) {
                                        DebugLog.d(TAG, "Failed to upgrade database.", e14);
                                    }
                                }
                            } finally {
                                sQLiteDatabase.endTransaction();
                            }
                        } catch (Throwable th9) {
                            sQLiteDatabase.endTransaction();
                            throw th9;
                        }
                    } catch (Throwable th10) {
                        sQLiteDatabase.endTransaction();
                        throw th10;
                    }
                } catch (Throwable th11) {
                    sQLiteDatabase.endTransaction();
                    throw th11;
                }
            } catch (Throwable th12) {
                sQLiteDatabase.endTransaction();
                throw th12;
            }
        } catch (Throwable th13) {
            sQLiteDatabase.endTransaction();
            throw th13;
        }
    }

    private boolean upgradeTo8(SQLiteDatabase sQLiteDatabase) {
        try {
            sQLiteDatabase.beginTransaction();
            sQLiteDatabase.execSQL("ALTER TABLE file ADD COLUMN scan_type INTEGER DEFAULT -1");
            HashMap<Integer, Integer> map = new HashMap<>();
            map.put(0, 256);
            map.put(10, 256);
            map.put(1, 257);
            map.put(11, 257);
            map.put(3, 512);
            map.put(2, 0);
            map.put(-1, 0);
            for (Map.Entry entry : map.entrySet()) {
                int iIntValue = ((Integer) entry.getKey()).intValue();
                int iIntValue2 = ((Integer) entry.getValue()).intValue();
                ContentValues contentValues = new ContentValues(1);
                contentValues.put("scan_type", Integer.valueOf(iIntValue2));
                sQLiteDatabase.update("file", contentValues, "policy_mode=" + iIntValue, null);
            }
            sQLiteDatabase.setTransactionSuccessful();
            return true;
        } catch (Exception e) {
            DebugLog.e(TAG, "Failed to upgrade database.", e);
            return false;
        } finally {
            sQLiteDatabase.endTransaction();
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        DebugLog.d(TAG, "onDownGrade(): from " + i + " to " + i2);
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS file");
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS upload");
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS improvement");
        onCreate(sQLiteDatabase);
    }
}
