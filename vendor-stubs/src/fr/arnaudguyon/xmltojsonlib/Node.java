package fr.arnaudguyon.xmltojsonlib;

import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
class Node {
    private ArrayList<Attribute> mAttributes = new ArrayList<>();
    private ArrayList<Node> mChildren = new ArrayList<>();
    private String mContent;
    private String mName;
    private String mPath;

    class Attribute {
        String mKey;
        String mValue;

        Attribute(String str, String str2) {
            this.mKey = str;
            this.mValue = str2;
        }
    }

    Node(String str, String str2) {
        this.mName = str;
        this.mPath = str2;
    }

    void addAttribute(String str, String str2) {
        this.mAttributes.add(new Attribute(str, str2));
    }

    void setContent(String str) {
        this.mContent = str;
    }

    void setName(String str) {
        this.mName = str;
    }

    void addChild(Node node) {
        this.mChildren.add(node);
    }

    ArrayList<Attribute> getAttributes() {
        return this.mAttributes;
    }

    String getContent() {
        return this.mContent;
    }

    ArrayList<Node> getChildren() {
        return this.mChildren;
    }

    String getPath() {
        return this.mPath;
    }

    String getName() {
        return this.mName;
    }
}
