package com.daos;
import java.sql.*;
import com.beans.*;
import com.db.*;
import java.util.ArrayList;

public class BloggerDao {
    
    public boolean add(Blogger blogger,String catIds[]){
        boolean status =false;
        Connection con=DbConnection.getConnection();
        if(con!=null){
        try{
            con.setAutoCommit(false);
            String sql1="insert into blogger (name,userid,password,mobile,address,pic)   values(?,?,?,?,?,?)";
            PreparedStatement smt1=con.prepareStatement(sql1);
            smt1.setString(1, blogger.getName());
            smt1.setString(2, blogger.getUserid());
            smt1.setString(3, blogger.getPassword());
            smt1.setString(4, blogger.getMobile());
            smt1.setString(5, blogger.getAddress());
            smt1.setString(6, blogger.getPic());
            
            int n=smt1.executeUpdate();
            if(n>0){
                String sql2="select id from blogger order by id desc limit 1";
                PreparedStatement smt2=con.prepareStatement(sql2);
                ResultSet rs=smt2.executeQuery();
                int bloggerId=0;
                if(rs.next()){
                    bloggerId=rs.getInt("id");
                }
                //Insert int relational table
                for(String catid :catIds){
                    String sql3="insert into blogger_category(bloggerId,categoryId) values(?,?)";
                    PreparedStatement smt3=con.prepareStatement(sql3);
                    smt3.setInt(1, bloggerId);
                    smt3.setInt(2, Integer.parseInt(catid));
                    smt3.executeUpdate();
                }
                
            }
            con.commit();
            status=true;
            con.close();
        
    }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
            try{con.rollback();   } catch(SQLException se) {System.out.println("Sql Error: "+se.getMessage()); }
            }
        }
        else {
            System.out.println("Connection can not be Stablished Please chaeck your connection Provider");
        }
        return status;
    }
    
    public Blogger find(String userid,String password){
        Blogger blogger=null;
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from blogger where userid=? and password=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setString(1, userid);
            smt.setString(2,password);
            ResultSet rs=smt.executeQuery();
            if(rs.next())
            {
                blogger=new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setMobile(rs.getString("mobile"));
                blogger.setAddress(rs.getString("address"));
                blogger.setPic(rs.getString("pic"));
                blogger.setStatus(rs.getString("status"));
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        
        
        return blogger;
    }
     public Blogger findByUserid_mobile(String userid,String mobile){
        Blogger blogger=null;
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from blogger where userid=? and mobile=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setString(1, userid);
            smt.setString(2,mobile);
            ResultSet rs=smt.executeQuery();
            if(rs.next())
            {
                blogger=new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setMobile(rs.getString("mobile"));
                blogger.setAddress(rs.getString("address"));
                blogger.setPic(rs.getString("pic"));
                blogger.setStatus(rs.getString("status"));
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        
        
        return blogger;
    }
    public boolean isExist(String userid){
       boolean status=false;
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from blogger where userid=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setString(1, userid);
            
            ResultSet rs=smt.executeQuery();
            if(rs.next())
            {
                status=true;
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        
        
        return status;
    }
    
    public Blogger find(int id){
        Blogger blogger=null;
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from blogger where id=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs=smt.executeQuery();
            if(rs.next())
            {
                blogger=new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setMobile(rs.getString("mobile"));
                blogger.setAddress(rs.getString("address"));
                blogger.setPic(rs.getString("pic"));
                blogger.setStatus(rs.getString("status"));
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        return blogger;
    }
    
    public ArrayList <Blogger> findAll(){
       ArrayList< Blogger> bloggerList=new ArrayList();
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from blogger ";
            PreparedStatement smt=con.prepareStatement(sql);
           
            ResultSet rs=smt.executeQuery();
            while(rs.next())
            {
                Blogger blogger=new Blogger();
                blogger=new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setMobile(rs.getString("mobile"));
                blogger.setAddress(rs.getString("address"));
                blogger.setPic(rs.getString("pic"));
                blogger.setStatus(rs.getString("status"));
                bloggerList.add(blogger);
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        
        
        return bloggerList;
    }
    
    public boolean update(Blogger blogger){
        boolean status =false;
        
        
        
        return status;
    }
    public boolean updateStatus(int id,String newStatus){
        boolean status =false;
        try{
            Connection con=DbConnection.getConnection();
            String sql="update blogger set status=? where id=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setString(1, newStatus);
            smt.setInt(2, id);
            int n=smt.executeUpdate();
            if(n>0)
                status=true;
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        
        
        return status;
    }
    
    
    public boolean delete(int id){
        boolean status =false;
        try{
            Connection con=DbConnection.getConnection();
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        
        
        return status;
    }
    
    public ArrayList<Blogger> findByCatId(int catid){
        ArrayList<Blogger> bloggerList=new ArrayList();
        try{
            Connection con=DbConnection.getConnection();
            String sql="select * from blogger where id in(select bloggerId from blogger_category where categoryId=?)";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setInt(1, catid);
            ResultSet rs=smt.executeQuery();
            while(rs.next()){
                Blogger blogger =new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setAddress(rs.getString("address"));
                blogger.setMobile(rs.getString("mobile"));
                blogger.setPic(rs.getString("pic"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setStatus(rs.getString("status"));
                
                bloggerList.add(blogger);
            }
        }
        catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        return  bloggerList;
    }
    
}
