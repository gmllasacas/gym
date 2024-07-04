<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Reportes extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id' => 1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function clientes()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipos_documento = $this->generico_modelo->listado('proceso_tipo_documento', '1');
        $provincias = $this->generico_modelo->listado('proceso_provincia', '1', ['where' => ['iddepartamento' => 2]]);

        $datos = [
            'menu_text' => 'Reportes',
            'submenu_text' => 'Clientes',
            'export_text' => 'Clientes nuevos por fecha de registro',
            'export_text_2' => 'Clientes inactivos (Sin membresía)',
            'registro_text' => 'kardex',
            'estados'=>$estados,
            'tipos' => $tipos_documento,
            'departamento' => 2,
            'provincias' => $provincias,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>4,'submenu' =>401]);
        $this->load->view('bases/barra');
        $this->load->view('reportes/clientes', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['reportes/clientes']]);
    }
}
