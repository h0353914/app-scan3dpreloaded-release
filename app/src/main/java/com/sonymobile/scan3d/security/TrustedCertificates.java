package com.sonymobile.scan3d.security;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public final class TrustedCertificates {
    private static final String SHA1_CERT_ANDROID_DEBUG = "A40BA32043DE84305BD5723CB19562079118AA4E";
    private static final String SHA1_CERT_ANDROID_VANILLA_PLATFORM_SIGNING_TEST = "27196E386B875E76ADF700E7EA84E4C6EEE33DFA";
    private static final String SHA1_CERT_ANDROID_VANILLA_TESTKEY_SIGNING_TEST = "61ED377E85D386A8DFEE6B864BD85B0BFAA5AF81";
    private static final String SHA1_CERT_SONY_ERICSSON_E_APPLICATION_SIGNING_LIVE_864F_1 = "330DF1D4F77968C397FF53D444089BB46DC330F1";
    private static final String SHA1_CERT_SONY_ERICSSON_E_APPLICATION_SIGNING_TEST_DC70_1 = "9E18A094A301AE2A09631635538F5D0D10D43393";
    private static final String SHA1_CERT_SONY_ERICSSON_E_PLATFORM_SIGNING_LIVE_864F_3 = "80D0156E14EFA9B2BE949ACC1791720CC58CB6E3";
    private static final String SHA1_CERT_SONY_ERICSSON_E_PLATFORM_SIGNING_TEST_DC70_3 = "176BABB1F2FCB7150877887596599D5730B168C0";
    private static final String SHA1_CERT_SONY_ERICSSON_IA_SIGNING_LIVE_A989_1 = "6D5C3554B9B301A17B437F98F917A9A44ADADFF9";
    private static final String SHA1_CERT_SONY_ERICSSON_IA_SIGNING_TEST_CD42_1 = "5985C78613CA8B0077004BCC183ABAE6A9B990A4";
    private static Map<String, CertificateInfo> TRUSTED_CERTS;
    private static CertificateInfo sOwnPackageCertificateInfo;

    static {
        TRUSTED_CERTS = new HashMap<>();
        sOwnPackageCertificateInfo = null;
        TRUSTED_CERTS.put(SHA1_CERT_SONY_ERICSSON_IA_SIGNING_LIVE_A989_1, new CertificateInfo(true));
        TRUSTED_CERTS.put(SHA1_CERT_SONY_ERICSSON_IA_SIGNING_TEST_CD42_1, new CertificateInfo(false));
        TRUSTED_CERTS.put(SHA1_CERT_SONY_ERICSSON_E_APPLICATION_SIGNING_LIVE_864F_1, new CertificateInfo(true));
        TRUSTED_CERTS.put(SHA1_CERT_SONY_ERICSSON_E_APPLICATION_SIGNING_TEST_DC70_1, new CertificateInfo(false));
        TRUSTED_CERTS.put(SHA1_CERT_SONY_ERICSSON_E_PLATFORM_SIGNING_LIVE_864F_3, new CertificateInfo(true));
        TRUSTED_CERTS.put(SHA1_CERT_SONY_ERICSSON_E_PLATFORM_SIGNING_TEST_DC70_3, new CertificateInfo(false));
        TRUSTED_CERTS.put(SHA1_CERT_ANDROID_VANILLA_TESTKEY_SIGNING_TEST, new CertificateInfo(false));
        TRUSTED_CERTS.put(SHA1_CERT_ANDROID_VANILLA_PLATFORM_SIGNING_TEST, new CertificateInfo(false));
        TRUSTED_CERTS.put(SHA1_CERT_ANDROID_DEBUG, new CertificateInfo(false));
    }

    private TrustedCertificates() {
    }

    public static boolean isOwnPackageLiveSigned(Context context) {
        PackageManager pm = context.getPackageManager();
        if (sOwnPackageCertificateInfo == null) {
            try {
                PackageInfo packageInfo = pm.getPackageInfo(context.getPackageName(), 0x40);
                sOwnPackageCertificateInfo = lookup(packageInfo);
            } catch (PackageManager.NameNotFoundException e) {
                return false;
            }
        }
        return sOwnPackageCertificateInfo != null && sOwnPackageCertificateInfo.isLive();
    }

    public static boolean isPackageTrusted(Context context, String callingPackage, StringBuilder log) throws SecurityException {
        if (callingPackage == null) {
            if (log != null) {
                log.append("null callingPackage");
            }
            return false;
        }
        PackageManager pm = context.getPackageManager();
        try {
            PackageInfo callingPackageInfo = pm.getPackageInfo(callingPackage, 0x40);
            CertificateInfo callingCertInfo = lookup(callingPackageInfo);
            if (log != null && callingCertInfo == null) {
                log.append("null PackageInfo for calling package: '");
                log.append(callingPackage);
                log.append("'");
                return false;
            }
            if (sOwnPackageCertificateInfo == null) {
                callingPackage = context.getPackageName();
                PackageInfo ownPackageInfo = pm.getPackageInfo(callingPackage, 0x40);
                sOwnPackageCertificateInfo = lookup(ownPackageInfo);
                if (log != null && sOwnPackageCertificateInfo == null) {
                    log.append("null PackageInfo for own package: '");
                    log.append(callingPackage);
                    log.append("'");
                    return false;
                }
            }
            if (log != null && !callingCertInfo.isLive()) {
                String status = sOwnPackageCertificateInfo.isLive() ? "live" : "not live";
                log.append("Non-live priv certificate, unpriv is: ");
                log.append(status);
            }
            boolean trusted = false;
            if (callingCertInfo != null && sOwnPackageCertificateInfo != null) {
                if (!sOwnPackageCertificateInfo.isLive() || callingCertInfo.isLive()) {
                    trusted = true;
                }
            }
            return trusted;
        } catch (PackageManager.NameNotFoundException e) {
            if (log != null) {
                log.append("NameNotFoundException for '");
                log.append(callingPackage);
                log.append("'");
            }
            return false;
        }
    }

    private static CertificateInfo lookup(PackageInfo packageInfo) {
        CertificateInfo result = null;
        try {
            Signature[] signatures = packageInfo.signatures;
            if (signatures.length >= 1) {
                result = lookup(signatures[0]);
            }
        } catch (NoSuchAlgorithmException e) {
        }
        return result;
    }

    private static CertificateInfo lookup(Signature signature) throws NoSuchAlgorithmException {
        byte[] bytes = signature.toByteArray();
        MessageDigest digest = MessageDigest.getInstance("SHA1");
        byte[] hash = digest.digest(bytes);
        String hex = new BigInteger(1, hash).toString(16);
        return TRUSTED_CERTS.get(hex.toUpperCase(Locale.getDefault()));
    }

    private static class CertificateInfo {
        private final boolean mIsLive;

        public CertificateInfo(boolean isLive) {
            mIsLive = isLive;
        }

        public boolean isLive() {
            return mIsLive;
        }
    }
}
