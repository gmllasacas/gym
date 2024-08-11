<style>
    .table-condensed .form-group{
        margin-bottom: 0px;
    }
    
    table.dataTable thead>tr>th {
        vertical-align: middle;
        text-align: center;
        font-size: 12px !important;
        padding-left: 10px;
        padding-right: 10px;
    }
    .table-bordered > tbody > tr > td,
    .table-bordered > tfoot > tr > th {
        white-space: nowrap;
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
            <ul class="nav nav-tabs" data-toggle="tabs">
                <li class="active">
                    <a href="#tab1" class="block-title"><?php echo $export_text;?></a>
                </li>
            </ul>
            <div class="block-content tab-content">
                <div class="tab-pane fade active in" id="tab1">
                    <script type="text/javascript">
                        var reportetext='<?php echo $export_text;?>';
                    </script>
                    <form class="form-horizontal push-15" method="post" action="" id="busqueda-form" autocomplete="off">
                        <input type="hidden" name="table" value="reporte_contable">
                        <input type="hidden" name="estado" value="^5">
                        <input type="hidden" name="fechafin" value="1">
                        <div class="row">
                            <div class="col-xs-12 col-sm-2 col-sm-offset-3">
                                <div class="form-group push-5">
                                    <label class="col-xs-12">Fecha de inicio</label>
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <input class="form-control required" type="text" name="fechainicio">
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
                            <div class="col-xs-12 col-sm-2">
                                <div class="form-group push-5">
                                    <label class="col-xs-12"><br></label>
                                    <div class="col-xs-12">
                                        <a class="btn btn-success width100 exportar-excel" type="button"><i class="fa fa-file-excel-o push-5-r"></i>EXPORTAR A EXCEL</a>
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
                                <th>NÚMERO DE REGISTRO O</th>
                                <th colspan="5">COMPROBANTE DE PAGO O DOCUMENTO</th>
                                <th colspan="3">INFORMACIÓN DEL CLIENTE</th>
                                <th rowspan="2">VALOR FACTURADO DE LA EXPORTACIÓN</th>
                                <th rowspan="2">BASE IMP. OP. GRAVADA</th>
                                <th colspan="2">IMPORTE DE LA OP. EXONERADA O INAFECTA</th>
                                <th rowspan="2">ISC</th>
                                <th rowspan="2">IGV Y/O IPM</th>
                                <th rowspan="2">ICBP</th>
                                <th rowspan="2">OTROS TRIBUTOS Y CARGOS</th>
                                <th rowspan="2">IMPORTE TOTAL DEL COMPROBANTE DE PAGO</th>
                                <th rowspan="2">TIPO DE CAMBIO</th>
                                <th colspan="4">REF. DEL COMPROBANTE DE PAGO   ORIGINAL QUE SE MODIFICA</th>
                            </tr>
                            <tr>
                                <th>COD. ÚNICO DE OPERACIÓN</th>
                                <th>FECHA DE EMISIÓN</th>
                                <th>FECHA DE VCTO</th>
                                <th>TIPO</th>
                                <th>SERIE</th>
                                <th>NÚMERO</th>
                                <th>TIPO DOC.</th>
                                <th>NÚMERO</th>
                                <th>APELLIDOS Y NOMBRES O RAZÓN SOCIAL</th>
                                <th>EXONERADA</th>
                                <th>INAFECTA</th>
                                <th>FECHA DE EMISIÓN</th>
                                <th>TIPO</th>
                                <th>SERIE</th>
                                <th>NÚMERO</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th class="cantidad"></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th>TOTAL</th>
                                <th>-</th>
                                <th class="subtotal"></th>
                                <th>-</th>
                                <th>-</th>
                                <th>-</th>
                                <th class="igv"></th>
                                <th>-</th>
                                <th>-</th>
                                <th class="total"></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
