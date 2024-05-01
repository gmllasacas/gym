<?php
defined('BASEPATH') or exit('No direct script access allowed');

class GenericoModelo extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function listado($table, $estado, $params = [], $exception = false)
    {
        $error = 'No existen registros';
        switch ($table) {
            case 'base_usuario':
                $con_emisor = $this->session->userdata('perfil') != '1' ? 'AND base_cliente_sistema.ruc="'.$this->session->userdata('ruc').'"' : '';
                $query = $this->db->query(
                    "SELECT base_usuario.*, base_perfil.descripcion as perfil, base_cliente_sistema.nombre_o_razon_social as cliente_sistemadesc, base_estado.descripcion as estadodesc, base_estado.color as estadocol
                    FROM base_usuario 
                    INNER JOIN base_perfil ON base_usuario.perfil=base_perfil.id
                    INNER JOIN base_cliente_sistema ON base_usuario.cliente_sistema=base_cliente_sistema.id $con_emisor
                    INNER JOIN base_estado ON base_usuario.estado=base_estado.id
                    WHERE base_usuario.estado REGEXP ?",
                    array('^['.$estado.']')
                );
                break;
            case 'base_cliente_sistema':
                $query = $this->db->query(
                    "SELECT base_cliente_sistema.*, base_estado.descripcion as estadodesc, base_estado.color as estadocol
                    FROM base_cliente_sistema 
                    INNER JOIN base_estado ON base_cliente_sistema.estado=base_estado.id
                    WHERE base_cliente_sistema.estado REGEXP ?",
                    array('^['.$estado.']')
                );
                break;
            case 'base_estado':
                $query = $this->db->query(
                    "SELECT base_estado.*
                    FROM base_estado 
                    WHERE base_estado.visibilidad REGEXP ?
                    ORDER BY id DESC",
                    array('^['.$estado.']')
                );
                break;
            case 'permisos':
                $query = $this->db->query(
                    "SELECT base_menu_perfil.*,menu1.padre AS menu_padre, menu1.url, menu1.icono, menu1.descripcion, menu2.descripcion AS padre_descripcion, menu2.icono as padre_icono
                    FROM base_menu_perfil 
                    LEFT JOIN base_menu menu1 ON base_menu_perfil.menu=menu1.id 
                    LEFT JOIN base_menu menu2 ON menu1.padre=menu2.id 
                    WHERE base_menu_perfil.estado REGEXP ? AND base_menu_perfil.perfil = ?
                    ORDER BY menu_padre ASC, base_menu_perfil.id ASC",
                    array('^['.$estado.']',$params['perfil'])
                );
                break;
            case 'proceso_cliente':
                $error = 'No existen clientes';
                $query = $this->db->query(
                    "SELECT proceso_cliente.*, base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_tipo_documento.descripcion as tipodesc
                    FROM proceso_cliente 
                    INNER JOIN base_estado ON proceso_cliente.estado=base_estado.id
                    INNER JOIN proceso_tipo_documento ON proceso_cliente.tipo_documento=proceso_tipo_documento.id
                    WHERE proceso_cliente.estado REGEXP ?",
                    array('^['.$estado.']')
                );
                break;
            case 'proceso_proveedor':
                $query = $this->db->query(
                    "SELECT proceso_proveedor.*, base_estado.descripcion as estadodesc, base_estado.color as estadocol
                    FROM proceso_proveedor 
                    INNER JOIN base_estado ON proceso_proveedor.estado=base_estado.id
                    WHERE proceso_proveedor.estado REGEXP ?",
                    array('^['.$estado.']')
                );
                break;
            case 'proceso_producto':
                $error = 'No existen productos';
                $query = $this->db->query(
                    "SELECT proceso_producto.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_categoria_producto.descripcion as tipodesc
                    FROM proceso_producto 
                    INNER JOIN base_estado ON proceso_producto.estado=base_estado.id
                    LEFT JOIN proceso_categoria_producto ON proceso_producto.tipo=proceso_categoria_producto.id
                    WHERE proceso_producto.estado REGEXP ?",
                    array('^['.$estado.']')
                );
                break;
            case 'proceso_ingreso':
                $query = $this->db->query(
                    "SELECT proceso_ingreso.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_proveedor.nombre_o_razon_social as proveedordesc,
                    base_usuario.username
                    FROM proceso_ingreso 
                    INNER JOIN base_estado ON proceso_ingreso.estado=base_estado.id
                    INNER JOIN proceso_proveedor ON proceso_ingreso.proveedor=proceso_proveedor.id
                    INNER JOIN base_usuario ON base_usuario.id=proceso_ingreso.usuario
                    WHERE proceso_ingreso.estado REGEXP ?",
                    array('^['.$estado.']')
                );
                break;
            case 'proceso_venta':
                $query = $this->db->query(
                    "SELECT proceso_venta.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_cliente.nombre_o_razon_social as clientedesc,
                    base_usuario.username
                    FROM proceso_venta 
                    INNER JOIN base_estado ON proceso_venta.estado=base_estado.id
                    INNER JOIN proceso_cliente ON proceso_venta.cliente=proceso_cliente.id
                    INNER JOIN base_usuario ON base_usuario.id=proceso_venta.usuario
                    WHERE proceso_venta.estado REGEXP ?",
                    array('^['.$estado.']')
                );
                break;
            case 'proceso_venta_detalle':
                $query = $this->db->query(
                    "SELECT proceso_venta_detalle.*,
                    proceso_producto.codigo,
                    proceso_producto.descripcion
                    FROM proceso_venta_detalle 
                    INNER JOIN proceso_producto ON proceso_venta_detalle.producto=proceso_producto.id
                    WHERE proceso_venta_detalle.estado REGEXP ? AND proceso_venta_detalle.venta = ?",
                    array('^['.$estado.']',$params['venta'])
                );
                break;
            case 'proceso_ingreso_detalle':
                $query = $this->db->query(
                    "SELECT proceso_ingreso_detalle.*,
                    proceso_producto.codigo,
                    proceso_producto.descripcion
                    FROM proceso_ingreso_detalle 
                    INNER JOIN proceso_producto ON proceso_ingreso_detalle.producto=proceso_producto.id
                    WHERE proceso_ingreso_detalle.estado REGEXP ? AND proceso_ingreso_detalle.ingreso = ?",
                    array('^['.$estado.']',$params['ingreso'])
                );
                break;
            case 'proceso_credito':
                $cliente = $params['cliente'];
                $query = $this->db->query(
                    "SELECT proceso_credito.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_tipo_credito.descripcion as tipodesc,
                    proceso_cliente.nombre_o_razon_social as clientedesc
                    FROM proceso_credito 
                    INNER JOIN base_estado ON proceso_credito.estado=base_estado.id
                    INNER JOIN proceso_tipo_credito ON proceso_credito.tipo_credito=proceso_tipo_credito.id
                    INNER JOIN proceso_cliente ON proceso_credito.cliente=proceso_cliente.id
                    WHERE proceso_credito.estado REGEXP ? AND proceso_credito.cliente = ?",
                    array('^['.$estado.']',$cliente)
                );
                
                break;
            default:
                $order_by = isset($params['order_by']) ? $params['order_by'] : 'id';
                $direction = isset($params['direction']) ? $params['direction'] : 'DESC';
                
                $this->db->select('*')->from($table);
                $this->db->where(['estado REGEXP' => '^['.$estado.']']);

                if (isset($params['where'])) {
                    $this->db->where($params['where']);
                }

                if (isset($params['where_in'])) {
                    $this->db->where_in($params['where_in']['column'], $params['where_in']['in']);
                }

                $query = $this->db->get();
                break;
        }

        $data = $query->result_array();
        if ($exception && count((array)$data) == 0) {
            throw new Exception($error);
        }

        return $data;
    }

    public function busqueda($table, $params)
    {
        switch ($table) {
            case 'proceso_venta':
                $fechainicio = $params['fechainicio'];
                $fechafin = $params['fechafin'];
                $estado = $params['estado'];
                //$usuario_sesion = $this->session->userdata('perfil') > 2 ? 'AND base_usuario.id="'.$this->session->userdata('id').'"' : '';
                $usuario_sesion = '';
                $query = $this->db->query(
                    "SELECT proceso_venta.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_cliente.nombre_o_razon_social as clientedesc,
                    base_usuario.username,
                    proceso_tipo_venta_pago.descripcion as tipodesc,
                    proceso_tipo_comprobante.descripcion as tipo_comprobantedesc,
                        (
                        SELECT SUM(proceso_venta_detalle.cantidad) FROM proceso_venta_detalle
                        WHERE proceso_venta_detalle.estado REGEXP ? AND proceso_venta_detalle.venta = proceso_venta.id
                        ) as cantidad
                    FROM proceso_venta 
                    INNER JOIN base_estado ON proceso_venta.estado=base_estado.id
                    INNER JOIN proceso_cliente ON proceso_venta.cliente=proceso_cliente.id
                    INNER JOIN base_usuario ON base_usuario.id=proceso_venta.usuario $usuario_sesion
                    INNER JOIN proceso_tipo_venta_pago ON proceso_venta.tipo_venta_pago=proceso_tipo_venta_pago.id
                    INNER JOIN proceso_tipo_comprobante ON proceso_venta.tipo_comprobante=proceso_tipo_comprobante.id
                    WHERE (DATE(proceso_venta.fecha_registro) BETWEEN ? AND ?) AND proceso_venta.estado REGEXP ?",
                    array('^['.$estado.']',$fechainicio,$fechafin,'^['.$estado.']')
                );
                break;
            case 'proceso_ingreso':
                $fechainicio = $params['fechainicio'];
                $fechafin = $params['fechafin'];
                $estado = $params['estado'];
                $usuario_sesion = $this->session->userdata('perfil') > 2 ? 'AND base_usuario.id="'.$this->session->userdata('id').'"' : '';
                $query = $this->db->query(
                    "SELECT proceso_ingreso.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_proveedor.nombre_o_razon_social as proveedordesc,
                    base_usuario.username
                    FROM proceso_ingreso 
                    INNER JOIN base_estado ON proceso_ingreso.estado=base_estado.id
                    INNER JOIN proceso_proveedor ON proceso_ingreso.proveedor=proceso_proveedor.id
                    INNER JOIN base_usuario ON base_usuario.id=proceso_ingreso.usuario $usuario_sesion
                    WHERE (DATE(proceso_ingreso.fecha_registro) BETWEEN ? AND ?) AND proceso_ingreso.estado REGEXP ?",
                    array($fechainicio,$fechafin,'^['.$estado.']')
                );
                break;
            case 'proceso_kardex':
                $fechainicio = $params['fechainicio'];
                $fechafin = $params['fechafin'];
                $producto = $params['producto'];
                $estado = $params['estado'];
                $con_producto = $producto != '0' ? 'AND proceso_kardex.producto="'.$producto.'"' : '';
                $query = $this->db->query(
                    "SELECT proceso_kardex.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_tipo_kardex.descripcion as tipodesc,
                    proceso_producto.codigo,
                    proceso_producto.descripcion
                    FROM proceso_kardex 
                    INNER JOIN base_estado ON proceso_kardex.estado=base_estado.id
                    INNER JOIN proceso_tipo_kardex ON proceso_kardex.tipo_kardex=proceso_tipo_kardex.id
                    INNER JOIN proceso_producto ON proceso_kardex.producto=proceso_producto.id
                    WHERE (DATE(proceso_kardex.fecha_registro) BETWEEN ? AND ?) AND proceso_kardex.estado REGEXP ? $con_producto",
                    array($fechainicio,$fechafin,'^['.$estado.']')
                );
                break;
            case 'proceso_pago':
                $fechainicio = $params['fechainicio'];
                $fechafin = $params['fechafin'];
                $cliente = $params['cliente'];
                $estado = $params['estado'];
                $con_where = $cliente != '0' ? 'AND proceso_pago.cliente="'.$cliente.'"' : '';
                $usuario_sesion = $this->session->userdata('perfil') > 2 ? 'AND base_usuario.id="'.$this->session->userdata('id').'"' : '';
                $query = $this->db->query(
                    "SELECT proceso_pago.*,
                    base_estado.descripcion as estadodesc,
                    base_estado.color as estadocol,
                    proceso_cliente.nombre_o_razon_social as clientedesc,
                    base_usuario.username,
                    proceso_tipo_pago.descripcion as tipodesc
                    FROM proceso_pago 
                    INNER JOIN base_estado ON proceso_pago.estado=base_estado.id
                    INNER JOIN proceso_cliente ON proceso_pago.cliente=proceso_cliente.id
                    INNER JOIN base_usuario ON proceso_pago.usuario=base_usuario.id $usuario_sesion
                    INNER JOIN proceso_tipo_pago ON proceso_pago.tipo_pago=proceso_tipo_pago.id
                    WHERE (DATE(proceso_pago.fecha_registro) BETWEEN ? AND ?) AND proceso_pago.estado REGEXP ? $con_where",
                    array($fechainicio,$fechafin,'^['.$estado.']')
                );
                break;
            default:
                $estado = $params['estado'];
                $query = $this->db->query("SELECT * FROM $table WHERE estado REGEXP ? ORDER BY id DESC", array('^['.$estado.']'));
                break;
        }

        $data = $query->result_array();
        if (count((array)$data) == 0) {
            throw new Exception("No existen registros");
        }

        return $data;
    }

    public function login($params)
    {

        $query = $this->db->query(
            "SELECT base_usuario.*, base_cliente_sistema.ruc
            FROM base_usuario
            INNER JOIN base_cliente_sistema ON base_usuario.cliente_sistema=base_cliente_sistema.id AND base_cliente_sistema.ruc=? 
            WHERE base_usuario.estado REGEXP ? AND base_usuario.username=?",
            array($params['ruc'],'^['.$params['estado'].']',$params['username'])
        );

        return $query->row_array();
    }
}
