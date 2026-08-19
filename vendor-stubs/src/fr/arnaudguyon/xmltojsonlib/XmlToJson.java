package fr.arnaudguyon.xmltojsonlib;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* JADX INFO: loaded from: classes2.dex */
public class XmlToJson {
    private static final String DEFAULT_CONTENT_NAME = "content";
    private static final String DEFAULT_ENCODING = "utf-8";
    private static final String DEFAULT_INDENTATION = "   ";
    private static final String TAG = "XmlToJson";
    private HashMap<String, String> mAttributeNameReplacements;
    private HashMap<String, String> mContentNameReplacements;
    private HashSet<String> mForceListPaths;
    private HashSet<String> mForceStringForPath;
    private String mIndentationPattern;
    private String mInputEncoding;
    private InputStream mInputStreamSource;
    private JSONObject mJsonObject;
    private HashSet<String> mSkippedAttributes;
    private HashSet<String> mSkippedTags;
    private StringReader mStringSource;

    public static class Builder {
        private HashMap<String, String> mAttributeNameReplacements;
        private HashMap<String, String> mContentNameReplacements;
        private HashSet<String> mForceListPaths;
        private HashSet<String> mForceStringForPath;
        private String mInputEncoding;
        private InputStream mInputStreamSource;
        private HashSet<String> mSkippedAttributes;
        private HashSet<String> mSkippedTags;
        private StringReader mStringSource;

        public Builder(@NonNull String str) {
            this.mInputEncoding = XmlToJson.DEFAULT_ENCODING;
            this.mForceListPaths = new HashSet<>();
            this.mAttributeNameReplacements = new HashMap<>();
            this.mContentNameReplacements = new HashMap<>();
            this.mForceStringForPath = new HashSet<>();
            this.mSkippedAttributes = new HashSet<>();
            this.mSkippedTags = new HashSet<>();
            this.mStringSource = new StringReader(str);
        }

        public Builder(@NonNull InputStream inputStream, @Nullable String str) {
            this.mInputEncoding = XmlToJson.DEFAULT_ENCODING;
            this.mForceListPaths = new HashSet<>();
            this.mAttributeNameReplacements = new HashMap<>();
            this.mContentNameReplacements = new HashMap<>();
            this.mForceStringForPath = new HashSet<>();
            this.mSkippedAttributes = new HashSet<>();
            this.mSkippedTags = new HashSet<>();
            this.mInputStreamSource = inputStream;
            this.mInputEncoding = str == null ? XmlToJson.DEFAULT_ENCODING : str;
        }

        public Builder forceList(@NonNull String str) {
            this.mForceListPaths.add(str);
            return this;
        }

        public Builder setAttributeName(@NonNull String str, @NonNull String str2) {
            this.mAttributeNameReplacements.put(str, str2);
            return this;
        }

        public Builder setContentName(@NonNull String str, @NonNull String str2) {
            this.mContentNameReplacements.put(str, str2);
            return this;
        }

        public Builder forceStringForPath(@NonNull String str) {
            this.mForceStringForPath.add(str);
            return this;
        }

        public Builder skipTag(@NonNull String str) {
            this.mSkippedTags.add(str);
            return this;
        }

        public Builder skipAttribute(@NonNull String str) {
            this.mSkippedAttributes.add(str);
            return this;
        }

        public XmlToJson build() {
            return new XmlToJson(this);
        }
    }

    private XmlToJson(Builder builder) {
        this.mIndentationPattern = DEFAULT_INDENTATION;
        this.mSkippedAttributes = new HashSet<>();
        this.mSkippedTags = new HashSet<>();
        this.mStringSource = builder.mStringSource;
        this.mInputStreamSource = builder.mInputStreamSource;
        this.mInputEncoding = builder.mInputEncoding;
        this.mForceListPaths = builder.mForceListPaths;
        this.mAttributeNameReplacements = builder.mAttributeNameReplacements;
        this.mContentNameReplacements = builder.mContentNameReplacements;
        this.mForceStringForPath = builder.mForceStringForPath;
        this.mSkippedAttributes = builder.mSkippedAttributes;
        this.mSkippedTags = builder.mSkippedTags;
        this.mJsonObject = convertToJSONObject();
    }

    @Nullable
    public JSONObject toJson() {
        return this.mJsonObject;
    }

