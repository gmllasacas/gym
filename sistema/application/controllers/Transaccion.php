<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Transaccion extends CI_Controller
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

    public function ingresos()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipos_ingreso_pago = $this->generico_modelo->listado('proceso_tipo_ingreso_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $proveedores = $this->generico_modelo->listado('proceso_proveedor', '1');

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Ingresos',
            'export_text' => 'Listado de ingresos',
            'registro_text' => 'ingreso',
            'tipocomprobantes'=>$tipocomprobantes,
            'tipos_ingreso_pago'=>$tipos_ingreso_pago,
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

    public function venta()
    {
        $sucursal = $this->session->userdata('sucursal');
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_venta_pagos = $this->generico_modelo->listado('proceso_tipo_venta_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $caja = $this->generico_modelo->caja(['sucursal' => $sucursal, 'estado'=>1]);
        $tipos_documento = $this->generico_modelo->listado('proceso_tipo_documento', '1');
        $codigos_descuento = $this->generico_modelo->listado('proceso_codigo_descuento', '1');

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Venta',
            'export_text' => 'Formulario de venta',
            'registro_text' => 'venta',
            'tipocomprobantes'=>$tipocomprobantes,
            'tipo_venta_pagos'=>$tipo_venta_pagos,
            'tipo_pagos'=>$tipo_pagos,
            'caja'=>$caja,
            'tipos'=>$tipos_documento,
            'departamento' => 2,
            'codigos_descuento' => $codigos_descuento,
            'estados'=>$estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3,'submenu' =>308]);
        $this->load->view('bases/barra');
        $this->load->view('transaccion/venta', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['transaccion/venta']]);
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

    // phpcs:ignore
    public function pagosCliente()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $clientes = $this->generico_modelo->listado('proceso_cliente', '1');
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Pagos de clientes',
            'export_text' => 'Listado de registros',
            'registro_text' => 'pago de cliente',
            'clientes'=>$clientes,
            'estados'=>$estados,
            'tipo_pagos'=>$tipo_pagos,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3,'submenu' =>305]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/pagos_cliente', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/pagos_cliente']]);
    }

    // phpcs:ignore
    public function pagosProveedor()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $clientes = $this->generico_modelo->listado('proceso_cliente', '1');
        $proveedores = $this->generico_modelo->listado('proceso_proveedor', '1');
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Pagos a proveedores',
            'export_text' => 'Listado de pagos a proveedores',
            'registro_text' => 'pago a proveedor',
            'proveedores'=>$proveedores,
            'estados'=>$estados,
            'tipo_pagos'=>$tipo_pagos,
            'tipocomprobantes'=>$tipocomprobantes,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3,'submenu' =>306]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/pagos_proveedor', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/pagos_proveedor']]);
    }

    public function caja()
    {
        $sucursal = $this->session->userdata('sucursal');
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
        $caja = $this->generico_modelo->caja(['sucursal' => $sucursal, 'estado'=>1]);
        $ultima_caja = $this->generico_modelo->caja(['sucursal' => $sucursal, 'estado'=>2]);
        $ultima_fecha = $ultima_caja['fecha_cierre'] ?? 'Sin información';

        $datos = [
            'menu_text' => 'Transacciones',
            'submenu_text' => 'Caja',
            'export_text' => 'Listado de registros',
            'registro_text' => 'registro',
            'productos'=>$productos,
            'tipocomprobantes'=>$tipocomprobantes,
            'tipo_venta_pagos'=>$tipo_venta_pagos,
            'tipo_pagos'=>$tipo_pagos,
            'clientes'=>$clientes,
            'proveedores'=>$proveedores,
            'estados'=>$estados,
            'sucursal'=>$sucursal,
            'caja'=>$caja,
            'ultima_fecha'=>$ultima_fecha,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>3, 'submenu' =>307]);
        $this->load->view('bases/barra');
        $this->load->view('transaccion/caja', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['transaccion/caja']]);
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
            $this->load->library('NumberToLetters');
            $letras = new NumberToLetters();
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
