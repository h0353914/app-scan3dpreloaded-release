package fr.arnaudguyon.xmltojsonlib;

import android.util.Xml;
import androidx.annotation.IntRange;
import androidx.annotation.NonNull;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xmlpull.v1.XmlSerializer;

/* JADX INFO: loaded from: classes2.dex */
public class JsonToXml {
    private static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("0", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
    private static final int DEFAULT_INDENTATION = 3;
    private HashSet<String> mForcedAttributes;
    private HashSet<String> mForcedContent;
    private JSONObject mJson;

    public static class Builder {
        private HashSet<String> mForcedAttributes;
        private HashSet<String> mForcedContent;
        private JSONObject mJson;

        public Builder(@NonNull JSONObject jSONObject) {
            this.mForcedAttributes = new HashSet<>();
            this.mForcedContent = new HashSet<>();
            this.mJson = jSONObject;
        }

        public Builder(@NonNull InputStream inputStream) {
            this(FileReader.readFileFromInputStream(inputStream));
        }

        public Builder(String str) {
            this.mForcedAttributes = new HashSet<>();
            this.mForcedContent = new HashSet<>();
            try {
                this.mJson = new JSONObject(str);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        public Builder forceAttribute(String str) {
            this.mForcedAttributes.add(str);
            return this;
        }

        public Builder forceContent(String str) {
            this.mForcedContent.add(str);
            return this;
        }

        public JsonToXml build() {
            return new JsonToXml(this.mJson, this.mForcedAttributes, this.mForcedContent);
        }
    }

    private JsonToXml(@NonNull JSONObject jSONObject, @NonNull HashSet<String> hashSet, HashSet<String> hashSet2) {
        this.mJson = jSONObject;
        this.mForcedAttributes = hashSet;
        this.mForcedContent = hashSet2;
    }

    public String toString() {
        Node node = new Node(null, "");
        prepareObject(node, this.mJson);
        return nodeToXML(node);
    }

    public String toFormattedString() {
        return toFormattedString(3);
    }

    public String toFormattedString(@IntRange(from = 0) int i) {
        try {
            StreamSource streamSource = new StreamSource(new StringReader(toString()));
            StreamResult streamResult = new StreamResult(new StringWriter());
            Transformer transformerNewTransformer = TransformerFactory.newInstance().newTransformer();
            transformerNewTransformer.setOutputProperty("indent", "yes");
            transformerNewTransformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "" + i);
            transformerNewTransformer.transform(streamSource, streamResult);
            return streamResult.getWriter().toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private String nodeToXML(Node node) {
        XmlSerializer xmlSerializerNewSerializer = Xml.newSerializer();
        StringWriter stringWriter = new StringWriter();
        try {
            xmlSerializerNewSerializer.setOutput(stringWriter);
            xmlSerializerNewSerializer.startDocument("UTF-8", true);
            nodeToXml(xmlSerializerNewSerializer, node);
            xmlSerializerNewSerializer.endDocument();
            return stringWriter.toString();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void nodeToXml(XmlSerializer xmlSerializer, Node node) throws IOException {
        String name = node.getName();
        if (name != null) {
            xmlSerializer.startTag("", name);
            for (Node.Attribute attribute : node.getAttributes()) {
                xmlSerializer.attribute("", attribute.mKey, attribute.mValue);
            }
            String content = node.getContent();
            if (content != null) {
                xmlSerializer.text(content);
            }
        }
        Iterator<Node> it = node.getChildren().iterator();
        while (it.hasNext()) {
            nodeToXml(xmlSerializer, it.next());
        }
        if (name != null) {
            xmlSerializer.endTag("", name);
        }
    }

    private void prepareObject(Node node, JSONObject jSONObject) {
        String string;
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Object objOpt = jSONObject.opt(next);
            if (objOpt != null) {
                if (objOpt instanceof JSONObject) {
                    Node node2 = new Node(next, node.getPath() + "/" + next);
                    node.addChild(node2);
                    prepareObject(node2, (JSONObject) objOpt);
                } else if (objOpt instanceof JSONArray) {
                    prepareArray(node, next, (JSONArray) objOpt);
                } else {
                    String str = node.getPath() + "/" + next;
                    if (objOpt instanceof Double) {
                        double dDoubleValue = ((Double) objOpt).doubleValue();
                        if (dDoubleValue % 1.0d == 0.0d) {
                            string = Long.toString((long) dDoubleValue);
                        } else {
                            if (DECIMAL_FORMAT.getMaximumFractionDigits() == 0) {
                                DECIMAL_FORMAT.setMaximumFractionDigits(20);
                            }
                            string = DECIMAL_FORMAT.format(dDoubleValue);
                        }
                    } else {
                        string = objOpt.toString();
                    }
                    if (isAttribute(str)) {
                        node.addAttribute(next, string);
                    } else if (isContent(str)) {
                        node.setContent(string);
                    } else {
                        Node node3 = new Node(next, node.getPath());
                        node3.setContent(string);
                        node.addChild(node3);
                    }
                }
            }
        }
    }

    private void prepareArray(Node node, String str, JSONArray jSONArray) {
        int length = jSONArray.length();
        String str2 = node.getPath() + "/" + str;
        for (int i = 0; i < length; i++) {
            Node node2 = new Node(str, str2);
            Object objOpt = jSONArray.opt(i);
            if (objOpt != null) {
                if (objOpt instanceof JSONObject) {
                    prepareObject(node2, (JSONObject) objOpt);
                } else if (objOpt instanceof JSONArray) {
                    prepareArray(node2, str, (JSONArray) objOpt);
                } else {
                    String string = objOpt.toString();
                    node2.setName(str);
                    node2.setContent(string);
                }
            }
            node.addChild(node2);
        }
    }

    private boolean isAttribute(String str) {
        return this.mForcedAttributes.contains(str);
    }

    private boolean isContent(String str) {
        return this.mForcedContent.contains(str);
    }
}
