package com.hackzurich.android;

import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import de.hdodenhof.circleimageview.CircleImageView;

/**
 * Created by ingamedeo on 17/09/16.
 */
public class LeaderBoardAdapter extends RecyclerView.Adapter<LeaderBoardAdapter.ViewHolder> {
    private LeaderBoardItem[] mDataset;

    // Provide a reference to the views for each data item
    // Complex data items may need more than one view per item, and
    // you provide access to all the views for a data item in a view holder
    public static class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        public View v;
        public CircleImageView circleImageView;
        public TextView usernameTextView;
        public TextView driverScoreTextView;

        public ViewHolder(View itemView, CircleImageView circleImageView, TextView usernameTextView, TextView driverScoreTextView) {
            super(itemView);
            this.v = itemView;
            this.circleImageView = circleImageView;
            this.usernameTextView = usernameTextView;
            this.driverScoreTextView = driverScoreTextView;
        }
    }

    // Provide a suitable constructor (depends on the kind of dataset)
    public LeaderBoardAdapter(LeaderBoardItem[] myDataset) {
        mDataset = myDataset;
    }

    // Create new views (invoked by the layout manager)
    @Override
    public LeaderBoardAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        // create a new view
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.leaderboard_row, parent, false);

        CircleImageView circleImageView = (CircleImageView) v.findViewById(R.id.profilePic);
        TextView usernameTextView = (TextView) v.findViewById(R.id.username);
        TextView driverScoreTextView = (TextView) v.findViewById(R.id.driverScore);

        ViewHolder vh = new ViewHolder(v, circleImageView, usernameTextView, driverScoreTextView);
        return vh;
    }

    // Replace the contents of a view (invoked by the layout manager)
    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {

        LeaderBoardItem item = mDataset[position];

        holder.circleImageView.setImageResource(item.getImageRes());
        holder.usernameTextView.setText(item.getUsername());
        holder.driverScoreTextView.setText(String.valueOf(item.getDriverScorePerc())+" %");
    }

    // Return the size of your dataset (invoked by the layout manager)
    @Override
    public int getItemCount() {
        return mDataset.length;
    }
}