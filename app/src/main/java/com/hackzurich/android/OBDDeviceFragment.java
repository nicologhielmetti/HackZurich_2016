package com.hackzurich.android;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.gelitenight.waveview.library.WaveView;

import lecho.lib.hellocharts.view.LineChartView;

/**
 * Created by ingamedeo on 17/09/16.
 */
public class OBDDeviceFragment extends Fragment {

    private LineChartView chart = null;
    private WaveHelper mWaveHelper;
    private WaveView waveView;
    private TextView driverStoreTextView = null;
    private MeterView meterView = null;
    private int mBorderWidth = 4;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.content_obddevice,container,false);
        setupUI(v);
        return v;
    }

    private void setupUI(View v) {
        //chart = (LineChartView) findViewById(R.id.chart);
        /* WaveView */
        waveView = (WaveView) v.findViewById(R.id.wave);
        /* Compute dynamic Border */
        //mBorderWidth = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, mBorderWidth, getResources().getDisplayMetrics());
        //Set border
        waveView.setBorder(mBorderWidth, getResources().getColor(R.color.light_grey));
        mWaveHelper = new WaveHelper(waveView);
        waveView.setShapeType(WaveView.ShapeType.CIRCLE);
        meterView = (MeterView) v.findViewById(R.id.meterView);
        meterView.setActivity(OBDDeviceFragment.this.getActivity());
        driverStoreTextView = (TextView) v.findViewById(R.id.driverStoreTextView);
    }

    @Override
    public void onResume() {
        super.onResume();
        mWaveHelper.initAnimation(0.6f);
        mWaveHelper.start();
    }

    @Override
    public void onPause() {
        mWaveHelper.cancel();
        super.onPause();
    }

    public void onDriverScoreUpdate(int driverScorePerc) {
        //Log.i(Constants.TAG, "Fragment GOT event!");
        if (driverStoreTextView!=null) {
            driverStoreTextView.setText(driverScorePerc+"%");
        }
    }
}
