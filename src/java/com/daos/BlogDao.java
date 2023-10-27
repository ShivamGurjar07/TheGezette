package com.daos;

import com.beans.*;
import com.db.*;
import java.sql.*;
import java.util.*;

public class BlogDao {

    public boolean add(Blog blog, String[] catIds) {
        boolean status = false;
        Connection con = DbConnection.getConnection();
        if (con != null) {
            try {
                con.setAutoCommit(false);
                String sql1 = "insert into blogs (title,description,pic,date,bloggerId) values(?,?,?,?,?)";
                PreparedStatement smt1 = con.prepareStatement(sql1);
                smt1.setString(1, blog.getTitle());
                smt1.setString(2, blog.getDescription());
                smt1.setString(3, blog.getPic());
                smt1.setString(4, blog.getDate());
                smt1.setInt(5, blog.getBloggerId());

                int n = smt1.executeUpdate();
                if (n > 0) {
                    String sql2 = "select id from blogs order by id desc limit 1";
                    PreparedStatement smt2 = con.prepareStatement(sql2);
                    ResultSet rs = smt2.executeQuery();
                    int blogId = 0;
                    if (rs.next()) {
                        blogId = rs.getInt("id");
                    }
                    //Insert int relational table
                    for (String catid : catIds) {
                        String sql3 = "insert into blog_category(blogId,categoryId) values(?,?)";
                        PreparedStatement smt3 = con.prepareStatement(sql3);
                        smt3.setInt(1, blogId);
                        smt3.setInt(2, Integer.parseInt(catid));
                        smt3.executeUpdate();
                    }

                }
                con.commit();
                status = true;
                con.close();

            } catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
                try {
                    con.rollback();
                } catch (SQLException se) {
                    System.out.println("Sql Error: " + se.getMessage());
                }
            }
        } else {
            System.out.println("Connection can not be Stablished Please chaeck your connection Provider");
        }
        return status;
    }

    public Blog findById(int id) {
        Blog blog = null;
        try {
            Connection con = DbConnection.getConnection();
            String sql = "select * from blogs where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs = smt.executeQuery();
            if (rs.next()) {
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setPic(rs.getString("pic"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setStatus(rs.getString("status"));
            }
            con.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return blog;
    }

    public ArrayList<Blog> findAll() {
        ArrayList<Blog> blogList = new ArrayList();
        try {
            Connection con = DbConnection.getConnection();
            String sql = "select id,title,description, DATE_FORMAT(date,'%D %b,%Y')\"date\",pic,bloggerId,status from blogs";
            PreparedStatement smt = con.prepareStatement(sql);

            ResultSet rs = smt.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setPic(rs.getString("pic"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setStatus(rs.getString("status"));
                blogList.add(blog);
            }
            con.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return blogList;
    }

    public ArrayList<Blog> findByCategoryId(int catId) {
        ArrayList<Blog> blogList = new ArrayList();
        try {
            Connection con = DbConnection.getConnection();
            String sql = "select * from blogs where id in (select blogId from blog_category where categoryId=?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, catId);
            ResultSet rs = smt.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setPic(rs.getString("pic"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setStatus(rs.getString("status"));
                blogList.add(blog);
            }
            con.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return blogList;
    }

    public ArrayList<Blog> findByBloggerId(int bloggerId) {
        ArrayList<Blog> blogList = new ArrayList();
        try {
            Connection con = DbConnection.getConnection();
            String sql = "select * from blogs where bloggerId=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, bloggerId);
            ResultSet rs = smt.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setPic(rs.getString("pic"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setStatus(rs.getString("status"));
                blogList.add(blog);
            }
            con.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return blogList;
    }

    public boolean updateStatus(int id, String newStatus) {
        boolean status = false;
        try {
            Connection con = DbConnection.getConnection();
            String sql = "update blogs set status=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, newStatus);
            smt.setInt(2, id);
            int n = smt.executeUpdate();
            if (n > 0) {
                status = true;
            }
        } catch (Exception e) {
            System.out.println("Error : " + e.getMessage());
        }

        return status;
    }

    public ArrayList<Blog> findRecentPost(int num) {
        ArrayList<Blog> blogList = new ArrayList();
        try {
            Connection con = DbConnection.getConnection();
            String sql = "select id,title,description, DATE_FORMAT(date,'%D %b,%Y')\"date\",pic,bloggerId,status from blogs order by id desc limit ?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, num);
            ResultSet rs = smt.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setDate(rs.getString("date"));
                blog.setPic(rs.getString("pic"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setStatus(rs.getString("status"));

                blogList.add(blog);
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Error : " + e.getMessage());
        }
        return blogList;

    }
}
