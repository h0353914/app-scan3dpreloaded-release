package com.sonymobile.scan3d.utils;

import com.sonymobile.scan3d.PrintMaterialType;
import com.sonymobile.scan3d.R;

public enum PrintMaterial {
    POLYJET_PLASTICS(R.drawable.print_material_polyjet, R.string.print_customization_material_polyjet_colour,
            3.0f, true, PrintMaterialType.POLYJET_PLASTICS),
    SANDSTONE_COLOUR(R.drawable.print_material_sandstone_colour, R.string.print_customization_material_sandstone_colour,
            2.0f, true, PrintMaterialType.SANDSTONE_COLOUR),
    PORCELAIN_WHITE(R.drawable.print_material_porcelain_white, R.string.print_customization_material_porcelain_white,
            3.0f, false, PrintMaterialType.PORCELAIN_WHITE);

    private final int mImage;
    private final int mText;
    private PrintMaterialType mType;

    PrintMaterial(int image, int text, float thickness, boolean supportsColor, PrintMaterialType type) {
        mImage = image;
        mText = text;
        mType = type;
    }

    public int getImage() {
        return mImage;
    }

    public int getText() {
        return mText;
    }

    public PrintMaterialType getType() {
        return mType;
    }
}
