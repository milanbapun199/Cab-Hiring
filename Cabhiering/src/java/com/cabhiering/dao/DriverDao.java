/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cabhiering.dao;

import com.cabhiering.entities.CarDetails;
import com.cabhiering.entities.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class DriverDao {
    private Connection conn;

    public DriverDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean insertDriver(Driver driver)
    {
        boolean f=false;
        try {
//            driver--->database

               String query="insert into driver_registration(d_name,d_email,d_mob,d_password) values(?,?,?,?)";
               
               PreparedStatement ps=this.conn.prepareStatement(query);
               ps.setString(1, driver.getdName());
               ps.setString(2, driver.getdEmail());
               ps.setString(3, driver.getdMobile());
               ps.setString(4, driver.getdPassword());
               
               ps.executeUpdate();
               
               f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    //get driver by driverMail and driverPassword
    
    
    public Driver getDriverByEmailAndPassword(String email,String password)
    {
        Driver driver=null;
        
        try {
            
            String query="select * from driver_registration where d_email=? and d_password=?";
            PreparedStatement ps=this.conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                driver=new Driver();
                
                //data from db
                String name=rs.getString("d_name");
                //set to drive object
                driver.setdName(name);
                
                driver.setdId(rs.getString("d_id"));
                driver.setdEmail(rs.getString("d_email"));
                driver.setdPassword(rs.getString("d_password"));
                driver.setDateTime(rs.getTimestamp("d_date_time"));
                driver.setdMobile(rs.getString("d_mob"));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driver;
    }
    
    
    public ArrayList dStatus(Driver driver)
    {
        try {
            String query="select t.travell_id,t.source,t.destination,t.date,t.time,t.t_id,a.d_id,a.travell_id,p.pstatus,tr.traveller_mob from travellingrequest t, assigndriver a,cabhiering.payment_info p,cabhiering.traveller_registration tr where t.travell_id=a.travell_id and t.travell_id=p.t_id and t.t_id=tr.traveller_email and a.d_id=? ";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, driver.getdId());
            ArrayList list=new ArrayList();
            ResultSet resultSet=preparedStatement.executeQuery();
            
            while(resultSet.next())
            {
                Driver d=new Driver();
                d.setDtravelid(resultSet.getString("travell_id"));
                d.setSource(resultSet.getString("source"));
                d.setDestination(resultSet.getString("destination"));
                d.setTime(resultSet.getString("time"));
                d.setDate(resultSet.getString("date"));
                d.setdEmail(resultSet.getString("t_id"));
                d.setdId(resultSet.getString("d_id"));
                d.setTravellerMob(resultSet.getString("traveller_mob"));
                d.setTravellerPaymentStatus(resultSet.getString("pstatus"));
                
                list.add(d);
            }
            return list;
            
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        
    }
    
    
    public String driverName(Driver driver)
    {
        try {
            
            String query="select d_name from driver_registration where d_email=?";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, driver.getdId());
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                driver.setdName(resultSet.getString("d_name"));
            }
            return driver.getdName();
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
      public boolean insertCabDetails(CarDetails carDetails)
    {
        boolean f=false;
        try {


               String query="insert into cabdetails(driveremail,cabnumber,regdnum,regddate,permitplace) values(?,?,?,?,?)";
               
               PreparedStatement ps=this.conn.prepareStatement(query);
               ps.setString(1, carDetails.getDriverEmail());
               ps.setString(2, carDetails.getCarNum());
               ps.setString(3, carDetails.getRegdNum());
               ps.setString(4, carDetails.getRegdDate());
               ps.setString(5, carDetails.getPemitPlace());
               
               ps.executeUpdate();
               
               f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
      
      public Driver getMobAndDriverId(Driver driver)
      {
          try {
                String query="select d.d_mob,a.d_id from driver_registration d,assigndriver a where a.d_id=d.d_email and a.d_id=(select d_id from assigndriver where travell_id=?)";
              PreparedStatement preparedStatement=this.conn.prepareStatement(query);
              preparedStatement.setString(1, driver.getDtravelid());
              ResultSet resultSet=preparedStatement.executeQuery();
              Driver d=new Driver();
             if( resultSet.next())
              
             {
                 d.setdEmail(resultSet.getString("d_id"));
                  d.setdMobile(resultSet.getString("d_mob"));
                  return d;
             } 
             return d;
                  
              
              
              
          } catch (Exception e) {
              e.printStackTrace();
              return null;
          }
      }
}
