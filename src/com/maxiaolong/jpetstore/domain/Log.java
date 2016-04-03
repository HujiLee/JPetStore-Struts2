package com.maxiaolong.jpetstore.domain;

import java.sql.Date;
import java.sql.Time;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class Log {
    private String uerid;
    private Date date;
    private Time time;
    private String dowhat;

    public String getUerid() {
        return uerid;
    }

    public void setUerid(String uerid) {
        this.uerid = uerid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getDowhat() {
        return dowhat;
    }

    public void setDowhat(String dowhat) {
        this.dowhat = dowhat;
    }

    public Log() {
    }

    public Log(String uerid, String dowhat) {
        this.uerid = uerid;
        this.date = new Date(System.currentTimeMillis());
        this.time=new Time(System.currentTimeMillis());
        this.dowhat = dowhat;
    }

    @Override
    public String toString() {
        return "Log{" +
                "uerid='" + uerid + '\'' +
                ", date=" + date +
                ", time=" + time +
                ", dowhat='" + dowhat + '\'' +
                '}';
    }
}