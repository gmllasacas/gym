<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Proceso extends CI_Controller
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
        $venta_sucursal = 'AND proceso_venta.sucursal = ' . $this->session->userdata('sucursal');

        $ventas_diario = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) = ?) $venta_sucursal;",
            array('^['.$estado.']',$date)
        )->row_array();
                
        $ventas_diario_credito = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND proceso_venta.tipo_venta_pago = 1 AND (DATE(proceso_venta.fecha) = ?) $venta_sucursal;",
            array('^['.$estado.']',$date)
        )->row_array();

        $ventas_diario_contado = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND proceso_venta.tipo_venta_pago = 2 AND (DATE(proceso_venta.fecha) = ?) $venta_sucursal;",
            array('^['.$estado.']',$date)
        )->row_array();

        $ventas_semana = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) BETWEEN ? AND ?) $venta_sucursal;",
            array('^['.$estado.']',$dateinisemana,$datefinsemana)
        )->row_array();

        $ventas_mes = $this->db->query(
            "SELECT COALESCE(SUM(proceso_venta.total),0) as ventas 
            FROM proceso_venta
            WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) BETWEEN ? AND ?) $venta_sucursal;",
            array('^['.$estado.']',$dateinimes,$datefinmes)
        )->row_array();

        $ventas_mes_anual = $this->db->query(
            "SELECT base_meses.id AS periodo, SUM(IFNULL(total_mes.total, 0)) AS total
            FROM (
                SELECT IFNULL(proceso_venta.total, 0) as total, MONTH(proceso_venta.fecha) as mdate
                FROM proceso_venta
                WHERE proceso_venta.estado REGEXP ? AND (DATE(proceso_venta.fecha) BETWEEN ? AND ?) $venta_sucursal
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
        $pago_sucursal = 'AND proceso_caja.sucursal = ' . $this->session->userdata('sucursal');

        $pagos_diario = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            INNER JOIN proceso_caja ON proceso_caja.id = proceso_pago.caja $pago_sucursal
            WHERE proceso_pago.estado REGEXP ? AND (DATE(proceso_pago.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();
                
        $pagos_diario_efectivo = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            INNER JOIN proceso_caja ON proceso_caja.id = proceso_pago.caja $pago_sucursal
            WHERE proceso_pago.estado REGEXP ? AND proceso_pago.tipo_pago = 1 AND (DATE(proceso_pago.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();
                
        $pagos_diario_deposito = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            INNER JOIN proceso_caja ON proceso_caja.id = proceso_pago.caja $pago_sucursal
            WHERE proceso_pago.estado REGEXP ? AND proceso_pago.tipo_pago = 2 AND (DATE(proceso_pago.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();

        $pagos_semana = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            INNER JOIN proceso_caja ON proceso_caja.id = proceso_pago.caja $pago_sucursal
            WHERE proceso_pago.estado REGEXP ? AND (DATE(proceso_pago.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinisemana,$datefinsemana)
        )->row_array();

        $pagos_mes = $this->db->query(
            "SELECT COALESCE(SUM(proceso_pago.pago),0) as pagos 
            FROM proceso_pago
            INNER JOIN proceso_caja ON proceso_caja.id = proceso_pago.caja $pago_sucursal
            WHERE proceso_pago.estado REGEXP ? AND (DATE(proceso_pago.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinimes,$datefinmes)
        )->row_array();

        $pagos_mes_anual = $this->db->query(
            "SELECT base_meses.id AS periodo, SUM(IFNULL(total_mes.total, 0)) AS total
            FROM (
                SELECT IFNULL(proceso_pago.pago, 0) as total, MONTH(proceso_pago.fecha) as mdate
                FROM proceso_pago
                INNER JOIN proceso_caja ON proceso_caja.id = proceso_pago.caja $pago_sucursal
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
        $ingreso_sucursal = 'AND proceso_ingreso.sucursal = ' . $this->session->userdata('sucursal');

        $ingresos_diario = $this->db->query(
            "SELECT COALESCE(SUM(proceso_ingreso_detalle.cantidad),0) as ingresos 
            FROM proceso_ingreso_detalle
            INNER JOIN proceso_ingreso ON proceso_ingreso.id = proceso_ingreso_detalle.ingreso $ingreso_sucursal
            WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) = ?);",
            array('^['.$estado.']',$date)
        )->row_array();
        //log_message('error', $this->db->last_query());

        $ingresos_semana = $this->db->query(
            "SELECT COALESCE(SUM(proceso_ingreso_detalle.cantidad),0) as ingresos 
            FROM proceso_ingreso_detalle
            INNER JOIN proceso_ingreso ON proceso_ingreso.id = proceso_ingreso_detalle.ingreso $ingreso_sucursal
            WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinisemana,$datefinsemana)
        )->row_array();

        $ingresos_mes = $this->db->query(
            "SELECT COALESCE(SUM(proceso_ingreso_detalle.cantidad),0) as ingresos 
            FROM proceso_ingreso_detalle
            INNER JOIN proceso_ingreso ON proceso_ingreso.id = proceso_ingreso_detalle.ingreso $ingreso_sucursal
            WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) BETWEEN ? AND ?);",
            array('^['.$estado.']',$dateinimes,$datefinmes)
        )->row_array();

        $ingresos_mes_anual = $this->db->query(
            "SELECT base_meses.id AS periodo, SUM(IFNULL(total_mes.total, 0)) AS total
            FROM (
                SELECT IFNULL(proceso_ingreso_detalle.cantidad, 0) as total, MONTH(proceso_ingreso_detalle.fecha) as mdate
                FROM proceso_ingreso_detalle
                INNER JOIN proceso_ingreso ON proceso_ingreso.id = proceso_ingreso_detalle.ingreso $ingreso_sucursal
                WHERE proceso_ingreso_detalle.estado REGEXP ? AND (DATE(proceso_ingreso_detalle.fecha) BETWEEN ? AND ?)
            ) total_mes
            RIGHT OUTER JOIN base_meses on total_mes.mdate = base_meses.id
            GROUP BY base_meses.mes
            ORDER BY base_meses.id ASC;",
            array('^['.$estado.']',$dateini,$datefin)
        )->result_array();

        $contadores['ingresos_diario'] = $ingresos_diario['ingresos'].' unid. ('.(isset($ingresos_diario['ingresos']) ? ($ingresos_diario['ingresos']>0 ? ($ingresos_diario['ingresos']) : 0) : 0).')';
        $contadores['ingresos_semana'] = $ingresos_semana['ingresos'].' unid. ('.(isset($ingresos_semana['ingresos']) ? ($ingresos_semana['ingresos']>0 ? ($ingresos_semana['ingresos']) : 0) : 0).')';
        $contadores['ingresos_mes'] = $ingresos_mes['ingresos'].' unid. ('.(isset($ingresos_mes['ingresos']) ? ($ingresos_mes['ingresos']>0 ? ($ingresos_mes['ingresos']) : 0) : 0).')';
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
        $data_pie_clientes = '[]';
        /*$clientes_ventas_anual = $this->db->query(
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
        }*/
        /**Clientes */

        /**Año actual */
        $this->configuracion['dashboard'] = ($this->configuracion['dashboard'] == '') ? 'public/img/recursos/dashboard.jpg' : $this->configuracion['dashboard'];

        $datos = [
            'menu_text' => 'Sistema',
            'submenu_text' => '',
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
}
