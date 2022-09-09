/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cabhiering.entities;

import java.sql.Timestamp;

/**
 *
 * @author HP
 */
public class Traveller {
  
    private String tName;
    private String tEmail;
    private String tMob;
    private String tPassword;
    private String tGender;
    private Timestamp tDateTime;
    private String code;

    public Traveller(String tName, String tEmail, String tMob, String tPassword, String tGender) {
        this.tName = tName;
        this.tEmail = tEmail;
        this.tMob = tMob;
        this.tPassword = tPassword;
        this.tGender = tGender;
    }

    public Traveller() {
    }
   

    public String gettName() {
        return tName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettEmail() {
        return tEmail;
    }

    public void settEmail(String tEmail) {
        this.tEmail = tEmail;
    }

    public String gettMob() {
        return tMob;
    }

    public void settMob(String tMob) {
        this.tMob = tMob;
    }

    public String gettPassword() {
        return tPassword;
    }

    public void settPassword(String tPassword) {
        this.tPassword = tPassword;
    }

    public String gettGender() {
        return tGender;
    }

    public void settGender(String tGender) {
        this.tGender = tGender;
    }

    public Timestamp gettDateTime() {
        return tDateTime;
    }

    public void settDateTime(Timestamp tDateTime) {
        this.tDateTime = tDateTime;
    }
    
    
    
}
