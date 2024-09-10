<?php
if (! defined('BASEPATH')) {
    exit('No direct script access allowed');
}

if (! function_exists('dd')) {
    function dd($variable)
    {
        echo '<pre>';
        print_r((array) $variable);
        die();
    }
}

if (! function_exists('permisos')) {
    function permisos($submenu)
    {
        $ci=& get_instance();
        $ci->load->model('generico_modelo');
        $permisos = $ci->generico_modelo->listado('permisos', '1', ['perfil' => $ci->session->userdata('perfil')]);
        $flag=false;
        foreach ($permisos as $item) {
            if ($item['menu'] == $submenu) {
                $flag = true;
            }
        }
        if (!$flag) {
            redirect(base_url(), 'location');
        } else {
            return $permisos;
        }
    }
}

if (! function_exists('days_difference')) {
    function days_difference($date_1, $date_2)
    {
        $datetime1 = date_create($date_1);
        $datetime2 = date_create($date_2);
        $interval = date_diff($datetime1, $datetime2);
        return $interval->format('%R%a');
    }
}

if (! function_exists('minutes_difference')) {
    function minutes_difference($datetime_1, $datetime_2)
    {
        $start_datetime = new DateTime($datetime_1);
        $diff = $start_datetime->diff(new DateTime($datetime_2));
        $total_minutes = ($diff->days * 24 * 60);
        $total_minutes += ($diff->h * 60);
        $total_minutes += $diff->i;
        return $total_minutes;
    }
}

if (!function_exists('array_group_by')) {
    /**
     * Groups an array by a given key.
     *
     * Groups an array into arrays by a given key, or set of keys, shared between all array members.
     *
     * Based on {@author Jake Zatecky}'s {@link https://github.com/jakezatecky/array_group_by array_group_by()} function.
     * This variant allows $key to be closures.
     *
     * @param array $array   The array to have grouping performed on.
     * @param mixed $key,... The key to group or split by. Can be a _string_,
     *                       an _integer_, a _float_, or a _callable_.
     *
     *                       If the key is a callback, it must return
     *                       a valid key from the array.
     *
     *                       If the key is _NULL_, the iterated element is skipped.
     *
     *                       ```
     *                       string|int callback ( mixed $item )
     *                       ```
     *
     * @return array|null Returns a multidimensional array or `null` if `$key` is invalid.
     */
    function array_group_by(array $array, $key)
    {
        if (!is_string($key) && !is_int($key) && !is_float($key) && !is_callable($key)) {
            trigger_error('array_group_by(): The key should be a string, an integer, or a callback', E_USER_ERROR);
            return null;
        }
        $func = (!is_string($key) && is_callable($key) ? $key : null);
        $_key = $key;
        // Load the new array, splitting by the target key
        $grouped = [];
        foreach ($array as $value) {
            $key = null;
            if (is_callable($func)) {
                $key = call_user_func($func, $value);
            } elseif (is_object($value) && isset($value->{$_key})) {
                $key = $value->{$_key};
            } elseif (isset($value[$_key])) {
                $key = $value[$_key];
            }
            if ($key === null) {
                continue;
            }
            $grouped[$key][] = $value;
        }
        // Recursively build a nested grouping if more parameters are supplied
        // Each grouped array value is grouped according to the next sequential key
        if (func_num_args() > 2) {
            $args = func_get_args();
            foreach ($grouped as $key => $value) {
                $params = array_merge([ $value ], array_slice($args, 2, func_num_args()));
                $grouped[$key] = call_user_func_array('array_group_by', $params);
            }
        }
        return $grouped;
    }
}

if (! function_exists('get_month_string')) {
    function get_month_string($mes)
    {
        if ($mes == "01") {
            return "Enero";
        }
        if ($mes == "02") {
            return "Febrero";
        }
        if ($mes == "03") {
            return "Marzo";
        }
        if ($mes == "04") {
            return "Abril";
        }
        if ($mes == "05") {
            return "Mayo";
        }
        if ($mes == "06") {
            return "Junio";
        }
        if ($mes == "07") {
            return "Julio";
        }
        if ($mes == "08") {
            return "Agosto";
        }
        if ($mes == "09") {
            return "Septiembre";
        }
        if ($mes == "10") {
            return "Octubre";
        }
        if ($mes == "11") {
            return "Noviembre";
        }
        if ($mes == "12") {
            return "Diciembre";
        }
    }
}

if (! function_exists('setxml')) {
    function setxml($path)
    {
        $patharr = explode('.', $path);
        return $patharr[0].'.xml';
    }
}

if (! function_exists('lastURI')) {
    function lastURI($path)
    {
        $patharr = explode('/', $path);
        return $patharr[5];
    }
}

