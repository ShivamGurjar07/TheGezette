package com.controller;

import com.beans.Blogger;
import com.daos.BloggerDao;
import com.util.OTPGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SmsController", urlPatterns = {"/SmsController"})
public class SmsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        if (op.equalsIgnoreCase("varifyotp")) {
            String otp1 = request.getParameter("otp");
            HttpSession session = request.getSession();
            String otp2 = (String) session.getAttribute("otp");
            if (otp1.equals(otp2)) {
                out.println("<b>Varified</b>");
                session.removeAttribute("otp");
            } else {
                out.println("<b><font color='red'>Not varified</font></b>");
            }
        }
       
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        if (op != null && op.equalsIgnoreCase("sendmessage")) {
            String message = URLEncoder.encode(request.getParameter("message"), "UTF-8");
            String mobile = request.getParameter("mobile");
            String sendId = "TXTIND";
            String language = "english";
            String route = "v3";
            String apiKey = "ZpxEJb9kLQ17vmtBGuUoANDyga4KcfPlijVq3FwXsHTdOYzIh5bG7DoyBmnYtlJkWIT8SzaiVFdQjARr";
            String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey + "&message=" + message + "&language=" + language + "&route=" + route + "&numbers=" + mobile;
            System.out.println("2");
            URL url = new URL(myUrl);
            HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", "Mozilla/5.0");
            con.setRequestProperty("cache-control", "no-cache");
            System.out.println("3");
            int responseCode = con.getResponseCode(); //200 for success

            if (responseCode == 200) {
                System.out.println("4");
                response.sendRedirect("Message sent successfully");
            } else {
                response.sendRedirect("Error: ");
            }
        }
        
         if (op != null && op.equalsIgnoreCase("sendotp")) {
            String userid = request.getParameter("userid");
            String mobile = request.getParameter("mobile");
            Blogger blogger = new BloggerDao().findByUserid_mobile(userid, mobile);
            if (blogger == null) {
                out.println("Detail Not Matched...");
                return;
            } else {
                String message = OTPGenerator.generateOTP(6);
                //Important Step
                // String mobile = request.getParameter("mobile");
                String sendId = "TXTIND";
                String language = "english";
                String route = "v3";
                String apiKey = "ZpxEJb9kLQ17vmtBGuUoANDyga4KcfPlijVq3FwXsHTdOYzIh5bG7DoyBmnYtlJkWIT8SzaiVFdQjARr";
                String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey + "&message=" + message + "&language=" + language + "&route=" + route + "&numbers=" + mobile;
                System.out.println("2");
                URL url = new URL(myUrl);
                HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("User-Agent", "Mozilla/5.0");
                con.setRequestProperty("cache-control", "no-cache");
                System.out.println("3");
                int responseCode = con.getResponseCode(); //200 for success
                System.out.println("4");
                if (responseCode == 200) {
                    response.sendRedirect("Message sent successfully");
                } else {
                    response.sendRedirect("Error: ");
                }
            }
        }
        
        
    }

}
