package com.mapbox.mapboxgl.image;

import android.graphics.Bitmap;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;

import java.io.IOException;

class ImageReader {

    private BitmapRegionDecoder mDecoder;
    private boolean mHasAlpha;
    private boolean mPremultipliedAlpha;

    public ImageReader(byte[] data) throws IOException { // TODO handle this in JNI?
        mDecoder = BitmapRegionDecoder.newInstance(data, 0, data.length, false);
        Bitmap bitmap = mDecoder.decodeRegion(new Rect(0, 0, 1, 1), null);
        mHasAlpha = bitmap.hasAlpha();
        mPremultipliedAlpha = bitmap.isPremultiplied();
    }

    int getWidth() {
        return mDecoder.getWidth();
    }

    int getHeight() {
        return mDecoder.getHeight();
    }

    boolean hasAlpha() {
        return mHasAlpha;
    }

    boolean premultipliedAlpha() {
        return mPremultipliedAlpha;
    }

    int[] read(int x, int y, int width, int height) {
        Bitmap bitmap = mDecoder.decodeRegion(new Rect(x, y, width, height), null);
        int[] pixels = new int[width * height];
        bitmap.getPixels(pixels, 0, width, 0, 0, width, height);
        return pixels;
    }

}
