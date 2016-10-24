package com.hackzurich.android;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lecho.lib.hellocharts.model.Line;
import lecho.lib.hellocharts.model.LineChartData;
import lecho.lib.hellocharts.model.PointValue;
import lecho.lib.hellocharts.view.LineChartView;

public class MainActivity extends AppCompatActivity {

    private FloatingActionButton fab = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //Toolbar toolbar = (Toolbar) findViewById(R.id.action_settings);
        //setSupportActionBar(toolbar);

        setupUI(this);

        /*
         ArrayList<DataSet.DataUnit> dataSet = DataSet.generateDataArray();
        ArrayList<ArrayList<DataSet.DataUnit>> clusters = DataSet.kMeansCluster(dataSet);

        for (ArrayList<DataSet.DataUnit> cluster : clusters) {
            Log.i(Constants.TAG, "*** NEW CLUSTER ***");
            for (DataSet.DataUnit unit : cluster) {
                Log.i(Constants.TAG, "ID: " + unit.getDriverID() + " 0: " + unit.get_BEHAVE_ACC_X_PEAK() + " 1: "+unit.get_MDI_RPM_MAX()+ " 2: "+unit.get_MDI_OVERSPEED_COUNTER());
            }
        }
        */

        //Skip 1st activity
        Intent obdIntent = new Intent(MainActivity.this, OBDDeviceActivity.class);
        startActivity(obdIntent);
        finish();
    }

    private void setupUI(Context context) {

        //Test ActionButton
        /*fab = (FloatingActionButton) findViewById(R.id.action_settings);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });*/

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        //if (id == R.id.action_settings) {
        //    return true;
        //}

        return super.onOptionsItemSelected(item);
    }
}
