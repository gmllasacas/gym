<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chillerlan\QRCode\QRCode;

class Transacciones extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->menu_text = 'Transacciones';
        $this->menu = '3';
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
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Ingresos',
            'export_text' => 'Listado de ingresos',
            'registro_text' => 'ingreso',
            'tipocomprobantes'=>$tipocomprobantes,
            'tipos_ingreso_pago'=>$tipos_ingreso_pago,
            'proveedores'=>$proveedores,
            'estados'=>$estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>301]);
        $this->load->view('bases/barra');
        $this->load->view('transacciones/ingresos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['transacciones/ingresos']]);
    }

    public function ventas()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_venta_pagos = $this->generico_modelo->listado('proceso_tipo_venta_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Ventas',
            'export_text' => 'Listado de ventas',
            'registro_text' => 'venta',
            'tipocomprobantes'=>$tipocomprobantes,
            'tipo_venta_pagos'=>$tipo_venta_pagos,
            'tipo_pagos'=>$tipo_pagos,
            'estados'=>$estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>303]);
        $this->load->view('bases/barra');
        $this->load->view('transacciones/ventas', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['transacciones/ventas']]);
    }

    public function puntoDeVenta()
    {
        $sucursal = $this->session->userdata('sucursal');
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $igvs = $this->generico_modelo->listado('proceso_igv', '1');
        $tipocomprobantes = $this->generico_modelo->listado('proceso_tipo_comprobante', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_venta_pagos = $this->generico_modelo->listado('proceso_tipo_venta_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $tipo_pagos = $this->generico_modelo->listado('proceso_tipo_pago', '1', ['orderby'=>'id','direction'=>'asc']);
        $caja = $this->generico_modelo->caja(['sucursal' => $sucursal, 'estado'=>1]);
        $tipos_documento = $this->generico_modelo->listado('proceso_tipo_documento', '1');
        $codigos_descuento = $this->generico_modelo->listado('proceso_codigo_descuento', '1');
        $sucursal = basedetalleregistro('base_sucursal', ['id'=>$sucursal]);

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Punto de venta',
            'export_text' => 'Formulario de venta',
            'registro_text' => 'venta',
            'tipocomprobantes'=>$tipocomprobantes,
            'tipo_venta_pagos'=>$tipo_venta_pagos,
            'tipo_pagos'=>$tipo_pagos,
            'igvs'=>$igvs,
            'caja'=>$caja,
            'tipos'=>$tipos_documento,
            'departamento' => 2,
            'codigos_descuento' => $codigos_descuento,
            'estados'=>$estados,
            'sucursal'=>$sucursal,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>308]);
        $this->load->view('bases/barra');
        $this->load->view('transacciones/punto_venta', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['transacciones/punto_venta']]);
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
            'menu_text' => $this->menu_text,
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
        $this->load->view('bases/menu', ['menu' =>$this->menu, 'submenu' =>309]);
        $this->load->view('bases/barra');
        $this->load->view('transacciones/caja', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['transacciones/caja']]);
    }

    public function comprobanteventa($id)
    {
        $registro=basedetalleregistro('proceso_venta', ['id'=>$id]);
        if (count((array)$registro)>0) {
            $registro['cliente_datos'] = basedetalleregistro('proceso_cliente', ['id'=>$registro['cliente']]);
            $registro['cliente_datos']['tipo_documento_desc'] = basedetalleregistro('proceso_tipo_documento', ['id'=>$registro['cliente_datos']['tipo_documento']]);
            $registro['tipo_comprobante_desc'] = basedetalleregistro('proceso_tipo_comprobante', ['id'=>$registro['tipo_comprobante']]);
            $registro['detalles'] = $this->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$id]);
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

    public function comprobante($id)
    {
        $registro=basedetalleregistro('proceso_venta', ['id'=>$id]);
        if (count((array)$registro)>0) {
            $registro['cliente_datos'] = basedetalleregistro('proceso_cliente', ['id'=>$registro['cliente']]);
            $registro['cliente_datos']['tipo_documento_desc'] = basedetalleregistro('proceso_tipo_documento', ['id'=>$registro['cliente_datos']['tipo_documento']]);
            $registro['tipo_comprobante_desc'] = basedetalleregistro('proceso_tipo_comprobante', ['id'=>$registro['tipo_comprobante']]);
            $registro['detalles'] = $this->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$id]);
            $registro['sucursal'] = basedetalleregistro('base_sucursal', ['estado'=>'1','id'=>$this->session->userdata('sucursal')]);
            $registro['sunat'] = basedetalleregistro('proceso_envio_sunat', ['estado'=>'1','venta'=>$id]);
            foreach ($registro['detalles'] as &$item) {
                $producto = basedetalleregistro('proceso_producto', ['estado'=>'1','id'=>$item['producto']]);
                $detalle_tipo_producto = detalle_tipo_producto($producto);
                $item['tipo'] = $detalle_tipo_producto['tipo'];
                $item['codigo'] = $detalle_tipo_producto['codigo'];
                $item['existencias'] = $detalle_tipo_producto['existencias'];
                $item['abreviatura'] = $detalle_tipo_producto['abreviatura'];
                $item['duracion_unidad_desc'] = $detalle_tipo_producto['duracion_unidad_desc'];
            }

            $this->load->library('NumberToLetters');
            $letras = new NumberToLetters();
            $registro['letras'] =$letras->convertir($registro['total'], 'SOLES');

            $qr = new QRCode();
            $registro['qr'] = $qr->render($registro['sunat']['cadena_para_codigo_qr']);

            $this->load->view('transacciones/comprobante', ['registro' => $registro]);
        } else {
            show_error('El comprobante no existe', '404', 'No encontrado');
        }
    }

    public function comprobanteAnulacion($id)
    {
        $registro=basedetalleregistro('proceso_venta', ['id'=>$id]);
        if (count((array)$registro)>0) {
            $registro['cliente_datos'] = basedetalleregistro('proceso_cliente', ['id'=>$registro['cliente']]);
            $registro['cliente_datos']['tipo_documento_desc'] = basedetalleregistro('proceso_tipo_documento', ['id'=>$registro['cliente_datos']['tipo_documento']]);
            $registro['tipo_comprobante_desc'] = basedetalleregistro('proceso_tipo_comprobante', ['id'=>$registro['tipo_comprobante']]);
            $registro['detalles'] = $this->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$id]);
            $registro['sucursal'] = basedetalleregistro('base_sucursal', ['estado'=>'1','id'=>$this->session->userdata('sucursal')]);
            $registro['sunat'] = basedetalleregistro('proceso_envio_sunat', ['estado'=>'1','venta'=>$id]);
            $registro['anulacion'] = basedetalleregistro('proceso_venta_anulacion', ['estado'=>'1','venta'=>$id]);

            $this->load->view('transacciones/comprobante_anulacion', ['registro' => $registro]);
        } else {
            show_error('El comprobante no existe', '404', 'No encontrado');
        }
    }
}
