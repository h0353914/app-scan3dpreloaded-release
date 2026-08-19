package com.sonymobile.scan3d.storageservice.network.firebase;

import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class Message {
    static final int CRITICAL_FAILURE = 3;
    private static final int DEFAULT_PROTOCOL_VERSION = 0;
    static final int GENERAL_FAILURE = 2;
    private static final String MESSAGE_AES_KEY = "key";
    private static final String MESSAGE_ID = "message_id";
    private static final String MESSAGE_PROTOCOL_VERSION = "protocol_version";
    private static final String MESSAGE_RECEIVING_REQUEST = "receiving_request";
    private static final String MESSAGE_REQUEST_TYPE = "request_type";
    private static final String MESSAGE_S3_KEY = "s3_key";
    private static final String MESSAGE_SESSION = "session_id";
    private static final String MESSAGE_STATE = "state";
    static final int NO_INPUT_FAILURE = 5;
    static final int START = 0;
    static final int SUCCESS = 1;
    static final int TIMEOUT_FAILURE = 4;
    private static final int UNKNOWN = -1;
    private String mAesKey;
    private String mMessageId;
    private int mProtocolVersion = 0;
    private String mReceivingRequest;
    private String mRequestType;
    private String mS3Key;
    private String mSession;
    private int mState;

    Message() {
    }

    int getState() {
        return this.mState;
    }

    String getSession() {
        return this.mSession;
    }

    String getRequestType() {
        return this.mRequestType;
    }

    String getS3Key() {
        return this.mS3Key;
    }

    String getAesKey() {
        return this.mAesKey;
    }

    String getMessageId() {
        return this.mMessageId;
    }

    int getProtocolVersion() {
        return this.mProtocolVersion;
    }

    String getReceivingRequest() {
        return this.mReceivingRequest;
    }

    static Message from(Map<String, String> map) {
        Message message = new Message();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String value = entry.getValue();
            switch (entry.getKey()) {
                case "request_type":
                    message.mRequestType = value;
                    break;
                case "state":
                    int i = Integer.parseInt(value);
                    switch (i) {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                            message.mState = i;
                            break;
                        default:
                            message.mState = -1;
                            break;
                    }
                    break;
                case "protocol_version":
                    message.mProtocolVersion = Integer.parseInt(value);
                    break;
                case "session_id":
                    message.mSession = value;
                    break;
                case "receiving_request":
                    message.mReceivingRequest = value;
                    break;
                case "message_id":
                    message.mMessageId = value;
                    break;
                case "s3_key":
                    message.mS3Key = value;
                    break;
                case "key":
                    message.mAesKey = value;
                    break;
            }
        }
        return message;
    }
}