if (! function_exists('setxmlex')) {
    function setxmlex($path)
    {
        $patharr2 = explode('.', $path);
        $patharr = explode('-', $patharr2[0]);
        return $patharr[0].'-'.$patharr[1].'-'.$patharr[2].'-'.$patharr[3].'.xml';
    }
}

if (! function_exists('spd')) {
    function spd($string, $size, $token)
    {
        return str_pad($string, $size, $token, STR_PAD_LEFT);
    }
}

if (! function_exists('spdr')) {
    function spdr($string, $size, $token)
    {
        return str_pad($string, $size, $token, STR_PAD_RIGHT);
    }
}

if (! function_exists('basenuevoregistro')) {
    function basenuevoregistro($inputs, $table, $exclude)
    {
        $ci=& get_instance();
        $ci->load->database();
        $table=trim($ci->db->escape_str($table));
        foreach ($exclude as $key => $value) {
            unset($inputs[$value]);
        }
        if ($ci->db->insert($table, $inputs, true)) {
            $id = $ci->db->insert_id();
            $query = $ci->db->select('*')->from($table)->where(['id'=>$id])->get();
            $inputs['id'] = $id;
            registro_auditoria($inputs, "Creó un registro de '$table' con ID: " . $id);
            return $query->row_array();
        }

        return false;
    }
}

if (! function_exists('baseactualizarregistro')) {
    function baseactualizarregistro($inputs, $table, $where, $exclude)
    {
        $ci=& get_instance();
        $ci->load->database();
        $table=trim($ci->db->escape_str($table));
        foreach ($exclude as $key => $value) {
            unset($inputs[$value]);
        }
        if ($ci->db->update($table, $inputs, $where)) {
            $query = $ci->db->select('*')->from($table)->where($where)->get();
            $inputs['id'] = $where['id'];
            registro_auditoria($inputs, "Actualizó un registro de '$table' con ID: " . $where['id']);
            return $query->row_array();
        }

        return false;
    }
}

if (! function_exists('baseeliminarregistro')) {
    function baseeliminarregistro($table, $where)
    {
        $ci=& get_instance();
        $ci->load->database();
        $table=trim($ci->db->escape_str($table));
        if ($ci->db->delete($table, $where)) {
            return true;
        }

        return false;
    }
}

if (! function_exists('basedetalleregistro')) {
    function basedetalleregistro($table, $where, $exception = false, $order = ['orderby'=>'id','direction'=>'desc'])
    {
        $ci=& get_instance();
        $ci->load->database();
        $table=trim($ci->db->escape_str($table));
        $query = $ci->db->select('*')->from($table)->where($where)->order_by($order['orderby'], $order['direction'])->get();
        $data = $query->row_array();
        if ($exception && count((array)$data) == 0) {
            throw new Exception('El registro no existe');
        }

        return $data;
    }
}

if (! function_exists('response')) {
    function response($data = [], $status = 200)
    {
        $respuesta = ['status' => $status];
        
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(array_merge($respuesta, $data));
        exit();
    }
}

if (! function_exists('caja_actual')) {
    function caja_actual($estado = '1', $id = '0', $sucursal = '0')
    {
        $ci=& get_instance();
        $ci->load->model('generico_modelo');
        $ci->load->database();
        if ($id != '0') {
            $parameters = ['id' => $id, 'sucursal' => $ci->session->userdata('sucursal'), 'estado'=>$estado];
        } else {
            if ($sucursal != '0') {
                $parameters = ['sucursal' => $sucursal, 'estado'=>$estado];
            } else {
                $parameters = ['sucursal' => $ci->session->userdata('sucursal'), 'estado'=>$estado];
            }
        }
        $data = $ci->generico_modelo->caja($parameters);
        if (!isset($data['id'])) {
            return false;
        }

        return $data;
    }
}

if (! function_exists('registro_auditoria')) {
    function registro_auditoria($data, $accion)
    {
        $ci=& get_instance();
        $ci->load->library('session');

        $inputs = [
            'usuario' => $ci->session->userdata('id'),
            'accion' => str_replace(['proceso_', 'base_'], ['', ''], $accion),
            'data' => json_encode($data),
            'sucursal' => $ci->session->userdata('sucursal'),
            'fecha' => date('Y-m-d H:i:s'),
        ];
        $ci->db->insert('proceso_auditoria', $inputs, true);
    }
}

