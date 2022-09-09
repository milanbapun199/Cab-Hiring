/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cabhiering.dao;

import com.cabhiering.entities.PaymentInfo;
import com.cabhiering.entities.Traveller;
import com.cabhiering.entities.TravellerRequest;
import com.cabhiering.entities.TravellingRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


/**
 *
 * @author HP
 */
public class TravellerDao {
    private Connection conn;

    public TravellerDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean insertTraveller(Traveller traveller)
    {
        boolean f=false;
        
        try {
            String query="insert into traveller_registration (traveller_name,traveller_email,traveller_mob,traveller_password,traveller_gender) values(?,?,?,?,?)";
            
            PreparedStatement ps=this.conn.prepareStatement(query);
            ps.setString(1, traveller.gettName());
            ps.setString(2, traveller.gettEmail());
            ps.setString(3, traveller.gettMob());
            ps.setString(4, traveller.gettPassword());
            ps.setString(5, traveller.gettGender());
            
            ps.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    //get traveller by travellerEmail and password
    
    public Traveller getTravellerByEmailAndPassword(String email ,String password)
    {
        Traveller traveller=null;
        
        
        try {
            
            String query="select * from traveller_registration where traveller_email=? and traveller_password=?";
            PreparedStatement ps=this.conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet set =ps.executeQuery();
            
            if(set.next())
            {
                traveller=new Traveller();
                
//                data from db set to traveller object

                  traveller.settName(set.getString("traveller_name"));
                  traveller.settEmail(set.getString("traveller_email"));
                  traveller.settGender(set.getString("traveller_gender"));
                  traveller.settMob(set.getString("traveller_mob"));
                  traveller.settPassword(set.getString("traveller_password")); 
            }
            
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        
        return traveller;
        
        
        
        
        
    }
    
    
    public Traveller edit(String email)
            
    {
        
        Traveller traveller=null;
        try {
            
            
            String query="select * from traveller_registration where traveller_email=? ";
            PreparedStatement ps=this.conn.prepareStatement(query);
            ps.setString(1, email);
           
            ResultSet set =ps.executeQuery();
            
            if(set.next())
            {
                traveller=new Traveller();
                
//                data from db set to traveller object

                  traveller.settName(set.getString("traveller_name"));
                  traveller.settEmail(set.getString("traveller_email"));
                  traveller.settGender(set.getString("traveller_gender"));
                  traveller.settMob(set.getString("traveller_mob"));
                  traveller.settPassword(set.getString("traveller_password"));
                  
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return traveller;
    }
    
    
    
    public int update(Traveller traveller)
    {
        
        try {
            
            String query="update traveller_registration set traveller_name=?,traveller_mob=?,traveller_password=? where traveller_email=? ";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            
            preparedStatement.setString(1, traveller.gettName());
            preparedStatement.setString(2, traveller.gettMob());
            preparedStatement.setString(3, traveller.gettPassword());
            preparedStatement.setString(4, traveller.gettEmail());
            
            
            preparedStatement.executeUpdate();
            return 1;
            
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int travellerRequestInsert(TravellingRequest travellingRequest )
    {
       
        
        try {
                        PreparedStatement ps=conn.prepareStatement("SELECT travell_id FROM travellingrequest ORDER BY travell_id DESC");
			ResultSet rs=ps.executeQuery();
            
            
                         String e;
			String en="";
			
			if(rs.next())
			{
			e=rs.getString(1).substring(1);
			int n = Integer.parseInt(e);
			n++;			

			if(n<10)
			  en="E"+"0000"+n;

			if(n>=10 && n<100 )
			  en="E"+"000"+n;

			if(n>=100 && n<1000 )
			  en="E"+"00"+n;

			if(n>=1000 && n<10000 )
			  en="E"+"0"+n;

			if(n>=10000 && n<100000 )
			  en="E"+ n;
			}
			else
				en="E00001";
			
			System.out.println(en);
            
            
            
            
            
            
            
            
            
            
            
            
            String query="insert into travellingrequest(travell_id,source,destination,date,time,t_id) values(?,?,?,?,?,?)";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, en);
            preparedStatement.setString(2, travellingRequest.getSourceAddress());
            preparedStatement.setString(3, travellingRequest.getDestinationAddress());
            preparedStatement.setString(4, travellingRequest.getDate());
            preparedStatement.setString(5, travellingRequest.getTime());
            preparedStatement.setString(6, travellingRequest.getTravellerId());
            preparedStatement.executeUpdate();
            
            return 1;
            
            
        } catch (Exception e) {
            
            e.printStackTrace();
            return 0;
        }
    }
    
    public TravellingRequest travelStatus(String travelId)
    {
        try {
            String query="select source,destination,date,time from travellingrequest where travell_id=?";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, travelId);
            
            ResultSet resultSet=preparedStatement.executeQuery();
            resultSet.next();
            
            TravellingRequest travellingRequest =new TravellingRequest();
            travellingRequest.setSourceAddress(resultSet.getString("source"));
            travellingRequest.setDestinationAddress(resultSet.getString("destination"));
            travellingRequest.setDate(resultSet.getString("date"));
            travellingRequest.setTime(resultSet.getString("time"));
            
            return travellingRequest;
                    
        } catch (Exception e) {
            
            e.printStackTrace();
            return null;
        }
    }
    
    public double getFare(String source,String destination)
    {
        try {
            
            String query="select distance,cost_per_km from rate where source=? and destination=?";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, source);
            preparedStatement.setString(2, destination);
            
            ResultSet resultSet=preparedStatement.executeQuery();
             
            resultSet.next();
            return resultSet.getDouble("distance")*resultSet.getInt("cost_per_km");
                    
        } catch (Exception e) {
            
            e.printStackTrace();
            return 0;
        }
    }
    
    
    
    
    public boolean insertPaymentDetails(PaymentInfo paymentInfo)
    {
        boolean f=false;
        
        try {
            
            
            String query="insert into payment_info(t_id,amount,pstatus) values(?,?,?)";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, paymentInfo.getTravelId());
            preparedStatement.setString(2, String.valueOf(paymentInfo.getAmount()));
            preparedStatement.setString(3,paymentInfo.getpStatus() );
            preparedStatement.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        return f;
    }
    
    
    
    
    
    
    
    //insert traveller card details..........
    
    public int insertTravellerCardDetails(String cardNum,String pin,String expMonth,String expYear)
    {
        try {
            String query="select balance from card_details where card_no=? and pin=? and exp_month=? and exp_year=?";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1,cardNum );
            preparedStatement.setString(2,pin );
            preparedStatement.setString(3,expMonth );
            preparedStatement.setString(4,expYear );
            
            ResultSet resultSet=preparedStatement.executeQuery();
            
            if(resultSet.next())
            {
                double bal=resultSet.getDouble("balance");
                return (int) bal;
            }
            else
                return -1;
                    
        } catch (Exception e) {
            
            e.printStackTrace();
            return -2;
        }
    }
    
    
    
    
    public int updateBalance(String cardNum,String balance)
    {
        try {
            String query="update card_details set balance=? where card_no=? ";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1,balance);
            preparedStatement.setString(2, cardNum);
           int r= preparedStatement.executeUpdate();
           return r;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    
    public int updatePaymentInfo(PaymentInfo info)
    {
        try {
            String query="update payment_info set pstatus=? where t_id=?";
            PreparedStatement preparedStatement =this.conn.prepareStatement(query);
            preparedStatement.setString(1,info.getpStatus());
            preparedStatement.setString(2, info.getTravelId());
            int r=preparedStatement.executeUpdate();
            return r;
            
        } catch (Exception e) {
            
            e.printStackTrace();
            return 0;
        }
    }
    
    
   
    
    
    public int resetPassword(Traveller traveller)
    {
        
        try {
            
            String query="update traveller_registration set traveller_password=? where traveller_email=?" ;
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, traveller.gettPassword());
            preparedStatement.setString(2, traveller.gettEmail());
            preparedStatement.executeUpdate();
            return 1;
            
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        
    }
    
     public String retriveTravelId(TravellingRequest travellingRequest)
    {
        try {
            String query="select travell_id from cabhiering.travellingrequest where timereg=(select timereg from cabhiering.travellingrequest where source=? and destination=? and date=? and time=? and t_id=?)";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, travellingRequest.getSourceAddress());
            preparedStatement.setString(2, travellingRequest.getDestinationAddress());
            preparedStatement.setString(3, travellingRequest.getDate());
            preparedStatement.setString(4, travellingRequest.getTime());
            preparedStatement.setString(5, travellingRequest.getTravellerId());
           ResultSet resultSet= preparedStatement.executeQuery();
            while (resultSet.next()) {                
                travellingRequest.setTravelId(resultSet.getString("travell_id"));
            }
            
            return travellingRequest.getTravelId();
            
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
   
    }
     
     
     
     
       public ArrayList getLocation()
    {
        try {
            
            String query="select location from place";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            ResultSet resultSet=preparedStatement.executeQuery();
            ArrayList list=new ArrayList();
            
            
            while(resultSet.next())
            {
                list.add(resultSet.getString("location"));
            }
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
       
       
       public ArrayList myAllrequest(String travelerEmail)
       {
           try {
            
            String query="select t.travell_id,t.source,t.destination,t.date,t.time,p.pstatus from travellingrequest t left outer join payment_info p on p.t_id=t.travell_id  where t.t_id=?";
            PreparedStatement preparedStatement=this.conn.prepareStatement(query);
            preparedStatement.setString(1, travelerEmail);
            ResultSet resultSet=preparedStatement.executeQuery();
            ArrayList list=new ArrayList();
            
            
            while(resultSet.next())
            {
                TravellerRequest request=new TravellerRequest();
                request.setTravelid(resultSet.getString("travell_id"));
                request.setSource(resultSet.getString("source"));
                request.setDestination(resultSet.getString("destination"));
                request.setDate(resultSet.getString("date"));
                request.setTime(resultSet.getString("time"));
                request.setPstatus(resultSet.getString("pstatus"));
                list.add(request);
            }
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
       }
}
