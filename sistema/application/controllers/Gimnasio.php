<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Gimnasio extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->menu_text = 'Pagos';
        $this->menu = '10';
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function sucursales()
    {
        $usuarios = $this->generico_modelo->listado('base_usuario', '1');
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $igvs = $this->generico_modelo->listado('proceso_igv', '1');

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Sucursales',
            'export_text' => 'Listado de sucursales',
            'registro_text' => 'sucursal',
            'usuarios' => $usuarios,
            'estados' => $estados,
            'igvs' => $igvs,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>1001]);
        $this->load->view('bases/barra');
        $this->load->view('gimnasio/sucursales', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['gimnasio/sucursales']]);
    }

    public function salas()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Salas',
            'export_text' => 'Listado de salas',
            'registro_text' => 'sala',
            'estados' => $estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>1002]);
        $this->load->view('bases/barra');
        $this->load->view('gimnasio/salas', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['gimnasio/salas']]);
    }

    public function cursos()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Cursos',
            'export_text' => 'Listado de cursos',
            'registro_text' => 'curso',
            'estados' => $estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>1003]);
        $this->load->view('bases/barra');
        $this->load->view('gimnasio/cursos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['gimnasio/cursos']]);
    }

    public function planificacion()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $salas = $this->generico_modelo->listado('proceso_sala', '1');
        $cursos = $this->generico_modelo->listado('proceso_curso', '1');

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Planificación de horarios',
            'export_text' => 'Listado de Planificaciones',
            'registro_text' => 'Planificación',
            'estados' => $estados,
            'salas' => $salas,
            'cursos' => $cursos,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>1004]);
        $this->load->view('bases/barra');
        $this->load->view('gimnasio/planificacion', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['gimnasio/planificacion']]);
    }
}
