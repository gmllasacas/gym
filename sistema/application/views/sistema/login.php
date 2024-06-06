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
                                        <a href="#recuperacion"><i class="si si-refresh push-5-r"></i> Recuperación de contraseña</a>
                                    </li>                                    
                                    <li class="">
                                        <a href="#crear_contrasena"><i class="si si-user push-5-r"></i> Crear contraseña</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade fade-left active in" id="ingreso">
                                        <div class="block block-themed text-center">
                                            <div class="block-header bg-primary">
                                                <ul class="block-options">
                                                    <li>
                                                        <a id="recuperacionbtn" href="#"><i class="fa fa-info-circle push-5-r text-warning"></i> Recuperación de contraseña</a>
                                                    </li>
                                                </ul>
                                                <h3 class="block-title text-left">Ingreso al sistema</h3>
                                            </div>
                                            <div class="block-content block-content-full block-content-narrow">
                                                <img src="<?php echo base_url().$this->configuracion['logo'];?>" class="animated fadeIn" style="max-width: 50%;">
                                                <h1 class="h2 font-w600 push-30-t push-5 text-logo"><b><?php echo $this->configuracion['titulo'];?></b></h1>
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
                                                                        <input class="form-control required passwordinput" type="password" id="password" name="password">
                                                                        <label for="password">Contraseña</label>
                                                                        <span class="input-group-addon"><i class="si si-lock"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                                                            <button class="btn btn-block btn-primary" type="submit"><i class="si si-login push-5-r"></i>Ingresar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade fade-left" id="recuperacion">
                                        <div class="block block-themed">
                                            <div class="block-header bg-primary">
                                                <ul class="block-options">
                                                    <li>
                                                        <a class="ingresobtn" href="#"><i class="si si-login push-5-r text-success"></i> Ingreso al sistema</a>
                                                    </li>
                                                </ul>
                                                <h3 class="block-title">Recuperación de contraseña</h3>
                                            </div>
                                            <div class="block-content block-content-full block-content-narrow">
                                                <div class="row">
                                                    <div class="col-xs-12 animated fadeIn">
                                                        <h4 class="h3 font-w300 push-10 text-center"><i class="fa fa-info-circle push-5-r text-warning"></i> Recuperación de contraseña de ingreso</h4>
                                                        <p class="text-muted">
                                                            Ingrese el <b>correo</b> con el que se registró en el sistema, se enviará un mensaje para la creación de una nueva contraseña.
                                                        </p>
                                                    </div>
                                                </div>
                                                <form class="form-horizontal push-30-t push-50" id="form-login-rec" action="<?php echo base_url();?>sistema/recuperar" method="post">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-md-12">
                                                            <div class="form-group">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required textoinput email" type="text" name="correo">
                                                                        <label>Correo</label>
                                                                        <span class="input-group-addon"><i class="si si-envelope"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-12 col-xs-offset-0 col-sm-6 col-sm-offset-3">
                                                            <button class="btn btn-block btn-danger" type="submit"><i class="si si-envelope push-5-r"></i>Enviar correo</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="crear_contrasena">
                                        <div class="block block-themed">
                                            <div class="block-header bg-primary">
                                                <ul class="block-options" style="float:left; margin-left:0;">
                                                    <li>
                                                    </li>
                                                </ul>
                                                <h3 class="block-title">Crear contraseña</h3>
                                            </div>
                                            <div class="block-content block-content-full block-content-narrow">
                                                <div class="row">
                                                    <div class="col-xs-12 animated fadeIn">
                                                        <h4 class="h3 font-w300 push-10">Creación de nueva contraseña</h4>
                                                        <p class="text-muted">
                                                            Ingrese su nueva contraseña para poder iniciar sesión en el sistema.
                                                        </p>
                                                    </div>
                                                </div>
                                                <form class="form-horizontal push-30-t push-50" id="form-login-crear" action="<?php echo base_url();?>sistema/crear" method="post" autocomplete="off">
                                                    <input type="hidden" name="token" value="<?php echo $token;?>">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                                                            <div class="form-group">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required textoinput" type="text" name="username" value="<?php echo $username;?>" readonly>
                                                                        <label>Usuario</label>
                                                                        <span class="input-group-addon"><i class="si si-user"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                                                            <div class="form-group">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required passwordinput" type="password" name="password" id="password3" autocomplete="new-password" role="presentation">
                                                                        <label>Nueva contraseña</label>
                                                                        <span class="input-group-addon"><i class="si si-lock"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                                                            <div class="form-group">
                                                                <div class="col-xs-12">
                                                                    <div class="input-group form-material form-material-info">
                                                                        <input class="form-control required passwordinput" type="password" name="password2" id="password2" autocomplete="new-password" role="presentation">
                                                                        <label>Confirmar nueva contraseña</label>
                                                                        <span class="input-group-addon"><i class="si si-lock"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                                                            <button class="btn btn-block btn-success" type="submit"><i class="fa fa-edit push-5-r"></i>Guardar</button>
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

        <div class="modal fade in" id="modal-crear" role="dialog">
            <div class="modal-dialog modal-dialog-popout">
                <div class="modal-content">
                    <div class="block block-themed block-transparent remove-margin-b">
                        <div class="block-header bg-primary-dark">
                            <ul class="block-options">
                                <li>
                                    <button data-dismiss="modal" type="button"><i class="si si-close"></i></button>
                                </li>
                            </ul>
                            <h3 class="block-title">Creación de nueva contraseña</h3>
                        </div>
                        <div class="block-content">
                            <div class="row">
                                <div class="col-xs-12 animated fadeIn">
                                    <h4 class="h3 font-w300 push-10 text-center"><i class="fa fa-check text-success push-5-r"></i> Nueva contraseña registrada correctamente</h4>
                                    <p>
                                        Puede iniciar sesión con su nueva contraseña. Se envió un mensaje al correo registrado del usuario asociado.
                                        <br>
                                        En unos minutos revise su bandeja de entrada o de correo no deseado.
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
                        <div class="block-header bg-primary">
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
                                    <h4 class="h3 font-w300 push-10 text-center"><i class="fa fa-check text-success push-5-r"></i> Recuperación realizada correctamente</h4>
                                    <p>
                                        Se envió un mensaje al correo registrado del usuario asociado.
                                        <br>
                                        En unos minutos revise su bandeja de entrada o de correo no deseado.
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