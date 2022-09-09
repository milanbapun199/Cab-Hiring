package com.cabhiering.entities;

import java.sql.Timestamp;

/**
 *
 * @author HP
 */
public class Driver {
    private String dId;
    private String dName;
    private String dEmail;
    private String dMobile;
    private String dPassword;
    private Timestamp dateTime;
    private String date;
    private String time;
    private String travellerMob;
    private String travellerPaymentStatus;
    private String code;
    
	
	String dtravelid;
	String source;
        String destination;

    public Driver(String dName, String dEmail, String dMobile, String dPassword) {
        this.dName = dName;
        this.dEmail = dEmail;
        this.dMobile = dMobile;
        this.dPassword = dPassword;
    }

    public Driver() {
    }
    
    
    

    public String getdId() {
        return dId;
    }

    public void setdId(String dId) {
        this.dId = dId;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getdEmail() {
        return dEmail;
    }

    public void setdEmail(String dEmail) {
        this.dEmail = dEmail;
    }

    public String getdMobile() {
        return dMobile;
    }

    public void setdMobile(String dMobile) {
        this.dMobile = dMobile;
    }

    public String getdPassword() {
        return dPassword;
    }

    public void setdPassword(String dPassword) {
        this.dPassword = dPassword;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getDtravelid() {
        return dtravelid;
    }

    public void setDtravelid(String dtravelid) {
        this.dtravelid = dtravelid;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTravellerMob() {
        return travellerMob;
    }

    public void setTravellerMob(String travellerMob) {
        this.travellerMob = travellerMob;
    }

    public String getTravellerPaymentStatus() {
        return travellerPaymentStatus;
    }

    public void setTravellerPaymentStatus(String travellerPaymentStatus) {
        this.travellerPaymentStatus = travellerPaymentStatus;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    
    
    
    
    
}
