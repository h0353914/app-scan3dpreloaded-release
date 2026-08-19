package com.sonymobile.scan3d.storageservice.utils;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.net.NetworkRequest;

import com.sonymobile.scan3d.logging.DebugLog;

public class ConnectionUtils extends ConnectivityManager.NetworkCallback {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.utils.ConnectionUtils";
    private static CustomConnection mCustomConnection;

    private ConnectivityManager mConnectivityManager;
    private ConnectionListener mListener;

    public ConnectionUtils(Context context) {
        mListener = null;
        mConnectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
    }

    private void addListener(ConnectionListener listener, int transportType) {
        if (mListener != null) {
            return;
        }
        NetworkRequest.Builder builder = new NetworkRequest.Builder();
        Network[] networks = mConnectivityManager.getAllNetworks();
        for (Network network : networks) {
            NetworkCapabilities capabilities = mConnectivityManager.getNetworkCapabilities(network);
            if (capabilities.hasTransport(transportType)) {
                builder.addTransportType(transportType);
                break;
            }
        }
        mConnectivityManager.registerNetworkCallback(builder.build(), this);
        mListener = listener;
    }

    private static boolean hasDataConnection(NetworkInfo networkInfo) {
        if (networkInfo == null) {
            DebugLog.d(TAG, "No active network connection.");
            return false;
        }
        DebugLog.d(TAG, "Active network type: " + networkInfo.getTypeName());
        if (!networkInfo.isAvailable()) {
            DebugLog.d(TAG, "Active network is not available!");
            return false;
        }
        if (!networkInfo.isConnected()) {
            DebugLog.d(TAG, "Active network is not connected!");
            return false;
        }
        DebugLog.d(TAG, "Active network is available and connected.");
        return true;
    }

    public static boolean isInternetConnectionAvailable(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
        return networkInfo != null && networkInfo.isConnected();
    }

    public static boolean isWifiConnection(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
        return hasDataConnection(networkInfo) && networkInfo.getType() == ConnectivityManager.TYPE_WIFI;
    }

    public static void setCustomConnection(CustomConnection customConnection) {
        mCustomConnection = customConnection;
    }

    public void addWifiListener(ConnectionListener listener) {
        addListener(listener, NetworkCapabilities.TRANSPORT_WIFI);
    }

    public boolean hasDataConnection() {
        if (mCustomConnection != null) {
            return mCustomConnection.hasDataConnection();
        }
        NetworkInfo networkInfo = mConnectivityManager.getActiveNetworkInfo();
        return hasDataConnection(networkInfo);
    }

    public boolean hasWifiConnection() {
        NetworkInfo networkInfo = mConnectivityManager.getActiveNetworkInfo();
        return hasDataConnection(networkInfo) && networkInfo.getType() == ConnectivityManager.TYPE_WIFI;
    }

    @Override
    public void onAvailable(Network network) {
        if (mListener != null && hasWifiConnection()) {
            mListener.onWifiConnected();
        }
    }

    @Override
    public void onLost(Network network) {
        if (mListener != null && !hasWifiConnection()) {
            mListener.onWifiDisconnected();
        }
    }

    public void removeListener() {
        if (mListener != null) {
            mConnectivityManager.unregisterNetworkCallback(this);
            mListener = null;
        }
    }

    public interface ConnectionListener {
        default void onWifiConnected() {
        }

        default void onWifiDisconnected() {
        }
    }
}
