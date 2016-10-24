package com.hackzurich.android;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;

/**
 * Created by Ennio on 17/09/2016.
 */
public class BehaviourFragment extends Fragment {

    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.behaviour,container,false);
        setupUI(v);
        return v;
    }

    private void setupUI(View v) {
        mRecyclerView = (RecyclerView) v.findViewById(R.id.my_recycler_view);

        // use this setting to improve performance if you know that changes
        // in content do not change the layout size of the RecyclerView
        mRecyclerView.setHasFixedSize(true);

        // use a linear layout manager
        if (getActivity()==null) return;
        mLayoutManager = new LinearLayoutManager(this.getActivity());
        mRecyclerView.setLayoutManager(mLayoutManager);

        // specify an adapter (see also next example)
        mAdapter = new HistoricalBehaviourAdapter(generateHistoData());
        mRecyclerView.setAdapter(mAdapter);
    }

    private HistoricalBehaviourItem[] generateHistoData() {

        ArrayList<HistoricalBehaviourItem> historicalBehaviourItems = new ArrayList<>();

        for (int i=0; i<10; i++) {
            historicalBehaviourItems.add(new HistoricalBehaviourItem( Constants.randNumber(1800, 10800), Constants.randNumber(50, 250),  Constants.randNumber(0, 100)));
        }

        return historicalBehaviourItems.toArray(new HistoricalBehaviourItem[historicalBehaviourItems.size()]);
    }
}
