package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import com.dd.plist.NSDictionary;
import com.dd.plist.NSString;
import com.dd.plist.PropertyListFormatException;
import com.dd.plist.PropertyListParser;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;

/* JADX INFO: loaded from: classes.dex */
public final class PropertiesUtil {
    public static final String PROPERTY_1 = "property_1";
    public static final String PROPERTY_2 = "property_2";
    public static final String PROPERTY_3 = "property_3";
    public static final String PROPERTY_4 = "property_4";
    public static final String PROPERTY_5 = "property_5";
    private static final String SCAN3D_PACKAGE_NAME = "com.sonymobile.scan3d";
    private static PropertiesUtil sInstance;
    private static String sPackageName;
    private NSDictionary mPropertiesDictionary = null;

    public static PropertiesUtil getInstance() {
        if (sInstance == null) {
            sInstance = new PropertiesUtil();
        }
        return sInstance;
    }

    public static void setPackageName(String str) {
        sPackageName = str;
    }

    public static boolean isProductionReady() {
        String str = sPackageName;
        return str != null && str.equals("com.sonymobile.scan3d");
    }

    public String getProperty(String str) {
        if (this.mPropertiesDictionary == null) {
            this.mPropertiesDictionary = loadProperties();
        }
        NSDictionary nSDictionary = this.mPropertiesDictionary;
        if (nSDictionary != null) {
            return ((NSString) nSDictionary.get((Object) str)).getContent();
        }
        return null;
    }

    private PropertiesUtil() {
    }

    private NSDictionary loadProperties() {
        try {
            return (NSDictionary) PropertyListParser.parse(unpack(mergeFiles()));
        } catch (PropertyListFormatException | IOException | ParseException | ParserConfigurationException | SAXException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] unpack(byte[] bArr) throws UnsupportedEncodingException {
        String[] strArrSplit = new String(bArr, StandardCharsets.UTF_8).split(":");
        char[] cArr = new char[strArrSplit.length];
        for (int i = 0; i < strArrSplit.length; i++) {
            cArr[i] = (char) (Integer.parseInt(strArrSplit[i]) - 5);
        }
        return new String(cArr).getBytes(StandardCharsets.UTF_8);
    }

    private byte[] mergeFiles() throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            InputStream resourceAsStream = null;
            try {
                for (String str : new String[]{"properties001", "properties002", "properties003", "properties004"}) {
                    resourceAsStream = getClass().getClassLoader().getResourceAsStream("res/raw/" + str);
                    byte[] bArr = new byte[1024];
                    while (true) {
                        int i = resourceAsStream.read(bArr);
                        if (i <= 0) {
                            break;
                        }
                        byteArrayOutputStream.write(bArr, 0, i);
                    }
                    resourceAsStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (resourceAsStream != null) {
                    resourceAsStream.close();
                }
            }
        } finally {
            byteArrayOutputStream.close();
        }
        return byteArrayOutputStream.toByteArray();
    }
}
