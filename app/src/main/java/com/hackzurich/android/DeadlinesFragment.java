package com.hackzurich.android;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CalendarView;
import android.widget.TextView;

/**
 * Created by Ennio on 17/09/2016.
 */
public class DeadlinesFragment extends Fragment {

    public static final String MyPREFERENCES = "MyPrefs" ;
    private SharedPreferences sharedpreferences = null;
    private TextView textInsuranceDate = null;
    private TextView textInspectionDate = null;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.deadlines,container,false);
        setupUI(v);
        return v;
    }

    private void setupUI(final View v) {
        if (getActivity()==null) return;
        sharedpreferences = getActivity().getSharedPreferences(MyPREFERENCES, Context.MODE_PRIVATE);
        textInsuranceDate = (TextView) v.findViewById(R.id.insurance_dateview);
        textInspectionDate = (TextView) v.findViewById(R.id.inspection_dateview);
        CalendarView insuranceCalendar = (CalendarView) v.findViewById(R.id.insurance_calendar);
        insuranceCalendar.setMinDate(System.currentTimeMillis());
        String insurance_pref = sharedpreferences.getString("insurance",null);
        if(insurance_pref != null) {
            String string = getResources().getString(R.string.expiration_date);
            String[] noNA = string.split(":");
            noNA[0] += ": " + insurance_pref;
            textInsuranceDate.setText(noNA[0]);
        }
        insuranceCalendar.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
            @Override
            public void onSelectedDayChange(CalendarView calendarView, int i, int i1, int i2) {
                String string = getResources().getString(R.string.expiration_date);
                String[] noNA = string.split(":");
                String date = i2 + "/" + i1 + "/" + i;
                noNA[0] += ": " + date;
                textInsuranceDate.setText(noNA[0]);
                if (sharedpreferences!=null) {
                    SharedPreferences.Editor editor = sharedpreferences.edit();
                    editor.putString("insurance", date);
                    editor.apply();
                }
            }
        });


        CalendarView inspectionCalendar = (CalendarView) v.findViewById(R.id.inspection_calendar);
        inspectionCalendar.setMinDate(System.currentTimeMillis());
        if (sharedpreferences!=null) {
            String inspection_pref = sharedpreferences.getString("inspection",null);
            if(inspection_pref != null) {
                String string = getResources().getString(R.string.expiration_date);
                String[] noNA = string.split(":");
                noNA[0] += ": " + inspection_pref;
                textInspectionDate.setText(noNA[0]);
            }
        }
        inspectionCalendar.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
            @Override
            public void onSelectedDayChange(CalendarView calendarView, int i, int i1, int i2) {
                String string = getResources().getString(R.string.expiration_date);
                String[] noNA = string.split(":");
                String date = i2 + "/" + i1 + "/" + i;
                noNA[0] += ": " + date;
                textInspectionDate.setText(noNA[0]);
                if (sharedpreferences!=null) {
                    SharedPreferences.Editor editor = sharedpreferences.edit();
                    editor.putString("inspection", date);
                    editor.apply();
                }
            }
        });
    }
}
