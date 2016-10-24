package com.hackzurich.android;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.text.DecimalFormat;

/**
 * Created by Ennio on 17/09/2016.
 */
public class ConsumptionFragment extends Fragment {

    /*
    MDI_DASHBOARD_FUEL_LEVEL Fuel level in percent from the dashboard.
    MDI_OBD_MILEAGE Mileage in kilometers obtained from the OBD
    */

    private TextView litresUsed = null;
    private TextView kmLast = null;
    private TextView avgKmL = null;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.consumptions,container,false);
        setupUI(v);
        generateData();
        return v;
    }

    private void setupUI(View v) {
        litresUsed = (TextView) v.findViewById(R.id.litresUsed);
        kmLast = (TextView) v.findViewById(R.id.kmLast);
        avgKmL = (TextView) v.findViewById(R.id.avgKmL);
    }

    private void generateData() {

        int litres = Constants.randNumber(5, 40);
        float km = litres*(15+(float)(Constants.randNumber(1,800)/100.0f-4));

        float kml = km/(float)litres;

        DecimalFormat numberFormat = new DecimalFormat("#.00");

        if (avgKmL!=null)
            avgKmL.setText("Average: " + numberFormat.format(kml));
        if (litresUsed!=null)
            litresUsed.setText("Litres used since last re-fuel: " + String.valueOf(litres)+ " l");
        if (kmLast!=null)
            kmLast.setText("Km since last re-fuel: "+ numberFormat.format(km) +" km");
    }
}