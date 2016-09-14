package com.pesitbsc.meghajit.sinchan;

/**
 * Created by MeghPES on 8/3/2016.
 */
public class FacultyDetailsRouter {

    private int fid, revSum,totalEnrolled;
    private String cname;

    public void setFid(int fid)
    {
        this.fid=fid;
    }

    public String getCname()
    {
        return this.cname;
    }

    public int getRevSum()
    {
        return this.revSum;
    }

    public int getTotalEnrolled()
    {
        return this.totalEnrolled;
    }

}
