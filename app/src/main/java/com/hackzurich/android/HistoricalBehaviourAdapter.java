package com.hackzurich.android;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Created by ingamedeo on 17/09/16.
 */
public class HistoricalBehaviourAdapter extends RecyclerView.Adapter<HistoricalBehaviourAdapter.ViewHolder> {
    private HistoricalBehaviourItem[] mDataset;

    // Provide a reference to the views for each data item
    // Complex data items may need more than one view per item, and
    // you provide access to all the views for a data item in a view holder
    public static class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        public MeterView meterView;
        public TextView kmTextView;
        public TextView timeTextView;

        public ViewHolder(View itemView, MeterView meterView, TextView kmTextView, TextView timeTextView) {
            super(itemView);
            this.meterView = meterView;
            this.kmTextView = kmTextView;
            this.timeTextView = timeTextView;
        }
    }

    // Provide a suitable constructor (depends on the kind of dataset)
    public HistoricalBehaviourAdapter(HistoricalBehaviourItem[] myDataset) {
        mDataset = myDataset;
    }

    // Create new views (invoked by the layout manager)
    @Override
    public HistoricalBehaviourAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        // create a new view
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.behaviour_row, parent, false);

        MeterView meterView = (MeterView) v.findViewById(R.id.meter);
        TextView kmTextView = (TextView) v.findViewById(R.id.kmText);
        TextView timeTextView = (TextView) v.findViewById(R.id.timeText);

        ViewHolder vh = new ViewHolder(v, meterView, kmTextView, timeTextView);
        return vh;
    }

    // Replace the contents of a view (invoked by the layout manager)
    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {

        HistoricalBehaviourItem item = mDataset[position];

        //holder.meterView
        holder.kmTextView.setText(String.valueOf(item.getKm() + " km"));
        holder.timeTextView.setText("Duration: " + item.getStringTimeDuration());
        holder.meterView.setAlpha(item.getScore()/100.0f);
    }

    // Return the size of your dataset (invoked by the layout manager)
    @Override
    public int getItemCount() {
        return mDataset.length;
    }
}