    @Nullable
    private JSONObject convertToJSONObject() {
        try {
            Tag tag = new Tag("", "xml");
            XmlPullParserFactory xmlPullParserFactoryNewInstance = XmlPullParserFactory.newInstance();
            xmlPullParserFactoryNewInstance.setNamespaceAware(false);
            XmlPullParser xmlPullParserNewPullParser = xmlPullParserFactoryNewInstance.newPullParser();
            setInput(xmlPullParserNewPullParser);
            for (int eventType = xmlPullParserNewPullParser.getEventType(); eventType != 0; eventType = xmlPullParserNewPullParser.next()) {
            }
            readTags(tag, xmlPullParserNewPullParser);
            unsetInput();
            return convertTagToJson(tag, false);
        } catch (IOException | XmlPullParserException e) {
            e.printStackTrace();
            return null;
        }
    }

    private void setInput(XmlPullParser xmlPullParser) {
        StringReader stringReader = this.mStringSource;
        if (stringReader != null) {
            try {
                xmlPullParser.setInput(stringReader);
                return;
            } catch (XmlPullParserException e) {
                e.printStackTrace();
                return;
            }
        }
        try {
            xmlPullParser.setInput(this.mInputStreamSource, this.mInputEncoding);
        } catch (XmlPullParserException e2) {
            e2.printStackTrace();
        }
    }

    private void unsetInput() {
        StringReader stringReader = this.mStringSource;
        if (stringReader != null) {
            stringReader.close();
        }
    }

    private void readTags(Tag tag, XmlPullParser xmlPullParser) {
        int next;
        do {
            try {
                next = xmlPullParser.next();
                if (next == 2) {
                    String name = xmlPullParser.getName();
                    String str = tag.getPath() + "/" + name;
                    boolean zContains = this.mSkippedTags.contains(str);
                    Tag tag2 = new Tag(str, name);
                    if (!zContains) {
                        tag.addChild(tag2);
                    }
                    int attributeCount = xmlPullParser.getAttributeCount();
                    for (int i = 0; i < attributeCount; i++) {
                        String attributeName = xmlPullParser.getAttributeName(i);
                        String attributeValue = xmlPullParser.getAttributeValue(i);
                        String str2 = tag.getPath() + "/" + tag2.getName() + "/" + attributeName;
                        if (!this.mSkippedAttributes.contains(str2)) {
                            Tag tag3 = new Tag(str2, getAttributeNameReplacement(str2, attributeName));
                            tag3.setContent(attributeValue);
                            tag2.addChild(tag3);
                        }
                    }
                    readTags(tag2, xmlPullParser);
                } else if (next == 4) {
                    tag.setContent(xmlPullParser.getText());
                } else {
                    if (next == 3) {
                        return;
                    }
                    Log.i(TAG, "unknown xml eventType " + next);
                }
            } catch (IOException | NullPointerException | XmlPullParserException e) {
                e.printStackTrace();
                return;
            }
        } while (next != 1);
    }

