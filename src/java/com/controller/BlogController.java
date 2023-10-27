/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.beans.Blog;
import com.daos.BlogDao;
import com.util.ImageUtility;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BlogController", urlPatterns = {"/BlogController"})
public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        if (op != null && op.equals("add")) {
            String imgPath = ImageUtility.uploadImage(request, getServletConfig(), "blogger/blogImages");
            HttpSession session = request.getSession();
            Blog blog = (Blog) session.getAttribute("blog");
            blog.setPic(imgPath);
            String catIds[] = (String[]) session.getAttribute("catIds");
            BlogDao bd = new BlogDao();
            if (bd.add(blog, catIds)) {
                response.sendRedirect("blogger/viewEditPost.jsp");
            } else {
                out.println("Blog not Saved !!!");
            }
        }

    }

}
