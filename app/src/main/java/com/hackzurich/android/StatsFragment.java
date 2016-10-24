package com.hackzurich.android;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Created by Ennio on 17/09/2016.
 */
public class StatsFragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.stats,container,false);
        setupUI(v);
        return v;
    }

    float gasoline_used=Constants.randNumber(1,10000);
    float distance_travelled=gasoline_used*(15+(float)(Constants.randNumber(1,800)/100.0f-4));

    float km_per_liters=distance_travelled/gasoline_used;

    private void setupUI(View v) {
        //TextView kmTextView = (TextView) v.findViewById(R.id.text1);
        //kmTextView.setText("Average RPM : -\nAverage speed : -\nAltitude : -\nLongitude : -\nOdometer : -\nBattery status : -\n");
    }
}
