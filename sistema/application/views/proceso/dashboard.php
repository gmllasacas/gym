

            <main id="main-container">
                <div class="content bg-image overflow-hidden" style="background-image: url('<?php echo base_url().$configuracion['dashboard'];?>');">
                    <div class="push-10-t push-15">
                        <h1 class="h2 text-white animated zoomIn">Dashboard</h1>
                    </div>
                </div>
                <div class="content bg-white border-b">
                    <div class="row push-20 text-uppercase">
                        <div class="col-xs-6 col-sm-3">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ventas del mes</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i> Período <?php echo $contadores['mes'];?></small></div>
                            <a class="h2 font-w300 text-danger" href="#"><?php echo $contadores['ventas_mes'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ventas de la semana</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['semana'];?></small></div>
                            <a class="h2 font-w300 text-danger" href="#"><?php echo $contadores['ventas_semana'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-2">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ventas del día</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['dia'];?></small></div>
                            <a class="h3 font-w300 text-danger" href="#"><?php echo $contadores['ventas_diario'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-2">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ventas del día (crédito)</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['dia'];?></small></div>
                            <a class="h3 font-w300 text-danger" href="#"><?php echo $contadores['ventas_diario_credito'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-2">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ventas del día (contado)</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['dia'];?></small></div>
                            <a class="h3 font-w300 text-danger" href="#"><?php echo $contadores['ventas_diario_contado'];?></a>
                        </div>
                    </div>
                    <div class="row push-20 text-uppercase">
                        <div class="col-xs-6 col-sm-3">
                            <div class="font-w700 text-gray-darker animated fadeIn">Pagos del mes</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i> Período <?php echo $contadores['mes'];?></small></div>
                            <a class="h2 font-w300 text-info" href="#"><?php echo $contadores['pagos_mes'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <div class="font-w700 text-gray-darker animated fadeIn">Pagos de la semana</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['semana'];?></small></div>
                            <a class="h2 font-w300 text-info" href="#"><?php echo $contadores['pagos_semana'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-2">
                            <div class="font-w700 text-gray-darker animated fadeIn">Pagos del día</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['dia'];?></small></div>
                            <a class="h3 font-w300 text-info" href="#"><?php echo $contadores['pagos_diario'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-2">
                            <div class="font-w700 text-gray-darker animated fadeIn">Pagos del día (efectivo)</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['dia'];?></small></div>
                            <a class="h3 font-w300 text-info" href="#"><?php echo $contadores['pagos_diario_efectivo'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-2">
                            <div class="font-w700 text-gray-darker animated fadeIn">Pagos del día (depósito)</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['dia'];?></small></div>
                            <a class="h3 font-w300 text-info" href="#"><?php echo $contadores['pagos_diario_deposito'];?></a>
                        </div>
                    </div>
                    <div class="row push-20 text-uppercase">
                        <div class="col-xs-6 col-sm-4">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ingresos del mes</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i> Período <?php echo $contadores['mes'];?></small></div>
                            <a class="h3 font-w300 text-success" href="#"><?php echo $contadores['ingresos_mes'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-4">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ingresos de la semana</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['semana'];?></small></div>
                            <a class="h3 font-w300 text-success" href="#"><?php echo $contadores['ingresos_semana'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-4">
                            <div class="font-w700 text-gray-darker animated fadeIn">Ingresos del día</div>
                            <div class="text-muted animated fadeIn"><small><i class="si si-calendar"></i>  <?php echo $contadores['dia'];?></small></div>
                            <a class="h3 font-w300 text-success" href="#"><?php echo $contadores['ingresos_diario'];?></a>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="block push-20 hidden">
                        <form class="form-horizontal" method="post" action="" id="busqueda-form" autocomplete="off">
                            <input type="hidden" name="table" value="ose_validacion_resumen_ose">
                            <input type="hidden" name="estado" value="^99">
                            <div class="block-header bg-gray-lighter">
                                <ul class="block-options">
                                    <li>
                                        <button class="text-info" role="button" type="submit"><i class="si si-magnifier"></i> <span class="hidden-xs">Consultar</span></button>
                                    </li>
                                </ul>
                                <h3 class="block-title"><?php echo $titulo_text;?> por fecha</h3>
                            </div>
                            <div class="block-content">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-3 col-sm-offset-3">
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="input-group form-material form-material-info">
                                                            <input class="js-datepicker-inicio-6 form-control required" data-date-format="yyyy-mm-dd" type="text" name="fechainicio" placeholder="Fecha">
                                                            <label>Fecha de inicio</label>
                                                            <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="input-group form-material form-material-info">
                                                            <input class="js-datepicker-fin form-control required" data-date-format="yyyy-mm-dd" type="text" name="fechafin" placeholder="Fecha">
                                                            <label>Fecha de fin</label>
                                                            <span class="input-group-addon"><i class="si si-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="block">
                                <div class="block-header">
                                    <h3 class="block-title">VENTAS POR MES</h3>
                                </div>
                                <div class="block-content block-content-full bg-gray-lighter text-center">
                                    <div id="graph1" style="width: 100%; height: 400px; margin: 0 auto"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="block">
                                <div class="block-header">
                                    <h3 class="block-title">PAGOS POR MES</h3>
                                </div>
                                <div class="block-content block-content-full bg-gray-lighter text-center">
                                    <div id="graph2" style="width: 100%; height: 400px; margin: 0 auto"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="block">
                                <div class="block-header">
                                    <h3 class="block-title">INGRESOS POR MES</h3>
                                </div>
                                <div class="block-content block-content-full bg-gray-lighter text-center">
                                    <div id="graph3" style="width: 100%; height: 400px; margin: 0 auto"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="block">
                                <div class="block-header">
                                    <h3 class="block-title">VENTAS POR CLIENTE DEL AñO (8 MAYORES)</h3>
                                </div>
                                <div class="block-content block-content-full bg-gray-lighter text-center">
                                    <div id="high-pie1" style="width: 100%; height: 400px; margin: 0 auto"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    var data_graph_ventas =<?php echo $data_graph_ventas;?>;
                    var data_graph_pagos =<?php echo $data_graph_pagos;?>;
                    var data_graph_ingresos =<?php echo $data_graph_ingresos;?>;
                    var data_pie_clientes =<?php echo $data_pie_clientes;?>;
                </script>
            </main>