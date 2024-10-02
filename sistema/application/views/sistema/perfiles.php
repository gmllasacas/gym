
<style>
    .list-unstyled li ul li {
        list-style: none;
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
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Fecha de registro</th>
                            <th>Estado</th>
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
                    <h3 class="block-title"><i class="fa fa-plus push-10-r"></i><span>Formulario de <?php echo $registro_text;?></span></h3>
                </div>
                <div class="block-content">
                    <form class="form-horizontal push-10-t push-10" method="post" action="" id="registro-form" autocomplete="off">
                        <input type="hidden" name="id" value="">
                        <input type="hidden" name="estado" value="1">
                        <input type="hidden" name="table" value="base_perfil">
                        <div class="row">
                            <div class="col-xs-9 col-sm-6 col-sm-offset-3">
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
                        </div>
                        <h3 class="h5 font-w600 text-uppercase push-15"><i class="fa fa-info text-primary push-5-r"></i> Permisos de acceso</h3>
                        <div class="row">
                            <div class="col-xs-9 col-sm-6 col-sm-offset-3">
                                <ul class="list-unstyled">
                                <?php
                                $grouped = array_group_by($menues, "menu_padre");
                                foreach ($grouped as $menu) :?>
                                    <li class="parent" data-id="<?php echo $menu[0]['menu_padre']; ?>">
                                        <label class="css-input css-checkbox css-checkbox css-checkbox-primary">
                                            <input class="menu" type="checkbox" checked=""><span class="push-10-r"></span> <?php echo $menu[0]['padre_descripcion']; ?>
                                        </label>
                                        <?php foreach ($menu as $submenu) :?>
                                        <ul>
                                            <li>
                                                <label class="css-input css-checkbox css-checkbox css-checkbox-primary">
                                                    <input class="submenu" name="submenu[]" value="<?php echo $submenu['menu']; ?>" data-id="<?php echo $submenu['menu']; ?>" type="checkbox" checked=""><span class="push-10-r"></span> <?php echo $submenu['descripcion']; ?>
                                                </label>
                                            </li>
                                        </ul>
                                        <?php endforeach;?>
                                    </li>
                                <?php endforeach;?>
                                </ul>
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