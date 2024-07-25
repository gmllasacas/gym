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
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function sucursales()
    {
        $usuarios = $this->generico_modelo->listado('base_usuario', '1');

        $datos = [
            'menu_text' => 'Inventario',
            'submenu_text' => 'Sucursales',
            'export_text' => 'Listado de sucursales',
            'registro_text' => 'sucursal',
            'usuarios' => $usuarios,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>2,'submenu' =>204]);
        $this->load->view('bases/barra');
        $this->load->view('inventario/sucursales', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['inventario/sucursales']]);
    }
}
