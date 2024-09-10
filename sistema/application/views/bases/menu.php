        <div id="page-container" class="sidebar-l sidebar-mini sidebar-o side-scroll header-navbar-fixed">
            <nav id="sidebar">
                <div id="sidebar-scroll">
                    <div class="sidebar-content">
                        <div class="side-header side-content logo-content">
                            <button class="btn btn-link text-gray pull-right hidden-md hidden-lg" type="button" data-toggle="layout" data-action="sidebar_close">
                                <i class="fa fa-times"></i>
                            </button>
                            <a href="#">
                                <img class="imglogo" src="<?php echo base_url().$this->configuracion['logo'];?>">
                                <span class="text-white text-center sidebar-mini-hide">  
                                    <b><?php echo $this->configuracion['titulo'];?></b><br> 
                                </span>
                            </a>
                        </div>
                        <div class="side-content side-nopad">
                            <ul class="nav-main">
                                <li class="nav-main-heading activeelement"><span class="sidebar-mini-hide">Navegación</span></li>
                                <?php
                                $grouped = array_group_by(permisos($submenu), "menu_padre");
                                foreach ($grouped as $key => $value) {
                                    echo '<li class="'.($menu == $key ? 'active open' : '').'">
                                                    <a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="'.$value[0]['padre_icono'].'"></i><span class="sidebar-mini-hide">'.str_replace('(Extranet)', '', $value[0]['padre_descripcion']).'</span></a>';
                                    $cont=0;
                                    $total=count($value);
                                    if ($total>0) {
                                        echo '<ul>';
                                    }
                                    foreach ($value as $item) {
                                        if ($item['visible']=='1') {
                                            $url=$item['url'];
                                            if ($url=='#') {
                                                $url='#';
                                            } else {
                                                $url=base_url().trim($url);
                                            }
                                            echo '<li><a class="'.($submenu == $item['menu'] ? 'active' : '').'" href="'.$url.'"><i class="'.$item['icono'].'"></i>'.$item['descripcion'].'</a></li>';
                                        }
                                        $cont++;
                                    }
                                    if ($total==$cont) {
                                        echo '</ul>';
                                    }
                                    echo '</li>';
                                }
                                ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>