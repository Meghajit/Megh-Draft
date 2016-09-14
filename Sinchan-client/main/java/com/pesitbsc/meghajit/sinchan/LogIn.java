package com.pesitbsc.meghajit.sinchan;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

public class LogIn extends AppCompatActivity {

    Button stud, fac;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_log_in);



        stud=(Button)findViewById(R.id.StLogin);
        fac=(Button)findViewById(R.id.FacLogin);

        stud.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent openStudentLogin = new Intent("com.pesitbsc.meghajit.sinchan.StudentLogin");
                startActivity(openStudentLogin);
            }
        });

        fac.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent openFacultyLogin = new Intent("com.pesitbsc.meghajit.sinchan.FacultyLogin");
                startActivity(openFacultyLogin);
            }
        });


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_log_in, menu);
        return true;
    }



    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
