

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head> 

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="TemplateMo">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

        <title>Contact us</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>

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
                    <div class="owl-banner owl-carousel">

                    </div>
                </div>
            </div>
            <!-- Banner Ends Here -->



            <section class="blog-posts">
                <div class="container">
                    <div class="row">
                        <!-- Content will  be changed here -->

                        <div class="col-lg-8" style="height: 100vh">
                            <h2>Contact Details </h2>
                            <div class="content">
                                <form id="contact" action="" method="post">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <fieldset>
                                                <input name="name" type="text" id="name" placeholder="Your name" required="" class="form-control"><br/>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <fieldset>
                                                <input name="email" type="text" id="email" placeholder="Your email" required="" class="form-control">
                                            </fieldset>
                                        </div>
                                        <div class="col-md-12 col-sm-12">
                                            <fieldset>
                                                <input name="subject" type="text" id="subject" placeholder="Subject" class="form-control"> <br/>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <textarea name="message" rows="6" id="message" placeholder="Your Message" required="" class="form-control"></textarea>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset> <br/>
                                                <button type="submit" id="form-submit" class="main-button" class=" btn btn-primary form-control">Send Message</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>   

                        <div class="col-md-4">
                            <h2>Our Address :</h2>
                            <p><i class="fas fa-map-marker-alt"></i> 438  Jawahar Chouk,  Raibidpura, Khargone(M.P.)</p>
                            <p><i class="fab fa-usps"></i> 451 440 </p>
                            <p><i class="fal fa-mobile-alt"></i> +91 9713374309</p>

                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!-- Side Bar -->
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
    function clearField(t) {                   //declaring the array outside of the
        if (!cleared[t.id]) {                      // function makes it static and global
            cleared[t.id] = 1;  // you could use true and false, but that's more typing
            t.value = '';         // with more chance of typos
            t.style.color = '#fff';
        }
    }
</script>

</body>
</html>