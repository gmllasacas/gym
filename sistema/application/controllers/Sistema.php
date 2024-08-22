<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Sistema extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->menu_text = 'Sistema';
        $this->menu = '1';
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function index()
    {
        $this->session->sess_destroy();
        $sucursales = $this->generico_modelo->listado('base_sucursal', '1');

        $datos = [
            'username' => '',
            'correo' => '',
            'token' => '',
            'sucursales' => $sucursales
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('sistema/login', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/login']]);
    }

    public function login()
    {
        $username = $this->input->post('username');
        $password = remove_invisible_characters($this->input->post('password'));
        $sucursal = $this->input->post('sucursal');
        $user_logging_waiting_time = $this->config->item('user_logging_waiting_time');
        $user_logging_attempts = $this->config->item('user_logging_attempts');
        $recaptcha_system_server_secret = $this->config->item('recaptcha_system_server_secret');

        $this->form_validation->set_rules('username', 'username', 'required');
        $this->form_validation->set_rules('password', 'password', 'required');
        $this->form_validation->set_rules('sucursal', 'sucursal', 'required');
        $this->form_validation->set_rules('recaptcha_response', 'recaptcha_response', 'required');

        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            $recaptcha_response = $this->input->post('recaptcha_response');
            $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$recaptcha_system_server_secret.'&response='.$recaptcha_response);
            $responseData = json_decode($verifyResponse);
            if ($responseData->success) {
                $registro = $this->generico_modelo->login(['estado'=>1, 'username'=>$username, 'sucursal'=>$sucursal]);
                if (isset($registro['id'])) {
                    $intentos = $registro['intentos'] + 1;
                    $ultimo_intento = is_null($registro['ultimo_intento']) ? date('Y-m-d H:i:s') : $registro['ultimo_intento'];
                    $ahora = date('Y-m-d H:i:s');
                    $minutos = minutes_difference($ultimo_intento, $ahora);
                    $flag = false;
                    if ($minutos > $user_logging_waiting_time) {
                        $intentos = 1;
                        $this->db->update('base_usuario', ['intentos' => $intentos, 'ultimo_intento' => $ahora], ['id' => $registro['id']]);
                        $flag = true;
                    } else {
                        $this->db->update('base_usuario', ['intentos' => $intentos], ['id' => $registro['id']]);
                        if ($intentos <= $user_logging_attempts) {
                            $flag = true;
                        }
                    }

                    if ($flag) {
                        if (password_verify($password, $registro['password'])) {
                            //$this->session->set_userdata('aviso', 1);
                            $this->session->set_userdata('id', $registro['id']);
                            $this->session->set_userdata('cliente_sistema', $registro['cliente_sistema']);
                            $this->session->set_userdata('ruc', $registro['ruc']);
                            $this->session->set_userdata('username', $registro['username']);
                            $this->session->set_userdata('perfil', $registro['perfil']);
                            $this->session->set_userdata('nombres', $registro['nombres'].' '.$registro['apellidos']);
                            $this->session->set_userdata('sucursal', $registro['sucursal']);
                            $this->session->set_userdata('sucursaldesc', $registro['sucursaldesc']);

                            $caja = $this->generico_modelo->caja(['sucursal' => $sucursal, 'estado'=>1]);
                            $this->session->set_userdata('caja', $caja['id'] ?? null);

                            $this->db->update('base_usuario', ['intentos' => 0, 'ultimo_intento' => $ahora, 'token'=> null], ['id' => $registro['id']]);
                            $permisos = $this->generico_modelo->listado('permisos', '1', ['perfil'=>$this->session->userdata('perfil')]);
                            registro_auditoria([], "Inició sesión");
                            response([
                                'message' => 'Datos correctos',
                                'redirect'=> base_url().$permisos[0]['url'],
                            ]);
                        } else {
                            $restante = ($user_logging_attempts - $intentos) < 0 ? $user_logging_attempts : ($user_logging_attempts - $intentos);
                            registro_auditoria([], "Intentó iniciar sesión, contraseña incorrecta");
                            response(['message'=>'Contraseña incorrecta, tiene ' .  $restante . ' intento(s) restante(s)'], 500);
                        }
                    } else {
                        response(['message'=>'Intentos de ingreso excedido (' . $user_logging_attempts .'), por favor espere ' . (15 - $minutos) . ' minuto(s) para intentar nuevamente'], 500);
                    }
                } else {
                    response(['message' => $registro['message']], 500);
                }
            } else {
                response(['message'=>'Captcha inválido, intente nuevamente'], 500);
            }
        }
    }

    public function salir()
    {
        registro_auditoria([], "Terminó sesión");
        $this->session->sess_destroy();
        redirect(base_url(), 'location');
    }

    public function configuracion()
    {
        $this->configuracion['dashboard'] = ($this->configuracion['dashboard'] == '') ? 'public/img/recursos/dashboard.jpg' : $this->configuracion['dashboard'];
        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Configuración',
            'export_text' => 'Formulario',
            'registro_text' => '',
            'configuracion'=>$this->configuracion
        ];
        
        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>101]);
        $this->load->view('bases/barra');
        $this->load->view('sistema/configuracion', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/configuracion']]);
    }

    public function clientes()
    {
        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Clientes del sistema',
            'export_text' => 'Listado de clientes del sistema',
            'registro_text' => 'cliente del sistema'
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>103]);
        $this->load->view('bases/barra');
        $this->load->view('sistema/clientes', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/clientes']]);
    }

    public function usuarios()
    {
        $clientes_sistema = $this->generico_modelo->listado('base_cliente_sistema', '^5');
        $estados = $this->generico_modelo->listado('base_estado', '1');
        if ($this->session->userdata('perfil') == '1') {
            $perfiles = $this->generico_modelo->listado('base_perfil', '^5');
        } else {
            $perfiles = $this->generico_modelo->listado('base_perfil', '1', [ 'where_in' => ['column' => 'id', 'in' => [3,4]]]);
        }

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Usuarios',
            'export_text' => 'Listado de usuarios',
            'registro_text' => 'usuario',
            'estados'=>$estados,
            'perfiles'=>$perfiles,
        ];
        
        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>104]);
        $this->load->view('bases/barra');
        $this->load->view('sistema/usuarios', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/usuarios']]);
    }

    public function auditoria()
    {
        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Auditoría',
            'export_text' => 'Listado de registros',
            'registro_text' => 'auditoría',
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>105]);
        $this->load->view('bases/barra');
        $this->load->view('sistema/auditoria', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/auditoria']]);
    }

    public function sucursales()
    {
        $usuarios = $this->generico_modelo->listado('base_usuario', '1');
        $estados = $this->generico_modelo->listado('base_estado', '1');

        $datos = [
            'menu_text' => $this->menu_text,
            'submenu_text' => 'Sucursales',
            'export_text' => 'Listado de sucursales',
            'registro_text' => 'sucursal',
            'usuarios' => $usuarios,
            'estados' => $estados,
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>$this->menu,'submenu' =>106]);
        $this->load->view('bases/barra');
        $this->load->view('sistema/sucursales', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/sucursales']]);
    }


    public function recuperar()
    {
        $correo=$this->input->post('correo');
        $this->form_validation->set_rules('correo', 'correo', 'required|valid_email');
        
        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            $registro = basedetalleregistro('base_usuario', ['estado'=>'1','correo'=>$correo]);
            if (count((array)$registro) > 0) {
                if ($this->configuracion['send_email'] == 1) {
                    $this->load->library('encryption');
                    $this->encryption->initialize(array('driver' => 'openssl'));

                    $fecha = date('Y-m-d H:i:s');
                    $titulo = 'Notificación de recuperación de contraseña';
                    $token = $this->encryption->encrypt($registro['username'] . '|' . $fecha);
                    $token_64 = base64_encode($token);
                    $enlace = base_url('sistema/validar/' . $token_64);

                    $actualizado=baseactualizarregistro(['token'=>$token], 'base_usuario', ['id'=>$registro['id']], []);
                    if ($actualizado) {
                        $this->load->library('email');
                        $datos  =[
                            'titulo' =>$titulo,
                            'texto' =>'Se solicitó la recuperación de contraseña para el usuario asociado al correo ' . $correo . ', se creó un enlace temporal que dura 3 horas:',
                            'username' =>$registro['username'],
                            'correo' =>$registro['correo'],
                            'enlace' =>$enlace
                        ];

                        $this->email->set_newline("\r\n");
                        $this->email->initialize(['mailtype'  => 'html']);
                        $this->email->from($this->config->item('system_email'), $this->config->item('system_username'));
                        $this->email->to($registro['correo']);
                        $this->email->subject($titulo);
                        $this->email->message($this->load->view('correo/recuperar', $datos, true));
                        registro_auditoria([], "Solicitó la recuperación de contraseña");
                        if ($this->email->send()) {
                            $emailresp = 'Email enviado';
                        } else {
                            $emailresp = $this->email->print_debugger();
                        }
                        response(['message'=>$emailresp], 201);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                } else {
                    response(['message'=>'Configuración de envío de correo desactivado'], 500);
                }
            } else {
                response(['message'=>'Usuario incorrecto'], 500);
            }
        }
    }

    public function validar($token = null)
    {
        if (is_null($token)) {
            show_error('Parámetros incorrectos', '400', 'Error');
        } else {
            $user_recovery_token_time = $this->config->item('user_recovery_token_time');
            $this->load->library('encryption');
            $this->encryption->initialize(array('driver' => 'openssl'));
            $token_og = base64_decode($token);
            $data = explode('|', $this->encryption->decrypt($token_og));
            $ahora = date('Y-m-d H:i:s');
            $minutos = minutes_difference($data[1], $ahora);
            if ($minutos <= $user_recovery_token_time) {
                $registro = basedetalleregistro('base_usuario', ['estado'=>'1', 'username'=>$data[0], 'token'=>$token_og]);
                if (count((array)$registro) > 0) {
                    $datos = [
                        'crear_contrasena' => 'true',
                        'username' =>$registro['username'],
                        'correo' =>$registro['correo'],
                        'token' => $token,
                        'funciones' => ['sistema/login'],
                    ];
                    $this->load->view('bases/cabezera');
                    $this->load->view('sistema/login', $datos);
                    $this->load->view('bases/pie');
                    $this->load->view('bases/funciones', ['funciones' => ['sistema/login']]);
                } else {
                    show_error('El usuario o token no existen', '400', 'Error');
                }
            } else {
                show_error('El enlace ha caducado', '400', 'Error');
            }
        }
    }

    public function crear()
    {
        $token=$this->input->post('token');
        $password=$this->input->post('password');
        $this->form_validation->set_rules('token', 'token', 'required');
        $this->form_validation->set_rules('password', 'password', 'required');
        
        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            $user_recovery_token_time = $this->config->item('user_recovery_token_time');
            $this->load->library('encryption');
            $this->encryption->initialize(array('driver' => 'openssl'));
            $token_og = base64_decode($token);
            $data = explode('|', $this->encryption->decrypt($token_og));
            $ahora = date('Y-m-d H:i:s');
            $minutos = minutes_difference($data[1], $ahora);
            if ($minutos <= $user_recovery_token_time) {
                $registro_det = basedetalleregistro('base_usuario', ['estado'=>'1', 'username'=>$data[0], 'token'=>$token_og]);
                if (count((array)$registro_det) > 0) {
                    $where = ['id' => $registro_det['id']];
                    $inputs['token'] = null;
                    $inputs['password'] = password_hash($password, PASSWORD_DEFAULT);
                    $registro = baseactualizarregistro($inputs, 'base_usuario', $where, []);
                    if ($registro) {
                        $this->load->library('email');
                        $titulo = 'Notificación de creación de contraseña';
                        $datos  =[
                            'titulo' =>$titulo,
                            'texto' =>'Se creó una nueva contraseña para el usuario asociado al correo ' . $registro['correo'] . ', si usted no lo hizo contáctese con el administrador del sistema.',
                        ];

                        $this->email->set_newline("\r\n");
                        $this->email->initialize(['mailtype'  => 'html']);
                        $this->email->from($this->config->item('system_email'), $this->config->item('system_username'));
                        $this->email->to($registro['correo']);
                        $this->email->subject($titulo);
                        $this->email->message($this->load->view('correo/notificacion', $datos, true));
                        registro_auditoria([], "Creó una nueva contraseña");
                        if ($this->email->send()) {
                            $emailresp = 'Email enviado';
                        } else {
                            $emailresp = $this->email->print_debugger();
                        }
                        
                        response(['message'=>'Contraseña creada', 'redirect'=> base_url()], 201);
                    } else {
                        response(['message'=>'Error al escribir en la BD'], 500);
                    }
                } else {
                    response(['message'=>'El usuario o token no existen'], 500);
                }
            } else {
                response(['message'=>'El enlace ha caducado'], 500);
            }
        }
    }
}
