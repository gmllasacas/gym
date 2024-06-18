<?php
if (! defined('BASEPATH')) {
    exit('No direct script access allowed');
}

if (! function_exists('dd')) {
    function dd($variable)
    {
        echo '<pre>';
        print_r($variable);
        die();
    }
}

if (! function_exists('permisos')) {
    function permisos($submenu)
    {
        $ci=& get_instance();
        $ci->load->model('generico_modelo');
        $permisos = $ci->generico_modelo->listado('permisos', '1', ['perfil'=>$ci->session->userdata('perfil')]);
        $flag=false;
        foreach ($permisos as $item) {
            if ($item['menu']==$submenu) {
                $flag=true;
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

if (! function_exists('unidades_docenas')) {
    function unidades_docenas($cantidad)
    {
        $docenas = intval($cantidad/12);
        $unidades = $cantidad%12;
        $return=($docenas>0 ? $docenas.' doc.' : '').($unidades>0 ? ' '.$unidades%12 .' unid.' : '');
        return $return;
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

if (! function_exists('registro_auditoria')) {
    function registro_auditoria($data, $accion)
    {
        $ci=& get_instance();
        $ci->load->library('session');

        $inputs = [
            'usuario' => $ci->session->userdata('id'),
            'accion' => str_replace(['proceso_', 'base_'], ['', ''], $accion),
            'data' => json_encode($data),
            //'sucursal' => $ci->session->userdata('sucursal'),
            'fecha' => date('Y-m-d H:i:s'),
        ];
        $ci->db->insert('proceso_auditoria', $inputs, true);
    }
}

if (! function_exists('nuevo_kardex')) {
    function nuevo_kardex($referencia, $item, $tipo_kardex)
    {
        $ci=& get_instance();
        $ci->load->database();
        $table = 'proceso_kardex';
        $kardex = basedetalleregistro('proceso_kardex', ['estado' => '1', 'producto' => $item['id']]);
        $saldo = (isset($kardex['saldo']) ? ($kardex['saldo'] > 0 ? $kardex['saldo'] : 0) : 0);
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
