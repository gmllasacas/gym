<?php include("header.php"); ?>

<body>
    <!-- COMING SOON SECTION -->
    <section class="coming_soon_section">
        <div class="container">
            <figure class="circle_shape mb-0">
                <img src="./assets/images/coming_soon_circle_icon.png" alt="" class="img-fluid">
            </figure>
            <div class="row" data-aos="fade-up">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="coming_soon_content">
                        <a href="<?php echo $url; ?>" class="text-decoration-none">
                            <figure>
                                <img src="<?php echo $logo_coming; ?>" alt="" class="img-fluid">
                            </figure>
                        </a>
                        <h1>EN CONSTRUCCIÓN</h1>
                        <p>Listos para la acción.</p>
                        <ul class="list-unstyled m-0">
                            <li>
                                <a href="<?php echo $instagram; ?>" target="_blank"><i class="fa-brands fa-instagram" aria-hidden="true"></i></a>
                            </li>
                            <li>
                                <a href="<?php echo $facebook; ?>" target="_blank"><i class="fa-brands fa-facebook-f" aria-hidden="true"></i></a>
                            </li>
                            <li>
                                <a href="<?php echo $tiktok; ?>" target="_blank"><i class="fa-brands fa-tiktok" aria-hidden="true"></i></a>
                            </li>
                            <li class="p-0">
                                <a href="<?php echo $whatsapp; ?>" target="_blank"><i class="fa-brands fa-whatsapp" aria-hidden="true"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

<?php include("footer.php"); ?>
