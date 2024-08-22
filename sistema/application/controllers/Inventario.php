<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Inventario extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->menu_text = 'Inventario';
        $this->menu = '2';
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    
    public function clientes()
    {
        $tipos_documento = $this->generico_modelo->listado('proceso_tipo_documento', '1');
        $provincias = $this->generico_modelo->listado('proceso_provincia', '1', ['where' => ['iddepartamento' => 2]]);

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Clientes',
            'export_text' => 'Listado de clientes',
            'registro_text' => 'cliente',
            'tipos' => $tipos_documento,
            'departamento' => 2,
            'provincias' => $provincias,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu, 'submenu' =>201]);
        $this->load->view('bases/barra');
        $this->load->view('inventario/clientes', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['inventario/clientes']]);
    }

    public function proveedores()
    {
        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Proveedores',
            'export_text' => 'Listado de proveedores',
            'registro_text' => 'Proveedor'
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu, 'submenu' =>202]);
        $this->load->view('bases/barra');
        $this->load->view('inventario/proveedores', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['inventario/proveedores']]);
    }

    public function productos()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipos = $this->generico_modelo->listado('proceso_tipo_producto', '1');
        $unidades = $this->generico_modelo->listado('proceso_unidad', '1');
        $duracion_unidades = $this->generico_modelo->listado('proceso_duracion_unidad', '1');

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Productos y Servicios',
            'export_text' => 'Listado de productos y servicios',
            'registro_text' => 'producto o servicio',
            'tipos'=>$tipos,
            'duracion_unidades'=>$duracion_unidades,
            'unidades'=>$unidades,
            'estados'=>$estados,
        ];
        
        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu, 'submenu' =>203]);
        $this->load->view('bases/barra');
        $this->load->view('inventario/productos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['inventario/productos']]);
    }

    public function codigos()
    {
        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Códigos de descuento',
            'export_text' => 'Listado de códigos de descuento',
            'registro_text' => 'Código de descuento'
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>205]);
        $this->load->view('bases/barra');
        $this->load->view('inventario/codigos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['inventario/codigos']]);
    }
}
