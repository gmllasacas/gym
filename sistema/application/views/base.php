
            <main id="main-container" >
                <div class="content-mini bg-gray-lighter">
                    <div class="row push-10">
                        <div class="col-sm-6">
                            <h1 class="page-heading">
                                Base
                            </h1>
                        </div>
                        <div class="col-sm-6 text-right hidden-xs">
                            <ol class="breadcrumb push-10-t">
                                <li>Inicio</li>
                                <li><a class="link-effect" href="">Base</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="content content-boxed">
                    <div class="row">
                        <div class="col-sm-4">
                            <a class="block block-link-hover2 nuevabase" href="#" data-toggle="modal" data-target="#base-modal">
                                <div class="block-content block-content-full bg-primary clearfix">
                                    <i class="si si-calendar  fa-2x text-white pull-right"></i>
                                    <i class="si si-plus text-white"></i>  <span class="h4 text-white">Registrar</span>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="block" id="busquedas">
                        <script type="text/javascript">
                                var reportetext='Listado de pacientes';
                        </script>
                        <ul class="nav nav-tabs nav-tabs-alt" data-toggle="tabs">
                            <li class="active">
                                <a href="#ultimasbases">Últimos 10 Registros</a>
                            </li>
                            <li class="">
                                <a href="#busqueda1">Consulta por Nº de atención </a>
                            </li>
                        </ul>
                        <div class="block-content tab-content">
                            <div class="tab-pane fade active in" id="ultimasbases">
                                <table class="table table-hover table-lista">
                                    <thead>
                                        <tr>
                                            <th>FECHA</th>
                                            <th>ATENCIÓN</th>
                                            <th>ESTADO</th>
                                            <th class="text-center" style="width: 10%;">ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php echo $bases;?>
                                        <tr>
                                            <td>2018/02/28</td>
                                            <td>234</td>
                                            <td>Activo</td>
                                            <td>
                                                <a class='btn btn-xs btn-info editarbase' data-id='4' data-table='base' data-toggle='tooltip' data-placement='top' title='Detalle'>
                                                    <i class='fa fa-check' ></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <div class="modal fade" id="base-modal" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-popout modal-lg">
                    <div class="modal-content">
                        <div class="block block-themed block-transparent remove-margin-b">
                            <div class="block-header bg-primary">
                                <ul class="block-options"><li><button data-dismiss="modal" type="button"><i class="si si-close"></i></button></li></ul>
                                <h3 class="block-title"><i class="si si-plus push-5-r"></i> <span>Líneas</span></h3>
                            </div>
                            <div class="block-content">
                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="base-form">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="table" value="base">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <label>Título</label>
                                                    <div class="input-group">
                                                        <input class="form-control required textoinput" type="text" name="titulo">
                                                        <span class="input-group-addon"><i class="si si-info"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <label>Tipo</label>
                                                    <select class="form-control required" name="tipo" style="width: 100%;">
                                                        <option value="1">A</option>
                                                        <option value="2">B</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-9">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <label>Descripción</label>
                                                    <div class="input-group">
                                                        <input class="form-control required textoinput" type="text" name="descripcion">
                                                        <span class="input-group-addon"><i class="si si-info"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-3">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <label>Estado</label>
                                                    <select class="form-control required" name="estado" style="width: 100%;">
                                                        <option value="1">Activo</option>
                                                        <option value="0">Inactivo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="divisor">
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