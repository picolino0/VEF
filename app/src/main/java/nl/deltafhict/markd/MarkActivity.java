package nl.deltafhict.markd;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;

public class MarkActivity extends AppCompatActivity {
    public static final String ROOMCODE_KEY = "roomcode";

    private MarkAdapter mAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mark);

        final RecyclerView recycler = (RecyclerView)findViewById(R.id.mark_recycler);
        recycler.setLayoutManager(new LinearLayoutManager(this));
        recycler.setAdapter(mAdapter = new MarkAdapter());

        findViewById(R.id.mark_add).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mAdapter.addMark("TEST");
            }
        });
    }
}