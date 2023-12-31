<%-- 
    Document   : viewBlogDetail
    Created on : Apr 26, 2022, 9:51:00 AM
    Author     : DIPESH
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.BlogDao,com.daos.BloggerDao"%>
<%@page import="com.beans.Blog"%>
<%@page import="com.beans.Blogger"%>
<%@page contentType="text/html" pageEncoding="UTF-8" 
        import="com.beans.Admin"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Monsterlite admin bootstrap 
              5 dashboard, frontend, responsive bootstrap 5 admin template, Monster admin lite design, Monster admin lite dashboard bootstrap 5 dashboard template">
        <meta name="description"
              content="Monster Lite is powerful and clean admin dashboard template, inpired from 
              Bootstrap Framework">
        <meta name="robots" content="noindex,nofollow">
        <title> Blog Detail</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/monster-admin-lite/"/>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png"/>
        <!-- Custom CSS -->
        <link href="assets/plugins/chartist/dist/chartist.min.css" rel="stylesheet"/>
        <!-- Custom CSS -->
        <link href="css/style.min.css" rel="stylesheet"/>
       
    </head>
    <body>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
             <!-- ============================================================== -->
             <!-- Topbar header - style you can find in pages.scss -->
             <!-- ============================================================== -->
             <jsp:include page="header.jsp"></jsp:include>
                 <!-- ============================================================== -->
                 <!-- End Topbar header -->
                 <!-- ============================================================== -->
                 <!-- ============================================================== -->
                 <!-- Left Sidebar - style you can find in sidebar.scss -->
                 <!-- ============================================================== -->
             <jsp:include page="sidebar.jsp"></jsp:include>
                 <!-- ============================================================== -->
                 <!-- End Left Sidebar - style you can find in sidebar.scss -->
                 <!-- ============================================================== -->
                 <!-- ============================================================== -->
                 <!-- Page wrapper -->
                 <!-- ============================================================== -->
                 <div class="page-wrapper">
                     <!-- ============================================================== -->
                     <!-- Bread crumb and right sidebar toggle -->
                     <!-- ============================================================== -->

                     <!-- ============================================================== -->
                     <!-- End Bread crumb and right sidebar toggle -->
                     <!-- ============================================================== -->
                     <!-- ============================================================== -->
                     <!-- Container fluid -->
                     <!-- ============================================================== -->
                     <div class="container-fluid"> 
                         <h1>Blog Details </h1>
                         <div class="row">
                             <div class="col col-md-12">
                             <% int id = Integer.parseInt(request.getParameter("id"));
                                 BlogDao bd = new BlogDao();
                                 Blog blog = bd.findById(id);
                             %>
                             <form method="post">
                                 <table class="table table-bordered">
                                     <tr>
                                         <td> Blog ID : <input type="text" name="id" value="<%=blog.getId()%>" readonly/>
                                     </tr>
                                     <tr>
                                         <td>Blog Description</td>
                                     </tr>
                                     <tr>
                                         <td style="text-align: justify"> <%=blog.getDescription()%>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>
                                             Change Status <br/>
                                             <select name="status" class="dropdown-header">
                                                 <option value="pending">Pending</option>
                                                 <option value="rejected">Rejected</option>
                                                 <option value="approved">Approved</option>

                                             </select>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td><input type="submit" name="submit" value="update status" class="btn btn-primary"/></td>
                                     </tr>
                                 </table>
                         </div>
                     </div>
                     <%
                         if (request.getParameter("submit")!= null) {
                             id = Integer.parseInt(request.getParameter("id"));
                             String status = request.getParameter("status");
                             if (bd.updateStatus(id, status)) {
                                 response.sendRedirect("viewBlogs.jsp");
                             } else {
                                 out.println("<h2>Error in updation </h2>");
                             }
                         }
                     %>
                 </div>
                 <!-- ============================================================== -->
                 <!-- End Container fluid -->
                 <!-- ============================================================== -->
                 <!-- ============================================================== -->
                 <!-- footer -->
                 <!-- ============================================================== -->
                 <jsp:include page="footer.jsp"></jsp:include>
                 <!-- ============================================================== -->
                 <!-- End footer -->
                 <!-- ============================================================== -->
             </div>
             <!-- ============================================================== -->
             <!-- End Page wrapper -->
             <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="assets/plugins/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/app-style-switcher.js"></script>
        <!--Wave Effects -->
        <script src="js/waves.js"></script>
        <!--Menu sidebar -->
        <script src="js/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="js/custom.js"></script>
        <!--This page JavaScript -->
        <!--flot chart-->
        <script src="assets/plugins/flot/jquery.flot.js"></script>
        <script src="assets/plugins/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
        <script src="js/pages/dashboards/dashboard1.js"></script>
    </body>
</html>
