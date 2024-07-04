            <style>
                .table-condensed .form-group{
                    margin-bottom: 0px;
                }
            </style>
            <main id="main-container" >
                <div class="content-mini-barra bg-gray-lighter">
                    <div class="row">
                        <div class="col-sm-12">
                            <ol class="breadcrumb">
                                <li><?php echo $menu_text;?></li>
                                <li><a class="link-effect" href="#"><?php echo $submenu_text;?></a></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="block push-10">
                        <ul class="nav nav-tabs nav-justified" data-toggle="tabs">
                            <li class="active">
                                <a href="#clientes_nuevos" class="block-title"><?php echo $export_text;?></a>
                            </li>
                            <li class="">
                                <a href="#clientes_inactivos" class="block-title"><?php echo $export_text_2;?></a>
                            </li>
                        </ul>
                        <div class="block-content tab-content">
                            <div class="tab-pane fade active in" id="clientes_nuevos">
                                <script type="text/javascript">
                                    var reportetext='<?php echo $export_text;?>';
                                </script>
                                <form class="form-horizontal push-15" method="post" action="" id="busqueda-form" autocomplete="off">
                                    <input type="hidden" name="table" value="proceso_cliente">
                                    <input type="hidden" name="estado" value="^5">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-2 col-sm-offset-3">
                                            <div class="form-group push-5">
                                                <label class="col-xs-12">Fecha de inicio</label>
                                                <div class="col-xs-12">
                                                    <div class="input-group">
                                                        <input class="js-datepicker-inicio form-control required" data-date-format="yyyy-mm-dd" type="text" name="fechainicio" placeholder="Fecha">
                                                        <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2">
                                            <div class="form-group push-5">
                                                <label class="col-xs-12">Fecha de fin</label>
                                                <div class="col-xs-12">
                                                    <div class="input-group">
                                                        <input class="js-datepicker-fin form-control required" data-date-format="yyyy-mm-dd" type="text" name="fechafin" placeholder="Fecha">
                                                        <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2">
                                            <div class="form-group push-5">
                                                <label class="col-xs-12"><br></label>
                                                <div class="col-xs-12">
                                                    <button class="btn btn-info width100" type="submit"><i class="fa fa-search push-5-r"></i>CONSULTAR</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="row options options-1 push-5">
                                    <div class="col-xs-12 col-sm-6">
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                    </div>
                                </div>
                                <table class="table table-hover table-bordered table-header-bg" id="table-list">
                                    <thead>
                                        <tr>
                                            <th>Fecha de registro</th>
                                            <th>Código</th>
                                            <th>Cliente</th>
                                            <th>Teléfono</th>
                                            <th>Correo</th>
                                            <th>Membresía</th>
                                            <th>Usuario de registro</th>
                                            <th>Estado</th>
                                            <th class="text-center" style="width: 120px;">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade " id="clientes_inactivos">
                                <script type="text/javascript">
                                    var reportetext_2='<?php echo $export_text_2;?>';
                                </script>
                                <div class="row options options-2 push-5">
                                    <div class="col-xs-12 col-sm-6">
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                    </div>
                                </div>
                                <table class="table table-hover table-bordered table-header-bg" id="table-list-2">
                                    <thead>
                                        <tr>
                                            <th>Fecha de fin de membresía</th>
                                            <th>Código</th>
                                            <th>Cliente</th>
                                            <th>Teléfono</th>
                                            <th>Correo</th>
                                            <th>Membresía</th>
                                            <th>Etiqueta de membresía</th>
                                            <th>Usuario de registro</th>
                                            <th>Estado</th>
                                            <th class="text-center" style="width: 10%;">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        
            <div class="modal fade" id="registro-modal" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-popout modal-lg">
                    <div class="modal-content">
                        <div class="block block-themed block-transparent remove-margin-b">
                            <div class="block-header bg-primary">
                                <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                                <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de <?php echo $registro_text;?></span></h3>
                            </div>
                            <div class="block-content">
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="registro-form" autocomplete="off">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="estado" value="1">
                                    <input type="hidden" name="table" value="proceso_cliente">
                                    <input type="hidden" name="departamento" value="<?php echo $departamento; ?>">
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos generales</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control" name="tipo_documento" style="width: 100%;">
                                                            <?php foreach ($tipos as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Tipo de documento</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control required textoinput font-w700" type="text" name="documento">
                                                        <label><b>Nro. de documento</b></label>
                                                        <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control required textoinput" type="text" name="nombre_o_razon_social">
                                                        <label>Nombres / Razón social</label>
                                                        <span class="input-group-addon"><i class="si si-info"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control select2" name="provincia" style="width: 100%;" data-placeholder="Seleccione provincia">
                                                            <?php foreach ($provincias as $item) :?>
                                                            <option value="<?php echo $item['idprovincia']; ?>" ><?php echo $item['provincia']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Provincia</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control select2" name="distrito" style="width: 100%;" data-placeholder="Seleccione distrito">
                                                        </select>
                                                        <label>Distrito</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="direccion_completa">
                                                        <label>Dirección</label>
                                                        <span class="input-group-addon"><i class="si si-direction"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput digits" type="text" name="telefono">
                                                        <label>Teléfono</label>
                                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput email" type="text" name="correo">
                                                        <label>Correo</label>
                                                        <span class="input-group-addon"><i class="si si-envelope"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="js-datepicker-inicio form-control" data-date-format="yyyy-mm-dd" type="text" name="fecha_nacimiento" placeholder="Fecha">
                                                        <label>Fecha de nacimiento</label>
                                                        <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material">
                                                        <textarea class="form-control" name="notas" rows="2"></textarea>
                                                        <label>Notas</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-user text-primary push-5-r"></i> Datos de contacto de emergencia</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-5">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="contacto">
                                                        <label>Nombres de contacto</label>
                                                        <span class="input-group-addon"><i class="si si-user"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput digits" type="text" name="contacto_telefono">
                                                        <label>Teléfono de contacto</label>
                                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12 text-center">
                                            <a class="btn btn-minw btn-square btn-muted" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
