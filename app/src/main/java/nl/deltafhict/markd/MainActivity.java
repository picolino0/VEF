package nl.deltafhict.markd;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.design.widget.TextInputLayout;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.AppCompatButton;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ScrollView;

public class MainActivity extends AppCompatActivity implements View.OnFocusChangeListener,
        TextWatcher {
    private ScrollView mRootScrollView;
    private EditText mRoomCodeView, mPassCodeView;
    private AppCompatButton mEnterButton;

    @Override
    @SuppressWarnings("deprecation")
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mRootScrollView = (ScrollView)findViewById(R.id.main_root);
        final ImageView logoView = (ImageView)findViewById(R.id.main_logo);

        final TextInputLayout roomCodeLayout = (TextInputLayout)
                findViewById(R.id.main_roomcode_layout);
        mRoomCodeView = (EditText)findViewById(R.id.main_roomcode);
        mRoomCodeView.setOnFocusChangeListener(this);
        mRoomCodeView.addTextChangedListener(this);

        final TextInputLayout passCodeLayout = (TextInputLayout)
                findViewById(R.id.main_passcode_layout);
        mPassCodeView = (EditText)findViewById(R.id.main_passcode);
        mPassCodeView.setOnFocusChangeListener(this);
        mPassCodeView.addTextChangedListener(this);

        mEnterButton = (AppCompatButton)findViewById(R.id.main_enter);
        mEnterButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final Intent intent = new Intent(MainActivity.this, MarkActivity.class);
                intent.putExtra(MarkActivity.ROOMCODE_KEY, mRoomCodeView.getText().toString());
                startActivity(intent);
            }
        });

        final Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                logoView.animate().alpha(1f);
            }
        }, 333);
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                roomCodeLayout.animate().alpha(1f);
                mRoomCodeView.animate().alpha(1f);
                passCodeLayout.animate().alpha(1f);
                mPassCodeView.animate().alpha(1f);
            }
        }, 666);
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                mEnterButton.animate().alpha(1f);
            }
        }, 1000);
    }

    @Override
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

    @Override
    public void onTextChanged(CharSequence s, int start, int before, int count) {}

    @Override
    public void afterTextChanged(Editable s) {
        mEnterButton.setEnabled(mRoomCodeView.getText().toString().matches("\\d{6}") &&
                mPassCodeView.getText().toString().matches("\\d{6}"));
    }

    @Override
    public void onFocusChange(View v, boolean hasFocus) {
        mRootScrollView.postDelayed(new Runnable() {
            @Override
            public void run() {
                mRootScrollView.scrollTo(0, mRootScrollView.getBottom());
            }
        }, 100);
    }
}