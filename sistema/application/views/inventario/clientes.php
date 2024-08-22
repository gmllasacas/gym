
            <style>
                table.dataTable thead>tr>th {
                    vertical-align: middle;
                    text-align: center;
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
                    <div class="block">
                        <script type="text/javascript">
                            var reportetext='<?php echo $export_text;?>';
                        </script>
                        <div class="block-header bg-gray-lighter">
                            <div class="block-options-simple">
                                <button class="btn btn-xs btn-success nuevoregistro" type="button"><i class="fa fa-plus"></i><span class="hidden-xs push-5-l">REGISTRAR <?php echo $registro_text;?></span></button>
                                <button class="btn btn-xs btn-info push-10-l" type="button" title="Recargar" id="block-reload"><i class="si si-refresh"></i><span class="hidden-xs push-5-l">RECARGAR LISTADO</span></button>
                            </div>
                            <h3 class="block-title"><?php echo $export_text;?></h3>
                        </div>
                        <div class="block-content">
                            <div class="row options push-5">
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
                                        <th rowspan="2">Código</th>
                                        <th rowspan="2">Tipo doc.</th>
                                        <th rowspan="2">Documento</th>
                                        <th rowspan="2">Nombre / Razón social</th>
                                        <th rowspan="1" colspan="4" class="text-center">Membresía</th>
                                        <th rowspan="2">Teléfono</th>
                                        <th rowspan="2">Correo</th>
                                        <th rowspan="2">Provincia</th>
                                        <th rowspan="2">Distrito</th>
                                        <th rowspan="2">Estado</th>
                                        <th rowspan="2">Etiqueta</th>
                                        <th rowspan="2" class="text-center" style="width: 10%;">Acciones</th>
                                    </tr>
                                    <tr>
                                        <th>Membresía</th>
                                        <th>Fecha de fin</th>
                                        <th>Días por vencer</th>
                                        <th>Etiqueta</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Código</th>
                                        <th>Tipo doc.</th>
                                        <th>Documento</th>
                                        <th>Nombre / Razón social</th>
                                        <th>Membresía</th>
                                        <th>Fecha de fin</th>
                                        <th>Días por vencer</th>
                                        <th>Etiqueta</th>
                                        <th>Teléfono</th>
                                        <th>Correo</th>
                                        <th>Provincia</th>
                                        <th>Distrito</th>
                                        <th>Estado</th>
                                        <th>Etiqueta</th>
                                        <th>Acciones</th>
                                    </tr>
                                </tfoot>
                            </table>
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
                                            <button class="btn btn-minw btn-square btn-primary" type="submit"><i class="fa fa-plus push-5-r"></i> Registrar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="credito-modal" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-dialog-popout modal-lg">
                    <div class="modal-content">
                        <div class="block block-themed block-transparent remove-margin-b">
                            <div class="block-header bg-primary">
                                <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                                <h3 class="block-title"><i class="fa fa-list push-10-r"></i><span>Detalle de crédito del cliente</span></h3>
                            </div>
                            <div class="block-content">
                                <h3 class="block-title push-10">
                                    <i class="fa fa-list push-5-r"></i><span>Listado de detalles</span>
                                </h3>
                                <input type="hidden" name="cliente" value="">
                                <table class="table table-hover" id="table-credito">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tipo</th>
                                            <th>Total</th>
                                            <th>Crédito</th>
                                            <th>Fecha</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-xs-12 text-center">
                                        <a class="btn btn-minw btn-square btn-muted push-20" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>