    private JSONObject convertTagToJson(Tag tag, boolean z) {
        JSONObject jSONObject = new JSONObject();
        if (tag.getContent() != null) {
            String path = tag.getPath();
            putContent(path, jSONObject, getContentNameReplacement(path, "content"), tag.getContent());
        }
        try {
            for (ArrayList<Tag> arrayList : tag.getGroupedElements().values()) {
                if (arrayList.size() == 1) {
                    Tag tag2 = arrayList.get(0);
                    if (isForcedList(tag2)) {
                        JSONArray jSONArray = new JSONArray();
                        jSONArray.put(convertTagToJson(tag2, true));
                        jSONObject.put(tag2.getName(), jSONArray);
                    } else if (tag2.hasChildren()) {
                        jSONObject.put(tag2.getName(), convertTagToJson(tag2, false));
                    } else {
                        putContent(tag2.getPath(), jSONObject, tag2.getName(), tag2.getContent());
                    }
                } else {
                    JSONArray jSONArray2 = new JSONArray();
                    Iterator<Tag> it = arrayList.iterator();
                    while (it.hasNext()) {
                        jSONArray2.put(convertTagToJson(it.next(), true));
                    }
                    jSONObject.put(arrayList.get(0).getName(), jSONArray2);
                }
            }
            return jSONObject;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }

    private void putContent(String str, JSONObject jSONObject, String str2, String str3) {
        if (str3 != null) {
            try {
                if (this.mForceStringForPath.contains(str)) {
                    jSONObject.put(str2, str3);
                } else if (str3.equalsIgnoreCase("true")) {
                    jSONObject.put(str2, true);
                } else if (str3.equalsIgnoreCase("false")) {
                    jSONObject.put(str2, false);
                } else {
                    try {
                        try {
                            jSONObject.put(str2, Integer.valueOf(Integer.parseInt(str3)));
                        } catch (NumberFormatException unused) {
                            jSONObject.put(str2, str3);
                        }
                    } catch (NumberFormatException unused2) {
                        jSONObject.put(str2, Double.valueOf(Double.parseDouble(str3)).doubleValue());
                    }
                }
            } catch (JSONException unused3) {
            }
        }
    }

    private boolean isForcedList(Tag tag) {
        return this.mForceListPaths.contains(tag.getPath());
    }

    private String getAttributeNameReplacement(String str, String str2) {
        String str3 = this.mAttributeNameReplacements.get(str);
        return str3 != null ? str3 : str2;
    }

    private String getContentNameReplacement(String str, String str2) {
        String str3 = this.mContentNameReplacements.get(str);
        return str3 != null ? str3 : str2;
    }

    public String toString() {
        JSONObject jSONObject = this.mJsonObject;
        if (jSONObject != null) {
            return jSONObject.toString();
        }
        return null;
    }

    public String toFormattedString(@Nullable String str) {
        if (str == null) {
            this.mIndentationPattern = DEFAULT_INDENTATION;
        } else {
            this.mIndentationPattern = str;
        }
        return toFormattedString();
    }

    public String toFormattedString() {
        if (this.mJsonObject == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("{\n");
        format(this.mJsonObject, sb, "");
        sb.append("}\n");
        return sb.toString();
    }

    private void format(JSONObject jSONObject, StringBuilder sb, String str) {
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            sb.append(str);
            sb.append(this.mIndentationPattern);
            sb.append("\"");
            sb.append(next);
            sb.append("\": ");
            Object objOpt = jSONObject.opt(next);
            if (objOpt instanceof JSONObject) {
                sb.append(str);
                sb.append("{\n");
                format((JSONObject) objOpt, sb, str + this.mIndentationPattern);
                sb.append(str);
                sb.append(this.mIndentationPattern);
                sb.append("}");
            } else if (objOpt instanceof JSONArray) {
                formatArray((JSONArray) objOpt, sb, str + this.mIndentationPattern);
            } else {
                formatValue(objOpt, sb);
            }
            if (itKeys.hasNext()) {
                sb.append(",\n");
            } else {
                sb.append(IOUtils.LINE_SEPARATOR_UNIX);
            }
        }
    }

    private void formatArray(JSONArray jSONArray, StringBuilder sb, String str) {
        sb.append("[\n");
        for (int i = 0; i < jSONArray.length(); i++) {
            Object objOpt = jSONArray.opt(i);
            if (objOpt instanceof JSONObject) {
                sb.append(str);
                sb.append(this.mIndentationPattern);
                sb.append("{\n");
                format((JSONObject) objOpt, sb, str + this.mIndentationPattern);
                sb.append(str);
                sb.append(this.mIndentationPattern);
                sb.append("}");
            } else if (objOpt instanceof JSONArray) {
                formatArray((JSONArray) objOpt, sb, str + this.mIndentationPattern);
            } else {
                formatValue(objOpt, sb);
            }
            if (i < jSONArray.length() - 1) {
                sb.append(",");
            }
            sb.append(IOUtils.LINE_SEPARATOR_UNIX);
        }
        sb.append(str);
        sb.append("]");
    }

    private void formatValue(Object obj, StringBuilder sb) {
        if (obj instanceof String) {
            sb.append("\"");
            sb.append((String) obj);
            sb.append("\"");
        } else {
            if (obj instanceof Long) {
                sb.append((Long) obj);
                return;
            }
            if (obj instanceof Integer) {
                sb.append((Integer) obj);
                return;
            }
            if (obj instanceof Boolean) {
                sb.append((Boolean) obj);
            } else if (obj instanceof Double) {
                sb.append((Double) obj);
            } else {
                sb.append(obj.toString());
            }
        }
    }
}
