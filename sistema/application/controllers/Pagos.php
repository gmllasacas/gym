<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chillerlan\QRCode\QRCode;

class Pagos extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->menu_text = 'Pagos';
        $this->menu = '4';
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function pagosCliente()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $clientes = $this->generico_modelo->listado('proceso_cliente', '1');
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Pagos de clientes',
            'export_text' => 'Listado de registros',
            'registro_text' => 'pago de cliente',
            'clientes'=>$clientes,
            'estados'=>$estados,
            'tipo_pagos'=>$tipo_pagos,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>403]);
        $this->load->view('bases/barra');
        $this->load->view('pagos/pagos_cliente', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['pagos/pagos_cliente']]);
    }

    public function pagosProveedor()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $clientes = $this->generico_modelo->listado('proceso_cliente', '1');
        $proveedores = $this->generico_modelo->listado('proceso_proveedor', '1');
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Pagos a proveedores',
            'export_text' => 'Listado de pagos a proveedores',
            'registro_text' => 'pago a proveedor',
            'proveedores'=>$proveedores,
            'estados'=>$estados,
            'tipo_pagos'=>$tipo_pagos,
            'tipocomprobantes'=>$tipocomprobantes,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>402]);
        $this->load->view('bases/barra');
        $this->load->view('pagos/pagos_proveedor', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['pagos/pagos_proveedor']]);
    }
}
