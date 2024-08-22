<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Web extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->menu_text = 'Página Web';
        $this->menu = '6';
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function contactosExternos()
    {
        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Contactos externos',
            'export_text' => 'Listado de registros',
            'registro_text' => '',
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>601]);
        $this->load->view('bases/barra');
        $this->load->view('web/contactos_externos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['web/contactos_externos']]);
    }
}
