
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
                                        <th>Código</th>
                                        <th>Descripción</th>
                                        <th>Tipo</th>
                                        <th>Tipo</th>
                                        <th>Precio</th>
                                        <th>Existencias</th>
                                        <th>Duración</th>
                                        <th>Fecha de registro</th>
                                        <th>Fav.</th>
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
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="registro-form" autocomplete="off">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="table" value="proceso_producto">
                                    <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos generales</h3>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4 col-sm-offset-4">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control" type="text" name="codigo" readonly>
                                                        <label>Código</label>
                                                        <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-9 col-sm-6 col-sm-offset-2">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control required textoinput" type="text" name="descripcion">
                                                        <label>Descripción</label>
                                                        <span class="input-group-addon"><i class="si si-info"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-2">
                                            <label class="css-input switch switch-primary">
                                                <input type="checkbox" name="favorito" checked=""><span></span> Favorito
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3 col-sm-offset-2">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control" name="tipo" style="width: 100%;">
                                                            <?php foreach ((array)$tipos as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Tipo</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3" id="producto">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="form-material form-material-info">
                                                        <select class="form-control" name="unidad" style="width: 100%;">
                                                            <?php foreach ((array)$unidades as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion'] . ' (' . $item['abreviatura'] . ')'; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <label>Unidades</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3" id="servicio">
                                            <div class="form-group no-sides-form-group">
                                                <div class="col-xs-3 no-sides-pad">
                                                    <div class="input-group form-material form-material-info">
                                                        <input class="form-control number" type="number" step="1" min="1" name="duracion">
                                                        <label>Duración</label>
                                                    </div>
                                                </div>
                                                <div class="col-xs-9 no-sides-pad">
                                                    <div class="input-group form-material form-material-info">
                                                        <select class="form-control" name="duracion_unidad" style="width: 100%;">
                                                            <?php foreach ((array)$duracion_unidades as $item) :?>
                                                            <option value="<?php echo $item['id']; ?>" ><?php echo $item['descripcion']; ?></option>
                                                            <?php endforeach;?>
                                                        </select>
                                                        <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="input-group form-material form-material-info">
                                                        <span class="input-group-addon">S/ </span>
                                                        <input class="form-control required number" type="number" step="0.01" min="0.00" name="precio">
                                                        <label>Precio referencial</label>
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
