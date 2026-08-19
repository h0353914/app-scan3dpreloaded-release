package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class CleanUpTask extends Task {
    private static final int MAX_AGE_IMPROVEMENT = 1;
    private static final long MAX_SIZE = 1073741824;
    private List<Candidate> mCandidates;
    private long mTotalSize;

    private static class Candidate {
        private final File mFile;
        private final Uri mUri;

        Candidate(IFileSet iFileSet) {
            this.mUri = iFileSet.getUri();
            String logUrl = iFileSet.getLogUrl();
            if (!TextUtils.isEmpty(logUrl)) {
                this.mFile = new File(logUrl);
            } else {
                this.mFile = null;
            }
        }

        boolean isValid(Context context) {
            File file = this.mFile;
            if (file == null || !file.exists()) {
                return false;
            }
            return Factory.getImprovements(context, this.mUri).isEmpty();
        }

        boolean delete() {
            return this.mFile.delete();
        }

        long size() {
            return this.mFile.length();
        }

        long modified() {
            return this.mFile.lastModified();
        }

        Uri getUri() {
            return this.mUri;
        }
    }

    CleanUpTask(TaskService taskService, JobParameters jobParameters) {
        super(taskService, jobParameters, false, false);
        this.mTotalSize = 0L;
        this.mCandidates = new ArrayList();
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    void doWork(Context context, JobParameters jobParameters) {
        Iterator<IFileSet> it = Factory.create(context, null, null).iterator();
        while (it.hasNext()) {
            Candidate candidate = new Candidate(it.next());
            if (candidate.isValid(context)) {
                addCandidate(candidate);
            }
        }
        this.mCandidates.sort((candidate, candidate2) -> (int) (candidate2.modified() - candidate.modified()));
        while (this.mTotalSize >= 1073741824 && removeCandidate(context)) {
        }
        this.mCandidates.clear();
        this.mCandidates = null;
        handleOldImprovements(context);
    }

    private void addCandidate(Candidate candidate) {
        if (this.mCandidates.add(candidate)) {
            this.mTotalSize += candidate.size();
        }
    }

    private boolean removeCandidate(Context context) {
        if (this.mCandidates.size() <= 0) {
            return false;
        }
        Candidate candidateRemove = this.mCandidates.remove(0);
        long size = candidateRemove.size();
        Uri uri = candidateRemove.getUri();
        if (!candidateRemove.delete()) {
            return false;
        }
        this.mTotalSize -= size;
        ContentValues contentValues = new ContentValues(1);
        contentValues.put(Contract.FileRecord.COLUMN_LOG_URL, (String) null);
        return context.getContentResolver().update(uri, contentValues, null, null) > 0;
    }

    private static void handleOldImprovements(Context context) {
        for (Improvement improvement : Factory.getImprovements(context, 1)) {
            if (improvement.isFailed() || improvement.isWaiting()) {
                ContentValues contentValues = new ContentValues(1);
                contentValues.put(Contract.ImprovementRecord.COLUMN_FAIL_STATE, (Integer) 1);
                context.getContentResolver().update(improvement.getUri(), contentValues, null, null);
            } else if (improvement.isDownloadable()) {
                Jobs.requestReceiveImprovementJob(context);
            } else {
                Jobs.scheduleNotificationUpdate(context);
            }
        }
    }
}
