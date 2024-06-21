            <style>
                .table-condensed .form-group{
                    margin-bottom: 0px;
                }
            </style>
            <main id="main-container" >
                <div class="content-mini bg-gray-lighter">
                    <div class="row push-10">
                        <div class="col-sm-6">
                            <h1 class="page-heading">
                                <?php echo $titulo_text;?>
                            </h1>
                        </div>
                        <div class="col-sm-6 text-right hidden-xs">
                            <ol class="breadcrumb push-10-t">
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
                            <input type="hidden" name="table" value="proceso_kardex">
                            <input type="hidden" name="estado" value="^5">
                            <div class="block-header bg-gray-lighter">
                                <h3 class="block-title"><?php echo $export_text;?> por fecha</h3>
                            </div>
                            <div class="block-content">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-2">
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
                                    <div class="col-xs-12 col-sm-6">
                                        <div class="form-group push-5">
                                            <label class="col-xs-12">Producto</label>
                                            <div class="col-xs-12">
                                                <select class="form-control select2" name="producto" style="width: 100%;" data-placeholder="Todos los productos" data-allow-clear="true">
                                                    <option value=""></option>
                                                    <?php foreach ($productos as $item) :?>
                                                    <option value="<?php echo $item['id']; ?>" ><?php echo $item['codigo'].' - '.$item['descripcion']; ?></option>
                                                    <?php endforeach;?>
                                                </select>
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
                                        <th>Tipo</th>
                                        <th>Producto / Servicio</th>
                                        <th>Cantidad</th>
                                        <th>Tipo</th>
                                        <th>Precio</th>
                                        <th>Subtotal</th>
                                        <th>Saldo</th>
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
            
            <div class="modal fade" id="venta-modal" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-popout modal-lg">
                    <div class="modal-content">
                        <div class="block block-themed block-transparent remove-margin-b">
                            <div class="block-header bg-primary">
                                <ul class="block-options">
                                    <li>
                                        <button data-dismiss="modal" type="button"><i class="si si-close"></i></button>
                                    </li>
                                </ul>
                                <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de <?php echo $registro_text;?></span></h3>
                            </div>
                            <div class="block-content">
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="venta-form" autocomplete="off">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="table" value="proceso_venta">
                                    <input type="hidden" name="estado" value="1">
                                    <input type="hidden" name="counter" value="0">
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos generales</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control required" name="cliente" style="width: 100%;" data-placeholder="Seleccione">
                                                            <option value="">Seleccione</option>
                                                            <?php foreach ($clientes as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['documento'].' - '.$item['nombre_o_razon_social']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Cliente</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control" type="text" name="fecha">
                                                        <label>Fecha</label>
                                                        <span class="input-group-addon"><i class="si si-calendar"></i></span>
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
                                                        <select class="form-control required" name="tipo_comprobante" style="width: 100%;" data-placeholder="Seleccione">
                                                            <option value="">Seleccione</option>
                                                            <?php foreach ($tipocomprobantes as $item) :?>
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
                                                        <input class="form-control textoinput required" type="text" name="comprobante">
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
                                                        <select class="form-control" name="tipo_venta_pago" style="width: 100%;" data-placeholder="Seleccione">
                                                            <?php foreach ($tipo_venta_pagos as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Tipo de venta</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 tipo_pago_div">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control" name="tipo_pago" style="width: 100%;" data-placeholder="Seleccione">
                                                            <?php foreach ($tipo_pagos as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Tipo de pago</label>
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

                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-list text-primary push-5-r"></i> Detalles de venta</h3>
                                    <div class="table-responsive">
                                        <table class="table table-condensed table-hover table-bordered">
                                            <thead>
                                                <tr>
                                                    <th width="3%" class="text-center">#</th>
                                                    <th width="12%" class="text-center">Cantidad</th>
                                                    <th width="8%" class="text-center">Código</th>
                                                    <th width="35%">Descripción</th>
                                                    <th width="15%" class="text-center">Exist. / Dur.</th>
                                                    <th width="12%" class="text-center">P. Venta</th>
                                                    <th width="12%" class="text-center">Total</th>
                                                    <th width="3%" class="text-center"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="8">Sin detalles</td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th colspan="6" class="text-right">Subtotal</th>
                                                    <th>
                                                        <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" name="subtotal" readonly tabindex="-1"></div>
                                                    </th>
                                                    <th></th>
                                                </tr>
                                                <tr>
                                                    <th colspan="6" class="text-right">IGV</th>
                                                    <th>
                                                        <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" name="igv" readonly tabindex="-1" data-igv="<?php echo $this->configuracion['igv'];?>"></div>
                                                    </th>
                                                    <th></th>
                                                </tr>
                                                <tr>
                                                    <th colspan="6" class="text-right">Total</th>
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
                                            <a class="btn btn-minw btn-square btn-muted push-5-r" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="modal fade" id="ingreso-modal" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-popout modal-lg">
                    <div class="modal-content">
                        <div class="block block-themed block-transparent remove-margin-b">
                            <div class="block-header bg-primary">
                                <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                                <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de <?php echo $registro_text;?></span></h3>
                            </div>
                            <div class="block-content">
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="ingreso-form" autocomplete="off">
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
                                                            <?php foreach ($proveedores as $item) :?>
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
                                                            <?php foreach ($tipocomprobantes as $item) :?>
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
                                        <div class="col-xs-12 col-sm-3 col-sm-offset-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control" type="text" name="fecha">
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
                                    <div class="table-responsive">
                                        <table class="table table-condensed table-hover table-bordered">
                                            <thead>
                                                <tr>
                                                    <th width="5%" class="text-center">#</th>
                                                    <th width="10%" class="text-center">Cantidad</th>
                                                    <th width="8%" class="text-center">Código</th>
                                                    <th width="30%">Descripción</th>
                                                    <th width="7%" class="text-center">Exist.</th>
                                                    <th width="12%" class="text-center">Precio</th>
                                                    <th width="8%" class="text-center">Saldo</th>
                                                    <th width="15%" class="text-center">Total</th>
                                                    <th width="5%" class="text-center"></th>
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
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
