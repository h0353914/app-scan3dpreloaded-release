package fr.arnaudguyon.xmltojsonlib;

import android.content.Context;
import androidx.annotation.NonNull;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/* JADX INFO: loaded from: classes2.dex */
public class FileReader {
    public static String readFileFromAsset(@NonNull Context context, @NonNull String str) {
        try {
            InputStream inputStreamOpen = context.getAssets().open(str);
            String fileFromInputStream = readFileFromInputStream(inputStreamOpen);
            inputStreamOpen.close();
            return fileFromInputStream;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String readFileFromInputStream(@NonNull InputStream inputStream) {
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        StringBuilder sb = new StringBuilder();
        try {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                sb.append(line);
            }
            return sb.toString();
        } catch (IOException unused) {
            return null;
        } finally {
            try {
                bufferedReader.close();
            } catch (IOException unused2) {
            }
            try {
                inputStreamReader.close();
            } catch (IOException unused3) {
            }
        }
    }
}
