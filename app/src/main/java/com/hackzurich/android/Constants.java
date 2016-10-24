package com.hackzurich.android;

/**
 * Created by ingamedeo on 17/09/16.
 */
public class Constants {
    public static final String TAG = "HackZurich";

    public static int randNumber(int lower, int upper) {
        int r = (int) (Math.random() * (upper - lower)) + lower;
        return r;
    }

    public static int[] profilePics = {R.drawable.leaderboard1, R.drawable.leaderboard2, R.drawable.leaderboard3, R.drawable.leaderboard4, R.drawable.leaderboard5, R.drawable.leaderboard6, R.drawable.leaderboard7};
    public static String[] profileNames = {"William O'Connor", "Everett Gray", "Greg Reynolds", "Christy Wallace", "Lydia Neal", "Elijah Perez", "Anthony Long"};

}
