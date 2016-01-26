package nl.deltafhict.markd;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

public class MarkAdapter extends RecyclerView.Adapter<MarkAdapter.ViewHolder> {
    private final ArrayList<String> mMarks = new ArrayList<>();

    @Override
    public MarkAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return new ViewHolder(LayoutInflater.from(parent.getContext())
                .inflate(R.layout.listitem_mark, parent, false));
    }

    @Override
    public void onBindViewHolder(MarkAdapter.ViewHolder holder, int position) {
        holder.text.setText(mMarks.get(position));
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        public TextView text;

        public ViewHolder(View view) {
            super(view);
            text = (TextView)view;
        }
    }

    @Override
    public int getItemCount() {
        return mMarks.size();
    }

    public void addMark(@NonNull String mark) {
        if (!mark.trim().isEmpty()) {
            mMarks.add(mark);
            notifyDataSetChanged();
        }
    }
}