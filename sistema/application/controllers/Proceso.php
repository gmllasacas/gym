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

    public function testPDF()
    {
        $this->load->library('Pdf');
        $pdf = new Pdf('header text', 'footer Text',PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        // set document information
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Nicola Asuni');
        $pdf->SetTitle('TCPDF Example 048');
        $pdf->SetSubject('TCPDF Tutorial');
        $pdf->SetKeywords('TCPDF, PDF, example, test, guide');

        // set default header data
        $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 048', PDF_HEADER_STRING);

        // set header and footer fonts
        $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
        $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

        // set auto page breaks
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        // set some language-dependent strings (optional)
        if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
            require_once(dirname(__FILE__).'/lang/eng.php');
            $pdf->setLanguageArray($l);
        }

        // ---------------------------------------------------------

        // set font
        $pdf->SetFont('helvetica', 'B', 20);

        // add a page
        $pdf->AddPage();

        $pdf->Write(0, 'Example of HTML tables', '', 0, 'L', true, 0, false, false, 0);

        $pdf->SetFont('helvetica', '', 8);

        // -----------------------------------------------------------------------------

        $tbl = <<<EOD
        <table cellspacing="0" cellpadding="1" border="1">
            <tr>
                <td rowspan="3">COL 1 - ROW 1<br />COLSPAN 3</td>
                <td>COL 2 - ROW 1</td>
                <td>COL 3 - ROW 1</td>
            </tr>
            <tr>
                <td rowspan="2">COL 2 - ROW 2 - COLSPAN 2<br />text line<br />text line<br />text line<br />text line</td>
                <td>COL 3 - ROW 2</td>
            </tr>
            <tr>
            <td>COL 3 - ROW 3</td>
            </tr>

        </table>
        EOD;

        $pdf->writeHTML($tbl, true, false, false, false, '');

        // -----------------------------------------------------------------------------

        $tbl = <<<EOD
        <table cellspacing="0" cellpadding="1" border="1">
            <tr>
                <td rowspan="3">COL 1 - ROW 1<br />COLSPAN 3<br />text line<br />text line<br />text line<br />text line<br />text line<br />text line</td>
                <td>COL 2 - ROW 1</td>
                <td>COL 3 - ROW 1</td>
            </tr>
            <tr>
                <td rowspan="2">COL 2 - ROW 2 - COLSPAN 2<br />text line<br />text line<br />text line<br />text line</td>
                <td>COL 3 - ROW 2</td>
            </tr>
            <tr>
            <td>COL 3 - ROW 3</td>
            </tr>

        </table>
        EOD;

        $pdf->writeHTML($tbl, true, false, false, false, '');

        // -----------------------------------------------------------------------------

        $tbl = <<<EOD
        <table cellspacing="0" cellpadding="1" border="1">
            <tr>
                <td rowspan="3">COL 1 - ROW 1<br />COLSPAN 3<br />text line<br />text line<br />text line<br />text line<br />text line<br />text line</td>
                <td>COL 2 - ROW 1</td>
                <td>COL 3 - ROW 1</td>
            </tr>
            <tr>
                <td rowspan="2">COL 2 - ROW 2 - COLSPAN 2<br />text line<br />text line<br />text line<br />text line</td>
                <td>COL 3 - ROW 2<br />text line<br />text line</td>
            </tr>
            <tr>
            <td>COL 3 - ROW 3</td>
            </tr>

        </table>
        EOD;

        $pdf->writeHTML($tbl, true, false, false, false, '');

        // -----------------------------------------------------------------------------

        $tbl = <<<EOD
        <table border="1">
        <tr>
        <th rowspan="3">Left column</th>
        <th colspan="5">Heading Column Span 5</th>
        <th colspan="9">Heading Column Span 9</th>
        </tr>
        <tr>
        <th rowspan="2">Rowspan 2<br />This is some text that fills the table cell.</th>
        <th colspan="2">span 2</th>
        <th colspan="2">span 2</th>
        <th rowspan="2">2 rows</th>
        <th colspan="8">Colspan 8</th>
        </tr>
        <tr>
        <th>1a</th>
        <th>2a</th>
        <th>1b</th>
        <th>2b</th>
        <th>1</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
        <th>5</th>
        <th>6</th>
        <th>7</th>
        <th>8</th>
        </tr>
        </table>
        EOD;

        $pdf->writeHTML($tbl, true, false, false, false, '');

        // -----------------------------------------------------------------------------

        // Table with rowspans and THEAD
        $tbl = <<<EOD
        <table border="1" cellpadding="2" cellspacing="2">
        <thead>
        <tr style="background-color:#FFFF00;color:#0000FF;">
        <td width="30" align="center"><b>A</b></td>
        <td width="140" align="center"><b>XXXX</b></td>
        <td width="140" align="center"><b>XXXX</b></td>
        <td width="80" align="center"> <b>XXXX</b></td>
        <td width="80" align="center"><b>XXXX</b></td>
        <td width="45" align="center"><b>XXXX</b></td>
        </tr>
        <tr style="background-color:#FF0000;color:#FFFF00;">
        <td width="30" align="center"><b>B</b></td>
        <td width="140" align="center"><b>XXXX</b></td>
        <td width="140" align="center"><b>XXXX</b></td>
        <td width="80" align="center"> <b>XXXX</b></td>
        <td width="80" align="center"><b>XXXX</b></td>
        <td width="45" align="center"><b>XXXX</b></td>
        </tr>
        </thead>
        <tr>
        <td width="30" align="center">1.</td>
        <td width="140" rowspan="6">XXXX<br />XXXX<br />XXXX<br />XXXX<br />XXXX<br />XXXX<br />XXXX<br />XXXX</td>
        <td width="140">XXXX<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td width="80">XXXX</td>
        <td align="center" width="45">XXXX<br />XXXX</td>
        </tr>
        <tr>
        <td width="30" align="center" rowspan="3">2.</td>
        <td width="140" rowspan="3">XXXX<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td align="center" width="45">XXXX<br />XXXX</td>
        </tr>
        <tr>
        <td width="80">XXXX<br />XXXX<br />XXXX<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td align="center" width="45">XXXX<br />XXXX</td>
        </tr>
        <tr>
        <td width="80" rowspan="2" >RRRRRR<br />XXXX<br />XXXX<br />XXXX<br />XXXX<br />XXXX<br />XXXX<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td align="center" width="45">XXXX<br />XXXX</td>
        </tr>
        <tr>
        <td width="30" align="center">3.</td>
        <td width="140">XXXX1<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td align="center" width="45">XXXX<br />XXXX</td>
        </tr>
        <tr>
        <td width="30" align="center">4.</td>
        <td width="140">XXXX<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td width="80">XXXX<br />XXXX</td>
        <td align="center" width="45">XXXX<br />XXXX</td>
        </tr>
        </table>
        EOD;

        $pdf->writeHTML($tbl, true, false, false, false, '');

        $pdf->writeHTML($tbl, true, false, false, false, '');

        // -----------------------------------------------------------------------------

        // NON-BREAKING TABLE (nobr="true")

        $tbl = <<<EOD
        <table border="1" cellpadding="2" cellspacing="2" nobr="true">
        <tr>
        <th colspan="3" align="center">NON-BREAKING TABLE</th>
        </tr>
        <tr>
        <td>1-1</td>
        <td>1-2</td>
        <td>1-3</td>
        </tr>
        <tr>
        <td>2-1</td>
        <td>3-2</td>
        <td>3-3</td>
        </tr>
        <tr>
        <td>3-1</td>
        <td>3-2</td>
        <td>3-3</td>
        </tr>
        </table>
        EOD;

        $pdf->writeHTML($tbl, true, false, false, false, '');

        // -----------------------------------------------------------------------------

        // NON-BREAKING ROWS (nobr="true")

        $tbl = <<<EOD
        <table border="1" cellpadding="2" cellspacing="2" align="center">
        <tr nobr="true">
        <th colspan="3">NON-BREAKING ROWS</th>
        </tr>
        <tr nobr="true">
        <td>ROW 1<br />COLUMN 1</td>
        <td>ROW 1<br />COLUMN 2</td>
        <td>ROW 1<br />COLUMN 3</td>
        </tr>
        <tr nobr="true">
        <td>ROW 2<br />COLUMN 1</td>
        <td>ROW 2<br />COLUMN 2</td>
        <td>ROW 2<br />COLUMN 3</td>
        </tr>
        <tr nobr="true">
        <td>ROW 3<br />COLUMN 1</td>
        <td>ROW 3<br />COLUMN 2</td>
        <td>ROW 3<br />COLUMN 3</td>
        </tr>
        </table>
        EOD;

        $pdf->writeHTML($tbl, true, false, false, false, '');
        $pdf->Output('test.pdf', 'I');
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
