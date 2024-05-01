        <main id="main-container" >
            <div class="content">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
                        <div class="block block-themed bg-transparent animated fadeIn">
                            <div class="block bg-transparent">
                                <ul class="nav nav-tabs nav-tabs-alt nav-justified hidden" data-toggle="tabs">
                                    <li class="active">
                                        <a href="#ingreso"><i class="si si-login push-5-r"></i> Ingreso al sistema</a>
                                    </li>
                                    <li class="">
                                        <a href="#usuario"><i class="si si-user push-5-r"></i> Crear usuario</a>
                                    </li>
                                    <li class="">
                                        <a href="#recuperacion"><i class="si si-refresh push-5-r"></i> Recuperación de contraseña</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade fade-left active in" id="ingreso">
                                        <div class="block block-themed text-center">
                                            <div class="block-header bg-primary">
                                                <ul class="block-options">
                                                    <li>
                                                    </li>
                                                </ul>
                                                <h3 class="block-title text-left">Ingreso al sistema</h3>
                                            </div>
                                            <div class="block-content block-content-full block-content-narrow">
                                                <img src="<?php echo base_url().$this->configuracion['logo'];?>" class="animated fadeIn" style="max-width: 50%;">
                                                <h1 class="h2 font-w600 push-30-t push-5 text-logo" data-toggle="appear" data-timeout="250" data-class="animated fadeIn"><b><?php echo $this->configuracion['titulo'];?></b></h1>
                                                <h1 class="h3 font-w400 push-30-t push-5 text-logo" >SISTEMA DE CONTROL DE INVENTARIO</h1>
                                                <form class="form-horizontal push-30-t push-30" id="form-login" action="<?php echo base_url();?>sistema/login" method="post">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group text-left">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required textoinput" type="text" id="username" name="username">
                                                                        <label for="username">Usuario</label>
                                                                        <span class="input-group-addon"><i class="si si-user"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group text-left">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required textoinput" type="password" id="password" name="password">
                                                                        <label for="password">Contraseña</label>
                                                                        <span class="input-group-addon"><i class="si si-lock"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                                                            <button class="btn btn-block btn-primary" data-toggle="appear" data-timeout="500" data-class="animated fadeIn" type="submit"><i class="si si-login push-5-r"></i>Ingresar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade fade-left" id="usuario">
                                        <div class="block block-themed">
                                            <div class="block-header bg-primary">
                                                <ul class="block-options" style="float:left; margin-left:0;">
                                                    <li>
                                                        <a class="ingresobtn" href="#"><i class="fa fa-arrow-left push-5-r"></i> Regresar</a>
                                                    </li>
                                                </ul>
                                                <h3 class="block-title text-right">Registro de Emisor</h3>
                                            </div>
                                            <div class="block-content block-content-full block-content-narrow">
                                                <div class="row">
                                                    <div class="col-xs-12 animated fadeIn">
                                                        <h3 class="h5 font-w600 text-uppercase push-5"><i class="fa fa-info text-info push-5-r"></i> Información</h3>
                                                        <h4 class="h3 font-w300 push-10">Registro de Emisor y usuario administrador de sistema</h4>
                                                        <p class="text-muted">
                                                            Ingrese los datos solicitados para el registro del <b>Emisor</b> segun el RUC ingresado y su usuario <b>administrador</b> para el ingreso al sistema. <br>
                                                            Se le enviara un correo con su contrasena generada.
                                                        </p>
                                                    </div>
                                                </div>
                                                <form class="form-horizontal push-30-t push-50" id="form-login-user" action="<?php echo base_url();?>sistema/registraadmin" method="post" autocomplete="off">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group text-left">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="js-masked-ruc form-control input-lg required textoinput font-w700" type="text" name="ruc" id="ruc2" placeholder="9999999999">
                                                                        <label for="ruc2"><b>RUC</b></label>
                                                                        <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group text-left">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required textoinput" type="text" id="username2" name="username">
                                                                        <label for="username2">Usuario</label>
                                                                        <span class="input-group-addon"><i class="si si-user"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group text-left">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required textoinput email" type="text" id="correo" name="correo">
                                                                        <label for="inidate">Correo</label>
                                                                        <span class="input-group-addon"><i class="si si-envelope"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                                                            <button class="btn btn-block btn-success" data-toggle="appear" data-timeout="500" data-class="animated fadeIn" type="submit"><i class="fa fa-plus push-5-r"></i>Registrar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade fade-left" id="recuperacion">
                                        <div class="block block-themed">
                                            <div class="block-header bg-primary">
                                                <ul class="block-options" style="float:left; margin-left:0;">
                                                    <li>
                                                        <a class="ingresobtn" href="#"><i class="fa fa-arrow-left push-5-r"></i> Regresar</a>
                                                    </li>
                                                </ul>
                                                <h3 class="block-title text-right">Recuperación de contraseña</h3>
                                            </div>
                                            <div class="block-content block-content-full block-content-narrow">
                                                <div class="row">
                                                    <div class="col-xs-12 animated fadeIn">
                                                        <h3 class="h5 font-w600 text-uppercase push-5"><i class="fa fa-info text-info push-5-r"></i> Información</h3>
                                                        <h4 class="h3 font-w300 push-10">Recuperación de contraseña de ingreso</h4>
                                                        <p class="text-muted">
                                                            Ingrese los datos solicitados y se enviará una <b>nueva contraseña</b> al </b>correo</b> asociado al usuario registrado en el sistema.
                                                        </p>
                                                    </div>
                                                </div>
                                                <form class="form-horizontal push-30-t push-50" id="form-login-rec" action="<?php echo base_url();?>sistema/recuperar" method="post">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group text-left">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="js-masked-ruc form-control input-lg required textoinput font-w700" type="text" name="ruc" id="ruc3" placeholder="9999999999">
                                                                        <label for="ruc3"><b>RUC</b></label>
                                                                        <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group text-left">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required textoinput" type="text" id="username3" name="username">
                                                                        <label for="username3">Usuario</label>
                                                                        <span class="input-group-addon"><i class="si si-user"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-12 col-xs-offset-0 col-sm-6 col-sm-offset-3">
                                                            <button class="btn btn-block btn-danger" data-toggle="appear" data-timeout="500" data-class="animated fadeIn" type="submit"><i class="fa fa-refresh push-5-r"></i>Recuperar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer id="page-footer" class="content-mini content-mini-full font-s12 bg-gray-lighter clearfix hidden-print">
            <div class="row">
                <div class="col-xs-12 col-sm-6 text-left text-center-xs">
                    <a class="font-w600"><?php echo $this->configuracion['titulo'];?> <?php echo $this->configuracion['version'];?></a> | <span><?php echo date('Y');?></span>
                </div>
                <div class="col-xs-12 col-sm-6 text-right text-center-xs">
                    <?php echo $this->configuracion['copyright'];?>
                </div>
            </div>
        </footer>

        <div class="modal fade in" id="modal-user" role="dialog">
            <div class="modal-dialog modal-dialog-popout">
                <div class="modal-content">
                    <div class="block block-themed block-transparent remove-margin-b">
                        <div class="block-header bg-primary-dark">
                            <ul class="block-options">
                                <li>
                                    <button data-dismiss="modal" type="button"><i class="si si-close"></i></button>
                                </li>
                            </ul>
                            <h3 class="block-title">Registro de usuario</h3>
                        </div>
                        <div class="block-content">
                            <div class="row">
                                <div class="col-xs-12 animated fadeIn">
                                    <h3 class="h5 font-w600 text-uppercase push-5"><i class="fa fa-check text-success push-5-r"></i> Correcto</h3>
                                    <h4 class="h3 font-w300 push-10">Registro realizado correctamente</h4>
                                    <p>
                                        Se envió un mensaje al correo <b></b> con el usuario ingresado y contraseña generada.
                                        <br>
                                        Revise su bandeja de entrada o de correo no deseado.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <div class="col-xs-12 text-center">
                                <a class="btn btn-minw btn-square btn-muted" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade in" id="modal-rec" role="dialog">
            <div class="modal-dialog modal-dialog-popout">
                <div class="modal-content">
                    <div class="block block-themed block-transparent remove-margin-b">
                        <div class="block-header bg-primary-dark">
                            <ul class="block-options">
                                <li>
                                    <button data-dismiss="modal" type="button"><i class="si si-close"></i></button>
                                </li>
                            </ul>
                            <h3 class="block-title">Recuperación de contraseña</h3>
                        </div>
                        <div class="block-content">
                            <div class="row">
                                <div class="col-xs-12 animated fadeIn">
                                    <h3 class="h5 font-w600 text-uppercase push-5"><i class="fa fa-check text-success push-5-r"></i> Correcto</h3>
                                    <h4 class="h3 font-w300 push-10">Recuperación realizada correctamente</h4>
                                    <p>
                                        Se envió un mensaje al correo registrado del usuario ingresado con la nueva contraseña generada.
                                        <br>
                                        Revise su bandeja de entrada o de correo no deseado.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <div class="col-xs-12 text-center">
                                <a class="btn btn-minw btn-square btn-muted" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="login_message" style="display:none;"> 
            Ingresando ...
        </div> 

        <script src="<?php echo base_url();?>public/js/core/jquery.min.js"></script>
        <script src="<?php echo base_url();?>public/js/core/bootstrap.min.js"></script>
        <script src="<?php echo base_url();?>public/js/core/jquery.slimscroll.min.js"></script>
        <script src="<?php echo base_url();?>public/js/core/jquery.scrollLock.min.js"></script>
        <script src="<?php echo base_url();?>public/js/core/jquery.appear.min.js"></script>
        <script src="<?php echo base_url();?>public/js/core/jquery.placeholder.min.js"></script>
        <script src="<?php echo base_url();?>public/js/core/js.cookie.min.js"></script>
        <script src="<?php echo base_url();?>public/js/app.js"></script>

        <script src="<?php echo base_url();?>public/js/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datetimepicker/moment.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/jquery-blockui/jquery.blockUI.js"></script>

        <script>
            jQuery(function () {
                App.initHelpers(['notify','masked-inputs','datepicker']);
            });
        </script>
        <?php foreach ($funciones as $item) { ?>
        <script src="<?php echo base_url();?>public/js/pages/<?php echo $item;?>.js?v<?php echo rand();?>"></script>
        <?php }?>
    </body>
</html>