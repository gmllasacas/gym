<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Transaccion extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->configuracion=basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->load->helper('text');
        $this->load->model('genericomodelo', 'generico_modelo');
    }

    public function ingresos()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);
        $proveedores = $this->generico_modelo->listado('proceso_proveedor', '1');

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Ingresos',
            'titulo_text' => 'Ingresos',
            'export_text' => 'Listado de ingresos',
            'registro_text' => 'ingreso',
            'tipocomprobantes'=>$tipocomprobantes,
            'proveedores'=>$proveedores,
            'estados'=>$estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3,'submenu' =>301]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/ingresos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/ingresos']]);
    }

    public function ventas()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_venta_pagos = $this->generico_modelo->listado('proceso_tipo_venta_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Ventas',
            'titulo_text' => 'Ventas',
            'export_text' => 'Listado de ventas',
            'registro_text' => 'venta',
            'tipocomprobantes'=>$tipocomprobantes,
            'tipo_venta_pagos'=>$tipo_venta_pagos,
            'tipo_pagos'=>$tipo_pagos,
            'estados'=>$estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3,'submenu' =>303]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/ventas', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/ventas']]);
    }

    public function kardex()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $clientes = $this->generico_modelo->listado('proceso_cliente', '1');
        $productos = $this->generico_modelo->listado('proceso_producto', '1');
        foreach ($productos as &$item) {
            $item['codigo'] = spd($item['id'], 6, '0');
        }
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_venta_pagos = $this->generico_modelo->listado('proceso_tipo_venta_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $proveedores = $this->generico_modelo->listado('proceso_proveedor', '1');

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Kardex',
            'titulo_text' => 'Kardex',
            'export_text' => 'Listado de registros',
            'registro_text' => 'kardex',
            'productos'=>$productos,
            'tipocomprobantes'=>$tipocomprobantes,
            'tipo_venta_pagos'=>$tipo_venta_pagos,
            'tipo_pagos'=>$tipo_pagos,
            'clientes'=>$clientes,
            'proveedores'=>$proveedores,
            'estados'=>$estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3,'submenu' =>304]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/kardex', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/kardex']]);
    }

    public function pagos()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $clientes = $this->generico_modelo->listado('proceso_cliente', '1');
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Pagos',
            'titulo_text' => 'Pagos',
            'export_text' => 'Listado de registros',
            'registro_text' => 'pago',
            'clientes'=>$clientes,
            'estados'=>$estados,
            'tipo_pagos'=>$tipo_pagos,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3,'submenu' =>305]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/pagos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/pagos']]);
    }

    public function comprobanteventa($id)
    {
        $registro=basedetalleregistro('proceso_venta', ['id'=>$id]);
        if (count((array)$registro)>0) {
            $registro['cliente_datos'] = basedetalleregistro('proceso_cliente', ['id'=>$registro['cliente']]);
            $registro['cliente_datos']['tipo_documento_desc'] = basedetalleregistro('proceso_tipo_documento', ['id'=>$registro['cliente_datos']['tipo_documento']]);
            $registro['tipo_comprobante_desc'] = basedetalleregistro('proceso_tipo_comprobante', ['id'=>$registro['tipo_comprobante']]);
            $registro['detalles'] = $this->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$id]);
            $registro['tipo'] = 'venta';
            $this->load->library('Numero_letras');
            $letras = new Numero_letras();
            $registro['letras'] =$letras->convertir($registro['total']);
            foreach ($registro['detalles'] as &$item) {
                $item['codigo'] = spd($item['producto'], 6, '0');
            }
            $this->load->view('proceso/comprobante', ['registro' => $registro]);
        } else {
            show_error('El comprobante no existe', '404', 'No encontrado');
        }
    }
}
