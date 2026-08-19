package com.sonymobile.scan3d.storageservice.network.synchublib;

/* JADX INFO: loaded from: classes.dex */
public class SphinxContent {
    private String contentId;
    private long creationDate;
    private boolean downloadable;
    private String etag;
    private String feedback;
    private boolean improvement;
    private String name;
    private int policy;
    private float rating;
    private String shareHash;
    private int sharedMeshes;
    private boolean visible;

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public String getETag() {
        return this.etag;
    }

    public void setETag(String str) {
        this.etag = str;
    }

    public String getContentId() {
        return this.contentId;
    }

    public void setContentId(String str) {
        this.contentId = str;
    }

    public String getFeedback() {
        return this.feedback;
    }

    public void setFeedback(String str) {
        this.feedback = str;
    }

    public long getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(long j) {
        this.creationDate = j;
    }

    public float getRating() {
        return this.rating;
    }

    public void setRating(float f) {
        this.rating = f;
    }

    public int getPolicy() {
        return this.policy;
    }

    public void setPolicy(int i) {
        this.policy = i;
    }

    public boolean isVisible() {
        return this.visible;
    }

    public void setVisible(boolean z) {
        this.visible = z;
    }

    public boolean isDownloadable() {
        return this.downloadable;
    }

    public void setDownloadable(boolean z) {
        this.downloadable = z;
    }

    public boolean isImprovement() {
        return this.improvement;
    }

    public void setIsImprovement(boolean z) {
        this.improvement = z;
    }

    public String getShareHash() {
        return this.shareHash;
    }

    public void setShareHash(String str) {
        this.shareHash = str;
    }

    public int getSharedMeshes() {
        return this.sharedMeshes;
    }

    public void setSharedMeshes(int i) {
        this.sharedMeshes = i;
    }
}
