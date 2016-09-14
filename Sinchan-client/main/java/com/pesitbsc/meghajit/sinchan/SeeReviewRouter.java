package com.pesitbsc.meghajit.sinchan;

/**
 * Created by MeghPES on 8/3/2016.
 */
public class SeeReviewRouter {

    private int qnum,answer,fid;
    private String usn, qmsg,cname;

    public String getusn()
    {
        return this.usn;
    }

    public int getQnum()
    {
        return this.qnum;
    }

    public String getQmsg()
    {
        return this.qmsg;
    }

    public int getAnswer()
    {
        return this.answer;
    }

    public void setCname(String cname)
    {
        this.cname=cname;
    }

    public void setFid(int fid){
        this.fid=fid;
    }


}


