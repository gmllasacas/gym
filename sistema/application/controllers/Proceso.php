<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Proceso extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion=basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function dashboard()
    {
        $this->db->simple_query(
            'SET SESSION sql_mode =
            REPLACE(REPLACE(REPLACE(
            @@sql_mode,
            "ONLY_FULL_GROUP_BY,", ""),
            ",ONLY_FULL_GROUP_BY", ""),
            "ONLY_FULL_GROUP_BY", "")'
        );

        /**Año actual */
        $date = date('Y-m-d');
        $dateini = date('Y-01-01');
        $datefin = date('Y-12-t');
        $dateinimes = date('Y-m-01');
        $datefinmes = date('Y-m-t');
            
        $nbDay = date('N', strtotime($date));
        $monday = new DateTime($date);
        $sunday = new DateTime($date);
        $monday->modify('-'.($nbDay-1).' days');
        $sunday->modify('+'.(7-$nbDay).' days');
        $dateinisemana=$monday->format('Y-m-d');
        $datefinsemana=$sunday->format('Y-m-d');
        $estado = 1;
        $contadores['dia']= $date;
        $contadores['semana']= $dateinisemana.' al '.$datefinsemana;
        $contadores['mes']= date('Y-m');

        /**Ventas */
        $ventas_diario = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();
                
        $ventas_diario_credito = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND proceso_venta.tipo_venta_pago = 1 AND (DATE(proceso_venta.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();

        $ventas_diario_contado = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND proceso_venta.tipo_venta_pago = 2 AND (DATE(proceso_venta.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();

        $ventas_semana = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinisemana,$datefinsemana)
        )->row_array();

        $ventas_mes = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinimes,$datefinmes)
        )->row_array();

        $ventas_mes_anual = $this->db->query(
            "SELECT base_meses.id AS periodo, SUM(IFNULL(total_mes.total, 0)) AS total
            FROM (
                SELECT IFNULL(proceso_venta.total, 0) as total, MONTH(proceso_venta.fecha) as mdate
                FROM proceso_venta
                WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) BETWEEN ? AND ?)
            ) total_mes
            RIGHT OUTER JOIN base_meses on total_mes.mdate = base_meses.id
            GROUP BY base_meses.mes
            ORDER BY base_meses.id ASC;",
            array('^['.$estado.']',$dateini,$datefin)
        )->result_array();
        $contadores['ventas_diario']= 'S/ '.$ventas_diario['ventas'];
        $contadores['ventas_diario_credito']= 'S/ '.$ventas_diario_credito['ventas'];
        $contadores['ventas_diario_contado']= 'S/ '.$ventas_diario_contado['ventas'];
        $contadores['ventas_semana']= 'S/ '.$ventas_semana['ventas'];
        $contadores['ventas_mes']= 'S/ '.$ventas_mes['ventas'];
        $data_graph_ventas = '[';

        foreach ($ventas_mes_anual as $item) {
            if ($item['total']==0 && $item['periodo']>date('m')) {
                $data_graph_ventas .= 'null, ';
            } else {
                $data_graph_ventas .= $item['total'].', ';
            }
        }
        $data_graph_ventas = substr($data_graph_ventas, 0, -2).']';
        /**Ventas */

        /**Pagos */
        $pagos_diario = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            WHERE proceso_pago.estado REGEXP ? AND (DATE(proceso_pago.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();
                
        $pagos_diario_efectivo = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            WHERE proceso_pago.estado REGEXP ? AND proceso_pago.tipo_pago = 1 AND (DATE(proceso_pago.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();
                
        $pagos_diario_deposito = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            WHERE proceso_pago.estado REGEXP ? AND proceso_pago.tipo_pago = 2 AND (DATE(proceso_pago.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();

        $pagos_semana = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            WHERE proceso_pago.estado REGEXP ? AND (DATE(proceso_pago.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinisemana,$datefinsemana)
        )->row_array();

        $pagos_mes = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            WHERE proceso_pago.estado REGEXP ? AND (DATE(proceso_pago.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinimes,$datefinmes)
        )->row_array();

        $pagos_mes_anual = $this->db->query(
            "SELECT base_meses.id AS periodo, SUM(IFNULL(total_mes.total, 0)) AS total
            FROM (
                SELECT IFNULL(proceso_pago.pago, 0) as total, MONTH(proceso_pago.fecha) as mdate
                FROM proceso_pago
                WHERE proceso_pago.estado REGEXP ? AND (DATE(proceso_pago.fecha) BETWEEN ? AND ?)
            ) total_mes
            RIGHT OUTER JOIN base_meses on total_mes.mdate = base_meses.id
            GROUP BY base_meses.mes
            ORDER BY base_meses.id ASC;",
            array('^['.$estado.']',$dateini,$datefin)
        )->result_array();
        $contadores['pagos_diario']= 'S/ '.$pagos_diario['pagos'];
        $contadores['pagos_diario_efectivo']= 'S/ '.$pagos_diario_efectivo['pagos'];
        $contadores['pagos_diario_deposito']= 'S/ '.$pagos_diario_deposito['pagos'];
        $contadores['pagos_semana']= 'S/ '.$pagos_semana['pagos'];
        $contadores['pagos_mes']= 'S/ '.$pagos_mes['pagos'];
        $data_graph_pagos = '[';

        foreach ($pagos_mes_anual as $item) {
            if ($item['total']==0 && $item['periodo']>date('m')) {
                $data_graph_pagos .= 'null, ';
            } else {
                $data_graph_pagos .= $item['total'].', ';
            }
        }
        $data_graph_pagos = substr($data_graph_pagos, 0, -2).']';
        /**Pagos */

        /**Ingresos */
        $ingresos_diario = $this->db->query(
            "SELECT COALESCE(SUM(proceso_ingreso_detalle.cantidad),0) as ingresos 
            FROM proceso_ingreso_detalle
            WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();
        //log_message('error', $this->db->last_query());

        $ingresos_semana = $this->db->query(
            "SELECT COALESCE(SUM(proceso_ingreso_detalle.cantidad),0) as ingresos 
            FROM proceso_ingreso_detalle
            WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinisemana,$datefinsemana)
        )->row_array();

        $ingresos_mes = $this->db->query(
            "SELECT COALESCE(SUM(proceso_ingreso_detalle.cantidad),0) as ingresos 
            FROM proceso_ingreso_detalle
            WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinimes,$datefinmes)
        )->row_array();

        $ingresos_mes_anual = $this->db->query(
            "SELECT base_meses.id AS periodo, SUM(IFNULL(total_mes.total, 0)) AS total
            FROM (
                SELECT IFNULL(proceso_ingreso_detalle.cantidad, 0) as total, MONTH(proceso_ingreso_detalle.fecha) as mdate
                FROM proceso_ingreso_detalle
                WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) BETWEEN ? AND ?)
            ) total_mes
            RIGHT OUTER JOIN base_meses on total_mes.mdate = base_meses.id
            GROUP BY base_meses.mes
            ORDER BY base_meses.id ASC;",
            array('^['.$estado.']',$dateini,$datefin)
        )->result_array();

        $contadores['ingresos_diario'] = $ingresos_diario['ingresos'].' unid. ('.(isset($ingresos_diario['ingresos']) ? ($ingresos_diario['ingresos']>0 ? unidades_docenas($ingresos_diario['ingresos']) : 0) : 0).')';
        $contadores['ingresos_semana'] = $ingresos_semana['ingresos'].' unid. ('.(isset($ingresos_semana['ingresos']) ? ($ingresos_semana['ingresos']>0 ? unidades_docenas($ingresos_semana['ingresos']) : 0) : 0).')';
        $contadores['ingresos_mes'] = $ingresos_mes['ingresos'].' unid. ('.(isset($ingresos_mes['ingresos']) ? ($ingresos_mes['ingresos']>0 ? unidades_docenas($ingresos_mes['ingresos']) : 0) : 0).')';
        $data_graph_ingresos = '[';

        foreach ($ingresos_mes_anual as $item) {
            if ($item['total']==0 && $item['periodo']>date('m')) {
                $data_graph_ingresos .= 'null, ';
            } else {
                $data_graph_ingresos .= $item['total'].', ';
            }
        }
        $data_graph_ingresos = substr($data_graph_ingresos, 0, -2).']';
        /**Ingresos */

        /**Clientes */
        $clientes_ventas_anual = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas, proceso_cliente.nombre_o_razon_social
            FROM proceso_venta
            INNER JOIN proceso_cliente ON proceso_venta.cliente=proceso_cliente.id
            WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) BETWEEN ? AND ?)
            GROUP BY proceso_venta.cliente
            ORDER BY ventas DESC
            LIMIT 8;",
            array('^['.$estado.']',$dateini,$datefin)
        )->result_array();

        if (count((array)$clientes_ventas_anual)) {
            $data_pie_clientes = '[';
            foreach ($clientes_ventas_anual as $item) {
                $data_pie_clientes .= '[\''.$item['nombre_o_razon_social'].'\', '.$item['ventas'].' ], ';
            }
            $data_pie_clientes = substr($data_pie_clientes, 0, -2).']';
        } else {
            $data_pie_clientes = '[]';
        }
        /**Clientes */

        /**Año actual */
        $this->configuracion['dashboard'] = ($this->configuracion['dashboard'] == '') ? 'public/img/recursos/dashboard.jpg' : $this->configuracion['dashboard'];

        $datos = [
            'menu_text' => 'Sistema',
            'submenu_text' => '',
            'titulo_text' => 'Indicadores',
            'export_text' => '',
            'registro_text' => '',
            'contadores'=>$contadores,
            'data_graph_ventas'=>$data_graph_ventas,
            'data_graph_pagos'=>$data_graph_pagos,
            'data_graph_ingresos'=>$data_graph_ingresos,
            'data_pie_clientes'=>$data_pie_clientes,
            'configuracion'=>$this->configuracion
        ];
        
        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>-1, 'submenu' =>-101]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/dashboard', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/dashboard']]);
    }
    
    public function clientes()
    {
        $tipos_documento = $this->generico_modelo->listado('proceso_tipo_documento', '1');
        $provincias = $this->generico_modelo->listado('proceso_provincia', '1', ['where' => ['iddepartamento' => 2]]);

        $datos = [
            'menu_text' => 'Inventario',
            'submenu_text' => 'Clientes',
            'titulo_text' => 'Clientes',
            'export_text' => 'Listado de clientes',
            'registro_text' => 'cliente',
            'tipos' => $tipos_documento,
            'departamento' => 2,
            'provincias' => $provincias,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>2, 'submenu' =>201]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/clientes', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/clientes']]);
    }

    public function proveedores()
    {
        $datos = [
            'menu_text' => 'Inventario',
            'submenu_text' => 'Proveedores',
            'titulo_text' => 'Proveedores',
            'export_text' => 'Listado de proveedores',
            'registro_text' => 'Proveedor'
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>2, 'submenu' =>202]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/proveedores', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/proveedores']]);
    }

    public function productos()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipos = $this->generico_modelo->listado('proceso_tipo_producto', '1');
        $unidades = $this->generico_modelo->listado('proceso_unidad', '1');
        $duracion_unidades = $this->generico_modelo->listado('proceso_duracion_unidad', '1');

        $datos = [
            'menu_text' => 'Inventario',
            'submenu_text' => 'Productos y Servicios',
            'titulo_text' => 'Productos  y Servicio',
            'export_text' => 'Listado de productos y servicios',
            'registro_text' => 'producto o servicio',
            'tipos'=>$tipos,
            'duracion_unidades'=>$duracion_unidades,
            'unidades'=>$unidades,
            'estados'=>$estados,
        ];
        
        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>2, 'submenu' =>203]);
        $this->load->view('bases/barra');
        $this->load->view('proceso/productos', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['proceso/productos']]);
    }
}
