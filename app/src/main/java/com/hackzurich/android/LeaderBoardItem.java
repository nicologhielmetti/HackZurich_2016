package com.hackzurich.android;

import android.graphics.drawable.Drawable;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by ingamedeo on 17/09/16.
 */
public class LeaderBoardItem {

    public LeaderBoardItem(int imageRes, String username, int driverScorePerc) {
        this.imageRes = imageRes;
        this.username = username;
        this.driverScorePerc = driverScorePerc;
    }

    public int getImageRes() {
        return imageRes;
    }

    public String getUsername() {
        return username;
    }

    public int getDriverScorePerc() {
        return driverScorePerc;
    }

    public String getStringDriverScorePerc() {
        return String.valueOf(driverScorePerc)+ " %";
    }

    private int imageRes;
    private String username;
    private int driverScorePerc;

}
