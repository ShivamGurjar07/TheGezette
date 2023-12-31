<%@page import="com.beans.Blogger"%>
<%@page import="com.daos.BloggerDao"%>
<%@page import="com.beans.Blog"%>
<%@page import="com.daos.BlogDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-tofit=no">
        <meta name="description" content="">
        <meta name="author" content="TemplateMo">
        <link 
            href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">
        <title>Blogging site</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-stand-blog.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <!--
        TemplateMo 551 Stand Blog
        https://templatemo.com/tm-551-stand-blog
        -->
    </head>
    <body>
        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div> 
        <!-- ***** Preloader End ***** -->
        <!-- Header -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Page Content -->
            <!-- Banner Starts Here -->
            <div class="main-banner header-text">
                <div class="container-fluid">
                </div>
            </div>
            <br/><br/>
            <section class="blog-posts">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="all-blog-posts">
                                <div class="row">
                                    <!-- main conent area -->

                                    <div class="col-lg-12">
                                    <%
                                        ArrayList<Blog> blogList = new BlogDao().findRecentPost(3);
                                        String catId = request.getParameter("catid");
                                        if (catId != null) {
                                            blogList = new BlogDao().findByCategoryId(Integer.parseInt(catId));
                                        }
                                        for (Blog blog : blogList) {
                                                if (blog.getStatus().equalsIgnoreCase("approved")) {%>

                                    <div class="blog-post">
                                        <div class="blog-thumb">
                                            <img src="<%=blog.getPic()%>" alt="" style="width:100%;height: 150px;">
                                        </div>
                                        <div class="down-content">
                                            <a href="#"><h4><%=blog.getTitle()%></h4></a>
                                            <ul class="post-info">
                                                        <li><a href="#"><% Blogger blogger = new BloggerDao().find(blog.getBloggerId());
                                                                 out.println(blogger.getName());%></a></li>
                                                <li><a href="#"><%=blog.getDate()%></a></li>
                                                <li><a href="#">12 Comments</a></li>
                                            </ul>
                                            <p style="text-align:justify"><%=blog.getDescription().substring(0, 250)%>... 
                                            </p>
                                            <div class="row">
                                                <div class="col-12">
                                                    <center><a href="viewBlogDetail.jsp?id=<%=blog.getId()%>" class="btn btn-secondary form-control">View Full Description</a>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}
                                     }%>
         
                                </div>
                                <div class="col-lg-12">
                                    <div class="main-button">
                                        <a href="blog.html">View All Posts</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- sidebr -->
                    <jsp:include page="sidebar.jsp"></jsp:include>
                    </div>
                </div>
            </section>

        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/accordions.js"></script>
        <script language = "text/Javascript">
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
            function clearField(t) { //declaring the array outside of the
                if (!cleared[t.id]) { // function makes it static and global
                    cleared[t.id] = 1; // you could use true and false, but that's more typing
                    t.value = ''; // with more chance of typos
                    t.style.color = '#fff';
                }
            }
        </script>
    </body>
</html>