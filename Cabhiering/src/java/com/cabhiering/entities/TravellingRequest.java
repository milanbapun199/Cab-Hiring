
package com.cabhiering.entities;

import java.sql.Time;


public class TravellingRequest {
    String sourceAddress;
    String destinationAddress; 
    String date;
    String time;
    String travelId;
    String travellerId;
    String  travellStatus;
    Time timeReg;

    public String getSourceAddress() {
        return sourceAddress;
    }

    public void setSourceAddress(String sourceAddress) {
        this.sourceAddress = sourceAddress;
    }

    public String getDestinationAddress() {
        return destinationAddress;
    }

    public void setDestinationAddress(String destinationAddress) {
        this.destinationAddress = destinationAddress;
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

    public String getTravelId() {
        return travelId;
    }

    public void setTravelId(String travellId) {
        this.travelId = travellId;
    }

    public String getTravellerId() {
        return travellerId;
    }

    public void setTravellerId(String travellerId) {
        this.travellerId = travellerId;
    }

    public String getTravellStatus() {
        return travellStatus;
    }

    public void setTravellStatus(String travellStatus) {
        this.travellStatus = travellStatus;
    }

    public Time getTimeReg() {
        return timeReg;
    }

    public void setTimeReg(Time timeReg) {
        this.timeReg = timeReg;
    }
    
    
    
    
    
    
}
