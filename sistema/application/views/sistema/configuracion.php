
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
                            <h3 class="block-title"><?php echo $export_text;?></h3>
                        </div>
                        <div class="block-content">
                            <form class="form-horizontal push-10-t push-10" method="post" action="<?php echo base_url();?>generico/actualizarregistro" id="registro-form" autocomplete="off" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="1">
                                <input type="hidden" name="table" value="base_configuracion">
                                <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Imágenes de sistema</h3>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-4 col-sm-offset-2 hidden">
                                        <a class="block block-bordered block-link-hover3 text-center" id="envio" role="button" data-texto="" data-table="base_configuracion" data-id="1" data-envio="<?php echo $configuracion['envio'];?>">
                                        </a>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-sm-offset-0">
                                        <input class="hidden" type="file" name="logo" onchange="document.getElementById('logo').src = window.URL.createObjectURL(this.files[0])">
                                        <a class="block block-bordered" id="editarlogo" role="button">
                                            <div class="block-content block-content-mini text-center" style="padding-bottom: 5px;">
                                                <div>
                                                    <img class="img-avatar" id="logo" src="<?php echo base_url().$configuracion['logo'];?>" alt="">
                                                </div>
                                                <div class="push-10-t"><b>Logo principal</b></div>
                                                <span class="small text-muted">Se recomienda una imagen cuadrada</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                        <input class="hidden" type="file" name="dashboard" onchange="document.getElementById('dashboard').style.backgroundImage='url('+window.URL.createObjectURL(this.files[0])+')'">
                                        <a class="block block-bordered" id="editardashboard" role="button">
                                            <div class="block-content block-content-mini text-center" style="padding-bottom: 5px;">
                                                <div class="content bg-image" id="dashboard" style="background-image: url('<?php echo base_url().$configuracion['dashboard'];?>');">
                                                </div>
                                                <div class="push-10-t"><b>Imagen de dashboard</b></div>
                                                <span class="small text-muted">Se recomienda una imagen rectangular</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Datos de sistema</h3>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group text-left">
                                            <div class="col-xs-12">
                                                <div class="input-group form-material form-material-info">
                                                    <input class="js-masked-ruc form-control required textoinput font-w700" type="text" name="ruc" id="ruc" placeholder="99 99999999 9"  value="<?php echo $configuracion['ruc'];?>">
                                                    <label for="ruc"><b>RUC</b></label>
                                                    <span class="input-group-addon"><i class="fa fa-barcode"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="form-material form-material-info">
                                                    <select class="form-control required" name="asociado" style="width: 100%;">
                                                        <option value="1" <?php echo ($configuracion['asociado']=='1'?'selected':'');?>>Activo</option>
                                                        <option value="0" <?php echo ($configuracion['asociado']=='0'?'selected':'');?>>Inactivo</option>
                                                    </select>
                                                    <label>Validación de RUC</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="form-material form-material-info">
                                                    <select class="form-control required" name="send_email" style="width: 100%;">
                                                        <option value="1" <?php echo ($configuracion['send_email']=='1'?'selected':'');?>>Activo</option>
                                                        <option value="0" <?php echo ($configuracion['send_email']=='0'?'selected':'');?>>Inactivo</option>
                                                    </select>
                                                    <label>Envío de email</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="input-group form-material form-material-info">
                                                    <input class="form-control required textoinput" type="text" name="url" value="<?php echo $configuracion['url'];?>">
                                                    <label>URL de SUNAT</label>
                                                    <span class="input-group-addon"><i class="si si-share"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="input-group form-material form-material-info">
                                                    <input class="form-control required textoinput" type="text" name="url_servicio" value="<?php echo $configuracion['url_servicio'];?>">
                                                    <label>URL del servicio</label>
                                                    <span class="input-group-addon"><i class="si si-share"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="input-group form-material form-material-info">
                                                    <input class="form-control required textoinput" type="text" name="url_api" value="<?php echo $configuracion['url_api'];?>">
                                                    <label>URL de API</label>
                                                    <span class="input-group-addon"><i class="si si-share"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="input-group form-material form-material-info">
                                                    <input class="form-control required number" type="number" step="0.01" min="0.00" name="igv" value="<?php echo $configuracion['igv'];?>">
                                                    <label>IGV</label>
                                                    <span class="input-group-addon">%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-photo text-primary push-5-r"></i> Datos de interfaz</h3>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group text-left">
                                            <div class="col-xs-12">
                                                <div class="input-group form-material form-material-info">
                                                    <input class="form-control required textoinput" type="text" name="titulo" value="<?php echo $configuracion['titulo'];?>">
                                                    <label>Nombre de sistema</label>
                                                    <span class="input-group-addon"><i class="si si-info"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <div class="form-group text-left">
                                            <div class="col-xs-12">
                                                <div class="input-group form-material form-material-info">
                                                    <input class="form-control required textoinput" type="text" name="copyright" value="<?php echo $configuracion['copyright'];?>">
                                                    <label>Copyright</label>
                                                    <span class="input-group-addon"><i class="si si-info"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12 text-center">
                                        <button class="btn btn-minw btn-square btn-success" type="submit"><i class="fa fa-gear push-5-r"></i> Guardar configuración</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>