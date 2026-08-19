package com.sonymobile.scan3d.storageservice.network;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.widget.ImageView;
import com.sonymobile.scan3d.logging.DebugLog;

/* JADX INFO: loaded from: classes.dex */
public final class RestApi {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.network.RestApi";

    private RestApi() {
    }

    public static IRestExecutor<Bitmap> getBitmap(Context context, String str, String str2) {
        DebugLog.d(TAG, "getBitmap(): " + str);
        return new AbstractRestExecutor<Void, Bitmap, String>() { // from class: com.sonymobile.scan3d.storageservice.network.RestApi.1
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public Bitmap getOutput(IHttpResponse iHttpResponse) throws Exception {
                if (iHttpResponse.getStatusCode() == 200) {
                    return BitmapFactory.decodeStream(iHttpResponse.getInputStream());
                }
                return null;
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str3, String str4, Void[] voidArr) {
                NetworkRequest networkRequest = new NetworkRequest(str3, NetworkRequest.Method.GET, true);
                networkRequest.addTokenAuthentication(str4);
                return networkRequest;
            }
        }.init(context, str, str2, new Void[0]);
    }

    public static void getBitmapAsync(Context context, String str, String str2, AsyncViewSetter<ImageView, Bitmap> asyncViewSetter) {
        getBitmap(context, str, str2).executeAsync(asyncViewSetter);
    }
}
