package com.daos;
import com.beans.*;
import com.db.*;
import java.sql.*;

public class AdminDao {  
    public Admin find(int id){
        Admin admin=null;
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from admin where id=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setInt(1,id);
            ResultSet rs=smt.executeQuery();
            if(rs.next()){
                admin=new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setUserid(rs.getString("userid"));
                admin.setPassword(rs.getString("password"));
                admin.setPic(rs.getString("pic"));
            }
            con.close();
         }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        return admin;
    }
    
    public Admin find(String userid,String password){
        Admin admin=null;
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from admin where userid=? and password=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setString(1,userid);
            smt.setString(2, password);
            ResultSet rs=smt.executeQuery();
            if(rs.next()){
                admin=new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setUserid(rs.getString("userid"));
                admin.setPassword(rs.getString("password"));
                admin.setPic(rs.getString("pic"));
            }
            con.close();
            
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        
        return admin;
    }
    public boolean updateProfilePic(int id ,String imgpath){
         boolean status =false;
        
        
        return status;
    }
    
    public boolean changePassword(int id,String newpwd){
        boolean status =false;
        
        
        
        
        return status;
    }
    
}
