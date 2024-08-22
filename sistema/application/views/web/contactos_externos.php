
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
                <form class="form-horizontal" method="post" action="" id="busqueda-form" autocomplete="off">
                    <input type="hidden" name="table" value="proceso_contacto_externo">
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
                            <th>Fecha</th>
                            <th>Nombres</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Asunto</th>
                            <th style="width: 25%;">Mensaje</th>
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