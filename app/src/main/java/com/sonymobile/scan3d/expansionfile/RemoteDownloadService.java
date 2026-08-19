package com.sonymobile.scan3d.expansionfile;

import com.google.android.vending.expansion.downloader.impl.DownloaderService;

public class RemoteDownloadService extends DownloaderService {
    private static final String BASE64_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmZJmj3D1FUAMYQWlyiTX3okE4fdBqYQCJYZTCeB+QuN2WAqYbIQGkDXbhLeY+RZO3G1qDSjwsx8rF2VIGpg3Pm6tBZdmel4PHZndCSM1V2NYGGMAhG/LxgkZN0DOMDVfBQoQZr2FoUnX/e0nlitjf4utDtSadQvhJIQJbdrPpFYX5ognY9PFFp7xO1I+Je0qdLCspfCSE95eM2E3etYEyOmwOrJ3bMZ7Gs05RCl69ONomYBEkfP0kjlFeC3K3TO+C6U7CYQtVPLz3xGHPsgGxjL5XXhaxY2wex+l0GpUa51VNrV5hEm2YyY0zKgr6ALxdKHAxidw2utpsp2pwMiafwIDAQAB";
    private static byte[] SALT;

    static {
        SALT = new byte[]{120, 55, 125, -61, 66, 22, 25, 9, -29, 115, 66, -95, 3, -122, 117, 124, -61, 8, 19, 52};
    }

    @Override
    public String getAlarmReceiverClassName() {
        return RemoteAlarmReceiver.class.getName();
    }

    @Override
    public String getPublicKey() {
        return "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmZJmj3D1FUAMYQWlyiTX3okE4fdBqYQCJYZTCeB+QuN2WAqYbIQGkDXbhLeY+RZO3G1qDSjwsx8rF2VIGpg3Pm6tBZdmel4PHZndCSM1V2NYGGMAhG/LxgkZN0DOMDVfBQoQZr2FoUnX/e0nlitjf4utDtSadQvhJIQJbdrPpFYX5ognY9PFFp7xO1I+Je0qdLCspfCSE95eM2E3etYEyOmwOrJ3bMZ7Gs05RCl69ONomYBEkfP0kjlFeC3K3TO+C6U7CYQtVPLz3xGHPsgGxjL5XXhaxY2wex+l0GpUa51VNrV5hEm2YyY0zKgr6ALxdKHAxidw2utpsp2pwMiafwIDAQAB";
    }

    @Override
    public byte[] getSALT() {
        return SALT;
    }
}
