package com.pesitbsc.meghajit.sinchan;

/**
 * Created by MeghPES on 8/3/2016.
 */
public class TakeReviewRouter {

    private int qnum;
    private String qmsg, cname, usn;

    String feed[]=new String[11]; // 11 answers for 11 questions

    public int getQnum()
    {
        return this.qnum;
    }

    public String getQmsg()
    {
        return this.qmsg;
    }

    public void setFeed(String feed[])
    {
        this.feed=feed;
    }

    public void setCname(String cname)
    {
        this.cname=cname;
    }

    public void setUsn(String usn)
    {
        this.usn=usn;
    }



}
