package fr.arnaudguyon.xmltojsonlib;

import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class Tag {
    private ArrayList<Tag> mChildren = new ArrayList<>();
    private String mContent;
    private String mName;
    private String mPath;

    Tag(String str, String str2) {
        this.mPath = str;
        this.mName = str2;
    }

    void addChild(Tag tag) {
        this.mChildren.add(tag);
    }

    void setContent(String str) {
        boolean z = false;
        if (str != null) {
            for (int i = 0; i < str.length(); i++) {
                char cCharAt = str.charAt(i);
                if (cCharAt != ' ' && cCharAt != '\n') {
                    z = true;
                    break;
                }
            }
        }
        if (z) {
            this.mContent = str;
        }
    }

    String getName() {
        return this.mName;
    }

    String getContent() {
        return this.mContent;
    }

    ArrayList<Tag> getChildren() {
        return this.mChildren;
    }

    boolean hasChildren() {
        return this.mChildren.size() > 0;
    }

    int getChildrenCount() {
        return this.mChildren.size();
    }

    Tag getChild(int i) {
        if (i < 0 || i >= this.mChildren.size()) {
            return null;
        }
        return this.mChildren.get(i);
    }

    HashMap<String, ArrayList<Tag>> getGroupedElements() {
        HashMap<String, ArrayList<Tag>> map = new HashMap<>();
        for (Tag tag : this.mChildren) {
            String name = tag.getName();
            ArrayList<Tag> arrayList = map.get(name);
            if (arrayList == null) {
                arrayList = new ArrayList<>();
                map.put(name, arrayList);
            }
            arrayList.add(tag);
        }
        return map;
    }

    String getPath() {
        return this.mPath;
    }

    public String toString() {
        return "Tag: " + this.mName + ", " + this.mChildren.size() + " children, Content: " + this.mContent;
    }
}
