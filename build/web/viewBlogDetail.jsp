<%@page import="com.beans.Feedback"%>
<%@page import="com.daos.FeedbackDao"%>
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
                                            
                                        int id=Integer.parseInt(request.getParameter("id"));
                                        Blog blog=new BlogDao().findById(id);
                                            %>
                                            <div class="col col-md-12 text-center"><h3> Title: <%=blog.getTitle()%></h3></div>
                                            <div class="col col-md-12"><img src="<%=blog.getPic()%>" style="width: 100%;height: 300px"/></div><br/>
                                            <div class="col col-md-12" style="text-align: justify"><%=blog.getDescription()%> </div><br/>
                                            <hr/>
                                            <form action="viewBlogDetail.jsp" method="post">
                                                <table class="table table-bordered">
                                                    <tr><td colspan="2"><h5>Drop Your Feedback</h5></td></tr>
                                                    <tr>
                                                        <td>Enter your Name</td>
                                                        <td><input type="text" name="name" class="form-control" required/>
                                                            <input type="hidden" name="blogId" value="<%=blog.getId()%>"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Enter Feedback/Comment</td>
                                                        <td><textarea name="feedback" rows="5" cols="22" class="form-control"></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><center><input type="submit" name="submit" value="submit"/></center>
                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                            </form>
                                </div>
                                
                        <% 
                            if(request.getParameter("submit")!=null){
                                %>
                                <jsp:useBean class="com.beans.Feedback" id="fb"></jsp:useBean>
                                <jsp:setProperty name="fb" property="*"></jsp:setProperty>
                                <%
                                    FeedbackDao fdb =new FeedbackDao();
                                    if(fdb.add(fb))
                                    out.println("Feedback added...");
                                    else 
                                    out.println("Error in adding feedback");
                                  
                            }
                                %>
                                
                                
                                
                            </div>
                        </div>
                    </div>
                    <!-- sidebr -->
                    <div class="col col-lg-4">
                        <h3>Viewer's feedback and Blogger's replies</h3><hr/>
                        <div style="border-width: 2px;border-style: solid;border-radius: 5px;">
                            <%
                                ArrayList<Feedback> fbList=new FeedbackDao().findByBlogId(id);
                                for(Feedback f:fbList){
                                %>
                                <hr/>
                                <p class="bg-inverse">
                                    <b><%=f.getName()%> :</b>
                                    <i><%=f.getFeedback()%></i>
                                </p>
                                
                                <p class="bg-info text-white">
                                    <b>Blogger Reply :</b>
                                    <%=f.getReply()==null?"No reply by Blogger":f.getReply()%>
                                </p>
                            <% }%>
                        </div>
                    </div>
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