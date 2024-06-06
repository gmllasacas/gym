
            <header id="header-navbar" class="content-mini content-mini-full">
                <ul class="nav-header pull-right">
                    <li>
                        
                        <div class="btn-group">
                            <button class="btn btn-default btn-image dropdown-toggle" data-toggle="dropdown" type="button">
                                <span class="text-white text-uppercase font-w300"> <?php echo $this->session->userdata('username'); ?> </span> 
                                <img src="<?php echo base_url();?>public/img/avatars/avatar.jpg" alt="Avatar">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li class="dropdown-header">Usuario</li>
                                <li>
                                    <a tabindex="-1">
                                        <i class="si si-user pull-right"></i><span><?php echo $this->session->userdata('nombres'); ?></span>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li class="dropdown-header">Acciones</li>
                                <li>
                                    <a tabindex="-1" href="<?php echo base_url();?>sistema/salir">
                                        <i class="si si-logout pull-right"></i>Cerrar Sesión
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <ul class="nav-header pull-left">
                    <li class="hidden-md hidden-lg">
                        <button class="btn btn-default" data-toggle="layout" data-action="sidebar_toggle" type="button">
                            <i class="fa fa-navicon"></i>
                        </button>
                    </li>
                    <li class="hidden-xs hidden-sm">
                        <button class="btn btn-default" data-toggle="layout" data-action="sidebar_mini_toggle" type="button">
                            <i class="fa fa-ellipsis-v"></i>
                        </button>
                    </li>
                    <li>
                        <a href="<?php echo base_url();?>public/documentos/<?php echo ($this->session->userdata('perfil')<=2 ? "Manualdetallado": "Manualrápido"); ?>.pdf" target="_new" class="btn btn-default pull-right" type="button">
                            ?
                        </a>
                    </li>
                </ul>
            </header>

            <div class="modal fade" id="help-modal" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-popout modal-lg">
                    <div class="modal-content">
                        <div class="block block-themed block-transparent remove-margin-b">
                            <div class="block-header bg-primary">
                                <ul class="block-options">
                                    <li>
                                        <button data-dismiss="modal" type="button"><i class="si si-close"></i></button>
                                    </li>
                                </ul>
                                <h3 class="block-title"><i class="fa fa-check push-10-r"></i><span>Ayuda</span></h3>
                            </div>
                            <div class="block-content">

                                <object data="<?php echo base_url();?>public/documentos/Manualrápido.pdf" type="application/pdf" height="500">
                                    alt : <a href="<?php echo base_url();?>public/documentos/Manualrápido.pdf">test.pdf</a>
                                </object>

                                <form class="form-horizontal push-10-t push-10" method="post" action="" id="" autocomplete="off">
                                    <div class="form-group">
                                        <div class="col-xs-12 text-center">
                                            <a class="btn btn-minw btn-square btn-muted push-5-r" data-dismiss="modal"><i class="fa fa-times push-5-r"></i> Cerrar</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>