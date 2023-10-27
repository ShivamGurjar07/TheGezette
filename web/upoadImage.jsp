<%-- 
    Document   : upoadImage
    Created on : Apr 24, 2022, 8:02:31 AM
    Author     : DIPESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script 
        src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script 
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script 
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/font-awesome.min.css">

        <script>
                function showImage(input,output)    {
                 if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                output.src = e.target.result;
            };
                reader.readAsDataURL(input.files[0]);
                }    
        }
        </script>
        </head>
        <body>
        <div class="container">
        <div class="row">
        <div  class="col col-md-12">
              <center>
              
                <jsp:useBean class="com.beans.Blogger" id="user" scope="session"></jsp:useBean>
                <jsp:setProperty name="user" property="*"></jsp:setProperty>
                
        <form action="BloggerController?op=add" method="post" 
            enctype="multipart/form-data">
        <img src="" id="mypic" width="300" height="400" border='2'/><br/>
        Select Your Photo <br/>
            <input type="file"  name="i mage" id="image" requi  red 
            onchange="showImage(this,mypic)"/>
        <br/>
        <input type="submit" value="Register"/>
                </form>
        </center>
                </div>
                </div>
                         </div>
                </body>
                </html>