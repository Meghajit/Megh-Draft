package com.pesitbsc.meghajit.sinchan;

/**
 * Created by MeghPES on 8/3/2016.
 */
public class FacultyRouter {

   private String facname,cname, password;
    private int fid;


    public String getFacname(){
        return this.facname;
    }

    public String getCname(){
        return this.cname;
    }

    public void setFid(int fid)
    {
        this.fid=fid;
    }

    public void setPassword(String password)
    {
        this.password=password;
    }

}
