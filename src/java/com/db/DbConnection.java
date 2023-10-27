
package com.db;
import java.sql.*;
/**
 *
 * @author DIPESH
 */
public class DbConnection {
    public static Connection getConnection(){
        Connection con =null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/javaproject","root","");
            
        }catch(Exception e){
            System.out.println("Error :"+ e.getMessage());
        }
        return con;
    }
}
