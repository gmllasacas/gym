
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
                                        <th>Fecha de registro</th>
                                        <th>Usuario</th>
                                        <th>Acción</th>
                                        <th>Sucursal</th>
                                        <th class="text-center" style="width: 10%;">Acciones</th>
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
                                <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Detalle de <?php echo $registro_text;?></span></h3>
                            </div>
                            <div class="block-content">
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="registro-form" autocomplete="off">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="table" value="proceso_ingreso">
                                    <input type="hidden" name="counter" value="0">
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos generales</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="username">
                                                        <label>Usuario</label>
                                                        <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="sucursal">
                                                        <label>Sucursal</label>
                                                        <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control textoinput" type="text" name="fecha">
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
                                                        <textarea class="form-control textoareainput" name="accion" rows="2"></textarea>
                                                        <label>Acción</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-list text-primary push-5-r"></i> Detalles de auditoría</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-2">
                                        </div>
                                        <div class="col-xs-12 col-sm-8">                                            
                                            <div class="table-responsive">
                                                <table class="table table-condensed table-hover table-bordered" id="table-detalles">
                                                    <thead>
                                                        <tr>
                                                            <th width="40%" class="text-center">Campo</th>
                                                            <th width="60%" class="text-center">Dato</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td colspan="2">Sin detalles</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2">
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