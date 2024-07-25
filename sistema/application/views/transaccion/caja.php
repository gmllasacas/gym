            <style>
                .table-condensed .form-group{
                    margin-bottom: 0px;
                }
            </style>
            <script>
                var caja_estado = <?php echo ($caja_estado ?? 'false'); ?>;
            </script>
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
                    <div class="row">
                        <?php if (isset($caja['id'])) { ?>
                        <div class="col-sm-6 col-md-5 col-md-offset-2">
                            <div class="block">
                                <table class="block-table text-left">
                                    <tbody>
                                        <tr>
                                            <td style="width: 70%;">
                                                <div class="h5 font-w700 text-uppercase"><i class="si si-calendar text-info"></i><span class="h5 font-w400 text-muted push-10-l">Fecha activa: </span> <?php echo $caja['fecha_apertura'];?></div>
                                                <div class="h5 font-w700 text-uppercase push-10-t"><i class="si si-info text-info"></i><span class="h5 font-w400 text-muted push-10-l">Estado: </span> CAJA ABIERTA</div>
                                            </td>
                                            <td class="bg-success text-center" style="width: 30%;">
                                                <div class="push-30 push-30-t">
                                                    <i class="fa fa-unlock fa-4x text-white-op"></i>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <a class="block block-link-hover3 text-center caja" href="javascript:void(0)" role="button" data-action="cierre" data-table="proceso_caja" data-estado="1" data-id="<?php echo $caja['id'];?>">
                                <div class="block-content block-content-full">
                                    <span class="item item-circle bg-danger-light"><i class="fa fa-lock text-danger"></i></span>
                                </div>
                                <div class="block-content block-content-full block-content-mini bg-gray-lighter text-danger font-w600">CERRAR CAJA</div>
                            </a>
                        </div>
                        <?php } else { ?>
                        <div class="col-sm-6 col-md-5 col-md-offset-2">
                            <div class="block">
                                <table class="block-table text-left">
                                    <tbody>
                                        <tr>
                                            <td style="width: 70%;">
                                                <div class="h5 font-w700 text-uppercase"><i class="si si-calendar text-info"></i><span class="h5 font-w400 text-muted push-10-l">Última fecha: </span> <?php echo $ultima_fecha;?></div>
                                                <div class="h5 font-w700 text-uppercase push-10-t"><i class="si si-info text-info"></i><span class="h5 font-w400 text-muted push-10-l">Estado: </span> CAJA CERRADA</div>
                                            </td>
                                            <td class="bg-danger text-center" style="width: 30%;">
                                                <div class="push-30 push-30-t">
                                                    <i class="fa fa-lock fa-4x text-white-op"></i>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <a class="block block-link-hover3 text-center caja" href="javascript:void(0)" role="button" data-action="apertura" data-table="proceso_caja" data-estado="1" data-id="0">
                                <div class="block-content block-content-full">
                                    <span class="item item-circle bg-success-light"><i class="fa fa-unlock text-success"></i></span>
                                </div>
                                <div class="block-content block-content-full block-content-mini bg-gray-lighter text-success font-w600">ABRIR CAJA</div>
                            </a>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="block push-10">
                        <script type="text/javascript">
                            var reportetext='<?php echo $export_text;?>';
                        </script>
                        <div class="block-header bg-gray-lighter">
                            <div class="block-options-simple">
                                <button class="btn btn-xs btn-success nuevoregistro" type="button"><i class="fa fa-plus"></i><span class="hidden-xs push-5-l">REGISTRAR AJUSTE</span></button>
                                <button class="btn btn-xs btn-info push-10-l" type="button" title="Recargar" id="block-reload"><i class="si si-refresh"></i><span class="hidden-xs push-5-l">RECARGAR LISTADO</span></button>
                            </div>
                            <h3 class="block-title"><?php echo $export_text;?> por fecha</h3>
                        </div>
                        <div class="block-content">
                            <form class="form-horizontal" method="post" action="" id="busqueda-form" autocomplete="off">
                                <input type="hidden" name="table" value="proceso_caja">
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
                                        <th>Fecha de registro</th>
                                        <th>Fecha de apertura</th>
                                        <th>Fecha de cierre</th>
                                        <th>Total</th>
                                        <th>Usuario de apertura</th>
                                        <th>Usuario de cierre</th>
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
        
            <div class="modal fade" id="abrir-modal" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-popout modal-lg">
                    <div class="modal-content">
                        <div class="block block-themed block-transparent remove-margin-b">
                            <div class="block-header bg-primary">
                                <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                                <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de <?php echo $registro_text;?></span></h3>
                            </div>
                            <div class="block-content">
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="abrir-form" autocomplete="off">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="estado" value="1">
                                    <input type="hidden" name="table" value="proceso_caja">
                                    <p class="message-block">
                                        <b><span class="text-danger">Importante:</span></b> <span class="message"></span>
                                    </p>
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos generales</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control" type="text" name="fecha_apertura" readonly>
                                                        <label>Fecha de apertura</label>
                                                        <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control" type="text" name="fecha_cierre" readonly>
                                                        <label>Fecha de cierre</label>
                                                        <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="usuario" autocomplete="new-password" role="presentation" readonly>
                                                        <label>Usuario de apertura</label>
                                                        <span class="input-group-addon"><i class="si si-user"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="usuario_cierre" autocomplete="new-password" role="presentation" readonly>
                                                        <label>Usuario de cierre</label>
                                                        <span class="input-group-addon"><i class="si si-user"></i></span>
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
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control number" type="number" step="0.01" min="0.00" name="apertura" value="0.00">
                                                        <label>Monto de apertura de caja</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control number" type="number" step="0.01" min="0.00" name="actual" value="0.00">
                                                        <label>Monto actual en caja</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control number" type="number" step="0.01" min="0.00" name="cierre" value="0.00">
                                                        <label>Monto de cierre de caja</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="sucursal" readonly>
                                                        <label>Sucursal</label>
                                                        <span class="input-group-addon"><i class="si si-pointer"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row apertura-block">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material">
                                                        <textarea class="form-control textoareainput" name="notas" rows="2"></textarea>
                                                        <label>Notas adicionales de apertura</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row cierre-block">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material">
                                                        <textarea class="form-control textoareainput" name="notas_cierre" rows="2"></textarea>
                                                        <label>Notas adicionales de cierre</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-list text-primary push-5-r"></i> Detalles de la caja</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-8 col-md-offset-2">
                                            <table class="table table-condensed table-hover table-bordered" id="table-detalles">
                                                <thead>
                                                    <tr>
                                                        <th width="10%" class="text-center">#</th>
                                                        <th width="30%" class="text-center">Fecha</th>
                                                        <th width="30%" class="text-center">Usuario</th>
                                                        <th width="30%" class="text-center">Monto</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="4">Sin detalles</td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th colspan="3" class="text-right">Total</th>
                                                        <th>
                                                            <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" name="total" readonly tabindex="-1"></div>
                                                        </th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12 text-center">
                                            <a class="btn btn-minw btn-square btn-muted" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                                            <button class="btn btn-minw btn-square btn-primary" type="submit"><i class="fa fa-plus push-5-r"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
                                    <input type="hidden" name="caja" value="">
                                    <input type="hidden" name="table" value="proceso_caja_detalle">
                                    <input type="hidden" name="estado" value="1">
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos generales</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control number" type="number" step="0.01" min="0.00" name="actual" value="0.00">
                                                        <label>Monto actual en caja</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control number" type="number" step="0.01" name="ajuste" value="0.00">
                                                        <label>Monto de ajuste (suma/resta)</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control number" type="number" step="0.01" min="0.00" name="total" value="0.00">
                                                        <label>Monto despues del ajuste</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="sucursal" readonly>
                                                        <label>Sucursal</label>
                                                        <span class="input-group-addon"><i class="si si-pointer"></i></span>
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
                                                        <textarea class="form-control textoareainput" name="notas" rows="2"></textarea>
                                                        <label>Notas adicionales</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
