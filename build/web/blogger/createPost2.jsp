<%@page import="com.daos.CategoryDao"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Blogger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Blogger blogger = (Blogger) session.getAttribute("blogger");
    if (blogger == null) {
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
        <meta name="keywords"
              content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, 
              css3 dashboard, bootstrap 5 dashboard, Monsterlite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 
              admin template, Monster admin lite design, Monster admin lite dashboard bootstrap 5 dashboard template">
        <meta name="description"
              content="Monster Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
        <meta name="robots" content="noindex,nofollow">
        <title>Upload Image</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/monster-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
        <!-- Custom CSS -->
        <link href="assets/plugins/chartist/dist/chartist.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/style.min.css" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
       <![endif]-->


        <script>
            function showImage(input, output) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        output.src = e.target.result;
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>

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

                <jsp:useBean class="com.beans.Blog" id="blog" scope="session"></jsp:useBean>
                <jsp:setProperty name="blog" property="*"></jsp:setProperty>
                <%
                    String[] catIds = request.getParameterValues("category");
                    session.setAttribute("catIds", catIds);
                %>
                <div class="container-fluid"> 
                    <h1>Create New Post </h1>
                    <div class="row">
                        <div class="col col-md-12">
                            <form action="../BlogController?op=add" action="createPost2.jsp" method="post" 
                                  enctype="multipart/form-data">
                                <table class="table table-bordered">
                                    <tr>
                                        <td>Select Image </td>
                                    </tr>
                                    <tr
                                        <td><img src="" style="width:300px; height: 200px; border-width: 2px; border-style: double" 
                                             id="image"/></td>
                                    <tr>
                                        <td> <input type="file" name="blogImage" class="form-control" 
                                                    onchange="showImage(this, image);" required/>
                                    </tr>
                                    <tr>
                                        <td> <input type="submit" name="submit" class="form-control btn btn-success"/>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>

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