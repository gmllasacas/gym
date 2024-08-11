<?php
defined('BASEPATH') or exit('No direct script access allowed');

use Ticketpark\HtmlPhpExcel\HtmlPhpExcel;

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
            'registro_text' => 'cliente',
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

    public function transacciones()
    {
        $estados = $this->generico_modelo->listado('base_estado', '1');
        $tipos_documento = $this->generico_modelo->listado('proceso_tipo_documento', '1');
        $provincias = $this->generico_modelo->listado('proceso_provincia', '1', ['where' => ['iddepartamento' => 2]]);

        $datos = [
            'menu_text' => 'Reportes',
            'submenu_text' => 'Transacciones',
            'export_text' => 'Reporte contable',
            'export_text_2' => '',
            'registro_text' => '',
            'estados'=>$estados,
            'tipos' => $tipos_documento,
            'departamento' => 2,
            'provincias' => $provincias,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>4,'submenu' =>402]);
        $this->load->view('bases/barra');
        $this->load->view('reportes/transacciones', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['reportes/transacciones']]);
    }

    public function reporteContable($date = null)
    {
        try {
            if (is_null($date)) {
                throw new Exception('Parámetros incorrectos');
            } else {
                $params['estado'] = '^5';
                $params['fechainicio'] = $date;
                $mes = get_month_string(date("m", strtotime($date . '-01')));

                $data = $this->generico_modelo->busqueda('reporte_contable', $params);
                $cantidad = count($data);
                $subtotal = 0;
                $igv = 0;
                $total = 0;
                $body = '';
                $filename = 'Registro de ventas ' . $mes . ' - ' . date("Y", strtotime($date . '-01')) . ' de ' . $this->config->item('system_username');
                $style_number_right = '{"format": "#,##0.00","text-align": "right"}';
                $style_right = '{"text-align": "right"}';
                $style_center_wrap_width = '{"text-align": "center","text-wrap":"true","vertical-align":"center","width": 30}';
                $style_center_wrap_width_2 = '{"text-align": "center","text-wrap":"true","vertical-align":"center","width": 15}';
                $style_header_center_wrap = '{"text-align": "center","text-wrap":"true","vertical-align":"center"}';
                $style_center_wrap = '{"text-align": "center","text-wrap":"true","vertical-align":"center","font-style":"bold"}';
                $style_header_center = '{"text-align": "center","vertical-align": "center"}';
                $style_center = '{"text-align": "center","vertical-align": "center"}';
                $style_header = '{"fill-color": "#000000","text-color": "#ffffff"}';
                $style_font_size = '{"font-size": 8}';

                foreach ($data as $item) {
                    $subtotal = $subtotal + $item['subtotal'];
                    $igv = $igv + $item['igv'];
                    $total = $total + $item['total'];
                    $comprobante = explode("-", $item['comprobante']);
                    $body .= "<tr _excel-styles='$style_font_size'>
                                <td></td>
                                <td></td>
                                <td>" . $item['fecha'] . "</td>
                                <td></td>
                                <td _excel-styles='$style_center'>0" . $item['tipo_comprobante'] . "</td>
                                <td _excel-styles='$style_center'>" . $comprobante[0] . "</td>
                                <td _excel-styles='$style_center'>" . ($comprobante[1] ?? '') . "</td>
                                <td _excel-styles='$style_center'>" . $item['cliente_tipo_doc'] . "</td>
                                <td _excel-styles='$style_center'>" . $item['cliente_documento'] . "</td>
                                <td>" . htmlentities($item['cliente_nombre_o_razon_social'], 0, "UTF-8") . "</td>
                                <td _excel-styles='$style_center'>-</td>
                                <td _excel-styles='$style_right'>" . $item['subtotal'] . "</td>
                                <td _excel-styles='$style_center'>-</td>
                                <td _excel-styles='$style_center'>-</td>
                                <td _excel-styles='$style_center'>-</td>
                                <td _excel-styles='$style_right'>" . $item['igv'] . "</td>
                                <td _excel-styles='$style_center'>-</td>
                                <td _excel-styles='$style_center'>-</td>
                                <td _excel-styles='$style_right'>" . $item['total'] . "</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>";
                }

                $html = "<table>
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th _excel-styles='{\"width\": 4}'></th>
                                    <th colspan='23' _excel-styles='$style_center_wrap'>" . $this->config->item('system_username') . "</th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th colspan='23' _excel-styles='$style_center_wrap'>$filename</th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr _excel-styles='$style_font_size'>
                                    <th></th>
                                    <th _excel-styles='$style_center_wrap_width_2'>N&#218;MERO DE REGISTRO O</th>
                                    <th colspan='5' _excel-styles='$style_header_center_wrap'>COMPROBANTE DE PAGO O DOCUMENTO</th>
                                    <th colspan='3' _excel-styles='$style_header_center_wrap'>INFORMACI&#211;N DEL CLIENTE</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>VALOR FACTURADO DE LA EXPORTACI&#211;N</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>BASE IMP. OP. GRAVADA</th>
                                    <th colspan='2' _excel-styles='$style_header_center_wrap'>IMPORTE DE LA OP. EXONERADA O INAFECTA</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>ISC</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>IGV Y/O IPM</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>ICBP</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>OTROS TRIBUTOS Y CARGOS</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>IMPORTE TOTAL DEL COMPROBANTE DE PAGO</th>
                                    <th rowspan='2' _excel-styles='$style_header_center_wrap'>TIPO DE CAMBIO</th>
                                    <th colspan='4' _excel-styles='$style_header_center_wrap'>REF. DEL COMPROBANTE DE PAGO ORIGINAL QUE SE MODIFICA</th>
                                </tr>
                                <tr _excel-styles='$style_font_size'>
                                    <th></th>
                                    <th _excel-styles='$style_header_center_wrap'>COD. &#218;NICO DE OPERACI&#211;N</th>
                                    <th _excel-styles='$style_header_center_wrap'>FECHA DE EMISI&#211;N</th>
                                    <th _excel-styles='$style_header_center_wrap'>FECHA DE VCTO</th>
                                    <th _excel-styles='$style_header_center'>TIPO</th>
                                    <th _excel-styles='$style_header_center'>SERIE</th>
                                    <th _excel-styles='$style_header_center'>N&#218;MERO</th>
                                    <th _excel-styles='$style_header_center_wrap'>TIPO DOC.</th>
                                    <th _excel-styles='$style_header_center'>N&#218;MERO</th>
                                    <th _excel-styles='$style_center_wrap_width'>APELLIDOS Y NOMBRES O RAZ&#211;N SOCIAL</th>
                                    <th _excel-styles='$style_header_center'>EXONERADA</th>
                                    <th _excel-styles='$style_header_center'>INAFECTA</th>
                                    <th _excel-styles='$style_header_center_wrap'>FECHA DE EMISI&#211;N</th>
                                    <th _excel-styles='$style_header_center'>TIPO</th>
                                    <th _excel-styles='$style_header_center'>SERIE</th>
                                    <th _excel-styles='$style_header_center'>N&#218;MERO</th>
                                </tr>
                            </thead>
                            <tbody>
                                $body
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th></th>
                                    <th>$cantidad Registros</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th _excel-styles='$style_right'>TOTAL</th>
                                    <th _excel-styles='$style_center'>-</th>
                                    <th _excel-styles='$style_number_right'>$subtotal</th>
                                    <th _excel-styles='$style_center'>-</th>
                                    <th _excel-styles='$style_center'>-</th>
                                    <th _excel-styles='$style_center'>-</th>
                                    <th _excel-styles='$style_number_right'>$igv</th>
                                    <th _excel-styles='$style_center'>-</th>
                                    <th _excel-styles='$style_center'>-</th>
                                    <th _excel-styles='$style_number_right'>$total</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </tfoot>
                        </table>";

                $htmlPhpExcel = new HtmlPhpExcel($html);
                $htmlPhpExcel->process()->download($filename . '.xlsx');
            }
        } catch (Exception $e) {
            show_error($e->getMessage(), '404', 'Error');
        }
    }
}