if (! function_exists('registro_detalle_caja')) {
    function registro_detalle_caja($data)
    {
        $ci=& get_instance();
        $ci->load->library('session');

        if ($data['monto'] > 0.00) {
            $inputs = [
                'tipo_caja_detalle' => isset($data['tipo_caja_detalle']) ? $data['tipo_caja_detalle'] : 1,
                'pago' => $data['pago'],
                'caja' => $data['caja'],
                'referencia' => $data['referencia'],
                'monto' => $data['monto'],
                'usuario' => $ci->session->userdata('id'),
                'fecha' => date('Y-m-d H:i:s'),
            ];
            $ci->db->insert('proceso_caja_detalle', $inputs, true);
        }
    }
}

if (! function_exists('registro_kardex')) {
    function registro_kardex($referencia, $item, $tipo_kardex)
    {
        $ci=& get_instance();
        $ci->load->database();
        $table = 'proceso_kardex';
        $sucursal = $ci->session->userdata('sucursal');
        //$kardex = $ci->generico_modelo->kardex(
        //    ['estado' => '1', 'producto' => $item['id'], 'sucursal' => $ci->session->userdata('sucursal'), 'tipo_kardex' => $tipo_kardex]
        //);
        $kardex = basedetalleregistro('proceso_kardex', ['estado' => '1', 'producto' => $item['id'], 'sucursal' => $sucursal]);
        $saldo = (isset($kardex['saldo']) ? ($kardex['saldo'] > 0 ? $kardex['saldo'] : 0) : 0);
        $inputs['sucursal'] = $sucursal;
        $inputs['tipo_kardex'] = $tipo_kardex;
        $inputs['referencia'] = $referencia;
        $inputs['producto'] = $item['id'];
        $inputs['cantidad'] = $item['cantidad'];
        $inputs['precio'] = $item['precio'];
        $inputs['subtotal'] = $item['subtotal'];
        $inputs['fecha'] = date('Y-m-d H:i:s');
        $inputs_saldo = 0;
        switch ($tipo_kardex) {
            case 1:
            case 4:
                $inputs_saldo = ($saldo + $item['cantidad']);
                break;
            case 2:
            case 3:
                $inputs_saldo = ($saldo - $item['cantidad']);
                break;
            default:
                break;
        }
        if ($item['tipo'] == 1) { //producto
            $inputs['saldo'] = $inputs_saldo;
        } else { //servicio
            $inputs['saldo'] = 0;
        }

        basenuevoregistro($inputs, 'proceso_kardex', []);
    }
}

if (! function_exists('tipo_producto')) {
    function tipo_producto($producto)
    {
        $exclude = [];
        $descripcionComprobante = '';
        switch ($producto['tipo']) {
            case '1':// Producto
                $exclude = ['id', 'table', 'codigo', 'duracion', 'duracion_unidad'];
                $descripcionComprobante = '<b>[' . $producto['cantidad'] . ']</b> ' . $producto['abreviatura'] . ' ' .$producto['codigo'] . ' ' . $producto['descripcion'];
                break;
            case '2'://Membresía
                $exclude = ['id', 'table', 'codigo', 'unidad'];
                $descripcionComprobante = '<b>[' . $producto['cantidad'] . ']</b> ' . $producto['abreviatura'] . ' ' .$producto['codigo'] . ' ' . $producto['descripcion'] . ' (' . $producto['duracion_unidad_desc'] . ')';
                break;
            case '3'://Comestible
                $exclude = ['id', 'table', 'codigo', 'duracion', 'duracion_unidad'];
                $descripcionComprobante = '<b>[' . $producto['cantidad'] . ']</b> ' . $producto['abreviatura'] . ' ' .$producto['codigo'] . ' ' . $producto['descripcion'];
                break;
            default:
                break;
        }

        return [
            'exclude' => $exclude,
            'descripcionComprobante' => $descripcionComprobante,
        ];
    }
}

if (! function_exists('detalle_tipo_producto')) {
    function detalle_tipo_producto($producto)
    {
        $producto['codigo'] = spd($producto['id'], 6, '0');
        $producto['existencias'] = 0;
        $producto['duracion_unidad_desc'] = '';
        switch ($producto['tipo']) {
            case '1':// Producto
                $kardex = ultimo_kardex(['estado' => '1','producto' => $producto['id']]);
                $producto['existencias'] = ($kardex['saldo']>0 ? $kardex['saldo'] : 0);
                $producto['abreviatura'] = basedetalleregistro('proceso_unidad', ['estado'=>'1','id'=>$producto['unidad']])['abreviatura'];
                break;
            case '2'://Membresía
                $producto['abreviatura'] = 'Memb.';
                $producto['duracion_unidad_desc'] = basedetalleregistro('proceso_duracion_unidad', ['estado'=>'1','id'=>$producto['duracion_unidad']])['descripcion'];
                break;
            case '3'://Comestible
                $producto['abreviatura'] = basedetalleregistro('proceso_unidad', ['estado'=>'1','id'=>$producto['unidad']])['abreviatura'];
                break;
            default:
                break;
        }

        return $producto;
    }
}

