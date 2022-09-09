/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cabhiering.dao;

import com.cabhiering.entities.Admin;
import com.cabhiering.entities.CarDetails;
import com.cabhiering.entities.Driver;
import com.cabhiering.entities.PaymentInfo;
import com.cabhiering.entities.TravellingRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class AdminDao {
    
    private Connection conn;

    public AdminDao(Connection conn) {
        this.conn = conn;
    }
    
    public ArrayList getDetails()
    {
        try {
            
            String query="select travell_id,source,destination,date,time,t_id from travellingrequest where travell_id not in(select travell_id from assigndriver)";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            ResultSet resultSet=preparedStatement.executeQuery();
            ArrayList list=new ArrayList();
            
            
            while(resultSet.next())
            {
                TravellingRequest travellingRequest=new TravellingRequest();
                travellingRequest.setSourceAddress(resultSet.getString("source"));
                travellingRequest.setTravelId(resultSet.getString("travell_id"));
                travellingRequest.setDestinationAddress(resultSet.getString("destination"));
                travellingRequest.setDate(resultSet.getString("date"));
                travellingRequest.setTime(resultSet.getString("time"));
                travellingRequest.setTravellerId(resultSet.getString("t_id"));
                
                list.add(travellingRequest);
                
            }
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public ArrayList getAvailableDriver(String date)
    {
        try {
            
            String query="select d_email from driver_registration where d_email not in(select d_id from assigndriver where travell_id in (select travell_id from travellingrequest where date=?))";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, date);
            ResultSet resultSet=preparedStatement.executeQuery();
            ArrayList list=new ArrayList();
            while(resultSet.next())
            {
             list.add(resultSet.getString("d_email"));   
            }
            return list;
                    
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    public int insertAssignDriver(Driver driver)
    {
        
        try {
            
            String query="insert into assigndriver(travell_id,d_id) values(?,?)";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, driver.getDtravelid());
            preparedStatement.setString(2, driver.getdId());
            preparedStatement.executeUpdate();
            return 1;
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    
    public int insertToPaymentInfo(PaymentInfo info)
    {
        
        try {
            String query="insert into payment_info(t_id,amount,pstatus) values(?,?,?)";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, info.getTravelId());
            preparedStatement.setDouble(2, info.getAmount());
            preparedStatement.setString(3, info.getpStatus());
            preparedStatement.executeUpdate();
            return 1;
            
        } catch (Exception e) {
            
            e.printStackTrace();
            return 0;
        }
        
    }
    
    
    
    
    public ArrayList getAllDetails()
    {
        try {
            String query="select t.travell_id,t.source,t.destination,t.date,t.time,t.t_id,a.d_id,p.amount,p.pstatus from travellingrequest t inner join assigndriver a on t.travell_id=a.travell_id inner join payment_info p on t.travell_id=p.t_id;";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            ResultSet resultSet=preparedStatement.executeQuery();
            ArrayList al=new ArrayList();
            
            
            
            
            while(resultSet.next())
            {
                Admin admin=new Admin();
                admin.setTravelId(resultSet.getString("travell_id"));
                admin.setTravellerId(resultSet.getString("t_id"));
                admin.setSource(resultSet.getString("source"));
                admin.setDestination(resultSet.getString("destination"));
                admin.setDate(resultSet.getString("date"));
                admin.setTime(resultSet.getString("time"));
                admin.setDriverId(resultSet.getString("d_id"));
                admin.setPaymentStatus(resultSet.getString("pstatus"));
                al.add(admin);
            }
            return al;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
//    public CarDetails getvarDeatails(String driverId)
//    {
//         try {
//            String query="select ";
//            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
//            ResultSet resultSet=preparedStatement.executeQuery();
//            ArrayList al=new ArrayList();
//            
//            
//            
//            
//            while(resultSet.next())
//            {
//                Admin admin=new Admin();
//                admin.setTravelId(resultSet.getString("travell_id"));
//                admin.setTravellerId(resultSet.getString("t_id"));
//                admin.setSource(resultSet.getString("source"));
//                admin.setDestination(resultSet.getString("destination"));
//                admin.setDate(resultSet.getString("date"));
//                admin.setTime(resultSet.getString("time"));
//                admin.setDriverId(resultSet.getString("d_id"));
//                admin.setPaymentStatus(resultSet.getString("pstatus"));
//                al.add(admin);
//            }
//            return al;
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
}
