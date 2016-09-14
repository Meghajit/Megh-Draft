package com.pesitbsc.meghajit.sinchan;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

public class StudentLogin extends AppCompatActivity {

    Button submit;
    String name, passw;
    Global global;

    StudentRouter strouter = new StudentRouter();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_student_login);

        global=((Global)getApplicationContext());


        }

    @Override
    protected void onStart(){
        super.onStart();

        submit=(Button)findViewById(R.id.LoginButton);

        submit.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                EditText nameText = (EditText) findViewById(R.id.StName);
                EditText passText = (EditText) findViewById(R.id.StPass);

                name = nameText.getText().toString();
                passw = passText.getText().toString();

                new HttpSendTask().execute();

            }
        });


    }


    private class HttpSendTask extends AsyncTask<Void, Void, StudentRouter> {
        @Override
        protected StudentRouter doInBackground(Void... params){

            strouter.setUsn(name);
            strouter.setPassword(passw);
            global.setUsn(name); // setting the global usn variable


            HttpHeaders requestHeaders= new HttpHeaders();
            requestHeaders.setContentType(new MediaType("application","json"));
            HttpEntity<StudentRouter> requestEntity = new HttpEntity<StudentRouter>(strouter,requestHeaders);



            try{

                String url="http://192.168.43.215:3000/login/student";



                RestTemplate restTemplate=new RestTemplate();
                restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
                ResponseEntity<StudentRouter[]> responseEntity = restTemplate.exchange(url, HttpMethod.POST, requestEntity,StudentRouter[].class);
                StudentRouter[] stud=responseEntity.getBody();

                //StudentRouter st[]=new StudentRouter[1];
                //arraycopy(responseEntity.getBody(),0,st,0,1);

                return stud[0];
            }catch(Exception e){
                Log.e("StudentLogin.java",e.getMessage(),e);
            }
            return null;
    }

        @Override
        protected void onPostExecute(StudentRouter st)
        {

                    Toast.makeText(getApplicationContext(), "Welcome, " + st.getSname() + " !",Toast.LENGTH_LONG).show();

                    // storing the data received globally
                    global.setSname(st.getSname());
            global.setCname(st.getCname());
            global.setrevTaken(st.getRevTaken());

            Intent openStudentDetails = new Intent("com.pesitbsc.meghajit.sinchan.StudentDetails");
            startActivity(openStudentDetails);

        }
    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_student_login, menu);
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