if (! function_exists('numeracion_actual')) {
    function numeracion_actual($tipo_comprobante, $sucursal = null)
    {
        $ci=& get_instance();
        $ci->load->database();
        $table = 'proceso_kardex';
        $sucursal_id = $sucursal ?? $ci->session->userdata('sucursal');
        $sucursal = basedetalleregistro('base_sucursal', ['id'=>$sucursal_id]);
        $comprobante = '';
        $campo = '';

        switch ($tipo_comprobante) {
            case '1':
                $comprobante = spd($sucursal['serie_factura'], 4, 'F') . '-' . spd($sucursal['numeracion_factura'], 6, '0');
                $campo = 'numeracion_factura';
                break;
            case '3':
                $comprobante = spd($sucursal['serie_boleta'], 4, 'B') . '-' . spd($sucursal['numeracion_boleta'], 6, '0');
                $campo = 'numeracion_boleta';
                break;
            case '99':
                $comprobante = spd($sucursal['serie_nota_venta'], 4, 'N') . '-' . spd($sucursal['numeracion_nota_venta'], 6, '0');
                $campo = 'numeracion_nota_venta';
                break;
            default:
                break;
        }

        return [
            'comprobante' => $comprobante,
            'campo' => $campo
        ];
    }
}


if (! function_exists('ultimo_kardex')) {
    function ultimo_kardex($parameters, $sucursal = null)
    {
        $ci=& get_instance();
        $ci->load->database();
        $table = 'proceso_kardex';
        $sucursal = $sucursal ?? $ci->session->userdata('sucursal');
        return basedetalleregistro(
            'proceso_kardex',
            ['estado' => $parameters['estado'], 'producto' => $parameters['producto'], 'sucursal' => $sucursal]
        );
    }
}

