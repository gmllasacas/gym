            <style>
                .table > thead:first-child > tr:first-child > th {
                    vertical-align: middle;
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
                        <script type="text/javascript">
                            var reportetext='<?php echo $export_text;?>';
                        </script>
                        <form class="form-horizontal" method="post" action="" id="busqueda-form" autocomplete="off">
                            <input type="hidden" name="table" value="proceso_ingreso">
                            <input type="hidden" name="estado" value="^5">
                            <div class="block-header bg-gray-lighter">
                                <div class="block-options-simple">
                                    <button class="btn btn-xs btn-success nuevoregistro" type="button"><i class="fa fa-plus"></i><span class="hidden-xs push-5-l">REGISTRAR <?php echo $registro_text;?></span></button>
                                </div>
                                <h3 class="block-title"><?php echo $export_text;?> por fecha</h3>
                            </div>
                            <div class="block-content">
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
                            </div>
                        </form>
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
                                        <th>Fecha de registro</th>
                                        <th>Proveedor</th>
                                        <th>Usuario</th>
                                        <th>Sucursal</th>
                                        <th>Estado</th>
                                        <th class="text-center" style="width: 120px;">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
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
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="anulacion-form" autocomplete="off">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="table" value="proceso_ingreso_anular">
                                    <h3 class="h5 font-w600 text-uppercase push-15">
                                        <i class="fa fa-info text-danger push-5-r"></i> Datos de Anulación <br>
                                    </h3>
                                    <p>
                                        <b><span class="text-danger">Importante:</span></b> Se borrarán las existencias de los productos del ingreso. Se realizarán validaciones de las existencias, si éstas son menores a la cantidad del ingreso, no se podrá realizar la anulación.
                                    </p>
                                    <div class="row datos">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="usuario" disabled>
                                                        <label>Usuario</label>
                                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control" type="text" name="fecha" disabled>
                                                        <label>Fecha</label>
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
                                                        <textarea class="form-control textoareainput required" name="motivo" rows="2"></textarea>
                                                        <label>Motivo de anulación</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group buttons">
                                        <div class="col-xs-12 text-center">
                                            <a class="btn btn-minw btn-square btn-muted" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                                            <button class="btn btn-minw btn-square btn-danger" type="submit"></button>
                                        </div>
                                    </div>
                                    <hr>
                                </form>

                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="registro-form" autocomplete="off">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="table" value="proceso_ingreso">
                                    <input type="hidden" name="counter" value="0">
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos generales</h3>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control select2 required" name="proveedor" style="width: 100%;" data-placeholder="Seleccione proveedor">
                                                            <option value="">Seleccione</option>
                                                            <?php foreach ((array)$proveedores as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['ruc'].' - '.$item['nombre_o_razon_social']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Proveedor de <?php echo $registro_text;?></label>
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
                                                        <select class="form-control" name="tipo_comprobante" style="width: 100%;" data-placeholder="Seleccione">
                                                            <option value="">Seleccione</option>
                                                            <?php foreach ((array)$tipocomprobantes as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Tipo de comprobante</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="comprobante">
                                                        <label>N° de comprobante</label>
                                                        <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control" name="tipo_ingreso_pago" style="width: 100%;" data-placeholder="Seleccione">
                                                            <option value="">Seleccione</option>
                                                            <?php foreach ((array)$tipos_ingreso_pago as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Pago al proveedor</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 tipo_ingreso_pago_div">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control number" type="number" step="0.01" min="0.01" name="pago">
                                                        <label>Pago</label>
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
                                                        <input class="form-control textoinput" type="text" name="sucursal" value="" readonly>
                                                        <label>Sucursal</label>
                                                        <span class="input-group-addon"><i class="si si-pointer"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control" type="text" name="fecha" disabled>
                                                        <label>Fecha</label>
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
                                                        <textarea class="form-control textoareainput" name="datos_adicionales" rows="2"></textarea>
                                                        <label>Datos adicionales</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-list text-primary push-5-r"></i> Detalles de ingreso</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-offset-1 producto-div">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Producto</label>
                                                <div class="col-md-6 push-10">
                                                    <select class="form-control select2" name="producto_sel" style="width: 100%;" data-placeholder="Seleccione producto">
                                                    </select>
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <a class="btn btn-success btn-producto width100" type="button" data-toggle="tooltip" data-placement="top" title="Agregar detalle de venta"><i class="fa fa-plus"></i> Agregar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-condensed table-hover table-bordered" id="table-detalles">
                                            <thead>
                                                <tr>
                                                    <th width="3%" class="text-center">#</th>
                                                    <th width="12%" class="text-center">Cantidad</th>
                                                    <th width="8%" class="text-center">Código</th>
                                                    <th width="30%">Descripción</th>
                                                    <th width="10%" class="text-center">Exist.</th>
                                                    <th width="12%" class="text-center">Precio</th>
                                                    <th width="10%" class="text-center">Saldo</th>
                                                    <th width="12%" class="text-center">Total</th>
                                                    <th width="3%" class="text-center"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="9">Sin detalles</td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th colspan="7" class="text-right">Total</th>
                                                    <th>
                                                        <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" name="total" readonly tabindex="-1"></div>
                                                    </th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-12 text-center">
                                            <a class="btn btn-minw btn-square btn-muted" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                                            <button class="btn btn-minw btn-square btn-success" type="submit"><i class="fa fa-plus push-5-r"></i> Registrar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
