<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Generico extends CI_Controller
{
    public $configuracion = [];
    public $sucursal = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
        $sucursal['id'] = $this->session->userdata('sucursal');
    }

    public function nuevoregistro()
    {
        $inputs = filter_var($this->input->post(), \FILTER_CALLBACK, ['options' => 'trim']);
        $table=$inputs['table'];
        if (count((array)$inputs)==0 || $table=='') {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            switch ($table) {
                case 'base_usuario':
                    $where = array('username'=>$this->input->post('username'));
                    $registro_det=basedetalleregistro($table, $where);
                    if (count((array)$registro_det)==0) {
                        $inputs['fecha']=date('Y-m-d H:i:s');
                        $exclude=array('id','password2','table');
                        $inputs['password']= password_hash($inputs['password'], PASSWORD_DEFAULT);
                        $registro=basenuevoregistro($inputs, $table, $exclude);
                        if ($registro) {
                            response(['message'=>'Registro correcto']);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>'El usuario ingresado ya está registrado'], 500);
                    }
                    break;
                case 'proceso_producto':
                    $inputs['favorito'] = $this->input->post('favorito') ? 1 : 0;
                    $tipo= $inputs['tipo'];
                    switch ($tipo) {
                        case '1':
                            $exclude = ['id', 'table', 'codigo', 'duracion', 'duracion_unidad'];
                            break;
                        case '2':
                            $exclude = ['id', 'table', 'codigo', 'unidad'];
                            break;
                        default:
                            $exclude = ['id', 'table', 'codigo'];
                            break;
                    }
                    $inputs['fecha']=date('Y-m-d H:i:s');
                    $registro=basenuevoregistro($inputs, $table, $exclude);
                    if ($registro) {
                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_cliente':
                    $registro_det=basedetalleregistro($table, ['documento'=>$this->input->post('documento')]);
                    if (count((array)$registro_det)==0) {
                        $inputs['usuario'] = $this->session->userdata('id');
                        $inputs['fecha']=date('Y-m-d H:i:s');
                        $exclude=array('id','table');
                        $registro=basenuevoregistro($inputs, $table, $exclude);
                        if ($registro) {
                            response(['message'=>'Registro correcto']);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>'El documento ingresado ya está registrado'], 500);
                    }
                    break;
                case 'proceso_venta':
                    $flag = true;
                    $message = '';
                    $productos = $this->input->post('producto');
                    $tipo_venta_pago = $this->input->post('tipo_venta_pago');
                    $tipo_pago = $this->input->post('tipo_pago');
                    $numero_operacion = $this->input->post('numero_operacion');
                    $cliente = $this->input->post('cliente');
                    $total_venta = $this->input->post('total');
                    $estado = $this->input->post('estado');
                    $fecha = date('Y-m-d H:i:s');
                    foreach ($productos as $item) {
                        if ($item['tipo'] == '2') { //servicio
                            $membresia = $this->generico_modelo->membresia(['cliente' => $cliente, 'estado'=>1]);
                            if ($membresia) {
                                $flag = false;
                                $message = 'El cliente tiene el servicio <b>' . $membresia['descripcion'] . '</b> activo hasta la fecha <b>' . $membresia['fecha_fin'] . '</b>';
                                break;
                            }
                        } else {
                            $kardex = ultimo_kardex(['estado' => '1','producto' => $item['id']]);
                            $saldo = (isset($kardex['saldo']) ? ($kardex['saldo'] > 0 ? $kardex['saldo'] : 0) : 0);
                            if ($item['cantidad'] > $saldo) {
                                $flag = false;
                                $message = 'El producto '.$item['productodesc'].' no posee '.$item['cantidad'].' unid. en existencias';
                                break;
                            }
                        }
                    }
                    $caja_actual = caja_actual();
                    if (!$caja_actual) {
                        response(['message' => 'No se puede registrar la venta, la caja está cerrada'], 500);
                    }

                    if ($flag) {
                        $usuario = $this->session->userdata('id');
                        $inputs['sucursal'] = $this->session->userdata('sucursal');
                        $inputs['usuario'] = $usuario;
                        $inputs['fecha'] = $fecha;
                        $exclude=array('id','table','counter','producto_sel','producto','tipo_pago','numero_operacion');
                        $registro=basenuevoregistro($inputs, $table, $exclude);
                        if ($registro) {
                            if ($tipo_pago == '1') {
                                /**Detalle de caja */
                                $inputs_dc['caja'] = $this->session->userdata('caja');
                                $inputs_dc['referencia'] = $registro['id'];
                                $inputs_dc['monto'] = $total_venta;
                                registro_detalle_caja($inputs_dc);
                                /**Detalle de caja */
                            }
                            foreach ($productos as $item) {
                                /**Kardex */
                                registro_kardex($registro['id'], $item, 2);//Venta
                                /**Kardex */

                                /**Detalle */
                                $inputs_p['venta']=$registro['id'];
                                $inputs_p['producto']=$item['id'];
                                $inputs_p['cantidad']=$item['cantidad'];
                                $inputs_p['precio']=$item['precio'];
                                $inputs_p['subtotal']=$item['subtotal'];
                                $inputs_p['fecha']=$fecha;
                                $registro_p=basenuevoregistro($inputs_p, 'proceso_venta_detalle', []);
                                /**Detalle */

                                if ($item['tipo'] == '2') { //servicio
                                    /**Cliente servicio */
                                    $producto = basedetalleregistro('proceso_producto', ['estado'=>'1','id'=>$item['id']]);
                                    $duracion_unidad = basedetalleregistro('proceso_duracion_unidad', ['estado'=>'1','id'=>$producto['duracion_unidad']]);

                                    $fecha_fin = strtotime("+" . $producto['duracion'] . " " . $duracion_unidad['unit'], strtotime(date('Y-m-d')));
                                    $inputs_cs['venta'] = $registro['id'];
                                    $inputs_cs['producto'] = $item['id'];
                                    $inputs_cs['fecha_fin'] = date('Y-m-d', $fecha_fin);
                                    $inputs_cs['usuario'] = $this->session->userdata('id');
                                    $inputs_cs['fecha'] = $fecha;
                                    $registro_cs = basenuevoregistro($inputs_cs, 'proceso_cliente_servicio', []);
                                    /**Cliente servicio */

                                    $registro=baseactualizarregistro(['membresia' => $registro_cs['id']], 'proceso_cliente', ['id' => $cliente], []);
                                }
                            }

                            //baseeliminarregistro('proceso_venta_detalle',['venta'=>$registro['id']]);
                            switch ($tipo_venta_pago) {
                                case 1:
                                    /**Crédito */
                                    $proceso_credito = basedetalleregistro('proceso_credito', ['estado'=>'1','cliente'=>$cliente]);
                                    $credito = (isset($proceso_credito['credito']) ? $proceso_credito['credito'] : 0);
                                    $inputs_c['tipo_credito']='1'; //Credito
                                    $inputs_c['referencia']=$registro['id'];//Venta
                                    $inputs_c['cliente']=$cliente;
                                    $inputs_c['total']=$total_venta;
                                    $inputs_c['credito']=$credito+$total_venta;
                                    $inputs_c['fecha']=date('Y-m-d H:i:s');
                                    $registro_c=basenuevoregistro($inputs_c, 'proceso_credito', []);
                                    /**Crédito */
                                    break;
                                case 2:
                                    /**Pago */
                                    $inputs_pa['tipo_pago'] = $tipo_pago;
                                    $inputs_pa['venta'] = $registro['id'];
                                    $inputs_pa['numero_operacion'] = $numero_operacion;
                                    $inputs_pa['cliente'] = $cliente;
                                    $inputs_pa['pago'] = $total_venta;
                                    $inputs_pa['usuario'] = $this->session->userdata('id');
                                    $inputs_pa['fecha'] = date('Y-m-d H:i:s');
                                    $registro_pa=basenuevoregistro($inputs_pa, 'proceso_pago', []);
                                    /**Pago */
                                    break;
                                default:
                                    break;
                            }

                            response(['message'=>'Registro correcto']);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>$message], 500);
                    }
                    break;
                case 'proceso_ingreso':
                    $productos = $this->input->post('producto');
                    $tipo_comprobante = $this->input->post('tipo_comprobante');
                    $tipo_ingreso_pago = $this->input->post('tipo_ingreso_pago');
                    $proveedor = $this->input->post('proveedor');
                    $total = $this->input->post('total');
                    $inputs['tipo_ingreso_pago'] = $tipo_ingreso_pago == '' ? null : $tipo_ingreso_pago;
                    $inputs['sucursal'] = $this->session->userdata('sucursal');
                    $inputs['tipo_comprobante'] = ($tipo_comprobante=='' ? null : $tipo_comprobante);
                    $inputs['usuario'] = $this->session->userdata('id');
                    $inputs['fecha'] = date('Y-m-d H:i:s');
                    $exclude = array('id','table','counter','producto_sel','producto','total','pago');
                    $registro = basenuevoregistro($inputs, $table, $exclude);
                    if ($registro) {
                        foreach ($productos as $item) {
                            /**Kardex */
                            registro_kardex($registro['id'], $item, 1);//Ingreso
                            /**Kardex */

                            /**Detalle */
                            $inputs_p['ingreso'] = $registro['id'];
                            $inputs_p['producto'] = $item['id'];
                            $inputs_p['cantidad'] = $item['cantidad'];
                            $inputs_p['precio'] = $item['precio'];
                            $inputs_p['subtotal'] = $item['subtotal'];
                            $inputs_p['fecha'] = $registro['fecha'];
                            $registro_p = basenuevoregistro($inputs_p, 'proceso_ingreso_detalle', []);
                            /**Detalle */
                        }

                        if ($tipo_ingreso_pago) {
                            /**Gasto */
                            $inputs_ga['tipo_gasto'] = 1;
                            $inputs_ga['referencia'] = $proveedor;
                            $inputs_ga['pago'] = match ((int) $tipo_ingreso_pago) {
                                1 => $total,
                                2 => $this->input->post('pago'),
                            };
                            $inputs_ga['usuario'] = $this->session->userdata('id');
                            $inputs_ga['observaciones'] = 'Pago creado automáticamente en el registro del ingreso.';
                            $inputs_ga['fecha'] = date('Y-m-d H:i:s');
                            $registro_pa=basenuevoregistro($inputs_ga, 'proceso_gasto', []);
                            /**Gasto */
                        }

                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_pago':
                    $cliente = $this->input->post('cliente');
                    $pago = $this->input->post('pago');
                    $inputs['usuario']=$this->session->userdata('id');
                    $inputs['fecha']=date('Y-m-d H:i:s');
                    $exclude=array('id','table','credito');
                    $registro=basenuevoregistro($inputs, $table, $exclude);
                    if ($registro) {

                        /**Crédito pago */
                        $proceso_credito_last = basedetalleregistro('proceso_credito', ['estado'=>'1','cliente'=>$cliente]);
                        $credito_last = (isset($proceso_credito_last['credito']) ? $proceso_credito_last['credito'] : 0);
                        $inputs_cp['tipo_credito']='2'; //Pago
                        $inputs_cp['referencia']=$registro['id'];//Pago
                        $inputs_cp['cliente']=$cliente;
                        $inputs_cp['total']=$pago;
                        $inputs_cp['credito']=$credito_last-$pago;
                        $inputs_cp['fecha']=date('Y-m-d H:i:s');
                        $registro_cp=basenuevoregistro($inputs_cp, 'proceso_credito', []);
                        /**Crédito pago */

                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_gasto':
                    $tipo_gasto = $this->input->post('tipo_gasto');
                    $referencia = $this->input->post('proveedor');
                    $inputs['tipo_gasto'] = $tipo_gasto;
                    $inputs['referencia'] = $referencia;
                    $inputs['usuario'] = $this->session->userdata('id');
                    $inputs['fecha'] = date('Y-m-d H:i:s');
                    $exclude = ['id', 'table', 'proveedor'];
                    $registro = basenuevoregistro($inputs, $table, $exclude);
                    if ($registro) {
                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_caja':
                    $apertura = $this->input->post('apertura');
                    $usuario = $this->session->userdata('id');
                    $fecha = date('Y-m-d H:i:s');

                    $inputs_c['apertura'] = $apertura;
                    $inputs_c['sucursal'] = $this->session->userdata('sucursal');
                    $inputs_c['notas'] = $this->input->post('notas');
                    $inputs_c['usuario'] = $usuario;
                    $inputs_c['fecha'] = $fecha;
                    $inputs_c['fecha_apertura'] = $this->input->post('fecha_apertura');
                    $registro = basenuevoregistro($inputs_c, $table, []);
                    $this->session->set_userdata('caja', $registro['id']);
                    if ($registro) {
                        /**Detalle de caja */
                        $inputs_dc['caja'] = $registro['id'];
                        $inputs_dc['referencia'] = null;
                        $inputs_dc['monto'] = $apertura;
                        registro_detalle_caja($inputs_dc);
                        /**Detalle de caja */

                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_caja_detalle':
                    $caja_actual = caja_actual();
                    if (!$caja_actual) {
                        response(['message' => 'No se puede registrar el ajuste, la caja está cerrada'], 500);
                    }

                    $usuario = $this->session->userdata('id');
                    $fecha = date('Y-m-d H:i:s');
                    $ajuste = $this->input->post('ajuste');

                    $inputs_dc['caja'] = $caja_actual['id'];
                    $inputs_dc['referencia'] = null;
                    $inputs_dc['monto'] = $ajuste;
                    $inputs_dc['usuario'] = $usuario;
                    $inputs_dc['fecha'] = $fecha;
                    $registro_dc = basenuevoregistro($inputs_dc, $table, []);
                    if ($registro_dc) {
                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                default:
                    $exclude=array('id','table');
                    $inputs['fecha']=date('Y-m-d H:i:s');
                    $registro=basenuevoregistro($inputs, $table, $exclude);
                    if ($registro) {
                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
            }
        }
    }

    public function actualizarregistro()
    {
        $inputs = filter_var($this->input->post(), \FILTER_CALLBACK, ['options' => 'trim']);
        $table=addslashes($this->input->post('table'));
        $id=addslashes($this->input->post('id'));
        if (count((array)$inputs)==0) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            switch ($table) {
                case 'base_usuario':
                    $where = array('username'=>$this->input->post('username'));
                    $registro_det=basedetalleregistro($table, $where);
                    if (count((array)$registro_det)>0 && $registro_det['id']!=$id) {
                        response(['message'=>'El usuario ingresado ya está registrado'], 500);
                    } else {
                        $exclude=array('id','password2','table');
                        $where  =array('id'=>$id);
                        if ($inputs['password']!='') {
                            $inputs['password']= password_hash($inputs['password'], PASSWORD_DEFAULT);
                        }
                        $registro=baseactualizarregistro($inputs, $table, $where, $exclude);
                        if ($registro) {
                            response(['message'=>'Registro actualizado'], 201);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    }
                    break;
                case 'proceso_pago_anulacion':
                    $inputs['estado']= 3;
                    $exclude=array('id','table','motivo');
                    $where  =array('id'=>$id);
                    $registro=baseactualizarregistro($inputs, 'proceso_pago', $where, $exclude);
                    if ($registro) {

                        /**Anulacion de pago */
                        $inputs_a['pago']=$id;
                        $inputs_a['motivo']=$this->input->post('motivo');
                        $inputs_a['usuario']=$this->session->userdata('id');
                        $inputs_a['fecha']=date('Y-m-d H:i:s');
                        $exclude=array('id','table','producto','total');
                        $registro_a=basenuevoregistro($inputs_a, 'proceso_pago_anulacion', $exclude);
                        /**Anulacion de pago */

                        /**Crédito de pago anulado*/
                        $proceso_credito_last = basedetalleregistro('proceso_credito', ['estado'=>'1','cliente'=>$registro['cliente']]);
                        $credito_last = (isset($proceso_credito_last['credito']) ? $proceso_credito_last['credito'] : 0);
                        $inputs_c['tipo_credito']='4'; //Pago anulado
                        $inputs_c['referencia']=$registro_a['id'];//Registro de anulacion
                        $inputs_c['cliente']=$registro['cliente'];
                        $inputs_c['total']=$registro['pago'];
                        $inputs_c['credito']=$credito_last+$registro['pago'];
                        $inputs_c['fecha']=date('Y-m-d H:i:s');
                        $registro_p=basenuevoregistro($inputs_c, 'proceso_credito', []);
                        /**Crédito de pago anulado*/
                        response(['message'=>'Registro actualizado'], 201);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_gasto_anulacion':
                    $inputs['estado'] = 3;
                    $exclude = ['id', 'table', 'motivo'];
                    $where = ['id' => $id];
                    $registro=baseactualizarregistro($inputs, 'proceso_gasto', $where, $exclude);
                    if ($registro) {
                        /**Anulacion de gasto */
                        $inputs_a['referencia'] = $id;
                        $inputs_a['motivo'] = $this->input->post('motivo');
                        $inputs_a['usuario'] = $this->session->userdata('id');
                        $inputs_a['fecha'] = date('Y-m-d H:i:s');
                        $exclude = ['id','table','producto','total'];
                        $registro_a = basenuevoregistro($inputs_a, 'proceso_gasto_anulacion', $exclude);
                        /**Anulacion de gasto */

                        response(['message'=>'Registro actualizado'], 201);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_ingreso_anular':
                    $flag=true;
                    $message='';
                    $detalles = $this->generico_modelo->listado('proceso_ingreso_detalle', '1', ['ingreso'=>$id]);
                    foreach ($detalles as $item) {
                        $kardex = ultimo_kardex(['estado' => '1','producto' => $item['producto']]);
                        $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                        if ($item['cantidad']>$saldo) {
                            $flag=false;
                            $message='El producto '.$item['descripcion'].' no posee '.$item['cantidad'].' unid. en existencias';
                            break;
                        }
                    }
                    
                    if ($flag) {
                        $inputs['estado']= 3;
                        $exclude=array('id','table','motivo');
                        $where  =array('id'=>$id);
                        $registro=baseactualizarregistro($inputs, 'proceso_ingreso', $where, $exclude);
                        if ($registro) {
                            /**Anulacion de ingreso */
                            $inputs_a['ingreso']=$id;
                            $inputs_a['motivo']=$this->input->post('motivo');
                            $inputs_a['usuario']=$this->session->userdata('id');
                            $inputs_a['fecha']=date('Y-m-d H:i:s');
                            $exclude=array('id','table','counter','producto_sel','producto','total');
                            $registro_a=basenuevoregistro($inputs_a, 'proceso_ingreso_anulacion', $exclude);
                            /**Anulacion de ingreso */
                            foreach ($detalles as $item) {
                                /**Kardex inverso*/
                                registro_kardex($registro['id'], $item, 3);//Ingreso anulado
                                /**Kardex inverso*/
                            }

                            response(['message'=>'Registro anulado']);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>$message], 500);
                    }
                    break;
                case 'proceso_venta_anular':
                    $inputs['estado']= 3;
                    $exclude=array('id','table','motivo');
                    $where  =array('id'=>$id);
                    $registro=baseactualizarregistro($inputs, 'proceso_venta', $where, $exclude);
                    if ($registro) {
                        $detalles = $this->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$id]);
                        /**Anulacion de venta */
                        $inputs_a['venta']=$id;
                        $inputs_a['motivo']=$this->input->post('motivo');
                        $inputs_a['usuario']=$this->session->userdata('id');
                        $inputs_a['fecha']=date('Y-m-d H:i:s');
                        $exclude=array('id','table','counter','producto_sel','producto','total');
                        $registro_a=basenuevoregistro($inputs_a, 'proceso_venta_anulacion', $exclude);
                        /**Anulacion de venta */
                        foreach ($detalles as $item) {
                            /**Kardex inverso*/
                            registro_kardex($registro_a['id'], $item, 4);//Venta anulada
                            /**Kardex inverso*/
                        }

                        switch ($registro['tipo_venta_pago']) {
                            case 1:
                                /**Crédito de venta anulada*/
                                $proceso_credito_last = basedetalleregistro('proceso_credito', ['estado'=>'1','cliente'=>$registro['cliente']]);
                                $credito_last = (isset($proceso_credito_last['credito']) ? $proceso_credito_last['credito'] : 0);
                                $inputs_c['tipo_credito']='5'; //Venta anulada
                                $inputs_c['referencia']=$id;//Registro de venta
                                $inputs_c['cliente']=$registro['cliente'];
                                $inputs_c['total']=$registro['total'];
                                $inputs_c['credito']=$credito_last-$registro['total'];
                                $inputs_c['fecha']=date('Y-m-d H:i:s');
                                $registro_p=basenuevoregistro($inputs_c, 'proceso_credito', []);
                                /**Crédito de venta anulada*/
                                break;
                            case 2:
                                //TODO ??

                                /**Anulacion de pago */
                                /**Anulacion de pago */

                                /**Crédito de pago anulado*/
                                /**Crédito de pago anulado*/

                                break;
                            default:
                                break;
                        }
                        

                        response(['message'=>'Registro anulado']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'base_configuracion':
                    if (!empty($_FILES['logo']['name'])) {
                        $this->load->library('upload');
                        $config['upload_path'] = './public/uploads/';
                        $config['allowed_types']= 'bmp|gif|jpeg|jpg|tif|png';
                        $config['max_size'] = 4096;
                        $config['encrypt_name'] = true;
                        $this->upload->initialize($config);
                        if (!$this->upload->do_upload('logo')) {
                            response(['message'=>$this->upload->display_errors()], 500);
                            break;
                        } else {
                            $uploaddata = $this->upload->data();
                            $inputs['logo']='public/uploads/'.$uploaddata['file_name'];
                        }
                    }
                    if (!empty($_FILES['dashboard']['name'])) {
                        $this->load->library('upload');
                        $config['upload_path'] = './public/uploads/';
                        $config['allowed_types']= 'bmp|gif|jpeg|jpg|tif|png';
                        $config['max_size'] = 4096;
                        $config['encrypt_name'] = true;
                        $this->upload->initialize($config);
                        if (!$this->upload->do_upload('dashboard')) {
                            response(['message'=>$this->upload->display_errors()], 500);
                            break;
                        } else {
                            $uploaddata = $this->upload->data();
                            $inputs['dashboard']='public/uploads/'.$uploaddata['file_name'];
                        }
                    }

                    $inputs['fecha']=date('Y-m-d H:i:s');
                    if ($inputs['ruc']!='') {
                        $inputs['ruc']=str_replace(' ', '', addslashes($this->input->post('ruc')));
                    }
                    $where  =array('id'=>$id);
                    $exclude=array('id','table');
                    $registro=baseactualizarregistro($inputs, $table, $where, $exclude);
                    if ($registro) {
                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_caja':
                    $apertura = $this->input->post('apertura');
                    $cierre = $this->input->post('cierre');
                    $sucursal = $this->session->userdata('sucursal');
                    $usuario = $this->session->userdata('id');
                    $perfil = $this->session->userdata('perfil');
                    $caja_actual = caja_actual();
                    $fecha = date('Y-m-d H:i:s');

                    if (in_array($perfil, [1, 2]) || ($caja_actual['usuario'] == $usuario)) {
                        $inputs_c['cierre'] = $cierre;
                        $inputs_c['notas_cierre'] = $this->input->post('notas');
                        $inputs_c['usuario_cierre'] = $usuario;
                        $inputs_c['fecha_cierre'] = $fecha;
                        $inputs_c['estado'] = $this->input->post('estado');
                        $registro = baseactualizarregistro($inputs_c, $table, ['id' => $id], []);
                        $this->session->set_userdata('caja', null);
                        if ($registro) {
                            $actual = $caja_actual['total'];
                            $monto = 0;
                            if ($cierre != $actual) {
                                $monto = $cierre - $actual;
                            }
                            /**Detalle de caja */
                            $inputs_dc['caja'] = $registro['id'];
                            $inputs_dc['referencia'] = null;
                            $inputs_dc['monto'] = $monto;
                            registro_detalle_caja($inputs_dc);
                            /**Detalle de caja */

                            response(['message'=>'Registro correcto']);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>'La caja puede ser cerrada solo por el usuario que abrió la caja o un administrador'], 500);
                    }
                    break;
                case 'base_sucursal':
                    $usuarios = $this->input->post('usuarios');
                    $fecha = date('Y-m-d H:i:s');

                    $registro = baseactualizarregistro($inputs, $table, ['id' => $id], ['id', 'table', 'usuarios', 'numeracion_boleta_actual', 'numeracion_factura_actual']);
                    if ($registro) {
                        $this->db->delete('base_usuario_sucursal', ['sucursal' => $id]);
                        foreach ($usuarios as $item) {
                            $inputs_us['usuario'] = $item;
                            $inputs_us['sucursal'] = $id;
                            $inputs_us['fecha'] = $fecha;
                            $registro_p=basenuevoregistro($inputs_us, 'base_usuario_sucursal', []);
                        }

                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_producto':
                    $inputs['favorito'] = $this->input->post('favorito') ? 1 : 0;
                    $where = array('id'=>$id);
                    $exclude = array('id','table','codigo');
                    $registro = baseactualizarregistro($inputs, $table, $where, $exclude);
                    if ($registro) {
                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                default:
                    $where = array('id'=>$id);
                    $exclude = array('id','table');
                    $registro = baseactualizarregistro($inputs, $table, $where, $exclude);
                    if ($registro) {
                        response(['message'=>'Registro actualizado'], 201);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
            }
        }
    }

    public function detalleregistro()
    {
        $table=addslashes($this->input->post('table'));
        $id=addslashes($this->input->post('id'));
        $exception=($this->input->post('exception') == null ? true : false);
        $date_format_mysql_full = $this->config->item('date_format_mysql_full');
        $date_format_mysql = $this->config->item('date_format_mysql');
        
        $this->form_validation->set_rules('table', 'table', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim|required');

        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            try {
                switch ($table) {
                    case 'base_usuario':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        break;
                    case 'proceso_producto':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        $registro['codigo'] = spd($registro['id'], 6, '0');
                        $kardex = ultimo_kardex(['estado' => '1','producto' => $id]);
                        $registro['existencias'] = ($kardex['saldo']>0 ? $kardex['saldo'] : 0);
                        if ($registro['tipo'] == 1) {
                            $unidad = basedetalleregistro('proceso_unidad', ['estado'=>'1','id'=>$registro['unidad']]);
                            $registro['abreviatura'] = $unidad['abreviatura'];
                        } else {
                            $registro['abreviatura'] = 'Serv.';
                            $duracion_unidad = basedetalleregistro('proceso_duracion_unidad', ['estado'=>'1','id'=>$registro['duracion_unidad']]);
                            $registro['duracion_unidad_desc'] = $duracion_unidad['descripcion'];
                        }
                        break;
                    case 'proceso_venta':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        $registro['detalles'] = $this->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$id]);
                        $registro['sucursal'] = basedetalleregistro('base_sucursal', ['estado'=>'1','id'=>$registro['sucursal']]);
                        foreach ($registro['detalles'] as &$item) {
                            $item['codigo'] = spd($item['producto'], 6, '0');
                            $producto = basedetalleregistro('proceso_producto', ['estado'=>'1','id'=>$item['producto']]);
                            $item['tipo'] = $producto['tipo'];
                            if ($producto['tipo'] == 1) {
                                $unidad = basedetalleregistro('proceso_unidad', ['estado'=>'1','id'=>$producto['unidad']]);
                                $item['abreviatura'] = $unidad['abreviatura'];
                            } else {
                                $item['abreviatura'] = 'Serv.';
                                $duracion_unidad = basedetalleregistro('proceso_duracion_unidad', ['estado'=>'1','id'=>$producto['duracion_unidad']]);
                                $item['duracion_unidad_desc'] = $duracion_unidad['descripcion'];
                            }
                        }
                        $registro['anulacion'] = basedetalleregistro('proceso_venta_anulacion', ['estado'=>'1','venta'=>$id]);
                        if ($registro['anulacion']) {
                            $registro['anulacion']['usuario'] = basedetalleregistro('base_usuario', ['id'=>$registro['anulacion']['usuario']]);
                        }
                        break;
                    case 'proceso_ingreso':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        $registro['detalles'] = $this->generico_modelo->listado('proceso_ingreso_detalle', '1', ['ingreso'=>$id]);
                        $registro['sucursal'] = basedetalleregistro('base_sucursal', ['estado'=>'1','id'=>$registro['sucursal']]);
                        foreach ($registro['detalles'] as &$item) {
                            $item['codigo'] = spd($item['producto'], 6, '0');
                        }
                        $registro['anulacion'] = basedetalleregistro('proceso_ingreso_anulacion', ['estado'=>'1','ingreso'=>$id]);
                        if ($registro['anulacion']) {
                            $registro['anulacion']['usuario'] = basedetalleregistro('base_usuario', ['estado'=>'1','id'=>$registro['anulacion']['usuario']]);
                        }
                        break;
                    case 'proceso_auditoria':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        $registro['usuario'] = basedetalleregistro('base_usuario', ['id'=>$registro['usuario']]);
                        $data = json_decode($registro['data'], true);
                        $detalles = [];
                        foreach ($data as $key => $value) {
                            if ($key == 'estado') {
                                $estado = basedetalleregistro('base_estado', ['id'=>$value]);
                                $value = $estado['descripcion'];
                            }
                            $key = strtoupper(str_replace('_', ' ', $key));
                            $detalles[] = ['campo' => $key, 'dato' => $value];
                        }
                        $registro['detalles'] = $detalles;
                        break;
                    case 'proceso_pago':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        $registro['anulacion'] = basedetalleregistro('proceso_pago_anulacion', ['estado'=>'1','pago'=>$id]);
                        if ($registro['anulacion']) {
                            $registro['anulacion']['usuario'] = basedetalleregistro('base_usuario', ['id'=>$registro['anulacion']['usuario']]);
                        }
                        break;
                    case 'proceso_gasto':
                        $where = ['id' => $id];
                        $registro = basedetalleregistro($table, $where, true);
                        match ((int) $registro['tipo_gasto']) {
                            1 => $registro['proveedor'] = $registro['referencia']
                        };
                        unset($registro['referencia']);
                        $registro['anulacion'] = basedetalleregistro('proceso_gasto_anulacion', ['estado' => '1', 'referencia' => $id]);
                        if ($registro['anulacion']) {
                            $registro['anulacion']['usuario'] = basedetalleregistro('base_usuario', ['id' => $registro['anulacion']['usuario']]);
                        }
                        break;
                    case 'proceso_caja':
                        $sucursal = $this->session->userdata('sucursal');
                        $action = $this->input->post('action') ?? '';
                        $estado = $this->input->post('estado') ?? 1;

                        if ($action == 'apertura') {
                            $registro = basedetalleregistro('base_usuario', ['id' => $this->session->userdata('id')], true);
                            $registro['sucursal'] = basedetalleregistro('base_sucursal', ['id' => $sucursal]);
                            $registro['fecha_apertura'] = date('Y-m-d H:i:s');
                            $registro['detalles'] = [];
                            break;
                        } else {
                            $registro = caja_actual($estado, $id) ?? [];
                            if (!$registro && $action == 'ajuste') {
                                throw new Exception('No se puede registrar, la caja está cerrada');
                            }
                            $registro['detalles'] = $this->generico_modelo->listado('proceso_caja_detalle', '1', ['caja' => $id]);
                        }
                        break;
                    case 'base_sucursal':
                        $tipo_comprobante = $this->input->post('tipo_comprobante');
                        $registro = basedetalleregistro($table, ['id' => $id], true);
                        $usuarios = $this->generico_modelo->listado('base_usuario_sucursal', '1', ['where' => ['sucursal' => $id]]);
                        $ids = array_column($usuarios, 'usuario');
                        $registro['usuarios'] = $ids;
                        $registro['numeracion'] = match ((int) $tipo_comprobante) {
                            1 => $registro['serie_boleta'] . '-' . spd($registro['numeracion_boleta'], 6, '0'),
                            2 => $registro['serie_factura'] . '-' . spd($registro['numeracion_factura'], 6, '0'),
                            default => ''
                        };
                        break;
                    case 'proceso_proveedor':
                        $tipo_comprobante = $this->input->post('tipo_comprobante');
                        $registro = basedetalleregistro($table, ['id' => $id], true);
                        $registro['ultimo_ingreso'] = basedetalleregistro('proceso_ingreso', ['estado'=>'1','sucursal'=>$this->session->userdata('sucursal'), 'proveedor'=>$id]);
                        break;
                    default:
                        $where = array('id' => $id);
                        $registro = basedetalleregistro($table, $where, true);
                        break;
                }
                response(['registro'=>$registro]);
            } catch (Exception $e) {
                response(['message'=>$e->getMessage()], 500);
            }
        }
    }

    public function listado()
    {
        $table = $this->input->post('table');
        $estado = $this->input->post('estado');
        $exception = ($this->input->post('exception') == null ? true : false);

        $this->form_validation->set_rules('table', 'table', 'trim|required');
        $this->form_validation->set_rules('estado', 'estado', 'trim|required');

        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            $meta = [];
            try {
                switch ($table) {
                    case 'base_usuario':
                        $registros = $this->generico_modelo->listado($table, $estado, [], true);
                        break;
                    case 'proceso_producto':
                        $tipos = ($this->input->post('tipos')) == null ? [] : $this->input->post('tipos');
                        $registros = $this->generico_modelo->listado($table, $estado, $tipos, true);
                        foreach ($registros as &$item) {
                            $item['codigo'] = spd($item['id'], 6, '0');
                            if ($item['tipo'] == 1) {
                                $kardex = ultimo_kardex(['estado' => '1','producto' => $item['id']]);
                                $item['existencias'] = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                            } else {
                                $item['existencias'] = '';
                            }
                        }
                        $meta['sucursal'] = $this->session->userdata('sucursaldesc');
                        break;
                    case 'proceso_producto_y_clientes':
                        $caja_actual = caja_actual();
                        if (!$caja_actual) {
                            throw new Exception('No se puede registrar, la caja está cerrada');
                        }

                        $productos = $this->generico_modelo->listado('proceso_producto', $estado, [], true);
                        foreach ($productos as &$item) {
                            $item['codigo'] = spd($item['id'], 6, '0');
                            $kardex = ultimo_kardex(['estado' => '1','producto' => $item['id']]);
                            $item['existencias'] = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                        }
                        $clientes = $this->generico_modelo->listado('proceso_cliente', $estado, [], true);
                        foreach ($clientes as &$item) {
                            //$proceso_credito_last = basedetalleregistro('proceso_credito', ['estado'=>'1','cliente'=>$item['id']]);
                            //$item['credito'] = (isset($proceso_credito_last['credito']) ? $proceso_credito_last['credito'] : 0);
                            //$item['credito'] = (isset($proceso_credito_last['credito']) ? ($proceso_credito_last['credito']>0 ? $proceso_credito_last['credito'] : 0) : 0);
                        }
                        $registros = [
                            'productos'=>$productos,
                            'date'=>date('Y-m-d H:i:s'),
                            'clientes'=>$clientes
                        ];
                        $meta['sucursal'] = $this->session->userdata('sucursaldesc');
                        break;
                    case 'proceso_cliente':
                        $ahora = date('Y-m-d');
                        $params['fecha'] = $this->input->post('inactive') ? $ahora : null;
                        $registros = $this->generico_modelo->listado($table, $estado, $params, true);
                        foreach ($registros as &$item) {
                            $item['codigo'] = spd($item['id'], 6, '0');
                            if ($item['fecha_fin']) {
                                $dias = days_difference($item['fecha_fin'], $ahora);
                                $item['dias'] = $dias * (-1);
                            } else {
                                $item['dias'] = '';
                            }
                        }
                        break;
                    case 'proceso_distrito':
                        $registros = $this->generico_modelo->listado($table, $estado, ['where' => ['idprovincia' => $this->input->post('provincia')]], true);
                        break;
                    case 'proceso_credito':
                        if ($this->input->post('cliente')>0) {
                            $registros = $this->generico_modelo->listado($table, $estado, ['cliente'=>$this->input->post('cliente')], true);
                        } else {
                            //No muestra mensaje
                            response(['message'=>''], 404);
                        }
                        break;
                    case 'base_sucursal':
                        $registros = $this->generico_modelo->listado($table, $estado, [], true);
                        foreach ($registros as &$item) {
                            $usuarios = $this->generico_modelo->listado('base_usuario_sucursal', '1', ['where' => ['sucursal' => $item['id']]]);
                            $item['usuarios'] = count($usuarios);
                        }
                        break;
                    default:
                        $registros = $this->generico_modelo->listado($table, $estado, [], true);
                        break;
                }
                response(['data'=>$registros, 'meta'=>$meta]);
            } catch (Exception $e) {
                response(['message'=>$e->getMessage()], 500);
            }
        }
    }

    public function busqueda()
    {
        $params = $this->input->post();
        $table = $this->input->post('table');
        $params['fechainicio'] = date("Y-m-d", strtotime($this->input->post('fechainicio')));
        $params['fechafin'] = date("Y-m-d", strtotime($this->input->post('fechafin')));

        $this->form_validation->set_rules('table', 'table', 'trim|required');
        $this->form_validation->set_rules('fechafin', 'fechafin', 'trim|required');
        $this->form_validation->set_rules('fechainicio', 'fechainicio', 'trim|required');
        $this->form_validation->set_rules('estado', 'estado', 'trim|required');

        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            try {
                switch ($table) {
                    case 'proceso_venta':
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        foreach ($registros as &$item) {
                            $item['totalsum'] = (($item['estado']==3 || $item['estado']==4) ? 0 : $item['total']);
                        }
                        break;
                    case 'proceso_ingreso':
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        break;
                    case 'proceso_kardex':
                        $params['producto'] = $this->input->post('producto');
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        foreach ($registros as &$item) {
                            $item['codigo'] = spd($item['producto'], 6, '0');
                            if ($item['tipo_producto'] == 2) {
                                $item['abreviatura'] = 'Serv.';
                            }
                        }
                        break;
                    case 'proceso_pago':
                        $params['cliente'] = $this->input->post('cliente');
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        foreach ($registros as &$item) {
                            $item['pagosum'] = ($item['estado']==3 ? 0 : $item['pago']);
                        }
                        break;
                    case 'proceso_gasto':
                        $params['tipo_gasto'] = $this->input->post('tipo_gasto');
                        $params['referencia'] = $this->input->post('proveedor');
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        foreach ($registros as &$item) {
                            $item['pagosum'] = ($item['estado']==3 ? 0 : $item['pago']);
                        }
                        break;
                    case 'proceso_cliente':
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        foreach ($registros as &$item) {
                            $item['codigo'] = spd($item['id'], 6, '0');
                        }
                        break;
                    case 'proceso_caja':
                        $params['sucursal'] = $this->session->userdata('sucursal');
                        $params['perfil'] = $this->session->userdata('perfil');
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        /*foreach ($registros as &$item) {
                            $item['pagosum'] = ($item['estado']==3 ? 0 : $item['pago']);
                        }*/
                        break;
                    case 'proceso_auditoria':
                        $params['sucursal'] = $this->session->userdata('sucursal');
                        $params['perfil'] = $this->session->userdata('perfil');
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        break;
                    default:
                        response(['message'=>'No existe la tabla'], 500);
                        break;
                }
                response(['data'=>$registros]);
            } catch (Exception $e) {
                response(['message'=>$e->getMessage()], 500);
            }
        }
    }
}
