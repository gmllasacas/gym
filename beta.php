<?php include("header.php"); ?>

<body>
    <div class="banner-section-outer">
        <header>
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="<?php echo $url; ?>"><figure class="mb-0"><img src="<?php echo $logo; ?>" alt="logo" class="img-fluid"></figure></a>
                    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">INICIO</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#planes">PLANES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#nosotros">NOSOTROS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#paquetes">PAQUETES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#equipo">EQUIPO</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#contacto">CONTACTO</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link contact_btn" href="<?php echo $system; ?>">INGRESAR</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <!-- SOCIAL ICONS -->
        <div class="left_icons float-left d-table" data-aos="fade-down">
            <div class="icon_content d-table-cell align-middle">
                <ul class="list-unstyled p-0 m-0">
                    <li>
                        <a href="<?php echo $instagram; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-instagram" aria-hidden="true"></i></a>
                    </li>
                    <li>
                        <a href="<?php echo $facebook; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-facebook-f" aria-hidden="true"></i></a>
                    </li>
                    <li>
                        <a href="<?php echo $tiktok; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-tiktok" aria-hidden="true"></i></a>
                    </li>
                    <li class="p-0">
                        <a href="<?php echo $whatsapp; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-whatsapp" aria-hidden="true"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- BANNER SECTION -->
        <section class="banner-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="banner_slider" class="carousel slide" data-ride="carousel">
                            <ul class="carousel-indicators">
                            <li data-target="#banner_slider" data-slide-to="0" class="active"></li>
                            <li data-target="#banner_slider" data-slide-to="1"></li>
                            </ul>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="banner-section-content">
                                        <div class="banner-section-wrapper">
                                            <h3>PROMOCIÓN</h3>
                                            <h2 data-aos="fade-up">PRE-APERTURA</h2>
                                            <figure class="white_line mb-0">
                                                <img src="./assets/images/banner_white_line.png" alt="linea" class="img-fluid">
                                            </figure>
                                        </div>
                                        <p>Entrada desde las 5 AM en la sede Golden Plaza.</p>
                                        <div class="btn_wrapper">
                                            <a class="text-decoration-none join_now_btn" href="#planes">Inscríbete
                                                <i class="fa-solid fa-play"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">    
                                    <div class="banner-section-content">
                                        <div class="banner-section-wrapper">
                                            <h3>PROMOCIÓN</h3>
                                            <h2 data-aos="fade-up">PLAN GOLD</h2>
                                            <figure class="white_line mb-0">
                                                <img src="./assets/images/banner_white_line.png" alt="linea" class="img-fluid">
                                            </figure>
                                        </div>
                                        <p>Inscribe a un amigo y recibirá un descuento.</p>
                                        <div class="btn_wrapper">
                                            <a class="text-decoration-none join_now_btn" href="#planes">Inscríbete
                                                <i class="fa-solid fa-play"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <?php
        $planes = [];

        $planes[0]['precio'] = 'S/99.90';
        $planes[0]['duracion'] = 'Mensual';
        $planes[0]['descripcion'] = 'GOLD';

        $planes[1]['precio'] = 'S/89.90';
        $planes[1]['duracion'] = 'Mensual';
        $planes[1]['descripcion'] = 'ESTÁNDAR';
        $planes[1]['detalles'][0]['descripcion'] = 'Solo 1 sede';
        $planes[1]['detalles'][1]['descripcion'] = 'Ingreso FULL DAY';
        
        $planes[2]['precio'] = 'S/79.90';
        $planes[2]['duracion'] = 'Mensual';
        $planes[2]['descripcion'] = 'GOOD MORNING';
        $planes[2]['detalles'][0]['descripcion'] = 'Solo 1 sede';
        $planes[2]['detalles'][1]['descripcion'] = 'Ingreso exclusivo de MAÑANA';

        $planes[3]['precio'] = 'S/170.00';
        $planes[3]['duracion'] = 'Mensual';
        $planes[3]['descripcion'] = 'GYMBRO';

        $planes[4]['precio'] = 'S/240.00';
        $planes[4]['duracion'] = 'Mensual';
        $planes[4]['descripcion'] = 'GRUPAL';
    ?>
    <!-- OUR SCHEDULE SECTION -->
    <section class="our_schedule_section" id="planes">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="our_schedule_content">
                        <h5>PLANES</h5>
                        <h2>ELIJE EL MEJOR PLAN</h2>
                    </div>
                </div>
            </div>
            <div class="table_wrapper" data-aos="fade-right">
                <table>
                    <tr>
                        <th>
                            <figure class="mb-0">
                                <img src="<?php echo $logo; ?>" alt="logo" class="img-fluid">
                            </figure>
                        </th>
            <?php foreach ($planes as $plane) { ?>
                        <th><?php echo $plane['descripcion']; ?></th>
            <?php } ?>
                    </tr>
                    <tr>
                        <td>Ingreso a ambas SEDES</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                    </tr>
                    <tr>
                        <td>Ingreso a una SEDE</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                    </tr>
                    <tr>
                        <td>Turno mañana</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                    </tr>
                    <tr>
                        <td>Turno tarde</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                    </tr>
                    <tr>
                        <td>Lunes a Domingo</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                    </tr>
                    <tr>
                        <td>Feriados</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                    </tr>
                    <tr>
                        <td>Máquinas y clases grupales</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                    </tr>
                    <tr>
                        <td>Invitados</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                    </tr>
                    <tr>
                        <td>Congelamiento de días</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                    </tr>
                    <tr>
                        <td>Regalo de bienvenida</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                    </tr>
                    <tr>
                        <td>Descuentos</td>
                        <td><i class="fa fa-check"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                        <td><i class="fa fa-xmark"></i></td>
                    </tr>
                    <tr>
                        <th></th>
                        <th>S/ 99.90</th>
                        <th>S/ 89.90</th>
                        <th>S/ 79.90</th>
                        <th>S/ 170.00</th>
                        <th>S/ 240.00</th>
                    </tr>
                </table>
            </div>
            <div class="btn_wrapper">
                <a class="text-decoration-none join_now_btn" href="<?php echo $whatsapp; ?>" target="_blank" rel="noopener noreferrer">Inscríbete
                    <i class="fa-solid fa-pen-to-square"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- TESTIMONIALS SECTION -->
    <section class="testimonials_section">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="testimonials_heading_content" data-aos="fade-right">
                        <h5>TESTIMONIOS</h5>
                        <h2>LOS CLIENTES DICEN</h2>
                    </div>
                    <div class="owl-carousel owl-theme">
                        <div class="item">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="testimonials_content">
                                        <div class="testimonials_apostrophy_wrapper">
                                            <p>A 10 meses de mi regreso al gimnasio, me doy cuenta cuánto he avanzado, la timidez, la confianza, la seguridad que antes me limitaba 
                                                y no me permitía avanzar, ahora cambio, hoy es distinto. Estoy segura de que cada paso que doy me acerca a la mejor versión de mí misma.</p>
                                            <figure class="apostrophy mb-0">
                                                <img src="./assets/images/testimonials_apostrophy.png" alt="" class="img-fluid">
                                            </figure>
                                        </div>
                                        <div class="testimonials_wrapper">
                                            <h6>JHERALDYNE TAMARA</h6>
                                            <span>Cliente</span>
                                            <figure class="white_line mb-0">
                                                <img src="./assets/images/testimonials_white_line.png" alt="" class="img-fluid">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <figure class="testimonials_img">
                                        <img src="./assets/images/testimonies/testimonie_2.jpg" alt="" class="img-fluid">
                                    </figure>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="testimonials_content">
                                        <div class="testimonials_apostrophy_wrapper">
                                            <p>El gimnasio salvó mi vida cuando estaba en mi punto más bajo, luchando contra la obesidad, el alcoholismo y una depresión.
                                                Gracias a ellos, pude superar mis adicciones, transformar mi cuerpo y mente, y recuperar mi autoestima y alegría de vivir.</p>
                                            <figure class="apostrophy mb-0">
                                                <img src="./assets/images/testimonials_apostrophy.png" alt="" class="img-fluid">
                                            </figure>
                                        </div>
                                        <div class="testimonials_wrapper">
                                            <h6>SIANG LUNA</h6>
                                            <span>Cliente, 22 años</span>
                                            <figure class="white_line mb-0">
                                                <img src="./assets/images/testimonials_white_line.png" alt="" class="img-fluid">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <figure class="testimonials_img">
                                        <img src="./assets/images/testimonies/testimonie_1.jpg" alt="" class="img-fluid">
                                    </figure>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="testimonials_content">
                                        <div class="testimonials_apostrophy_wrapper">
                                            <p>Comencé a asistir al gimnasio para mejorar mi físico, pues ya no me sentía cómoda ya no me sentía yo, había caído en depresión por muchos meses.
                                                A mi me impulsaron, no tome la decisión de asistir al gimnasio por mi misma, ahora puedo decir que me siento yo otra vez.</p>
                                            <figure class="apostrophy mb-0">
                                                <img src="./assets/images/testimonials_apostrophy.png" alt="" class="img-fluid">
                                            </figure>
                                        </div>
                                        <div class="testimonials_wrapper">
                                            <h6>KATHERINE BRAVO</h6>
                                            <span>Cliente, 22 años</span>
                                            <figure class="white_line mb-0">
                                                <img src="./assets/images/testimonials_white_line.png" alt="" class="img-fluid">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <figure class="testimonials_img">
                                        <img src="./assets/images/testimonies/testimonie_3.jpg" alt="" class="img-fluid">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ABOUT US SECTION -->
    <section class="aboutus_section"  id="nosotros">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12 d-lg-block d-md-flex align-items-center">
                    <div class="aboutus_image">
                        <figure class="mb-0">
                            <img src="./assets/images/aboutus_image.png" alt="nosotros">
                        </figure>
                    </div>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12" data-aos="fade-right">
                    <div class="aboutus_content">
                        <h5>NOSOTROS</h5>
                        <h2>TAHUA FITNESS CLUB</h2>
                        <p>Nuestra misión es transformar vidas a través del ejercicio y la realización de actividad física, promoviendo un estilo de vida saludable y equilibrado para todos nuestros colaboradores.</p>
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-6 col-6">
                                <div class="counter_wrapper">
                                    <span class="rating counter">600</span>
                                    <span class="plus_sign">K+</span>
                                    <p>HORAS TRABAJADAS</p>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-6 col-6">
                                <div class="counter_wrapper margin_left">
                                    <span class="rating counter">790</span>
                                    <span class="plus_sign">+</span>
                                    <p>PROGRAMAS EJECUTADOS</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-6 col-6">
                                <div class="counter_wrapper">
                                    <span class="rating counter">2560</span>
                                    <span class="plus_sign">+</span>
                                    <p>CLIENTES FELICES</p>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-6 col-6">
                                <div class="counter_wrapper margin_left">
                                    <span class="rating counter">830</span>
                                    <span class="plus_sign">+</span>
                                    <p>CUERPOS PERFECTOS</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="coming_soon_content">
                        <ul class="list-unstyled m-0 pl-0">
                            <li class="icons"><a href="<?php echo $instagram; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-instagram" aria-hidden="true"></i></a></li>
                            <li class="icons"><a href="<?php echo $facebook; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-facebook-f" aria-hidden="true"></i></a></li>
                            <li class="icons"><a href="<?php echo $tiktok; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-tiktok" aria-hidden="true"></i></a></li>
                            <li class="icons"><a href="<?php echo $whatsapp; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-whatsapp mr-0" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php
        $paquetes = [];
        $paquetes[0]['precio'] = 'S/240';
        $paquetes[0]['duracion'] = 'S/80 mensual';
        $paquetes[0]['descripcion'] = 'Miembro Tahua';
        $paquetes[0]['image'] = './assets/images/pricing_tables_1.jpg';
        $paquetes[0]['detalles'][0]['descripcion'] = '3 meses';
        $paquetes[0]['detalles'][1]['descripcion'] = 'Acceso lunes a sábado';
        $paquetes[0]['detalles'][2]['descripcion'] = '1 semana de regalo';
        $paquetes[0]['detalles'][3]['descripcion'] = '25% de descuento DR. Chang';

        $paquetes[1]['precio'] = 'S/450';
        $paquetes[1]['duracion'] = 'S/75 mensual';
        $paquetes[1]['descripcion'] = 'Gold';
        $paquetes[1]['image'] = './assets/images/pricing_tables_2.jpg';
        $paquetes[1]['detalles'][0]['descripcion'] = '6 meses';
        $paquetes[1]['detalles'][1]['descripcion'] = 'Acceso lunes a sábado';
        $paquetes[1]['detalles'][2]['descripcion'] = '2 semanas de regalo';
        $paquetes[1]['detalles'][3]['descripcion'] = '25% de descuento DR. Chang';

        $paquetes[2]['precio'] = 'S/840';
        $paquetes[2]['duracion'] = 'S/70 mensual';
        $paquetes[2]['descripcion'] = 'Premium';
        $paquetes[2]['image'] = './assets/images/pricing_tables_3.jpg';
        $paquetes[2]['detalles'][0]['descripcion'] = '1 año';
        $paquetes[2]['detalles'][1]['descripcion'] = 'Acceso lunes a sábado';
        $paquetes[2]['detalles'][2]['descripcion'] = '1 mes de regalo';
        $paquetes[2]['detalles'][3]['descripcion'] = '25% de descuento DR. Chang';
    ?>
    <!-- PRICING TABLES SECTION -->
    <section class="pricing_tables_section"  id="paquetes">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="pricing_tables_content">
                        <h5>PAQUETES</h5>
                        <h2>ELIJE TU PAQUETE</h2>
                    </div>
                </div>
            </div>
            <div class="row" data-aos="fade-up">
            <?php foreach ($paquetes as $paquete) { ?>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="pricing_tables_box_content">
                        <div class="pricing_tables_box_upper_portion">
                            <figure class="mb-0">
                                <img src="<?php echo $paquete['image']; ?>" alt="paquete" class="img-fluid">
                            </figure>
                            <div class="pricing_tables_box_image_content">
                                <span class="price"><?php echo $paquete['precio']; ?></span>
                                <span class="month"><?php echo $paquete['duracion']; ?></span>
                            </div>
                        </div>
                        <div class="pricing_tables_box_lower_portion">
                            <h5><?php echo $paquete['descripcion']; ?></h5>
                            <ul class="list-unstyled">
                            <?php foreach ($paquete['detalles'] as $detalle) { ?>
                                <li>
                                    <i class="fa-solid fa-check" aria-hidden="true"></i><?php echo $detalle['descripcion']; ?>
                                </li>
                            <?php } ?>
                            </ul>
                            <div class="btn_wrapper">
                                <a class="join_now_btn text-decoration-none" href="<?php echo $whatsapp; ?>" target="_blank" rel="noopener noreferrer">Inscríbete</a>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
            </div>
        </div>
    </section>

    <?php
        $team_members = [];

        $team_members[0]['nombre'] = 'ISRAEL LAZARO';
        $team_members[0]['titulo'] = 'Trainer';
        $team_members[0]['redes']['facebook'] = '#';
        $team_members[0]['imagen'] = './assets/images/members/member_1.jpg';

        $team_members[1]['nombre'] = 'GIANPIERRE CORDERO';
        $team_members[1]['titulo'] = 'Trainer';
        $team_members[1]['redes']['facebook'] = '#';
        $team_members[1]['imagen'] = './assets/images/members/member_2.jpg';

        $team_members[2]['nombre'] = 'BRINER RODRÍGUEZ';
        $team_members[2]['titulo'] = 'Trainer';
        $team_members[2]['redes']['facebook'] = '#';
        $team_members[2]['imagen'] = './assets/images/members/member_4.jpg';

        $team_members[4]['nombre'] = 'FRAYELIS BRIZUELA';
        $team_members[4]['titulo'] = 'Trainer';
        $team_members[4]['redes']['facebook'] = '#';
        $team_members[4]['imagen'] = './assets/images/members/member_5.jpg';

        $team_members[5]['nombre'] = 'KEVIN CORASI';
        $team_members[5]['titulo'] = 'Trainer';
        $team_members[5]['redes']['facebook'] = '#';
        $team_members[5]['imagen'] = './assets/images/members/member_6.jpg';

        $team_members[6]['nombre'] = 'ANGELA JAMANCA';
        $team_members[6]['titulo'] = 'Trainer';
        $team_members[6]['redes']['facebook'] = '#';
        $team_members[6]['imagen'] = './assets/images/members/member_7.jpg';

        $team_members[7]['nombre'] = 'SIANG LUNA';
        $team_members[7]['titulo'] = 'Trainer';
        $team_members[7]['redes']['facebook'] = '#';
        $team_members[7]['imagen'] = './assets/images/members/member_8.jpg';
    ?>
    <!-- TEAM MEMBERS SECTION -->
    <section class="team_member_section team_member_background_section" id="equipo">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="team_member_content">
                        <h5>MIEMBROS DEL EQUIPO</h5>
                        <h2>EQUIPO DE ENTRADORES EXPERTOS</h2>
                    </div>
                </div>
            </div>
            <div class="row" data-aos="fade-up">
                <div class="owl-carousel owl-theme">
                    <?php foreach ($team_members as $item) { ?>
                    <div class="item">
                        <div class="team_member_box_content2">
                            <div class="team_member_box_upper_portion">
                                <figure class="mb-0">
                                    <img src="<?php echo $item['imagen']; ?>" alt="" class="img-fluid">
                                </figure>
                            </div>
                            <div class="team_member_box_lower_portion">
                                <h5><?php echo $item['nombre']; ?></h5>
                                <p><?php echo $item['titulo']; ?></p>
                                <div class="team_member_social_icons">
                                    <a href="<?php echo $item['redes']['facebook']; ?>" class="text-decoration-none">
                                        <i class="fa-brands fa-facebook-f" aria-hidden="true"></i>
                                    </a>
                                    <a href="<?php echo $item['redes']['facebook']; ?>" class="text-decoration-none">
                                        <i class="fa-brands fa-twitter" aria-hidden="true"></i>
                                    </a>
                                    <a href="<?php echo $item['redes']['facebook']; ?>" class="text-decoration-none">
                                        <i class="fa-brands fa-instagram" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </section>

    <!-- TEAM MEMBERS SECTION -->
    <section class="our_news_section"  id="fotos">
        <div class="container">
            <div class="row d-flex align-items-center justify-content-center" data-aos="fade-up">
                <div class="team_member_content">
                    <h5>FOTOS</h5>
                    <h2>INSTAGRAM</h2>
                </div>
            </div>
            <div class="row d-flex align-items-center justify-content-center" data-aos="fade-up">
                <div class="border-accent">
                    <iframe src="<?php echo $instagram_embed; ?>" width="640" height="660" frameborder="0" scrolling="no" allowtransparency="true"></iframe>
                </div>
            </div>
        </div>
    </section>

    <!-- CONTACT US SECTION -->
    <section class="contact_us_section" id="contacto">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 d-lg-block d-md-flex align-items-center">
                    <div class="contact_us_image">
                        <figure class="mb-0">
                            <img src="./assets/images/contact_us_image.png" alt="">
                        </figure>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="contact_us_form_content" data-aos="fade-right">
                        <h5>CONTACTO</h5>
                        <h2>ÚNETE AL EQUIPO</h2>
                        <form method="post" action="<?php echo $system . '/service/contacto'; ?>" autocomplete="off" id="contact-form">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group mb-0">    
                                    <input type="text" name="name" id="fullname" class="form-placeholder-color" placeholder="Nombre" required> 
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group mb-0">
                                    <input type="tel" name="phone" id="phonenum" class="form-placeholder-color form_style" placeholder="Teléfono" required>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group mb-0">    
                                    <input type="email" name="email" id="emailaddrs" class="form-placeholder-color" placeholder="Correo" required> 
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group mb-0">    
                                    <input type="text" name="sub" id="title" class="form-placeholder-color form_style" placeholder="Asunto"> 
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class=" form-group mb-0">    
                                    <textarea rows="3" name="msg" id="comment" class="form-placeholder-color" placeholder="Mensaje" required></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="g-recaptcha" data-sitekey="<?php echo $recaptcha_html_web_secret; ?>"></div>
                            <br/>
                            <div class="btn_wrapper">
                                <button type="submit" name="btnsubmit" id="submitbutton">Enviar<i class="fa-solid fa-play"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <?php
        $footer_sede_1 = 'SEDE SUNAT';
        $footer_sede_1_url = 'https://maps.app.goo.gl/zqmTAbcEF6n4AjDK6';
        $footer_sede_1_direccion = 'Jr. Simón Bolívar 667 - Huaraz';
        $footer_sede_1_horario_1 = 'Lunes a Viernes: 6 AM a 11 PM';
        $footer_sede_1_horario_2 = 'Sábado: 7 AM a 1 PM, 4 PM a 8 PM';
        $footer_sede_1_horario_3 = 'Domingo: 4 PM a 8 PM';

        $footer_sede_2 = 'SEDE GOLDEN PLAZA';
        $footer_sede_2_url = 'https://maps.app.goo.gl/mZmT3z12wfusrU9s7';
        $footer_sede_2_direccion = 'Av. Centenario 290 - Golden Plaza';
        $footer_sede_2_horario_1 = 'Lunes a Viernes: 6 AM a 10 PM';
        $footer_sede_2_horario_2 = 'Sábado: 7 AM a 1 PM, 4 PM a 8 PM';
        $footer_sede_2_horario_3 = 'Domingo: 4 PM a 8 PM';
    ?>
    <!-- FOOTER SECTION -->
    <section class="footer-section">
        <div class="container">
            <div class="middle-portion">
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="about_col">
                            <a href="<?php echo $url; ?>">
                                <figure>
                                    <img src="<?php echo $logo_footer; ?>" alt="footer" class="img-fluid">
                                </figure>
                            </a>
                            <ul class="list-unstyled">
                                <li class="icons"><a href="<?php echo $instagram; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-instagram" aria-hidden="true"></i></a></li>
                                <li class="icons"><a href="<?php echo $facebook; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-facebook-f" aria-hidden="true"></i></a></li>
                                <li class="icons"><a href="<?php echo $tiktok; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-tiktok" aria-hidden="true"></i></a></li>
                                <li class="icons"><a href="<?php echo $whatsapp; ?>" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-whatsapp mr-0" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="hours_col">
                            <h6><?php echo $footer_sede_1; ?></h6>
                            <ul class="list-unstyled"><li>
                                <li>
                                    <p>Dirección</p>
                                </li>
                                <li>
                                    <span><a href="<?php echo $footer_sede_1_url; ?>"><?php echo $footer_sede_1_direccion; ?></a></span>
                                </li>
                                <li>
                                    <p>Horarios</p>
                                </li>
                                <li>
                                    <span><?php echo $footer_sede_1_horario_1; ?></span>
                                </li>
                                <li>
                                    <span><?php echo $footer_sede_1_horario_2; ?></span>
                                </li>
                                <li>
                                    <span><?php echo $footer_sede_1_horario_3; ?></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="hours_col">
                            <h6><?php echo $footer_sede_2; ?></h6>
                            <ul class="list-unstyled"><li>
                                <li>
                                    <p>Dirección</p>
                                </li>
                                <li>
                                    <span><a href="<?php echo $footer_sede_1_url; ?>"><?php echo $footer_sede_2_direccion; ?></a></span>
                                </li>
                                <li>
                                    <p>Horarios</p>
                                </li>
                                <li>
                                    <span><?php echo $footer_sede_2_horario_1; ?></span>
                                </li>
                                <li>
                                    <span><?php echo $footer_sede_2_horario_2; ?></span>
                                </li>
                                <li>
                                    <span><?php echo $footer_sede_2_horario_3; ?></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-portion">
            <div class="copyright col-xl-12"> 
                <p>Desarrollado por SENQAI SOURCE</p>
            </div>
        </div>
        <figure class="mb-0 footer_left_icon left_icon">
            <img src="./assets/images/logo-gris.png" alt="logo" class="img-fluid">
        </figure>
        <figure class="mb-0 footer_right_icon right_icon">
            <img src="./assets/images/logo-gris.png" alt="logo" class="img-fluid">
        </figure>
    </section>

<?php include("footer.php"); ?>
