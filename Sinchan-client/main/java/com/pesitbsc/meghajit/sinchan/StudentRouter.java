package com.pesitbsc.meghajit.sinchan;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by MeghPES on 8/3/2016.
 */



public class StudentRouter {


   @ JsonProperty(access=JsonProperty.Access.READ_ONLY)
    private  String usn;

    @ JsonProperty(access=JsonProperty.Access.READ_ONLY)
    private  String spassword;


    @ JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    private String cname;

    @ JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    private String sname;

    @ JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    private String facname;

    @ JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    private int revTaken;






        //SETTERS

    public void setUsn(String usn)
    {
         this.usn=usn;
    }
    public void setPassword(String spassword)
    {
         this.spassword=spassword;
    }



    //GETTERS

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

    public int getRevTaken()
    {
        return this.revTaken;
    }

}
