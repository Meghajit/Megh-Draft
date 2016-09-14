package com.pesitbsc.meghajit.sinchan;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by MeghPES on 8/3/2016.
 */
public class StudentDetailsRouter {

    @JsonProperty(access=JsonProperty.Access.READ_ONLY)
    private String usn;

    @ JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    private String cname;

    @ JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    private int revTaken;

    public void setUsn(String usn)
    {
        this.usn=usn;
    }

    public String getCname()
    {
        return this.cname;
    }

    public int getRevTaken()
    {
        return this.revTaken;
    }
}
