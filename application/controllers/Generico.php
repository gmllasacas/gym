<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Generico extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->configuracion=basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->load->helper('text');
        $this->load->model('genericomodelo', 'generico_modelo');
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
                    $registro_det=basedetalleregistro($table, ['codigo'=>$this->input->post('codigo')]);
                    if (count((array)$registro_det)==0) {
                        $inputs['fecha']=date('Y-m-d H:i:s');
                        $exclude=array('id','table');
                        $registro=basenuevoregistro($inputs, $table, $exclude);
                        if ($registro) {
                            response(['message'=>'Registro correcto']);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>'El código ingresado ya está registrado'], 500);
                    }
                    break;
                case 'proceso_cliente':
                    $registro_det=basedetalleregistro($table, ['documento'=>$this->input->post('documento')]);
                    if (count((array)$registro_det)==0) {
                        $inputs['fecha']=date('Y-m-d H:i:s');
                        $exclude=array('id','table','credito');
                        $registro=basenuevoregistro($inputs, $table, $exclude);
                        if ($registro) {
                            /**Crédito */
                            $inputs_c['tipo_credito']='3'; //Credito inicial
                            $inputs_c['referencia']=null;
                            $inputs_c['cliente']=$registro['id'];
                            $inputs_c['total']=$inputs['credito'];
                            $inputs_c['credito']=$inputs['credito'];
                            $inputs_c['fecha_registro']=date('Y-m-d H:i:s');
                            $inputs_c['fecha']=date('Y-m-d H:i:s');
                            $registro_p=basenuevoregistro($inputs_c, 'proceso_credito', []);
                            /**Crédito */

                            response(['message'=>'Registro correcto']);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>'El documento ingresado ya está registrado'], 500);
                    }
                    break;
                case 'proceso_venta':
                    //log_message('error','inputs:'.print_r($inputs, TRUE));
                    $flag=true;
                    $message='';
                    $productos=$this->input->post('producto');
                    foreach ($productos as $item) {
                        $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['id']]);
                        $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                        if ($item['cantidad']>$saldo) {
                            $flag=false;
                            $message='El producto '.$item['productodesc'].' no posee '.$item['cantidad'].' unid. en existencias';
                            break;
                        }
                    }

                    if ($flag) {
                        $fecha_registro= $this->input->post('fecha_registro');
                        $tipo_venta_pago = $this->input->post('tipo_venta_pago');
                        $tipo_pago = $this->input->post('tipo_pago');
                        $cliente = $this->input->post('cliente');
                        $total_venta = $this->input->post('total');
                        $estado = $this->input->post('estado');
                        $inputs['usuario']=$this->session->userdata('id');
                        $inputs['fecha']=date('Y-m-d H:i:s');
                        $exclude=array('id','table','counter','producto_sel','producto','tipo_pago');
                        $registro=basenuevoregistro($inputs, $table, $exclude);
                        if ($registro) {
                            foreach ($productos as $item) {
                                /**Kardex */
                                $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['id']]);
                                $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                                $inputs_e['tipo_kardex']=2;//Venta
                                $inputs_e['referencia']=$registro['id'];
                                $inputs_e['producto']=$item['id'];
                                $inputs_e['cantidad']=$item['cantidad'];
                                $inputs_e['precio']=$item['precio'];
                                $inputs_e['subtotal']=$item['subtotal'];
                                $inputs_e['saldo']=($saldo-$item['cantidad']);
                                $inputs_e['fecha_registro']=$fecha_registro;
                                $inputs_e['fecha']=date('Y-m-d H:i:s');
                                $registro_e=basenuevoregistro($inputs_e, 'proceso_kardex', []);
                                /**Kardex */
                                
                                /**Detalle */
                                $inputs_p['venta']=$registro['id'];
                                $inputs_p['producto']=$item['id'];
                                $inputs_p['cantidad']=$item['cantidad'];
                                $inputs_p['precio']=$item['precio'];
                                $inputs_p['subtotal']=$item['subtotal'];
                                $inputs_p['precioc']=$item['precioc'];
                                $inputs_p['subtotalc']=$item['subtotalc'];
                                $inputs_p['fecha']=$fecha_registro;
                                $registro_p=basenuevoregistro($inputs_p, 'proceso_venta_detalle', []);
                                /**Detalle */
                            }
                            if ($estado!=4) {
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
                                        $inputs_c['fecha_registro']=$fecha_registro;
                                        $inputs_c['fecha']=date('Y-m-d H:i:s');
                                        $registro_c=basenuevoregistro($inputs_c, 'proceso_credito', []);
                                        /**Crédito */
                                        break;
                                    case 2:
                                        /**Pago */
                                        $inputs_pa['tipo_pago']=$tipo_pago;
                                        $inputs_pa['cliente']=$cliente;
                                        $inputs_pa['pago']=$total_venta;
                                        $inputs_pa['usuario']=$this->session->userdata('id');
                                        $inputs_pa['fecha_registro']=$fecha_registro;
                                        $inputs_pa['fecha']=date('Y-m-d H:i:s');
                                        $registro_pa=basenuevoregistro($inputs_pa, 'proceso_pago', []);
                                        /**Pago */
                                        break;
                                    default:
                                        break;
                                }
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
                    $flag=true;
                    $productos = $this->input->post('producto');
                    $fecha_registro= $this->input->post('fecha_registro');
                    $tipo_comprobante = $this->input->post('tipo_comprobante');
                    $inputs['tipo_comprobante']=($tipo_comprobante=='' ? null : $tipo_comprobante);
                    $inputs['usuario']=$this->session->userdata('id');
                    $inputs['fecha']=date('Y-m-d H:i:s');
                    $exclude=array('id','table','counter','producto_sel','producto','total');
                    $registro=basenuevoregistro($inputs, $table, $exclude);
                    if ($registro) {
                        foreach ($productos as $item) {
                            /**Kardex */
                            $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['id']]);
                            $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                            $inputs_e['tipo_kardex']=1;//Ingreso
                            $inputs_e['referencia']=$registro['id'];
                            $inputs_e['producto']=$item['id'];
                            $inputs_e['cantidad']=$item['cantidad'];
                            $inputs_e['precio']=$item['precio'];
                            $inputs_e['subtotal']=$item['subtotal'];
                            $inputs_e['saldo']=($saldo+$item['cantidad']);
                            $inputs_e['fecha_registro']=$fecha_registro;
                            $inputs_e['fecha']=date('Y-m-d H:i:s');
                            $registro_p=basenuevoregistro($inputs_e, 'proceso_kardex', []);
                            /**Kardex */

                            /**Detalle */
                            $inputs_p['ingreso']=$registro['id'];
                            $inputs_p['producto']=$item['id'];
                            $inputs_p['cantidad']=$item['cantidad'];
                            $inputs_p['precio']=$item['precio'];
                            $inputs_p['subtotal']=$item['subtotal'];
                            $inputs_p['fecha']=$fecha_registro;
                            $registro_p=basenuevoregistro($inputs_p, 'proceso_ingreso_detalle', []);
                            /**Detalle */
                        }
                        response(['message'=>'Registro correcto']);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                    break;
                case 'proceso_pago':
                    $cliente = $this->input->post('cliente');
                    $pago = $this->input->post('pago');
                    $fecha_registro= $this->input->post('fecha_registro');
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
                        $inputs_cp['fecha_registro']=$fecha_registro;
                        $inputs_cp['fecha']=date('Y-m-d H:i:s');
                        $registro_cp=basenuevoregistro($inputs_cp, 'proceso_credito', []);
                        /**Crédito pago */

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
                case 'proceso_venta':
                    $flag=true;
                    $message='';
                    $productos=$this->input->post('producto');
                    foreach ($productos as $item) {
                        $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['id']]);
                        $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                        if ($item['cantidad']>$saldo) {
                            $flag=false;
                            $message='El producto '.$item['productodesc'].' no posee '.$item['cantidad'].' unid. en existencias';
                            break;
                        }
                    }
                    
                    if ($flag) {
                        $fecha_registro= $this->input->post('fecha_registro');
                        $tipo_venta_pago = $this->input->post('tipo_venta_pago');
                        $tipo_pago = $this->input->post('tipo_pago');
                        $total_venta = $this->input->post('total');
                        $estado = $this->input->post('estado');
                        $inputs['usuario']=$this->session->userdata('id');
                        $exclude=array('id','table','counter','producto_sel','producto','tipo_pago');
                        $where  =array('id'=>$id);
                        $registro=baseactualizarregistro($inputs, 'proceso_venta', $where, $exclude);
                        if ($registro) {
                            $cliente = $registro['cliente'];

                            foreach ($productos as $item) {
                                /**Kardex */
                                $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['id']]);
                                $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                                $inputs_e['tipo_kardex']=2;//Venta
                                $inputs_e['referencia']=$registro['id'];
                                $inputs_e['producto']=$item['id'];
                                $inputs_e['cantidad']=$item['cantidad'];
                                $inputs_e['precio']=$item['precio'];
                                $inputs_e['subtotal']=$item['subtotal'];
                                $inputs_e['saldo']=($saldo-$item['cantidad']);
                                $inputs_e['fecha_registro']=$fecha_registro;
                                $inputs_e['fecha']=date('Y-m-d H:i:s');
                                $registro_e=basenuevoregistro($inputs_e, 'proceso_kardex', []);
                                /**Kardex */
                                
                                /**Detalle */
                                $inputs_p['venta']=$registro['id'];
                                $inputs_p['producto']=$item['id'];
                                $inputs_p['cantidad']=$item['cantidad'];
                                $inputs_p['precio']=$item['precio'];
                                $inputs_p['subtotal']=$item['subtotal'];
                                $inputs_p['precioc']=$item['precioc'];
                                $inputs_p['subtotalc']=$item['subtotalc'];
                                $inputs_p['fecha']=$fecha_registro;
                                $registro_p=basenuevoregistro($inputs_p, 'proceso_venta_detalle', []);
                                /**Detalle */
                            }
                            if ($estado!=4) {
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
                                        $inputs_c['fecha_registro']=$fecha_registro;
                                        $inputs_c['fecha']=date('Y-m-d H:i:s');
                                        $registro_c=basenuevoregistro($inputs_c, 'proceso_credito', []);
                                        /**Crédito */
                                        break;
                                    case 2:
                                        /**Pago */
                                        $inputs_pa['tipo_pago']=$tipo_pago;
                                        $inputs_pa['cliente']=$cliente;
                                        $inputs_pa['pago']=$total_venta;
                                        $inputs_pa['usuario']=$this->session->userdata('id');
                                        $inputs_pa['fecha_registro']=$fecha_registro;
                                        $inputs_pa['fecha']=date('Y-m-d H:i:s');
                                        $registro_pa=basenuevoregistro($inputs_pa, 'proceso_pago', []);
                                        /**Pago */
                                        break;
                                    default:
                                        break;
                                }
                            }
                            response(['message'=>'Registro actualizado'], 201);
                        } else {
                            response(['message'=>'Error al escribir en la BD'], 500);
                        }
                    } else {
                        response(['message'=>$message], 500);
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
                        $inputs_c['fecha_registro']=date('Y-m-d H:i:s');
                        $inputs_c['fecha']=date('Y-m-d H:i:s');
                        $registro_p=basenuevoregistro($inputs_c, 'proceso_credito', []);
                        /**Crédito de pago anulado*/
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
                        $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['producto']]);
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
                                $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['producto']]);
                                $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                                $inputs_e['tipo_kardex']=3;//Ingreso anulado
                                $inputs_e['referencia']=$id;//Registro de ingreso
                                $inputs_e['producto']=$item['producto'];
                                $inputs_e['cantidad']=$item['cantidad'];
                                $inputs_e['precio']=$item['precio'];
                                $inputs_e['subtotal']=$item['subtotal'];
                                $inputs_e['saldo']=($saldo-$item['cantidad']);
                                $inputs_e['fecha_registro']=date('Y-m-d H:i:s');
                                $inputs_e['fecha']=date('Y-m-d H:i:s');
                                $registro_e=basenuevoregistro($inputs_e, 'proceso_kardex', []);
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
                            $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['producto']]);
                            $saldo = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                            $inputs_e['tipo_kardex']=4;//Venta anulada
                            $inputs_e['referencia']=$registro_a['id'];//Registro de anulacion
                            $inputs_e['producto']=$item['producto'];
                            $inputs_e['cantidad']=$item['cantidad'];
                            $inputs_e['precio']=$item['precio'];
                            $inputs_e['subtotal']=$item['subtotal'];
                            $inputs_e['saldo']=($saldo+$item['cantidad']);
                            $inputs_e['fecha_registro']=date('Y-m-d H:i:s');
                            $inputs_e['fecha']=date('Y-m-d H:i:s');
                            $registro_e=basenuevoregistro($inputs_e, 'proceso_kardex', []);
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
                                $inputs_c['fecha_registro']=date('Y-m-d H:i:s');
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
                default:
                    $where  =array('id'=>$id);
                    $exclude=array('id','table');
                    $registro=baseactualizarregistro($inputs, $table, $where, $exclude);
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
        $exception=(strip_tags($this->input->post('exception')) == null ? true : false);
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
                        $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$id]);
                        $registro['existencias'] = ($kardex['saldo']>0 ? $kardex['saldo'] : 0);
                        break;
                    case 'proceso_venta':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        $registro['detalles'] = $this->generico_modelo->listado('proceso_venta_detalle', '1', ['venta'=>$id]);
                        $registro['anulacion'] = basedetalleregistro('proceso_venta_anulacion', ['estado'=>'1','venta'=>$id]);
                        $registro['anulacion']['usuario'] = basedetalleregistro('base_usuario', ['id'=>$registro['anulacion']['usuario']]);
                        break;
                    case 'proceso_ingreso':
                        $where = array('id'=>$id);
                        $registro = basedetalleregistro($table, $where, true);
                        $registro['detalles'] = $this->generico_modelo->listado('proceso_ingreso_detalle', '1', ['ingreso'=>$id]);
                        $registro['anulacion'] = basedetalleregistro('proceso_ingreso_anulacion', ['estado'=>'1','ingreso'=>$id]);
                        $registro['anulacion']['usuario'] = basedetalleregistro('base_usuario', ['estado'=>'1','id'=>$registro['anulacion']['usuario']]);
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
                        $registro['anulacion']['usuario'] = basedetalleregistro('base_usuario', ['id'=>$registro['anulacion']['usuario']]);
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
        $table=strip_tags($this->input->post('table'));
        $estado=strip_tags($this->input->post('estado'));
        $exception=(strip_tags($this->input->post('exception')) == null ? true : false);

        $this->form_validation->set_rules('table', 'table', 'trim|required');
        $this->form_validation->set_rules('estado', 'estado', 'trim|required');

        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            try {
                switch ($table) {
                    case 'base_usuario':
                        $registros = $this->generico_modelo->listado($table, $estado, [], true);
                        break;
                    case 'proceso_producto':
                        $registros = $this->generico_modelo->listado($table, $estado, [], true);
                        foreach ($registros as &$item) {
                            $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['id']]);
                            $item['existencias'] = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                            $item['unidades_docenas'] = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? unidades_docenas($kardex['saldo']) : 0) : 0);
                        }
                        break;
                    case 'proceso_producto_y_clientes':
                        $productos = $this->generico_modelo->listado('proceso_producto', $estado, [], true);
                        foreach ($productos as &$item) {
                            $kardex = basedetalleregistro('proceso_kardex', ['estado'=>'1','producto'=>$item['id']]);
                            $item['existencias'] = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? $kardex['saldo'] : 0) : 0);
                            $item['unidades_docenas'] = (isset($kardex['saldo']) ? ($kardex['saldo']>0 ? unidades_docenas($kardex['saldo']) : 0) : 0);
                        }
                        $clientes = $this->generico_modelo->listado('proceso_cliente', $estado, [], true);
                        foreach ($clientes as &$item) {
                            $proceso_credito_last = basedetalleregistro('proceso_credito', ['estado'=>'1','cliente'=>$item['id']]);
                            $item['credito'] = (isset($proceso_credito_last['credito']) ? $proceso_credito_last['credito'] : 0);
                            //$item['credito'] = (isset($proceso_credito_last['credito']) ? ($proceso_credito_last['credito']>0 ? $proceso_credito_last['credito'] : 0) : 0);
                        }
                        $registros = [
                            'productos'=>$productos,
                            'date'=>date('Y-m-d H:i:s'),
                            'clientes'=>$clientes
                        ];
                        break;
                    case 'proceso_cliente':
                        $registros = $this->generico_modelo->listado($table, $estado, [], true);
                        foreach ($registros as &$item) {
                            $proceso_credito_last = basedetalleregistro('proceso_credito', ['estado'=>'1','cliente'=>$item['id']]);
                            $item['credito'] = (isset($proceso_credito_last['credito']) ? $proceso_credito_last['credito'] : 0);
                        }
                        break;
                    case 'proceso_credito':
                        if ($this->input->post('cliente')>0) {
                            $registros = $this->generico_modelo->listado($table, $estado, ['cliente'=>$this->input->post('cliente')], true);
                        } else {
                            //No muestra mensaje
                            response(['message'=>''], 404);
                        }
                        break;
                    default:
                        $registros = $this->generico_modelo->listado($table, $estado, [], true);
                        break;
                }
                response(['data'=>$registros]);
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
                            $item['cantidad_docenas'] = (isset($item['cantidad']) ? ($item['cantidad']>0 ? unidades_docenas($item['cantidad']) : 0) : 0);
                        }
                        break;
                    case 'proceso_ingreso':
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        break;
                    case 'proceso_kardex':
                        $params['producto'] = $this->input->post('producto');
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        foreach ($registros as &$item) {
                            $item['saldo_docenas'] = unidades_docenas($item['saldo']);
                        }
                        break;
                    case 'proceso_pago':
                        $params['cliente'] = $this->input->post('cliente');
                        $registros = $this->generico_modelo->busqueda($table, $params);
                        foreach ($registros as &$item) {
                            $item['pagosum'] = ($item['estado']==3 ? 0 : $item['pago']);
                        }
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
