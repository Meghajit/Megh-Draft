package com.pesitbsc.meghajit.sinchan;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class StudentDetails extends AppCompatActivity {

    Global global;
    int numRows=9;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_student_details);

        global=((Global)getApplicationContext());

        TextView StName = (TextView)findViewById(R.id.studentName);
        TextView StUsn = (TextView)findViewById(R.id.studentUsn);
        StName.setText(global.getSname());
        StUsn.setText(global.getUsn());

        RelativeLayout tl=(RelativeLayout)findViewById(R.id.reviewDet);



        TextView cour,rev,status;
        Button sub;


        for(int i=0,count=50;i<numRows;i++,count+=80)
        {
            RelativeLayout.LayoutParams courDetails = new RelativeLayout.LayoutParams(
                    RelativeLayout.LayoutParams.WRAP_CONTENT,
                    RelativeLayout.LayoutParams.WRAP_CONTENT
            );

            courDetails.addRule(RelativeLayout.ALIGN_PARENT_LEFT);

            courDetails.setMargins(0, count, 0, 0);
            cour=new TextView(this);

            cour.setText(global.getCname());

            tl.addView(cour, courDetails);

            RelativeLayout.LayoutParams revDetails=new RelativeLayout.LayoutParams(

                    RelativeLayout.LayoutParams.WRAP_CONTENT,
                    RelativeLayout.LayoutParams.WRAP_CONTENT


            );

            revDetails.addRule(RelativeLayout.CENTER_HORIZONTAL);

            revDetails.setMargins(20,count,0,0);
            rev=new TextView(this);
            if(global.getrevTaken()==1){

                rev.setText("Submitted");
                tl.addView(rev,revDetails);

            }

            else{

                rev.setText("Pending");
                tl.addView(rev,revDetails);

                RelativeLayout.LayoutParams subDetails = new RelativeLayout.LayoutParams(
                        RelativeLayout.LayoutParams.WRAP_CONTENT,
                        RelativeLayout.LayoutParams.WRAP_CONTENT
                );

                subDetails.addRule(RelativeLayout.ALIGN_PARENT_RIGHT);
                subDetails.setMargins(0,count,0,0);

                sub=new Button(this);
                sub.setText("Review it !");
                tl.addView(sub,subDetails);
            }

        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_student_details, menu);


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
