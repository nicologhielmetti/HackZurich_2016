package com.hackzurich.android;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

/**
 * Created by Ennio on 17/09/2016.
 */
public class LeaderboardFragment extends Fragment {

    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.leaderboard,container,false);
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
        mAdapter = new LeaderBoardAdapter(generateLeaderBoardData());
        mRecyclerView.setAdapter(mAdapter);
    }

    private LeaderBoardItem[] generateLeaderBoardData() {

        ArrayList<LeaderBoardItem> leaderBoardItems = new ArrayList<>();

        for (int i=0; i<Constants.profilePics.length; i++) {
            leaderBoardItems.add(new LeaderBoardItem(Constants.profilePics[i], Constants.profileNames[i],  Constants.randNumber(0, 100)));
        }

        Collections.sort(leaderBoardItems, new Comparator<LeaderBoardItem>() {
            @Override
            public int compare(LeaderBoardItem o1, LeaderBoardItem o2) {
                return o2.getDriverScorePerc() < o1.getDriverScorePerc() ? -1 : o2.getDriverScorePerc() > o1.getDriverScorePerc() ? 1 : 0;
            }
        });

        return leaderBoardItems.toArray(new LeaderBoardItem[leaderBoardItems.size()]);
    }

}