if (! function_exists('sunat_comprobante')) {
    function sunat_comprobante($parameters, $operacion, $sucursal_id = null)
    {
        $ci=& get_instance();
        $ci->load->database();

        $sucursal_id = $sucursal ?? $ci->session->userdata('sucursal');
        $sucursal = basedetalleregistro('base_sucursal', ['id'=>$sucursal_id]);
        $ruta = $sucursal['sunat_api_ruta'];
        $token = $sucursal['sunat_api_token'];
        $venta = basedetalleregistro('proceso_venta', ['id'=>$parameters['venta']]);
        $venta['detalles'] = $ci->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$parameters['venta']]);
        $cliente = basedetalleregistro('proceso_cliente', ['id'=>$venta['cliente']]);
        $comprobante = explode("-", $venta['comprobante']);
        $tipo_de_comprobante = match ((int)$venta['tipo_comprobante']) {
            1 => 1,
            3 => 2,
            7 => 3,
            8 => 4,
            default => 0,
        };
        $detalles = [];

        switch ($operacion) {
            case 'generar_comprobante':
                foreach ($venta['detalles'] as $item) {
                    $total_item = $item['subtotal'];
                    $subtotal_item = round($total_item * (100/(100 + $venta['igv_percent'])), 2);
                    $valor_unitario = round($item['precio'] * (100/(100 + $venta['igv_percent'])), 2);
                    $detalles[] = [
                        "unidad_de_medida" => ($item['producto_tipo'] == 1 ? "NIU" : "ZZ"),
                        "codigo" => spd($item['producto'], 6, '0'),
                        "descripcion" => $item['descripcion'],
                        "cantidad" => $item['cantidad'],
                        "valor_unitario" => $valor_unitario,
                        "precio_unitario" => $item['precio'],
                        "descuento" => "",
                        "subtotal" => $subtotal_item,
                        "tipo_de_igv" => "1",
                        "igv" => $total_item - $subtotal_item,
                        "total" => $total_item,
                        "anticipo_regularizacion" => "false",
                        "anticipo_documento_serie" => "",
                        "anticipo_documento_numero" => ""
                    ];
                }

                $data = [
                    "operacion" => "generar_comprobante",
                    "tipo_de_comprobante" => $tipo_de_comprobante,
                    "serie" => $comprobante[0],
                    "numero" => (int)$comprobante[1],
                    "sunat_transaction" => "1",
                    "cliente_tipo_de_documento" => $cliente['tipo_documento'],
                    "cliente_numero_de_documento" => $cliente['documento'],
                    "cliente_denominacion" => $cliente['nombre_o_razon_social'],
                    "cliente_direccion" => $cliente['direccion'] ?? '',
                    "cliente_email" => $cliente['correo'] ?? '',
                    "cliente_email_1" => "",
                    "cliente_email_2" => "",
                    "fecha_de_emision" => date('d-m-Y'),
                    "fecha_de_vencimiento" => "",
                    "moneda" => "1",
                    "tipo_de_cambio" => "",
                    "porcentaje_de_igv" => $venta['igv_percent'],
                    "descuento_global" => $venta['descuento'] ?? "",
                    "total_descuento" => $venta['descuento'] ?? "",
                    "total_anticipo" => "",
                    "total_gravada" => $venta['subtotal'],
                    "total_inafecta" => "",
                    "total_exonerada" => "",
                    "total_igv" => $venta['igv'],
                    "total_gratuita" => "",
                    "total_otros_cargos" => "",
                    "total" => $venta['total'],
                    "percepcion_tipo" => "",
                    "percepcion_base_imponible" => "",
                    "total_percepcion" => "",
                    "total_incluido_percepcion" => "",
                    "detraccion" => "false",
                    "observaciones" => "",
                    "documento_que_se_modifica_tipo" => "",
                    "documento_que_se_modifica_serie" => "",
                    "documento_que_se_modifica_numero" => "",
                    "tipo_de_nota_de_credito" => "",
                    "tipo_de_nota_de_debito" => "",
                    "enviar_automaticamente_a_la_sunat" => "true",
                    "enviar_automaticamente_al_cliente" => "false",
                    "codigo_unico" => $venta['id'],
                    "condiciones_de_pago" => "",
                    "medio_de_pago" => "",
                    "placa_vehiculo" => "",
                    "orden_compra_servicio" => "",
                    "tabla_personalizada_codigo" => "",
                    "formato_de_pdf" => "",
                    "items" => $detalles
                ];
                break;
            case 'generar_anulacion':
                $data = [
                    "operacion" => "generar_anulacion",
                    "tipo_de_comprobante" => $tipo_de_comprobante,
                    "serie" => $comprobante[0],
                    "numero" => (int)$comprobante[1],
                    "motivo" => $parameters['motivo'],
                    "codigo_unico" => ""
                ];
                break;
            default:
                break;
        }

        $data_json = json_encode($data);

        $request = curl_init();
        curl_setopt($request, CURLOPT_URL, $ruta);
        curl_setopt(
            $request,
            CURLOPT_HTTPHEADER,
            [
                'Authorization: Token token="'.$token.'"',
                'Content-Type: application/json',
            ]
        );
        curl_setopt($request, CURLOPT_POST, 1);
        curl_setopt($request, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($request, CURLOPT_POSTFIELDS, $data_json);
        curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
        $response  = curl_exec($request);
        curl_close($request);

        $response_json = json_decode($response, true);
        $inputs['datos'] = json_encode($data);
        $inputs['usuario'] = $ci->session->userdata('id');
        $inputs['venta'] = $venta['id'];
        $inputs['fecha'] = date('Y-m-d H:i:s');
        if (isset($response_json['errors'])) {
            $inputs['errores'] = $response_json['errors'];
            $inputs['codigo'] = $response_json['codigo'];
            $proceso = false;
        } else {
            if (isset($response_json['enlace'])) {
                $inputs['errores'] = '';
                $inputs['tipo_de_comprobante'] = $response_json['tipo_de_comprobante'];
                $inputs['serie'] = $response_json['serie'];
                $inputs['numero'] = $response_json['numero'];
                $inputs['enlace'] = $response_json['enlace'];
                $inputs['sunat_ticket_numero'] = $response_json['sunat_ticket_numero'] ?? '';
                $inputs['aceptada_por_sunat'] = $response_json['aceptada_por_sunat'];
                $inputs['sunat_description'] = $response_json['sunat_description'];
                $inputs['sunat_note'] = $response_json['sunat_note'];
                $inputs['sunat_responsecode'] = $response_json['sunat_responsecode'];
                $inputs['sunat_soap_error'] = $response_json['sunat_soap_error'];
                $inputs['pdf_zip_base64'] = $response_json['pdf_zip_base64'];
                $inputs['cadena_para_codigo_qr'] = $response_json['cadena_para_codigo_qr'] ?? '';
                $inputs['codigo_hash'] = $response_json['codigo_hash'] ?? '';
                $proceso = true;
            } else {
                $inputs['errores'] = 'Respuesta vacía';
                $proceso = false;
            }
        }

        return [
            'proceso' => $proceso,
            'inputs' => $inputs,
        ];
    }
}
