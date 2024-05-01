<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Sistema extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->configuracion=basedetalleregistro('base_configuracion', ['id'=>1]);
        $this->load->helper('text');
        $this->load->model('genericomodelo', 'generico_modelo');
    }

    public function index()
    {
        $this->session->sess_destroy();

        $this->load->view('bases/cabezera');
        $this->load->view('sistema/login', ['funciones' => ['sistema/login']]);
    }

    public function login()
    {
        //$ruc=str_replace(' ','',addslashes($this->input->post('ruc')));
        $username=$this->input->post('username');
        $password=remove_invisible_characters($this->input->post('password'));
        
        switch ($username) {
            case 'superadmin':
                $ruc=10478672882;
                break;
            default:
                $ruc=10412455130;
                break;
        }

        //$this->form_validation->set_rules('ruc', 'ruc', 'required');
        $this->form_validation->set_rules('username', 'username', 'required');
        $this->form_validation->set_rules('password', 'password', 'required');

        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            $registro = $this->generico_modelo->login(['estado'=>1,'ruc'=>$ruc,'username'=>$username]);
            if (count((array)$registro)>0) {
                $intentos = $registro['intentos'] + 1;
                $ultimo_intento = is_null($registro['ultimo_intento']) ? date('Y-m-d H:i:s') : $registro['ultimo_intento'];
                $ahora = date('Y-m-d H:i:s');
                $minutos = date_difference_minutes($ultimo_intento, $ahora);
                $flag = false;
                if ($minutos > 15) {
                    $this->db->update('base_usuario', ['intentos' => 0, 'ultimo_intento' => $ahora], ['id' => $registro['id']]);
                    $flag = true;
                } elseif ($intentos <= 3) {
                    $this->db->update('base_usuario', ['intentos' => $intentos, 'ultimo_intento' => $ahora], ['id' => $registro['id']]);
                    $flag = true;
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
                        //$this->session->set_userdata('mensaje', 'Bienvenido '.$registro['nombres'].' '.$registro['apellidos']);

                        $permisos = $this->generico_modelo->listado('permisos', '1', ['perfil'=>$this->session->userdata('perfil')]);
                        response([
                            'message' => 'Datos correctos',
                            'redirect'=> base_url().$permisos[0]['url'],
                        ]);
                    } else {
                        $restante = (3 - $intentos) < 0 ? 3 : (3 - $intentos);
                        response(['message'=>'Contraseña incorrecta, tiene ' .  $restante . ' intento(s) restante(s)'], 500);
                    }
                } else {
                    response(['message'=>'Intentos de ingreso excedido (' . $intentos .'), por favor espere ' . (15 - $minutos) . ' minuto(s) para intentar nuevamente'], 500);
                }
            } else {
                response(['message'=>'Usuario incorrecto'], 500);
            }
        }
    }

    public function salir()
    {
        $this->session->sess_destroy();
        redirect(base_url(), 'location');
    }

    public function configuracion()
    {
        $datos = [
            'menu_text' => 'Sistema',
            'submenu_text' => 'Configuración',
            'titulo_text' => 'Configuración',
            'export_text' => 'Formulario',
            'registro_text' => '',
            'configuracion'=>$this->configuracion
        ];
        
        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>1,'submenu' =>101]);
        $this->load->view('bases/barra');
        $this->load->view('sistema/configuracion', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/configuracion']]);
    }

    public function clientes()
    {
        $datos = [
            'menu_text' => 'Sistema',
            'submenu_text' => 'Clientes del sistema',
            'titulo_text' => 'Clientes del sistema',
            'export_text' => 'Listado de clientes del sistema',
            'registro_text' => 'cliente del sistema'
        ];

        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>1,'submenu' =>103]);
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
            'menu_text' => 'Sistema',
            'submenu_text' => 'Usuarios',
            'titulo_text' => 'Usuarios',
            'export_text' => 'Listado de usuarios',
            'registro_text' => 'usuario',
            'clientes_sistema'=>$clientes_sistema,
            'estados'=>$estados,
            'perfiles'=>$perfiles,
        ];
        
        $this->load->view('bases/cabezera');
        $this->load->view('bases/menu', ['menu' =>1,'submenu' =>104]);
        $this->load->view('bases/barra');
        $this->load->view('sistema/usuarios', $datos);
        $this->load->view('bases/pie');
        $this->load->view('bases/funciones', ['funciones' => ['sistema/usuarios']]);
    }
}
