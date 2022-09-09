/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cabhiering.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author HP
 */
public class ConnectionProvider {
    private  static Connection conn;
    
    
    public static Connection getConnection()
    {
        try {
           if(conn == null)
           {
               Class.forName("com.mysql.cj.jdbc.Driver");
           
           conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabhiering ","root","123456");
           }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    
}
