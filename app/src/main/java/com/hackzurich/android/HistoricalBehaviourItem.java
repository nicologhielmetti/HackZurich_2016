package com.hackzurich.android;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by ingamedeo on 17/09/16.
 */
public class HistoricalBehaviourItem {

    public HistoricalBehaviourItem(long secondsDuration, int km, int score) {
        this.secondsDuration = secondsDuration;
        this.km = km;
        this.score = score;
    }

    public long getSecondsDuration() {
        return secondsDuration;
    }

    public String getStringTimeDuration() {
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm", Locale.US);
        String dateString = formatter.format(new Date(secondsDuration * 1000L));
        return dateString;
    }

    public int getKm() {
        return km;
    }

    public int getScore() {
        return score;
    }

    private long secondsDuration;
    private int km;
    private int score;

}
