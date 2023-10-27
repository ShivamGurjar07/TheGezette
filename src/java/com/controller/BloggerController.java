
package com.controller;

import com.beans.Blogger;
import com.daos.BloggerDao;
import com.util.ImageUtility;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "BloggerController", urlPatterns = {"/BloggerController"})
public class BloggerController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        String op=request.getParameter("op");
        if(op!=null && op.equalsIgnoreCase("checkuserid")){
            String userid=request.getParameter("userid");
            BloggerDao bd=new BloggerDao();
            if(bd.isExist(userid))
                out.println("<font color:'red' > Sorry this userid is already registered");
            else 
                out.println("");
            
        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        String op=request.getParameter("op");
        if(op!=null && op.equalsIgnoreCase("add")){
            String imagePath=ImageUtility.uploadImage(request,getServletConfig(),"blogger/profilePics/");
            HttpSession session=request.getSession();
            Blogger blogger =(Blogger)session.getAttribute("blogger");
            blogger.setPic(imagePath);
            
            String cids[]=(String[])session.getAttribute("cids");
            
            BloggerDao bd=new BloggerDao();
            if(bd.add(blogger,cids)){
                response.sendRedirect("login.jsp");
            }
            else
                out.println("Unable to Registered");
        }
    }

    
}
