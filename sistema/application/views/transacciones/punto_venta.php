<style>
    .form-group {
        margin-bottom: 15px;
    }
    .form-group.no-sides-form-group {
        margin-top: -15px;
    }
    .select2-container--default .select2-selection--single .select2-selection__placeholder {
        text-transform: none;
        font-weight: 500;
    }
    .table-condensed .form-control {
        font-size: 13px;
    }
    .table-condensed tfoot > tr > th {
        vertical-align: middle;
    }
    .text-success {
        color: #46c37b !important;
    }
    tfoot .text-muted {
        color: #b9b9b9 !important;
    }
    tfoot .text-muted .form-control{
        color: #b9b9b9 !important;
    }
    .list-activity > li > i:first-child {
        position: absolute;
        left: 10px;
        top: 10px;
        display: inline-block;
        width: 20px;
        height: 20px;
        line-height: 20px;
        font-size: 18px;
        text-align: center;
    }
    #preventa-detalles .form-control {
        height: auto;
        padding: 2px 4px;
        font-size: 12px;
        line-height: 1;
        text-align: right;
    }
    #preventa-detalles label {
        height: auto;
        font-size: 12px;
    }
    #preventa-detalles .input-group-addon {
        padding: 2px 4px;
        font-size: 11px;
    }
    #preventa-detalles .form-control-static {
        min-height: 20px;
        padding-top: 0px;
        padding-bottom: 0px;
    }
    #preventa-detalles .form-control-static small {
        font-size: 75%;
    }
    #preventa-detalles .form-group {
        margin-bottom: 0px;
    }
    .detalle .block.block-bordered {
        position: relative;
    }
    .preventas .block.block-bordered {
        position: relative;
    }
    .btn-delete{
        position: absolute;
        right: -10px;
        top: -10px;
        z-index: 2;
    }
    .h6 small {
        font-weight: 400;
        font-size: 75%;
        color: #999999;
    }

    .ribbon-box {
        padding: 0 0px;
        height: 20px;
        width: 20px;
        line-height: 18px;
        font-size: 14px;
        color: #fff;
        top: -10px;
        right: -10px;
        border-radius: 10px;
        background: white;
        border: 1px solid #d9dbdb;
    }

    #preventa-modal .block-header + .block-content-mini {
        padding: 20px 20px 1px;
    }

    
    #preventa-modal .block-content .block {
        margin-bottom: 10px;
    }

    #preventa-detalles .btn-xxs {
        padding: 2px 10px 1px;
        font-size: 12px;
        line-height: 1.5;
        border-radius: 3px;
    }

    hr.mini {
        margin-top: 10px;
        margin-bottom: 10px;
    }

    @media screen and (max-width: 767px){
        #preventatab .form-horizontal .control-label {
            line-height: 35px;
            margin-bottom: -5px;
        }
        #preventa-detalles .form-group {
            margin-bottom: 5px;
        }
        .favoritos .block-content.block-content-mini {
            padding: 5px 10px;
        }
        .favoritos .block.block-bordered {
            margin-bottom: 10px;
        }
        .favoritos .block.block-bordered small{
            font-size: 75%;
        }
        .favoritos .block.block-bordered h6{
            font-size: 12px;
        }
        .btn-delete {
            position: absolute;
            right: 10px;
            top: 10px;
            font-size: 10px;
            border-radius: 2px;
            z-index: 2;
        }
        #preventa-modal .block-header + .block-content-mini {
            padding: 10px;
        }
        .block-content .block {
            margin-bottom: 10px;
        }
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
        <div class="row">
            <div class="col-md-8">
                <?php if (!isset($caja['id'])) { ?>
                    <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <h3 class="font-w300 push-15">Caja cerrada</h3>
                        <p>La caja se encuentra cerrada, para realizar ventas se necesita abrir la caja.</p>
                    </div>
                <?php } ?>
                <div class="block" style="position: relative;">
                    <div class="<?php echo (!isset($caja['id']) ? 'block-blocker' : '') ?>">
                    </div>
                    <script type="text/javascript">
                        var reportetext='<?php echo $export_text;?>';
                        var igv_id ='<?php echo $sucursal['igv'];?>';
                    </script>
                    
                    <div class="block-header bg-gray-lighter">
                        <div class="block-options-simple">
                            <button class="btn btn-xs btn-success nuevapreventa" type="button"><i class="fa fa-plus"></i><span class="hidden-xs push-5-l">VER O REGISTRAR</span> PREVENTAS</button>
                        </div>
                        <h3 class="block-title">Formulario de Venta</h3>
                    </div>
                    <div class="block-content">
                        <form class="form-horizontal" method="post" action="" id="registro-form" autocomplete="off">
                            <input type="hidden" name="id" value="">
                            <input type="hidden" name="preventa" value="">
                            <input type="hidden" name="table" value="proceso_venta">
                            <input type="hidden" name="estado" value="1">
                            <input type="hidden" name="counter" value="0">
                            <input type="hidden" name="tipo_venta_pago" value="2">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <div class="form-group no-sides-form-group has-success">
                                        <div class="row">
                                            <label class="col-xs-12 text-success">CLIENTE</label>
                                            <div class="col-xs-12">
                                                <div class="input-group push-10">
                                                    <select class="form-control select2 required" name="cliente" style="width: 100%;" data-placeholder="Seleccione cliente">
                                                    </select>
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-success btn-cliente" type="button"><i class="fa fa-plus"></i><span class="hidden-xs push-10-l">CREAR CLIENTE</span></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group no-sides-form-group has-info">
                                        <div class="row">
                                            <label class="col-xs-12 text-info">TIPO DE COMPROBANTE</label>
                                            <div class="col-xs-12">
                                                <select class="form-control text-info font-w700 required" name="tipo_comprobante" style="width: 100%;">
                                                    <?php foreach ((array)$tipocomprobantes as $item) :?>
                                                    <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                    <?php endforeach;?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="input-group form-material form-material-info">
                                                <input class="form-control textoinput" type="text" name="comprobante" readonly>
                                                <label>NRO. DE COMPROBANTE</label>
                                                <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
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
                                                <input class="form-control textoareainput" type="text" name="datos_adicionales">
                                                <label>DATOS ADICIONALES</label>
                                                <span class="input-group-addon"><i class="si si-info"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="form-material form-material-info">
                                                <select class="form-control select2" name="codigo_descuento" style="width: 100%;" data-placeholder="Seleccione">
                                                    <option value="">Seleccione</option>
                                                    <?php foreach ((array)$codigos_descuento as $item) :?>
                                                    <option data-descuento_tipo="<?php echo $item['descuento_tipo']; ?>" data-descuento_cantidad="<?php echo $item['descuento_cantidad']; ?>" value="<?php echo $item['id']; ?>" ><?php echo $item['codigo'] . ' (' . $item['descuento_tipo'].$item['descuento_cantidad'] .')'; ?></option>
                                                    <?php endforeach;?>
                                                </select>
                                                <label>CÓDIGO DE DESCUENTO</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 tipo_venta_pago_div">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="form-material form-material-info">
                                                <select class="form-control" name="tipo_pago" style="width: 100%;" data-placeholder="Seleccione">
                                                    <?php foreach ((array)$tipo_pagos as $item) :?>
                                                    <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                    <?php endforeach;?>
                                                </select>
                                                <label>TIPO DE PAGO</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3 tipo_pago_div">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="input-group form-material form-material-info">
                                                <input class="form-control textoinput" type="text" name="numero_operacion">
                                                <label>NRO. DE OPERACIÓN</label>
                                                <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-star text-warning push-5-r"></i> Productos favoritos</h3>
                            <div class="row favoritos">
                            </div>

                            <h3 class="h5 font-w600 text-uppercase push-15"><i class="si si-list text-primary push-5-r"></i> Detalles de venta <small class="text-info preventa-tag"></small></h3>
                            <div class="row">
                                <div class="col-xs-12 col-md-12 col-lg-10 col-lg-offset-1">
                                    <div class="form-group">
                                        <div class="col-xs-10 col-md-8">
                                            <select class="form-control select2" name="producto_sel" style="width: 100%;" data-placeholder="Seleccione producto - servicio">
                                                <option></option>
                                            </select>
                                        </div>
                                        <div class="col-xs-2 col-md-4">
                                            <button class="btn btn-success btn-producto" style="width: 100%;" type="button"><i class="fa fa-plus"></i><span class="hidden-xs push-10-l">AGREGAR DETALLE</span></button>
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
                                            <th colspan="6" class="text-right text-info">TOTAL SIN DESC.</th>
                                            <th>
                                                <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control text-info" type="text" name="total_inicial" readonly tabindex="-1"></div>
                                            </th>
                                            <th></th>
                                        </tr>
                                        <tr class="text-muted">
                                            <th colspan="6" class="text-right">Descuento</th>
                                            <th>
                                                <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" name="descuento" readonly tabindex="-1"></div>
                                            </th>
                                            <th></th>
                                        </tr>
                                        <tr class="text-muted">
                                            <th colspan="6" class="text-right">Gravada</th>
                                            <th>
                                                <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" name="subtotal" readonly tabindex="-1"></div>
                                            </th>
                                            <th></th>
                                        </tr>
                                        <tr class="">
                                            <th colspan="5" class="text-right"></th>
                                            <th>
                                                <span class="pull-left">IGV</span>
                                                <select class="form-control pull-right" name="igv_percent" style="width: 70%;height: 24px;font-size: 10px;padding: 0px 4px;pointer-events:none;" readonly>
                                                    <?php foreach ((array)$igvs as $item) :?>
                                                    <option value="<?php echo $item['id']; ?>" data-value="<?php echo $item['descripcion']; ?>"><?php echo $item['descripcion']; ?>%</option>
                                                    <?php endforeach;?>
                                                </select>
                                            </th>
                                            <th>
                                                <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" name="igv" readonly tabindex="-1"></div>
                                            </th>
                                            <th></th>
                                        </tr>
                                        <tr>
                                            <th colspan="6" class="text-right text-success">Total</th>
                                            <th>
                                                <div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control text-success" type="text" name="total" readonly tabindex="-1"></div>
                                            </th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12 text-center">
                                    <a class="btn btn-minw btn-square btn-muted push-5-r clear-form"><i class="fa fa-times push-5-r"></i> LIMPIAR</a>
                                    <button class="btn btn-minw btn-square btn-success" type="submit"></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="block block-caja">
                    <script>
                        var caja_id ='<?php echo isset($caja['id']) ? $caja['id'] : 0; ?>';
                    </script>
                    <?php if (isset($caja['id'])) { ?>
                    <div class="block-header bg-success">
                        <div class="block-options-simple">
                            <button class="btn btn-xs btn-danger caja" type="button" data-action="cierre" data-table="proceso_caja" data-estado="1" data-id="<?php echo $caja['id'];?>">
                                <i class="fa fa-lock"></i><span class="push-5-l">Cerrar Caja</span>
                            </button>
                        </div>
                        <h3 class="block-title text-white">Caja abierta</h3>
                    </div>
                    <?php } else { ?>
                    <div class="block-header bg-danger">
                        <div class="block-options-simple">
                            <button class="btn btn-xs btn-success caja" type="button" data-action="apertura" data-table="proceso_caja" data-estado="1" data-id="0">
                                <i class="fa fa-unlock"></i><span class="push-5-l">Abrir Caja</span>
                            </button>
                        </div>
                        <h3 class="block-title text-white">Caja cerrada</h3>
                    </div>
                    <?php } ?>
                    <div class="block-content">
                        <div class="row items-push">
                            <div class="col-xs-12 col-sm-4">
                                <div class="font-w700 text-gray-darker text-uppercase"><i class="si si-calendar push-5-r"></i> Fecha</div>
                                <a class="h3 font-w300 text-primary caja-date"></a>
                            </div>
                            <div class="col-xs-6 col-sm-4">
                                <div class="font-w700 text-gray-darker text-uppercase"><i class="si si-wallet push-5-r"></i> Total (Efectivo)</div>
                                <a class="h3 font-w300 text-primary caja-total"></a>
                            </div>
                            <div class="col-xs-6 col-sm-4">
                                <div class="font-w700 text-gray-darker text-uppercase"><i class="si si-credit-card push-5-r"></i> Total (Tarjeta)</div>
                                <a class="h3 font-w300 text-primary caja-total-tarjeta"></a>
                            </div>
                        </div>
                    </div>
                    <div class="block-content block-content-full bg-gray-lighter">
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="font-w600 font-s13 text-gray-darker text-uppercase">Movimientos</span>
                            </div>
                            <?php if (isset($caja['id'])) { ?>
                            <div class="col-xs-6 text-right">
                                <button class="btn btn-xs btn-success nuevoajusteregistro" type="button"><i class="fa fa-plus"></i><span class="push-5-l">REGISTRAR AJUSTE</span></button>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="block-content" data-toggle="slimscroll" data-height="547px" data-always-visible="true">
                        <ul class="list list-activity caja-detalles">
                        </ul>
                    </div>
                </div>
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
                    <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de caja</span></h3>
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

<div class="modal fade" id="registro-cliente-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-popout modal-lg">
        <div class="modal-content">
            <div class="block block-themed block-transparent remove-margin-b">
                <div class="block-header bg-primary">
                    <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                    <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario (reducido) de cliente</span></h3>
                </div>
                <div class="block-content">
                    <form class="form-horizontal push-10-t push-10" method="post" action="" id="registro-cliente-form" autocomplete="off">
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
                                                <?php foreach ((array)$tipos as $item) :?>
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
                                        <div class="input-group form-material form-material-info">
                                            <input class="form-control textoinput" type="text" name="direccion_completa">
                                            <label>Dirección</label>
                                            <span class="input-group-addon"><i class="si si-direction"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <div class="col-xs-12 col-sm-3">
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

<div class="modal fade" id="registro-ajuste-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-popout modal-lg">
        <div class="modal-content">
            <div class="block block-themed block-transparent remove-margin-b">
                <div class="block-header bg-primary">
                    <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                    <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de ajuste</span></h3>
                </div>
                <div class="block-content">
                    <form class="form-horizontal push-10-t push-10" method="post" action="" id="registro-ajuste-form" autocomplete="off">
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

<div class="modal fade" id="preventa-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-popout modal-lg">
        <div class="modal-content">
            <div class="block block-themed block-transparent remove-margin-b">
                <div class="block-header bg-primary">
                    <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                    <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de Preventa</span></h3>
                </div>
                <div class="block-content block-content-mini">
                    <form class="form-horizontal" method="post" action="" id="preventa-form" autocomplete="off">
                        <input type="hidden" name="id" value="">
                        <input type="hidden" name="table" value="proceso_preventa">
                        <input type="hidden" name="estado" value="1">
                        <input type="hidden" name="counter" value="0">

                        <h3 class="h5 font-w600 text-uppercase push-15"><i class="si si-docs text-info push-5-r"></i> Preventas registradas</h3>
                        <div class="row preventas">
                        </div>

                        <div class="block block-bordered">
                            <div class="block-content block-content-mini">
                                <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-star text-warning push-5-r"></i> Productos favoritos</h3>
                                <div class="row favoritos">
                                </div>
                                <h3 class="h5 font-w600 text-uppercase push-15"><i class="si si-list text-primary push-5-r"></i> Detalles de Preventa</h3>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <div class="col-xs-10 col-md-8">
                                                <select class="form-control select2" name="producto_sel" style="width: 100%;" data-placeholder="Seleccione producto - servicio">
                                                    <option></option>
                                                </select>
                                            </div>
                                            <div class="col-xs-2 col-md-4">
                                                <button class="btn btn-success btn-producto" style="width: 100%;" type="button"><i class="fa fa-plus"></i><span class="hidden-xs push-10-l">AGREGAR DETALLE</span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="preventa-detalles">
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-md-12 col-lg-10 col-lg-offset-1">
                                        <a class="block block-bordered">
                                            <div class="block-content block-content-mini clearfix">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-4 col-sm-offset-8">
                                                        <div class="form-group push-5">
                                                            <label class="col-xs-3 control-label text-success">TOTAL</label>
                                                            <div class="col-xs-9">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">S/</span>
                                                                    <input class="form-control" style="text-align: right;" type="number" step="0.01" name="total" value="0.00" readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="row push-5-t">
                                    <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="form-material form-material-info">
                                                    <select class="form-control select2" name="datos_adicionales" style="width: 100%;" data-placeholder="Seleccione dato">
                                                        <option value="">Seleccione dato</option>
                                                        <?php foreach ((array)$mesas as $item) :?>
                                                        <option value="<?php echo $item; ?>" ><?php echo $item; ?></option>
                                                        <?php endforeach;?>
                                                    </select>
                                                    <label>Datos adicionales</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12 text-center">
                                <a class="btn btn-minw btn-square btn-muted push-5-t push-5-r" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> CERRAR</a>
                                <button class="btn btn-minw btn-square btn-success push-5-t" type="submit"></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>