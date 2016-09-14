package com.pesitbsc.meghajit.sinchan;

import android.app.Application;

/**
 * Created by MeghPES on 8/10/2016.
 */
public class Global extends Application {



    private String sname, cname, facname, usn,qmsg;
    private int fid,qnum,answer,revTaken,revSum,totalEnrolled;



    public void setUsn(String usn) // set the usn of the student globally
    {
        this.usn=usn;
    }

    public String getUsn()
    {
        return this.usn;
    }

    public String getSname()
    {
        return this.sname;
    }
    public String getCname()
    {
        return this.cname;
    }
    public String getFacname()
    {
        return this.facname;
    }

    public void setSname(String sname) //set the name of the student globally
    {
        this.sname=sname;
    }

    public void setCname(String cname)
    {
        this.cname=cname;
    }

    public void setFacname(String facname)
    {
        this.facname=facname;
    }

    public void setrevTaken(int revTaken)
    {
        this.revTaken=revTaken;
    }


    public int getrevTaken()
    {
       return revTaken;
    }





}
